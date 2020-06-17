;....x   ;0
;...x.x  ;1
;..x...x ; 2
;.x.....x
;xxxxxxxxx ; 3
;#show[10] ascii \n
mov ecx,5
mov ebx, 0

loop:

cmp ecx , 1
je end_loop

#show[" "] ascii

dec ecx 
jmp loop
end_loop:
#show["*"] ascii
add ebx, 1
cmp ebx , 1
je paint2
cmp ebx , 2
je paint3
cmp ebx , 3
je paint4
cmp ebx , 4
je paint5




paint2:
#show[10] ascii 
mov ecx,4
jmp loop

paint3:
#show[" "] ascii
#show["*"] ascii
#show[10] ascii 
mov ecx,3
jmp loop


paint4:
mov ecx,2
mov eax,3
loop2:
cmp eax, 1
je loop
#show[" "] ascii
dec eax
jmp loop2

paint5:
#show[10] ascii 
#show[" "] ascii
#show["*"] ascii
mov eax,5
$loop3:
cmp eax, 0
je $end_loop
#show[" "] ascii
dec eax
jmp $loop3

$end_loop:
#show["*"] ascii
#show[10] ascii 
mov ecx,9
loop3:
cmp ecx , 0
je $end
#show["*"] ascii
dec ecx
jmp loop3
$end:

#stop