.data
	num: .asciiz "\nGive roman number!\n"
	false: .asciiz "\nPlease enter a correct Roman numeral!\n"
	.align 0
	string: .space 20
	switch: .byte 'M' 'D' 'C' 'L' 'X' 'V' 'I'
	.align 2
	decimal: .word 1000 500 100 50 10 5 1
.text
.macro replace_n (%x)		#Replace \n at the end of the string (if it exists) with \0
	add $t0, %x, $0		
	lbu $t1, ($t0)
loop1:
	beq $t1, '\0', exit 
	addi $t0, $t0, 1
	lbu $t1, ($t0)
	j loop1
exit:
	addi $t0, $t0, -1
	lbu $t1, ($t0)
	bne $t1, '\n', noChange  
	sb $0, ($t0) 
noChange:
.end_macro

.globl main
main:
	li $v0, 4			
	la $a0, num
	syscall
	la $s0, string
	add $a0, $s0, $0
	li $a1, 20	
	li $v0, 8		
	syscall	
	replace_n($s0)		
	#ready arguments
	move $a0, $s0		#Check if the roman numeral is correct
	jal check_roman
	beq $v0, 0, falseCheck		#If its not correct read another number
	#ready arguments
	move $a0, $s0
	jal roman_to_decimal	#Calculate the number that was given
	
	move $t0, $v0 		#Print the  number calculated and abort
	li $v0, 1
	move $a0, $t0
	syscall
	li $v0, 10
	syscall
	
falseCheck:
	li $v0, 4			#print text and return to main label
	la $a0, false	
	syscall
	j main
	
check_roman:
	addi $sp, $sp, -8		#Store $ra and the numeral in the stack 
	sw $ra, 4($sp)
	sw $a0, 0($sp)
	lbu $t0, ($a0)
	beq $t0, 0, last1		#Check if we read all characters
	li $t1, 0
	loop2:
		beq $t1, 7, wrong	#Check if we reached the end of accepted characters
		lbu $t2, switch($t1)	#load the next correct character
		beq $t2, $t0, hurray	#Compare the two characters
		addi $t1, $t1, 1
		j loop2
		
	last1:				#Case where we checked all characters
		li $v0, 1
		addi $sp, $sp, 8
		jr $ra
	
	wrong:				#Case where a character is not accepted
		li $v0, 0
		addi $sp, $sp, 8
		jr $ra
	
	hurray:	
		addi $a0, $a0, 1		#Case where a character is correct	
		jal check_roman
	
		lw $ra, 4($sp)			#Restore old values and stack
		lw $a0, 0($sp)
		addi $sp, $sp, 8
		jr $ra
	
roman_to_decimal:
	addi $sp, $sp, -8		#load to stack
	sw $ra, 0($sp)
	sw $s0, 4($sp)					
	lbu $t0, ($a0)		#Load the first given character in $t0
	beq $t0, 0, end		#if it is zero(\0) it finishes and does load to stack
	li $t1, 0			#Use t1 register as counter	
	
	loop3:
		lbu $t2, switch($t1)	#Load the first character check in $t2
		beq $t2, $t0, hurray1	#Check if the characters match until they match
		addi $t1, $t1, 1
		j loop3
		
	hurray1:				
		sll $t1, $t1, 2		#When two characters match use the position of the 
		lw $s0, decimal($t1)	#character in the table to load its value from the 
						#array of values
		
		bne $s0, 1, next_1	#Only 1, 10 and 100 can be subtracted from any roman numeral
		j check_next		#thus we check for subtraction only when they appear
		next_1:
		bne $s0, 10, next_2
		j check_next
		next_2:
		bne $s0, 100, next_3
		j check_next
		next_3:
		
		addi $a0, $a0, 1		#If no subtraction is required continue to next character
		call_function:
		
		jal roman_to_decimal
		
		add $v0, $v0, $s0		#return value
		lw $ra, 0($sp)		#get the needed values from the stack
		lw $s0, 4($sp)
		addi $sp, $sp, 8 
		jr $ra
		
		check_next:					#Check if number after 1,10 or 100 is larger 
			addi $a0, $a0, 1
			lbu $t0, ($a0)
			beq $t0, 0, call_function	#if the number checked was the last number return
			li $t1, 0				#else initialize $t1 counter
		
		loop4:
			lbu $t2, switch($t1)	#Perform similar operations as the previous checks
			beq $t2, $t0, hurray2	#in order to find the number
			addi $t1, $t1, 1
			j loop4
		
		hurray2:				
			sll $t1, $t1, 2		
			lw $t4, decimal($t1)	
			bgt $t4, $s0, bigger	
			j call_function
			
			bigger:			#If the next number is bigger than subtract them and
			sub $s0, $t4, $s0		#continue the loop
			addi $a0, $a0, 1
			j call_function	
		end:
			addi $sp, $sp, 8
			li $v0, 0
			jr $ra
