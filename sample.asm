section .text
global asmvecsub
asmvecsub:
; Initialize index
loop_start:
mov rax, [rdx]
mov rbx, [r8]
add rax, rbx
mov [r9], rax
add rdx, 4
add r8, 4
add r9, 4
loop loop_start
ret
