#include "schedule.h"
#include "macros.h"
#include <stddef.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <limits.h>
#include <float.h> 
#include "list.h"

#define NEWTASKSLICE (NS_TO_JIFFIES(100000000))
#define RUNTIME_MS(now, past) ((now - past)/(int) 1e6)

/* Local Globals
 * rq - This is a pointer to the runqueue that the scheduler uses.
 * current - A pointer to the current running task.
 */
struct runqueue *rq;
struct task_struct *current;
short int vol_interrupt_flag = 0;

/* External Globals
 * jiffies - A discrete unit of time used for scheduling.
 *			 There are HZ jiffies in a second, (HZ is 
 *			 declared in macros.h), and is usually
 *			 1 or 10 milliseconds.
 */
extern long long jiffies;
extern struct task_struct *idle;

/*-----------------Initilization/Shutdown Code-------------------*/
/* This code is not used by the scheduler, but by the virtual machine
 * to setup and destroy the scheduler cleanly.
 */
 
 /* initscheduler
  * Sets up and allocates memory for the scheduler, as well
  * as sets initial values. This function should also
  * set the initial effective priority for the "seed" task 
  * and enqueu it in the scheduler.
  * INPUT:
  * newrq - A pointer to an allocated rq to assign to your
  *			local rq.
  * seedTask - A pointer to a task to seed the scheduler and start
  * the simulation.
  */
void initschedule(struct runqueue *newrq, struct task_struct *seedTask)
{
	seedTask->next = seedTask->prev = seedTask;
	vol_interrupt_flag = 0;
	newrq->head = seedTask;
	newrq->nr_running++;
}

/* killschedule
 * This function should free any memory that 
 * was allocated when setting up the runqueu.
 * It SHOULD NOT free the runqueue itself.
 */
void killschedule()
{
	struct task_struct* currPtr, *tmpPtr;
	currPtr = rq->head;
	while(currPtr->next != rq->head) {
		tmpPtr = currPtr;
		currPtr = currPtr->next;
		free(tmpPtr->thread_info);
		free(tmpPtr);
	}
	free(rq->head->thread_info);
	free(rq->head);
	return;
}


void print_rq () {
	struct task_struct *curr;
	
	printf("Rq: \n");
	curr = rq->head;
	if (curr)
		printf("%p", curr);
	while(curr->next != rq->head) {
		curr = curr->next;
		printf(", %p", curr);
	};
	printf("\n");
}

/*-------------Scheduler Code Goes Below------------*/
/* This is the beginning of the actual scheduling logic */

/* schedule
 * Gets the next task in the queue
 */
