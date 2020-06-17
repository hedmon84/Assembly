call main
#stop

; sum => eax
; i => ecx
array_sum:
 xor eax , eax  ; es igual a mov eax , 0
 xor ecx , ecx

as_for:
   cmp ecx, dword[esp + 8]
   jge as_en_for
jge as_end_for:
mov ebx, dword 
