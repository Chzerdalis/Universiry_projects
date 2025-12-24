.data
	string_1: .asciiz "Number is a Power of 2\n"
	string_2: .asciiz "Number is not a Power of 2\n"
.text
.globl main
main:
	loop_1:
	li $s0,1
	li $s2,0
	li $s4,0
	
	li $v0,5
	syscall 
	move $t0,$v0
	
	blt $t0,$zero,terminate
	loop_2:
	addi $s4,$s4,1
	beq  $s4,33,check_2
	and $t1,$s0,$t0
	bgtz $t1,check_1
	sll $s0,$s0,1
	j loop_2
	
	check_1:
	addi $s2,$s2,1
	sll $s0,$s0,1
	j loop_2
	
	check_2:
	li $v0,4
	bgt $s2,1,print
	la $a0, string_1
	syscall
	j loop_1
	
	print:
	la $a0, string_2
	syscall
	j loop_1
	
	terminate:
	li $v0,10
	syscall