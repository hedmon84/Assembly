
 
li $t0, 20 ; Row
li $t1, 40 ; Column
li $s0, 0xffff0000
li $s1, 0xb800
li $a0, 0x1e01 ; character
li $a1, 0x1e20 ; back ground

; #exec "/home/hedmon/Desktop/Prueba2_P2_2020/move_sprite.asm"
jal move_sprite 





loop:
    sll $t2, $t0, 6
    sll $t3, $t0, 4
    add $t2, $t2, $t3
    add $t2, $t2, $t1
    sll $t2, $t2, 1
    add $s2, $t2, $s1
    sh $a0, 0($s2)
  



    
test_keys:
    lbu $v0, 4($s0)
    andi $v1, $v0, 0x1
    #show $v1
    beq $v1, $zero, test_right
wait_left:
    lbu $v0, 4($s0)
    andi $v0, $v0, 0x1
    #show $v0
    bne $v0, $zero, wait_left
    
    sh $a1, 0($s2)
    addi $t1, $t1, -1
    j loop
    
test_right:
    andi $v1, $v0, 0x2
     #show $v1
    beq $v1, $zero, test_down
wait_right:
    lbu $v0, 4($s0)
    andi $v0, $v0, 0x2
     #show $v0
    bne $v0, $zero, wait_right
    
    sh $a1, 0($s2)
    addi $t1, $t1, 1
    j loop

test_down:
    andi $v1, $v0, 0x4
    beq $v1, $zero, test_up
wait_down:
    lbu $v0, 4($s0)
    andi $v0, $v0, 0x4
    bne $v0, $zero, wait_down
     #show $v0
    sh $a1, 0($s2)
    addi $t0, $t0, 1
    j loop
test_up:
    andi $v1, $v0, 0x8
     #show $v1
    beq $v1, $zero, test_b
 
wait_up:
    lbu $v0, 4($s0)
    andi $v0, $v0, 0x8
     #show $v0
    bne $v0, $zero, wait_up
    sh $a1, 0($s2)
    addi $t0, $t0, -1
    j loop

test_b:
   andi $v1, $v0, 0b01000000
    #show $v1
   beq $v1 , $zero, test_q

wait_b:
 lbu $v0, 4($s0)
    andi $v0, $v0, 0b01000000
     #show $v0
    bne $v0, $zero, wait_b
    addi $t4, $t4, 1
    #show $v0
    j loop


test_q:
    andi $v1, $v0, 0x14
    bne $v1, $zero, end_loop
    j test_keys








end_loop:
    #show $v0 binary






move_sprite:

move $t0,$s2
#show $t0
move $t1,$s3
#show $t1
jr $ra
