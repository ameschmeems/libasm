			global		_ft_strdup
			extern		_ft_strlen
			extern		_ft_strcpy
			extern		_malloc

			section		.text
_ft_strdup:
			push		rdi			; save pointer on stack
			call		_ft_strlen
			mov			rdi, [rax + 1]	; set argument for malloc (len + null char)
			call		_malloc
			jc			error
			mov			rax, rdi		; put new pointer as dest
			pop			rsi				; put old pointer as src
			call		_ft_strcpy
error:
			ret