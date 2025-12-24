.data
	power: .asciiz "Number is a Power of 2\n"
	notpower: .asciiz "Number is a Not a Power of 2\n"
.text
.globl main
main:
	li $s0, 0
	

loop:
	li $t3, 0 	#count the number of loops
	li $t2, 0
	li $s2, 1	#use register s2 to perform and proccess with t1 register
	li $v0, 5
	syscall
	move $t1, $v0	# store the integer in t1 register
	blt $t1, $t0, abort	#if integer <0 stop the program
check:
	and $s3, $t1, $s2	# check if there are more than one bits with the value of 1 on the integer given
	sll $s2, $s2, 1
	addi $t3, $t3, 1
	beq $t3, 32, finalCheck
	bgt $s3, $0, checkpoint		#store number of 1s found in register t2
	j check
	
checkpoint:
	addi $t2, $t2, 1
	j check
	
finalCheck:
	bgt $t2, 1, incorrect
	j correct 
correct:
	li $v0, 4
	la $a0, power
	syscall
	j loop
incorrect:
	li $v0, 4
	la $a0, notpower
	syscall
	j loop
abort:
	li $v0, 10
	syscall
	
