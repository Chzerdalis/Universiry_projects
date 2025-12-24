.data
	array: .word 1, 2, 1000, 4, 5, 7, 999, 10
.text
.globl main            	
main:
	la $s3, array
	li $a0,0
	li $t1,7
	li $t2,0
	li $t0,0
	lw $t3, 0($s3)
	
	loop:
		addi $s3,$s3,4
		lw $t4, 0($s3)
		addi $t2,$t2,1
		ble $t4, $t3, gay
		move $t3, $t4
		gay:
			bne $t2,$t1,loop
	move $a0, $t3
	li $v0, 1
	syscall
	li $v0, 10
	syscall
		

