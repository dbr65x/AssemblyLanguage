;Baldwin2.asm 
;Student: Daniel Baldwin
;Class: CSC3210
;Assignment#: 5-2
;Description: The program uses short-circuit evaluation within a while loop.

.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.data								;data area
A SWORD 9
B SWORD 8
X SWORD 11

.code								;code area
main PROC

mov ax, A							;A is moved to ax

mov bx, B							;B is moved to bx

BeginWhile:							;Start of the while loop

	cmp X, 0						;0 is compared to X

	jle EndWhile					;if X is less than or equal to 0 jump to end of while loop

	cmp X, 3						;3 is compared to X

	je L2							;if x is equal to 3 jump to L2

	cmp X, ax						;ax is compared to X

	jle L1							;if X is less than or equal to ax jump to L1

	mov dx, X						;X is moved to dx

	sub dx, 2						;2 is subtracted from dx

	mov X, dx						;dx is moved to X

	jmp L3							;jump to L3

L1:									;L1 begins

	cmp X, bx						;bx is compared to X

	jge L2							;if X is greater than or equal to ax jump to L1

	mov dx, X						;X is moved to dx

	sub dx, 2						;2 is subtracted from dx

	mov X, dx						;dx is moved to X

	jmp L3							;jump to L3

L2:									;L2 begins

	mov dx, X						;X is moved to dx

	sub dx, 1						;1 is subtracted from dx

	mov X, dx						;dx is moved to X

L3:									;L3 begins

	jmp BeginWhile					;jump to begining of while loop

EndWhile:							;end of while loop

	INVOKE ExitProcess,0			;ends program
main ENDP
end main
