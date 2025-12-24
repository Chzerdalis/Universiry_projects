.data
	enter: .asciiz "\n"
	getn: .asciiz "\nGive n!\n"
	getm: .asciiz "\nGive m!\n"
	result: .asciiz "Function result is :"
.text
.globl main

main:
	li $v0, 4			
	la $a0, getn
	syscall
	li $v0, 5 
	syscall
	move $s0,$v0 	#Store n in s0 register
	li $v0, 4
	la $a0, getm
	syscall
	li $v0, 5 
	syscall
	move $s1,$v0	#Store m in s1 register
	
	add $a0, $s0, $0	#n in a0
	add $a1, $s1, $0	#m in a1
	li $v0, 1
	move $a0, $sp
	syscall
	li $v0, 4
	la $a0, enter
	syscall
	li $v0, 0
	add $a0, $s0, $0	#n in a0
	jal Function
	
	add $a0, $v0, $0
	li $v0, 1
	syscall
	j main
	li $v0, 10		
	syscall	
	
Function:
	beq $a0, 0, nzero
	beq $a1, 0, mzero
	
	addi $sp, $sp, -8
	sw $ra, ($sp)
	sw $s0, 4($sp)
	
	move $t0, $v0
	move $t1, $a0
	li $v0, 1
	move $a0, $sp
	syscall
	li $v0, 4
	la $a0, enter
	syscall
	move $v0, $t0
	move $a0, $t1
	j next
	nzero:
	add $v0, $0, $a1
	j end
	mzero:
	add $v0, $0, $a0
	end:
	jr $ra
	
	next:
	addi $a0, $a0, -1
	jal Function
	addi $a0, $a0, 1
	
	move $s0, $v0
	addi $a1, $a1, -1
	jal Function
	addi $a1, $a1, 1
	
	add $v0, $v0, $s0
	
	lw $ra, ($sp)
	lw $s0, 4($sp)
	addi $sp, $sp, 8
	jr $ra
