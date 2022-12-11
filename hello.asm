; ----------------------------------------------------------------------------------------
; Writes "Hello, World" to the console using only system calls. Runs on 64-bit macOS only.
; To assemble and run:
;
;     nasm -fmacho64 hello.asm && ld hello.o && ./a.out
; ----------------------------------------------------------------------------------------

			global		start

			section		.text
start:		mov			rax, 0x0200000		; system call for write
			mov			rdi, 1				; file handle for stdout
			mov			rsi, message		; address of string to output
			mov			rdx, 13				; number of bytes to output
			syscall							; invoke the write operation
			mov			rax, 0x02000001		; system call for exit
			xor			rdi, rdi			; exit code 0
			syscall							; invoke call to exit

			section		.data
message:	db			"Hello, World", 10	; string, and newline at the end