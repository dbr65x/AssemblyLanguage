;Baldwin1.asm 
;Student: Daniel Baldwin
;Class: CSC3210
;Assignment#: 2-1
;Description: The program does AX = val2 + 9 + val3 - val1
;Result: AX=30 in decimal

.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.data								;data area
val2 WORD 11

val3 WORD 16

val1 SWORD 6

.code								;code area
main PROC

	mov ax, val2					;value of val 2 is moved to ax

	add ax, 9						;9 is added to ax

	add ax, val3					;val3 is added to ax

	sub ax, val1					;val1 is subtracted from ax

	INVOKE ExitProcess,0			; ends program
main ENDP
end main
