savedcmd_/home/sysfs_module/sysfs_module.mod := printf '%s\n'   sysfs_module.o | awk '!x[$$0]++ { print("/home/sysfs_module/"$$0) }' > /home/sysfs_module/sysfs_module.mod
