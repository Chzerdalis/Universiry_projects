#include <linux/kernel.h>
#include <linux/syscalls.h>
#include <linux/sched.h>

SYSCALL_DEFINE0(find_roots) {
	struct task_struct *task = current;

	printk("find_roots system call called by process %d\n", task->pid);
	
	while(task != NULL) {
		printk("id: %d, name: %s\n" ,task->pid ,(char*)task->comm);

		if(task->pid == 1) {
			break;
		}

		task = task->real_parent;
	}
	return(0);
} 
