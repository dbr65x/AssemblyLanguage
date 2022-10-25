;Baldwin1.asm 
;Student: Daniel Baldwin
;Class: CSC3210
;Assignment#: 3-1
;Description: The program does BX = -val2 + 7 - (-val3 + val1)
;Result: BX= -12 in decimal, FFF4h in hexadecimal 

.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.data								;data area
val1 BYTE 12

val2 BYTE 9

val3 BYTE 2

.code								;code area
main PROC

	movzx bx, val2 					;val2 is moved to ebx while filling the register with the proper value

	movzx ax, val3					;val3 is moved to eax while filling the register with the proper value

	movzx cx, val1					;val1 is moved to ecx while filling the register with the proper value

	neg bx							    ;the value in ebx is made negative

	neg ax						    	;the value in eax is made negative

	add bx, 7				    		;7 is added to bx

	add ax, cx					  	;ecx is subtracted to eax

	sub bx, ax						  ;ax is added to bx

	INVOKE ExitProcess,0		; ends program
main ENDP
end main
