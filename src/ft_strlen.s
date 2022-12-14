			global		_ft_strlen

			section		.text
_ft_strlen:
			xor			rax, rax			; initialize rax to 0
			jmp			compare				; go to compare
increment:
			inc			rax					; i++
compare:
			cmp			byte [rdi + rax], 0	; compare str[i] with 0
			jne			increment			; if above isnt true, go to increment
done:
			ret								; return value in rax