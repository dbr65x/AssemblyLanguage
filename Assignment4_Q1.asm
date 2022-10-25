;Baldwin1.asm 
;Student: Daniel Baldwin
;Class: CSC3210
;Assignment#: 4-1
;Description: The program finds the sum of val's words and stores the result in dx

.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.data								;data area
val QWORD 0506030704080102h

.code								;code area
main PROC

movzx eax,WORD PTR val				;[val+0] is moved to eax using PTR

movzx ebx,WORD PTR [val+2]			;[val+2] is moved to ebx using PTR

movzx ecx,WORD PTR [val+4]			;[val+4] is moved to ecx using PTR

movzx edx,WORD PTR [val+6]			;[val+6] is moved to edx using PTR

add dx, cx							;ax is added to dx

add dx, bx							;bx is added to dx

add dx, ax							;cx is added to dx

	INVOKE ExitProcess,0			; ends program
main ENDP
end main
