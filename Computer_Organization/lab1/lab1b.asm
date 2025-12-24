.data
	N1: .asciiz "Please give N1\n"
	N2: .asciiz "Please give N2\n"
	Answer: .asciiz "The max final union of ranges is ["
	comma: .asciiz ","
	bracket: .asciiz "]."
	enter: .asciiz "\n"
	stupdi: .asciiz "--Epeidh eisai xazos ta vazw me swsth seira :)--\n"
.text
.globl main
main:

	li $v0, 4
	la $a0, N1
	syscall
	li $v0, 5
	syscall
	move $s1, $v0	# store the integer N1 in s1 register
	bltz $s1, ultimateAbort
	li $v0, 4
	la $a0, N2
	syscall
	li $v0, 5
	syscall
	move $s2, $v0	# store the integer N2 in s2 register
	bltz $s2,ultimateAbort
	blt $s2, $s1, switchS
	
loop:
	li $v0, 4
	la $a0, N1
	syscall
	li $v0, 5
	syscall
	move $t1, $v0	# store the integer N3 in t1 register
	bltz $t1, abort
	li $v0, 4
	la $a0, N2
	syscall
	li $v0, 5
	syscall
	move $t2, $v0	# store the integer N4 in t2 register
	bltz $t2, abort
	blt $t2, $t1, switchN
checkCase:
	blt $t1, $s1, N2check1 # If N1' < N1 check for N2'
	ble $t1, $s2, N2check2 # N1'>= N1 if N1'<= N2 check for N2'
	j rangeSwitch
N2check1:
	blt $t2, $s1, rangeSwitch # If N2' < N1 check for range switch
	ble $t2, $s2, rangeMergeN1 #N2'>=N1 if N2' <= N2 Merge ranges
	j switch # else N2' > N2 switch ranges
N2check2:
	ble $t2, $s2, loop
	j rangeMergeN2
	
rangeSwitch:
	sub $s0, $s2, $s1
	sub $t0, $t2, $t1
	bge $s0, $t0, loop 
switch:
	move $s1, $t1
	move $s2, $t2
	j loop
rangeMergeN1:
	move $s1, $t1
	j loop
rangeMergeN2:
	move $s2, $t2
	j loop
abort:
	li $v0, 4
	la $a0,Answer
	syscall
	li $v0, 1
	move $a0, $s1
	syscall
	li $v0, 4
	la $a0,comma
	syscall
	li $v0, 1
	move $a0, $s2
	syscall
	li $v0, 4
	la $a0,bracket
	syscall
	li $v0, 4
	la $a0, enter
	syscall
ultimateAbort:
	li $v0, 10
	syscall
	
switchN:
	li $v0, 4
	la $a0, stupdi
	syscall
	move $t0, $t1
	move $t1, $t2
	move $t2, $t0
	j checkCase
switchS:
	li $v0, 4
	la $a0, stupdi
	syscall
	move $s0, $s1
	move $s1, $s2
	move $s2, $s0
	j loop