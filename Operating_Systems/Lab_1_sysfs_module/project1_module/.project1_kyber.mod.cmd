savedcmd_/home/project1_module/project1_kyber.mod := printf '%s\n'   project1_kyber.o | awk '!x[$$0]++ { print("/home/project1_module/"$$0) }' > /home/project1_module/project1_kyber.mod
