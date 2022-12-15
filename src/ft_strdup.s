			global		_ft_strdup
			extern		_ft_strlen
			extern		_ft_strcpy
			extern		_malloc

			section		.text
_ft_strdup:
			push		rdi			; save pointer on stack
			call		_ft_strlen
			mov			rdi, rax	; set argument for malloc (len)
			inc			rdi			; add one for null byte
			call		_malloc
			jc			error
			mov			rdi, rax		; put new pointer as dest
			pop			rsi				; put old pointer as src
			call		_ft_strcpy
error:
			ret