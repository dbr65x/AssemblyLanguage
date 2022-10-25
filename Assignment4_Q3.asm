;Baldwin3.asm 
;Student: Daniel Baldwin
;Class: CSC3210
;Assignment#: 4-3
;Description: The program is a nested loop that adds the sum of the loop count values to y.

.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.data								;data area
countI DWORD ?

countJ DWORD ?

y DWORD 15 DUP(?)

.code								;code area
main PROC

	mov esi, OFFSET y				;the address of y is moved to esi

	mov ecx, 5						;5 is moved to ecx

L1:									;Start of L1 loop

	mov countI, ecx					;ecx is moved to countI

	mov ecx, 3						;3 is moved to ecx

L2:									;Start of L2 loop

	mov countJ, ecx					;ecx is moved to countJ
	
	mov ebx, countI					;countI is added to ebx

	mov edx, countJ					;countJ is added to ebx

	add ebx, edx					;edx is added to ebx

	add [esi], ebx					;ebx is added to the spot of the current address of esi

	add esi, type y					;the type of y is added to esi

	loop L2							;loop L2 is looped

	mov ecx, countI					;countI is moved to ecx

	loop L1							;loop L1 is looped

	INVOKE ExitProcess,0			;ends program
main ENDP
end main
