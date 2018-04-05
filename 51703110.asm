	.text

	.globl	main
main:
	lwc1	$f12,sum
	
	# Print msg1
	li	$v0,4		
	la	$a0, msg1	
	syscall

	# Get N from user and save
	li	$v0,5		
	syscall	
	move	$t0,$v0		
	
	
	
	# Initialize registers
	li	$t1, 0		# initialize counter (i)


	# Main loop body
loop:	addi	$t1, $t1, 1	# i = i + 1

	move 	$t3, $t1
	add	$t4, $t3, 1
	
	move	$a1,$t3
	mtc1 	$a1,$f1
	cvt.s.w $f1,$f1
	
	move	$a2,$t4
	mtc1 	$a2,$f2
	cvt.s.w $f2,$f2
	
	div.s	$f3,$f1,$f2 # i/(i+1)

	add.s	$f12, $f12, $f3	# sum = sum + i/(i+1)
	beq	$t0, $t1, exit	# if i = N, continue
	j	loop

	# Exit routine - print msg2
exit:	li	$v0, 4		
	la	$a0, msg2
	syscall
	
	# Print sum
	li	$v0,2		
	syscall

	# Print newline
	li	$v0,4		
	la	$a0, lf
	syscall
	li	$v0,10		# exit
	syscall
	
	
	.data
msg1:	.asciiz	"Enter your number:  "
msg2:	.asciiz	"Sum = "
lf:     .asciiz	"\n"
sum:	.float 0.0
