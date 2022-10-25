;Baldwin2.asm 
;Student: Daniel Baldwin
;Class: CSC3210
;Assignment#: 6-2
;Description: This program calculates the factorial of an input number
INCLUDE Irvine32.inc		; Irvine32 library
.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword
.data
prompt1 byte "Enter unsigned integer (n!): ",0
prompt2 byte "calculated (n!): ",0
.code
main PROC
mov edx, offset prompt1		;address of prompt1 is moved to edx
call WriteString			;prints prompt in console from edx
call ReadDec				;allows for unsigned integer input and stores value in eax
push eax					;pushes user input 
call Factorial				;calls method that calculates the factorial
mov edx, offset prompt2		;address of prompt2 is moved to edx
call WriteString			;prints prompt in console from edx
call WriteDec				;display the number
call Crlf					;output a CR/LF

invoke ExitProcess,0
main ENDP
;Calculates the factorial of user input unsigned integers
;Receives eax or [ebp+8], and returns the factorial in the eax register
Factorial PROC
push ebp					;ebp is pushed onto the stack
mov ebp,esp					;esp is moved to ebp
mov eax,[ebp + 8]			;the first parameter is moved to eax
cmp eax,0					;eax and 0 are compared
ja L1						;jump to L1 is if eax's value  is above 0
mov eax,1					;1 is moved to eax
jmp L2						;jump to L2

L1:							;beginning of L1
	dec eax					;eax is decremented
	push eax				;eax is pushed onto the stack
	call Factorial			;calls method that calculates the factorial

ReturnFactorial:			;this calculates the math
 mov ebx,[ebp+8]			;the first parameter is moved to ebx
 mul ebx					;unsigned multiplication with ebx as the multiplier

L2: 
	pop ebp					;ebp is popped from the stack
	ret 4					;the stack is cleaned

Factorial ENDP
end main
