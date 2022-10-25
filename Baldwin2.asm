;Baldwin2.asm 
;Student: Daniel Baldwin
;Class: CSC3210
;Assignment#: 2-2
;Description: The program adds values to different registers while first clearing the registers.

.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.data								;data area

.code								;code area
main PROC
	
	mov eax, 0						;0 is moved to eax

	mov edx, 0						;0 is moved to edx

	add eax, 10						;10 is added to eax

	add edx, 8						;8 is added to edx

	add ax, 3						;3 is added to ax

	add al, 2						;2 is added to al

	INVOKE ExitProcess,0			;ends program
main ENDP
end main