#findMAXMIN
.data
st_Nhap: .asciiz "Nhap vao so luong phan tu cua mang: "
st_Xuat: .asciiz "Mang cua nhap vao la: "
st_Min: .asciiz "Gia tri nho nhat la: "
st_Max: .asciiz "\nGia tri lon nhat la: "
a: .word 0:10
.text
main:
	la $a0, st_Nhap
	jal print_st
  
	addi $v0, $0, 5
	syscall
	addi $t0, $v0, 0 # Luu lai gia tri vua nhap
#Nhap mang
	addi $t1, $0, 0 
	la $s0, a
	addi $s1, $s0, 0 # Dung $s0 va $s1 luu dia chi dau cua mang
Loop:
	slt $t2, $t1, $t0
	beq $t2, $0, EndLoop
	addi $v0, $0, 5
	syscall
	sw $v0, 0($s0)
	bne $t1, $0, Nhay
    addi $t5, $v0, 0
    addi $t6, $v0, 0
Nhay:
	addi $t3, $v0, 0
	addi $s0,  $s0, 4
	addi $t1, $t1, 1

SSMin:
	slt $t2, $t3, $t5
	beq $t2, $0, SSMax
    addi $t5, $t3, 0
SSMax:
	slt $t2, $t6, $t3
	beq $t2, $0, Loop
	addi $t6, $t3, 0
    j Loop
	
EndLoop:

	la $a0, st_Min
	jal print_st

	addi $a0, $t5, 0
	addi $v0, $0, 1
	syscall   

	la $a0, st_Max
	jal print_st
	addi $a0, $t6, 0
	addi $v0, $0, 1
	syscall

exit:
	addi $v0, $0, 10
	syscall
print_st:
	addi $v0, $0, 4
	syscall
	jr $ra