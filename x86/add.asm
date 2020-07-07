; uso de pila
push 20       ; add to stack  a1
push 10       ; add to stack  a2
call _add      ; jal
add esp, 8
#show eax signed decimal
#stop



_add:
 mov eax, dword[esp + 4] ; se posiciona en offset+4 10
 mov ebx, dword[esp + 8]; se posiciona en offset+8 10
 ; or  add eax,dword[esp + 8] mas corto
 add eax, ebx
 ret  ; retorna a la siguiente instruccion y se trae el resultado en eax