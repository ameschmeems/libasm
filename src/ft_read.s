			global		_ft_read
			extern		___error

			section		.text
_ft_read:
			mov			rax, 0x02000003		; syscall read
			syscall
			jc			error				; if error occured, jump to error
			ret
error:
			push		rax
			call		___error	; save pointer to errno in rax
			pop			rdi
			mov			[rax], rdi			; put errno value in errno address
			mov			rax, -1				; set return value to -1
			ret