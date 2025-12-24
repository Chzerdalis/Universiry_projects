.data
	final_text: .asciiz "Merged array = "
	bracket_1: "["
	bracket_2: "]"
	comma:	.asciiz ","	
	size:	.asciiz "Give me array size:\n"
	ints:	.asciiz "Give me your integer\n"
.text
.globl main
#i use some macros in order to not repeat the some code
.macro read_size
	li $v0, 4			#print message
	la $a0, size
	syscall
	li $v0, 5			#Get size of first array
	syscall
.end_macro 
.macro allocate_mem (%x)
	move %x, $v0		#Store array size in s0 register
	li $v0, 9			
	sll %x, %x, 2		
	move $a0, %x
	syscall			#Allocate memory for the first array
	srl %x, %x, 2
.end_macro 

.macro fill_array(%y)		
	addi $t0, $t0, 1		#change counter
	li $v0, 4			
	la $a0, ints
	syscall			#print message
	li $v0, 5
	syscall			#read integer
	sw $v0, ($t1)		#save integer #t1 is initialized befone the macro
	addi $t1, $t1, 4		#change pointer position
.end_macro
	
	

main:
	li $s0, 0 #i initialize these registers because it helps later
	li $s1, 0
	li $s2, 0
	li $s3, 0
	li $s4, 0
	
	read_size
	beq $v0, 0, next_1	#if size == 0 then nothing is allocated and s0 s1 remain 0 and 'NULL'
	allocate_mem($s0)		#allocate mem for the first array
	move $s1, $v0		#Store first array address in s1 register
	
	add $t1, $s1, $0		
	add $t0, $0, $0
	loop_1:
		beq $t0, $s0, next_1		#fills first array one by one
		fill_array($s0)
		 j loop_1
next_1: 
	read_size
	beq $v0, 0, next_2	#if size == 0 then nothing is allocated and s2 s3 remain 0 and 'NULL'
	allocate_mem($s2)		#allocate mem for the second array
	move $s3, $v0		#Store second array address in s3 register
	
	add $t1, $s3, $0
	add $t0, $0, $0
	loop_2:
		beq $t0, $s2, next_2		#fills second array one by one
		fill_array($s2)
		j loop_2
next_2:
#s0 = size of 1st array
#s1 = address of first array
#s2 = size of second array
#s3 = address of second array
	bne $s1, 0, allocate 			#checks if both are NULL in order not
	beq $s3, 0, not_allocate		#to allocate mem for the merged array
	
	allocate:
	add $t0, $s0, $s2 	#size of the final array (out)
	li $v0, 9			
	sll $t0, $t0, 2		
	move $a0, $t0
	syscall
	move $s4, $v0		#s4 = address of final array
	not_allocate:
	#if it does not allocate s4 is already initialized to NULL
	
	#ready arguments for the merge function
	addi $sp, $sp, -4
	sw $s4, ($sp)		#save the fifth argumement in stack (s4)
	move $a0, $s1		#addres of first to a0
	move $a1, $s0		#size of first to a1
	move $a2, $s3		#addres of second to a2
	move $a3, $s2		#size of second to a3
	
	jal merge			#goes into merge function
	
	beq $s4, 0, quit		#if out is NULL quits else prints it
	add $t0, $s0, $s2
	li $v0, 4
	la $a0, final_text
	syscall
	la $a0, bracket_1
	syscall
	li $t1, 1
	print:
		li $v0, 1
		beq $t1, $t0, print_last
		lw $a0, ($s4)
		syscall
		li $v0, 4
		la $a0, comma
		syscall
		addi $s4, $s4, 4
		addi $t1, $t1, 1
		j print
	print_last:
		lw $a0, ($s4)
		syscall
		li $v0, 4
		la $a0, bracket_2
		syscall
	quit:
		li $v0, 10
		syscall
	
	
	
merge:
	#below i move a2 and a0 to temporary registers because they are const and i
	#cant directly change them
	lw $t4, ($sp)		#takes thge fifth argument from the stack
	addi $sp, $sp, 4		
	beq $t4, 0, exit_3	#if s4 = t4 = NULL means there is nothing to be done and exits
	bne $a0, 0, first_not_NULL		#checks if the first array is NULL
	move $t2, $a2		#if it is that meams that the second is not
	lw $t3, 0($t2)
	li $t6, 0
	j exit_1
	first_not_NULL:		#if it is not NULL it loads the first number
	move $t0, $a0
	lw $t1, 0($t0)
	li $t5, 0
	beq $a2, 0, second_NULL		#checks if the second array is NULL
	move $t2, $a2		#if it is not NULL it loads the first number
	lw $t3, 0($t2)
	li $t6, 0
	j loop_3	
	second_NULL: 
	j exit_2				 
	loop_3:
		bgt $t1, $t3, option_1 #checks whick number is bigger
		
		sw $t1, ($t4)		#loads the smaller number in the out
		addi $t5, $t5, 1		
		addi $t4, $t4, 4		#changes pointer to out
		beq $t5, $a1, exit_1	
		addi $t0, $t0, 4		#changes pointer to the first array
		lw $t1, ($t0)		#loads next (bigger)number
		j loop_3
		
		option_1:
		sw $t3, ($t4)		#the same here but for the other array
		addi $t6, $t6, 1
		addi $t4, $t4, 4
		beq $t6, $a3, exit_2
		addi $t2, $t2, 4
		lw $t3, ($t2)
		j loop_3
		#exit_1 and 2 are used when one of the array ends which means that the rest
		#of the other array is defentily bigger and by definition sorted
		#also they are usefull when one of the two arrays does not exist
		exit_1:
			loop_4:
				sw $t3, ($t4)		#copies the rest of the second array in out
				addi $t6, $t6, 1
				beq $t6, $a3, exit_3	
				addi $t4, $t4, 4
				addi $t2, $t2, 4
				lw $t3, ($t2)
				j loop_4
		
		exit_2:
			loop_5:
				sw $t1, ($t4) 		#copies the rest of the second array in out
				addi $t5, $t5, 1
				beq $t5, $a1, exit_3	
				addi $t4, $t4, 4
				addi $t0, $t0, 4
				lw $t1, ($t0)
				j loop_5
		
		exit_3:
			jr $ra
	
