;Baldwin1.asm 
;Student: Daniel Baldwin
;Class: CSC3210
;Assignment#: 6-1
;Description: The program calculates val1=(val2-val3)*(val4/val2)-(val3*3)

.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.data								;data area
val1 SDWORD ?
val2 SDWORD 5
val3 SDWORD 2
val4 SDWORD 25
.code								;code area
main PROC
	;all variables are pushed to the stack
	push val4
	push val3
	push val2
	push val1
	call IntegerArithmetic
	mov val1, ebx					;result of IntegerArithimetic is stored in val1

	INVOKE ExitProcess,0			; ends program
main ENDP
;Performs the equation: val1=(val2-val3)*(val4/val2)-(val3*3)
;Receives the variables val4,val3,val2,and val1
;Returns the answer to the equation in the ebx register
IntegerArithmetic PROC
	push ebp						;ebp is pushed onto the stack
	mov ebp, esp					;esp is moved to ebp
	
	;(val2-val3)
	mov ebx,[ebp + 12]				;val2 is moved to ebx
	sub ebx,[ebp + 16]				;val3 is subtracted from ebx

	;(val4/val2)
	mov eax,[ebp + 20]				;val4 is moved to eax
	CDQ								;the value in eax is extended to edx		
	mov ecx,[ebp + 12]				;val2 is moved to ecx
	idiv ecx						;signed division is done with ecx as the divisor
	
	;(val2-val3)*(val4/val2)
	imul ebx						;signed multiplication is done with ebx as the multiplier
	mov ebx,eax						;eax is moved to ebx

	;(val3*3)
	mov eax, 3						;3 is moved to eax
	mov ecx,[ebp + 16] 				;val2 is moved to ebx
	imul ecx						;signed multiplication is done with ecx as the multiplier

	;((val2-val3)*(val4/val2))-(val3*3)
	sub ebx, eax;					;eax is subtracted from ebx
	;result of procedure is stored in ebx

	pop ebp							;ebp is popped from the stack
	ret								;the return address is popped from the stack
IntegerArithmetic ENDP
end main
