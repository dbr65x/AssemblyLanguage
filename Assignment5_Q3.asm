;Baldwin3.asm 
;Student: Daniel Baldwin
;Class: CSC3210
;Assignment#: 5-3
;Description: The program does logical shifts depending on if MSB is set in al.

.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.data								;data area


.code								;code area
main PROC

mov al, 88h							;88h is moved to al

test al, 10000000b					;the "and" operation is tested on 10000000b and al

jz notSet							;jump to notSet if zero flag is noy set

sar al, 3							;arithmetic shift right by 3 

jmp exit							;jump to exit

notSet:								;notSet begins

	sal al, 2						;arithmetic shift left by 2

exit:								;exits begins

	INVOKE ExitProcess,0			;ends program
main ENDP
end main
