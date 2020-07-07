mov ecx, 5
mov ebx, 1 ; result


loop:
 cmp ecx, 1          ; beq
 je end_loop         ; beq
 ; ebx * ecx
 mov eax, ebx
 imul ecx            ; ecx * eax
 ; hi = edx
 ; lo = eax
 mov ebx, eax
 dec ecx             ; sub exc , -1
 jmp loop
end_loop:
#show  ebx 
#stop


