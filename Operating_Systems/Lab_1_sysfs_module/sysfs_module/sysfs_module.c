#include <linux/module.h>
#include <linux/printk.h>
#include <linux/kobject.h>
#include <linux/sysfs.h>
#include <linux/init.h>
#include <linux/fs.h>
#include <linux/string.h>
#include <linux/kernel.h>
#include <linux/sched.h>

static struct kobject *example_kobject;
volatile int roots = 0;

static ssize_t find_roots(struct kobject *kobj, struct kobj_attribute *attr, char *buf) {
	struct task_struct *task = current;
    ssize_t num_of_bytes = 0;

	num_of_bytes += sprintf(&buf[num_of_bytes], "find_roots system call called by process %d\n", task->pid);
	while(task != NULL) {
        num_of_bytes += sprintf(&buf[num_of_bytes], "id: %d, name: %s\n", task->pid, task->comm);
		if(task->pid == 1) {
			break;
		}

		task = task->real_parent;
	}
	return(num_of_bytes);
} 

struct kobj_attribute foo_attribute = __ATTR(find_roots, 0660, find_roots, NULL);

static int __init mymodule_init (void) {
    int error = 0;

    example_kobject = kobject_create_and_add("team77", kernel_kobj);

    if(!example_kobject) return -ENOMEM;

    error = sysfs_create_file(example_kobject, &foo_attribute.attr);

    if(error) {
        printk("failed to create the foo file in /sys/kernel/kobject_example \n");
    }

    return error;
}

static void __exit mymodule_exit (void) {
    printk("Module un initialized successfully \n");
    kobject_put(example_kobject);
}

module_init(mymodule_init);
module_exit(mymodule_exit);
MODULE_LICENSE("GPL");

