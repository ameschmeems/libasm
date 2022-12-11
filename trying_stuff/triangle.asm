; ----------------------------------------------------------------------------------------
; This is an OSX console program that writes a little triangle of asterisks to standard
; output. Runs on macOS only.
;
;     nasm -fmacho64 triangle.asm && gcc hola.o && ./a.out
; ----------------------------------------------------------------------------------------

			global		start

			section		.text
start:
			mov			rdx, output			; rdx holds address of the next byte to write
			mov			r8, 1				; initial line length
			mov			r9, 0				; number of stars written so far on current line
line:
			mov			byte [rdx], '*'		; write a single star
			inc			rdx					; advance pointer by 1
			inc			r9					; increment number of stars written so far on current line
			cmp			r9, r8				; check if we reached required number of stars
			jne			line				; if not, go back to line
lineDone:
			mov			byte [rdx], 10		; write a newline
			inc			rdx					; advance pointer by 1
			inc			r8					; increment total amount of stars for next line
			mov			r9, 0				; we're on a new line, so reset amount of stars written so far on line
			cmp			r8, maxlines		; check if we reached the last line
			jng			line				; if not, start writing a line
done:
			mov			rax, 0x02000004		; system call for write
			mov			rdi, 1				; file handle for stdout
			mov			rsi, output			; address of string to output
			mov			rdx, dataSize		; amount of bytes to output
			syscall							; execute write operation
			mov			rax, 0x02000001		; system call for exit
			xor			rdi, rdi			; exit code 0
			syscall							; execute exit call

			section		.bss
maxlines	equ			8
dataSize	equ			44
output:		resb		dataSize