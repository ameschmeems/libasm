			global		_ft_write

			section		.text
_ft_write:
			mov			rax, 0x02000004		; syscall write
			syscall
			cmp			rax, 0				; compare return value with 0
			jl			error				; if less than 0, jump to error
			ret
error:
			neg			rax					; get errno value
			mov			rdi, rax			; save errno value
			call		__errno_location	; save pointer to errno in rax
			mov			[rax], rdi			; put errno value in errno address
			mov			rax, -1				; set return value to -1
			ret
