			global		_ft_write
			extern		___error

			section		.text
_ft_write:
			mov			rax, 0x02000004		; syscall write
			syscall
			jc			error				; mac marks error as carry, rather than negative for god knows what reason (the ret value is what we put into errno)
			ret
error:
			push		rax
			call		___error			; save pointer to errno in rax
			pop			rdi
			mov			[rax], rdi			; put errno value in errno address
			mov			rax, -1				; set return value to -1
			ret
