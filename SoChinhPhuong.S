.data
	input: .asciiz "Input a number:   "
	output1: .asciiz "Is square number !!! "
	output2: .asciiz "Is not square number !!!  "
	else: .asciiz "Unavailable number !!! "
	line: .asciiz "\n"
.text
.globl main
main:
	#print input
	li		$v0,  4
	la		$a0, input
	syscall

	#input number
	li		$v0,  5
	syscall
	move 	$t0, $v0

	blt		$t0, 0, prnt3	# if $t0 < 0 then print else

	li		$t3,  0		# new variable $t3 = 0
	
# loop
loop:
	mult	$t3, $t3			# Square $t3
	mflo	$t4					# copy Lo to $t4
	beq		$t4, $t0, prnt1		#if $t4 == $t0 print output1
	bgt		$t4, $t0, prnt2		#if $t4 > $t0 print output2
	addi	$t3, $t3, 1			# $t3 = $t3 + 1
	
	j	loop	

#print output 1
prnt1:
	li		$v0, 4		
	la		$a0, output1
	syscall				
	
	j end	
	

prnt2:
	li		$v0, 4		
	la		$a0, output2
	syscall				
	j end


prnt3:
	li		$v0, 4		
	la		$a0, else
	syscall				
	j end


end:
	li		$v0, 4		
	la		$a0, line
	syscall				
	
	li $v0, 10	
	syscall		# exit
.end