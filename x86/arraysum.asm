

call  main
#stop
arraysum:

mov eax, 0 ; sum
mov ecx, 0 ; i


as_for:
cmp ecx,dword[esp+8]
#show dword[esp+8]
jge end_for
mov ebx,dword[esp+4]
#show ebx
mov eax, dword[ebx+ecx*4]  ; a + i*4
inc ecx
#show ecx
jmp as_for

end_for:
ret


main:
sub esp,12
mov dword[esp],10
mov dword[esp+4],20
mov dword[esp+8],30
mov ebx,esp
#show esp
#show ebx

push 3
push ebx
#show esp

call arraysum
add esp,8
#show eax

add esp,12
ret
