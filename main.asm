$MOD51    ; This includes 8051 definitions for the Metalink assembler

ORG 00h
num equ 30h
temp equ 31h
temp2 equ 32h

MOV num,#0
MOV temp,#2

loop:
MOV A,num
MOV R2,A
call check_prime
MOV A,R2
CJNE A,#0,not_prime
prime:
MOV A,num
MOV B,#10
DIV AB
MOV P0,A
MOV P2,B
call delay
jmp final
not_prime:
jmp final
final:
INC num
MOV A,num
CJNE A,#100,loop
MOV num,#0
jmp loop

check_prime:
MOV A,R2
CJNE A,#2,not_eq
MOV R2,#0
RET
not_eq:
JC lower
jmp start
lower:
MOV R2,#1
RET
start:
MOV temp2,A
MOV temp,#2
continue:
MOV A,temp2
MOV B,temp
DIV AB
MOV A,B
CJNE A,#0,false
true:
MOV A,temp2
CJNE A,31h,correct
incorrect:
MOV R2,#0
RET
correct:
MOV R2,#1
RET
false:
INC temp
MOV A,temp2
CJNE A,31h,continue 
MOV R2,#0
RET

delay:
MOV R1,#20
x1:MOV R0,#250
x0:DJNZ R0,x0
DJNZ R1,x1
RET

END
