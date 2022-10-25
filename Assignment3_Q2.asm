;Baldwin2.asm 
;Student: Daniel Baldwin
;Class: CSC3210
;Assignment#: 3-2
;Description: The program does z-x+6, z=y-x+7, z=r+y-9 and stores the results in z list
;Result: z list should be 0Dh, 14h, 0Fh.

.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.data								;data area
x WORD 7

y WORD 20

r WORD 4

z WORD 3 DUP (?) 

.code								;code area
main PROC

	mov eax, 0 						;0 is moved to eax 

	mov ebx, 0						;0 is moved to ebx 

	mov ecx, 0						;0 is moved to ecx 

	add ax, x						;x is added to ax
	
	add ax, 6						;6 is added to ax

	add bx, y						;y is added to bx

	sub bx, x						;x is subtracted from bx
	
	add bx, 7						;7 is added to bx

	add cx, r						;r is added to cx

	add cx, y						;y is added to cx

	sub cx, 9						;9 is subtracted from cx

	xchg z, ax						;the value of ax is exchanged with z

	xchg [z+2], bx					;the value of bx is exchanged with [z+2]

	xchg [z+4], cx					;the value of cx is exchanged with [z+4]

	mov ax, z						;to check if values are in right place, z is moved to ax

	mov bx, [z+2]					;to check if values are in right place, [z+2] is moved to bx

	mov cx, [z+4]					;to check if values are in right place, [z+4] is moved to cx

	INVOKE ExitProcess,0			; ends program
main ENDP
end main
