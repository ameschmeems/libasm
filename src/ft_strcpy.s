			global		_ft_strcpy

			section		.text
_ft_strcpy:								; ft_strcpy(char *dst -> rdi, const char *src -> rsi)
			mov			rax, rdi		; save dst in rax
			xor			rcx, rcx		; clear rcx, will be used as loop counter
loop:
			cmp			byte [rsi + rcx], 0	; compare src[i] with 0
			jz			end					; if zero, go to end
			mov			r8b, byte [rsi + rcx]
			mov			[rdi + rcx], r8b	; copy src[i] to dst[i]
			inc			rcx				; increment rcx
			jmp			loop			; go back to start of loop
end:
			mov 		byte [rdi + rcx], 0		; add null byte at the end of dst
			ret
