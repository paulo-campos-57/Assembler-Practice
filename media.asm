.data 
	#ver_media: 140
	approved: .asciiz "APROVADO\n"
	repproved: .asciiz "REPROVADO\n"
	
.text
	li $a0, 50
	li $a1, 100
	
	jal MEDIA
	
	jal SITUACAO
	
	li $v0, 10
	syscall

	SOMA:
		add $v0, $a0, $a1
		jr $ra
	
	MEDIA:
		addi $sp, $sp, -4
		sw $ra, ($sp)
		jal SOMA
		srl $v0, $v0, 1
		lw $ra, ($sp)
		addi $sp, $sp, 4
		jr $ra
	
	SITUACAO:
		sgt $t1, $v0, 70
		bnez $t1, IF
		
		la $a0, repproved
		li $v0, 4
		syscall
		
		j EXIT
	
	IF:
		la $a0, approved
		li $v0, 4
		syscall
		
	EXIT:
		jr $ra
