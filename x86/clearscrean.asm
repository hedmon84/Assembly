push 0x6
call clrscr
add esp, 4
#stop



clrscr:
 mov ebx, dword [esp + 4]
 and ebx, 0x0f