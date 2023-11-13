.data
	hello: .asciiz "Hello, World!\n"

.text
	main:
		# Imprime a string na tela
		li $v0, 4	# Carrega o código do sistema para imprimir string
		la $a0, hello	# Carrega o endereço da string em $a0
		syscall		# Chama a interrupção do sistema
		
		# Sai do programa
		li $v0, 10	# Carrega o código do sistema para sair do programa
		syscall		# Chama a interrupção do sistema
