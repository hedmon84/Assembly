
call main
#stop 







main:

sub esp, 12

mov dword[esp],5
#show dword[esp]
mov dword[esp+4],20
#show dword[esp+4]
mov dword[esp+8],30
#show dword[esp+8]


mov eax , 300

#show ["/n"] ascii
push 10
push eax
#show dword[esp] 
#show dword[esp+4]
#show dword[esp+8]
#show dword[esp+12]
#show dword[esp+16]

add esp, 12
ret

