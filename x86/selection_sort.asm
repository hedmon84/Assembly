
call main
#stop


get_min:

mov eax , 0 ; min
mov ecx , 1 ; i

mov ebp,dword[esp+4]   ;inicializando ebp
;#show dword[ebp] [3]
#show ebp


#show[10] ascii 
#show dword[esp] [9]
#show[10] ascii 

;#show dword[ebp] [3]
#show[10] ascii


as_for:


cmp ecx, dword[esp+8]   ;i < n
jge end_loop  


mov ebx ,dword[ebp+ecx*4] 

#show dword[ebp+eax*4]
#show ebx


cmp dword[ebp+eax*4],ebx  ;arreglo[min] > arreglo[i]
#show eflags

jge equalize

inc ecx          ;i++
#show ecx
jmp as_for


equalize:
#show ecx


mov eax,ecx               ;min = i
#show eax
inc ecx                    ;i++
#show ecx
jmp as_for

end_loop:
ret




selection_sort:



#show[10] ascii 

#show ebp
#show["ebp"] ascii
;#show dword[ebp] [3]
#show[10] ascii 
#show["esp"] ascii
#show dword[esp] [6]

cmp dword[esp+8],1       ;if (n>1)
je end_sort   

push dword[esp+8]       ; n
push dword[esp+8]     ; array[] pointer


#show[10] ascii 
#show dword[esp] [8]
#show[10] ascii 

call get_min               ; get_min func
#show eax


#show[10] ascii 
#show dword[esp] [8]
#show[10] ascii 
add esp,8

#show[10] ascii 
#show dword[esp] [6]
#show[10] ascii 


cmp eax,0          ; pos!=0
je rec_call


mov ebx,dword[ebp]         ;int temp = arreglo[0];
 #show ebx                  ; ebx ; tmp
 #show[10] ascii 

mov edx , dword[ebp+eax*4]    ; arreglo[pos]
#show edx
mov dword[ebp],edx             ;arreglo[0] = arreglo[pos];
;#show dword[ebp]

mov dword[ebp+eax*4],ebx   ; arreglo[pos] = temp;
;#show dword[ebp] [3]
jmp rec_call

rec_call:

#show[10] ascii 
#show dword[esp] [6]
#show[10] ascii 

dec dword[esp+8]            ;n-1

#show[10] ascii 
#show dword[esp] [6]


lea   esi,dword[ebp+4]     ;&arreglo[1]
#show[10] ascii 
#show esi


mov dword[esp+4],esi




#show[10] ascii 
#show["*"] ascii 
#show[10] ascii

jmp selection_sort



end_sort:    ;end selection sort



ret


main:

sub esp,48
mov dword[esp],100
mov dword[esp+4],2
mov dword[esp+8],67
mov dword[esp+12],38
mov dword[esp+16],76
mov dword[esp+20],12
mov dword[esp+24],50
mov dword[esp+28],62
mov dword[esp+32],14
mov dword[esp+36],60
mov dword[esp+40],294
mov dword[esp+44],193
mov dword[esp+48],351

mov ebp,esp
#show ebp
push 13

push ebp
#show esp

#show dword[ebp] [3]
#show[10] ascii 
#show dword[esp] [5]

call selection_sort
add esp,8
#show[10] ascii
#show dword[esp] [13]   ; show  sorted array

add esp,48
ret
