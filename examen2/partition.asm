call main
#stop

swap:
    
    #show dword[esp+4]
    mov ebp,dword[esp+12]
     
    mov esi,dword[esp+8] ; i
    mov edi, dword[esp+4] ;j

    mov edx,dword[ebp+esi*4] ; temp
    mov ecx,dword[ebp+esi*4] ; i
    mov ecx,dword[ebp+edi*4] ;arr[i] = arr[j];
    mov dword[ebp+esi*4],edx ;arr[j] = temp;
    ret

partition:
    
    mov edx,dword[ebp+8]  ; high

    mov eax , dword[ebp+edx*4] ; int pivot = arr[high];
    #show eax

  
 
    mov ecx , dword[ebp+4] ; low
    sub ecx , 1; i
    #show ecx
   
  
    mov edi,edx
    sub edi,1  ; high -1
    #show edi
    mov esi, ecx ;j
    as_for:
    cmp esi,edi
    jge end

    cmp dword[ebp+esi*4],eax
    jg no_if

    inc ecx  ;i++
      
    push dword[esp+12]
    push ecx
    push esi
    
    call swap
    add esp,12
    no_if:
  
    jmp as_for
    end:
    
    push dword[esp+12]
    add ecx ,1 ;
    push edx
    call swap
    add esp,12

    mov eax,ecx
    add eax,1

    ret

main:
    sub esp, 52
    #set dword [esp] = [56, 1, 12, 87, 65, 65, 73, 91, 75, 29, 33, 100, 55]
    mov ebp,esp
    push ebp

    ;#show dword[ebp] [11]
    push 12
    push 0
   
    call partition
    #show eax
    add esp, 12

    #show dword [esp][13] signed decimal

    add esp, 52
    ret

