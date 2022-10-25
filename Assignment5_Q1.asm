;Baldwin1.asm 
;Student: Daniel Baldwin
;Class: CSC3210
;Assignment#: 5-1
;Description: The program finds the smallest element by searching an array.

.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.data								;data area
index BYTE 0
min SBYTE 0
ary SBYTE 11, 15, -3, -4, 0, 60, 11, -1, 18
arraySize = ($-ary)/ TYPE ary

.code								;code area
main PROC

mov bl, [ary+0]						;[arr+0] is moved to bl

mov min, bl							;bl is moved to min

beginwhile:							;while loop begins

	cmp index,arraySize				;arraySize and index are compared

	jg endwhile						;if index is greater than arraySize jump to end of while loop

	movzx esi, index				;index is moved to esi

	mov al, ary[esi]				;ary[esi] is moved to al

	cmp al, min						;min and al are compared

	jge L1							;if al is greater than or equal to min jump to L1

	mov min, al						;al is moved to min

L1:

	inc index						;index is incremented

	jmp beginwhile					;jump to the beginning of the loop

endwhile:							;while loop ends

movsx edx, min

	INVOKE ExitProcess,0			; ends program
main ENDP
end main
