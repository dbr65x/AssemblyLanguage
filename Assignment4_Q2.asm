;Baldwin2.asm 
;Student: Daniel Baldwin
;Class: CSC3210
;Assignment#: 4-2
;Description: The program swaps values of an array in place.

.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.data									;data area
array BYTE "B","A","D","C","F","E","H","G"

.code									;code area
main PROC
	mov ecx, lengthof array				;lengthof array is moved to ecx

	mov esi, 0							;0 is moved to esi

L1:
	sub ecx,1							;1 is subtracted from ecx
	
	mov al, array[esi]					;array[esi] is moved to al

	mov edi, esi						;esi is moved to edi

	add esi, TYPE array					;the type of array is added to esi

	mov bl, array[esi]					;array[esi] is moved to bl

	xchg al,bl							;al and bl are exchanged

	mov array[edi],al					;al is moved to array[edi]

	mov array[esi],bl					;bl is moved to array[esi]

	add esi, TYPE array					;the type of array is added to esi

	loop L1								;L1 is looped

	INVOKE ExitProcess,0				; ends program
main ENDP
end main
