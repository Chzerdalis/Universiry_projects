# This is a test lab to become familiar to the MARS simulator

.text
.globl main            	# label "main" must be global
main:
	li $a0,0		     # Reset register $t0 (Counter)
	addi $t1,$0,10		# Put value 10 in register $t1	# (Number Of Loop iterations)
        li $v0, 1
        move $t0, $s0
        
loop:	
	addi $a0,$a0,1		# $a0 = $a0 + 1
        syscall
	bne $a0,$t1,loop		# if($a0!=$t1) go to “loop”  
	
	#exit program
	li $v0,10
	syscall	
