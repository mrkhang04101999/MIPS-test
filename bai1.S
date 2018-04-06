.data
string: .asciiz "Hello TDT" 
lenght: .word 10	
line: .asciiz "\n"

.text

main: 
	lw $t1,lenght 
	la $t0,string
	
	add $s0,$s0,$0	#bien ch?y s0 = 0

	
loop: 	beq $s0,$t1,end # neu s0 = t1 	
	lbu $s1,0($t0)	# s1 là ??a ch? c?a kí t? ??u tiên 
	li $v0,11	# in ki t?
	add $a0,$s1,0
	syscall
	li $v0,4	#in dòng 
	la $a0,line
	syscall
	addi $t0,$t0,1	# kí t? ti?p theo 
	add $s0,$s0,1	# t?ng bi?n ??m lên 1
	j loop
		
end: 
	li $v0,10
	syscall	