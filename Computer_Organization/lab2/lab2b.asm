.data
	final_text: .asciiz "The bits on the register are: \n"
	bits:	.asciiz "Give me the number of bits to be read\n"
	pointer:	.asciiz "Give me address pointer\n"
	ints:	.asciiz "Give me the bit offset\n"
	array: .byte 0x70,0x8C,0xF3,0x82,0x1B,0x9D,0x52,0x3C,0x46
.text
.globl main
main:
	add $s0, $0, $0		
	li $v0, 4			
	la $a0, pointer
	syscall
	li $v0, 5	
	syscall
	move $s0,$v0		#Store the address pointer in s0 register
	li $v0, 4			
	la $a0, ints
	syscall
	li $v0, 5	
	syscall
	move $a1, $v0		#Store the offset in a1 register
	li $v0, 4			
	la $a0, bits
	syscall
	li $v0, 5	
	syscall
	move $a2, $v0		#Store the number of bits to read in a2 register
			
	la $t0, array		#Calculate address to be read and store the value in a0 register
	add $a0, $s0, $t0
	
	jal bits_read

	li $v0, 10
	syscall
	
bits_read:
	beq $a2, 0, end
	addi $t0, $a2, -8
	add $t0, $t0, $a1  	#Store how many bits we need to shift for the first byte we read
	add $t2, $0, $0
	loop:
		ble $t0, $0, negative
		lbu $t1, ($a0)	
		sllv $t1, $t1, $t0
		addi $t0, $t0, -8
		add $t2, $t1, $t2
		addi $a0, $a0, 1
		j loop
	negative:
		not $t0, $t0		#Make the value of t0 positive and shift the bits on the right side
		addi $t0, $t0, 1
		lbu $t1, ($a0)	
		srlv $t1, $t1, $t0  
		add $t2, $t1, $t2
	gay:
	addi $t0, $a2, -32
	not $t0, $t0		
	addi $t0, $t0, 1
	sllv $t2, $t2, $t0
	srlv $t2, $t2, $t0
	end:
	addi $v0, $0, 4
	la $a0, final_text
	syscall
	add $a0, $t2, $0
	addi $v0, $0, 35
	syscall
	
	jr $ra