void schedule()
{
	long long now;
	
	long double min_exp_burst = DBL_MAX, temp_exp_burst;
	static struct task_struct *nxt = NULL;
	struct task_struct *curr, *prv, *traverse;

	double curr_goodness = 0.0, goodness = DBL_MAX;
	#ifdef CALCWAIT_RQ
	long long max_waitinRQ = 0;
	#endif
	
	
	prv = current;
	current->need_reschedule = 0; 
									/* Always make sure to reset that, in case *
								   * we entered the scheduler because current*
								   * had requested so by setting this flag   */
	
	if (current == idle) {
		// means a process has been killed and idle process has taken over duration_in_cpuing the transition
		vol_interrupt_flag = 0;
	}

	current->last_use_cpu = now = sched_clock(); //Track the last time that this task is in the CPU

	//if only task is the Init task, then we can just return to it
	if (rq->nr_running == 1) {
		//Calculate the exp burst of the prossess that went to sleep
		if (vol_interrupt_flag) {
			current->expected_burst = (2*(RUNTIME_MS(now, current->start_time_burst) + current->accumulated_burst) + current->expected_burst)/3;
			current->accumulated_burst = 0;
			vol_interrupt_flag = 0;
		}

		context_switch(rq->head);
		nxt = rq->head->next;
	}
	else {
		//Find min expected burst time and max wait in queue
		for (traverse = rq->head->next; traverse != rq->head; traverse = traverse->next ) {
			if(traverse == current) {
				//Calculate the temp burst with regard the time that the task runs without having 'slept'
				temp_exp_burst = (2*(RUNTIME_MS(now, traverse->start_time_burst) + traverse->accumulated_burst) + traverse->expected_burst)/3;
			}else {
				//If the exp is zero calculate a temp burst else use the exp burst
				//temp_exp_burst = traverse->expected_burst == 0 ? 2*(RUNTIME_MS(now, traverse->start_time_burst) + traverse->accumulated_burst)/3 : traverse->expected_burst;
				temp_exp_burst = 2*traverse->accumulated_burst/3 + traverse->expected_burst/3;
			}
			
			if (temp_exp_burst < min_exp_burst) {
				min_exp_burst = temp_exp_burst; // Queue based on minimum expected burst
			}
			// printf("%s: %Lf\n", traverse->thread_info->processName, temp_exp_burst);

			#if defined(CALCWAIT_RQ)
			if (RUNTIME_MS(now, traverse->last_use_cpu) > max_waitinRQ) {
				max_waitinRQ = RUNTIME_MS(now, traverse->last_use_cpu);
			}
			// printf("%s WAIT %lld | MAX %lld\n", traverse->thread_info->processName, RUNTIME_MS(now, traverse->last_use_cpu), max_waitinRQ);
			#endif
		}

		for (traverse = rq->head->next; traverse != rq->head; traverse = traverse->next ) {
			if(traverse == current) {
				temp_exp_burst = (2*(RUNTIME_MS(now, traverse->start_time_burst) + traverse->accumulated_burst) + traverse->expected_burst)/3;
			}else {
				//temp_exp_burst = traverse->expected_burst == 0 ? 2*(RUNTIME_MS(now, traverse->start_time_burst) + traverse->accumulated_burst)/3 : traverse->expected_burst;
				temp_exp_burst = 2*traverse->accumulated_burst/3 + traverse->expected_burst/3;
			}
			//Calculate goodness based on exp burst only OR exp burst and wait in queue
			#ifdef CALCWAIT_RQ
			curr_goodness = ((1 + temp_exp_burst)*(max_waitinRQ + 1)) / ((1 + min_exp_burst)*(1 + RUNTIME_MS(now, traverse->last_use_cpu)));
			#else
			curr_goodness = (1 + temp_exp_burst) / (1 + min_exp_burst);
			#endif

			// printf("%s: %f\n", traverse->thread_info->processName, curr_goodness);

			if (curr_goodness < goodness) {
				goodness = curr_goodness;
				nxt = traverse;
			}
		}
		
		//if interupt update values 
		if (vol_interrupt_flag) {
			current->expected_burst = (2*(RUNTIME_MS(now, current->start_time_burst) + current->accumulated_burst) + current->expected_burst)/3;
			current->accumulated_burst = 0;
			vol_interrupt_flag = 0;
		}

		curr = nxt;
		nxt = nxt->next;
		if (nxt == rq->head)    /* Do this to always skip init at the head */
			nxt = nxt->next;	/* of the queue, whenever there are other  */
								/* processes available					   */
		context_switch(curr);
	}

	//if the task changes add time to the total runtime and mark the start of 
	if (prv != current) {
		if (prv != rq->head) {
			prv->accumulated_burst += RUNTIME_MS(now, prv->start_time_burst);
		}
		current->start_time_burst = now;
	}
}

/* sched_fork
 * Sets up schedule info for a newly forked task
 */
void sched_fork(struct task_struct *p)
{
	p->accumulated_burst = 0;
	p->start_time_burst = 0;
	p->expected_burst = 0;
	p->last_use_cpu = 0;
	p->time_slice = 100;
}

/* scheduler_tick
 * Updates information and priority
 * for the task that is currently running.
 */
void scheduler_tick(struct task_struct *p) {
	schedule();
}

/* wake_up_new_task
 * Prepares information for a task
 * that is waking up for the first time
 * (being created).
 */
void wake_up_new_task(struct task_struct *p)
{
	p->next = rq->head->next;
	p->prev = rq->head;
	p->next->prev = p;
	p->prev->next = p;

	p->last_use_cpu = sched_clock();
	rq->nr_running++;
}

/* activate_task
 * Activates a task that is being woken-up
 * from sleeping.
 */
void activate_task(struct task_struct *p)
{
	p->next = rq->head->next;
	p->prev = rq->head;
	p->next->prev = p;
	p->prev->next = p;
	
	p->last_use_cpu = sched_clock();
	rq->nr_running++;
}

/* deactivate_task
 * Removes a running task from the scheduler to
 * put it to sleep.
 */
void deactivate_task(struct task_struct *p)
{
	vol_interrupt_flag = 1;

	p->prev->next = p->next;
	p->next->prev = p->prev;
	if (p != rq->head) // Head should always point to itself
		p->next = p->prev = NULL;	/* Make sure to set them to NULL *
							   		 * next is checked in cpu.c      */

	rq->nr_running--;
}