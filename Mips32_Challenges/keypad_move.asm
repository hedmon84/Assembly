li $s1 , 0xc1ac;character position
li $s2 , 0x0e78  ;character
li $s3 , 0x0e20  ;clean previews
li $t2, 0b00000001 ; left cursor
li $t1, 0b00000010 ; right cursor
li $t3, 0b00000100 ; up cursor
li $t4, 0b00001000 ; down cursor
li $s0, 0xffff0000 ; keypad address 0xffff0004

; #exec "/home/hedmon/Desktop/Q2_2020_Classes/Organizacion/EasyAsm11Mayo2020/Mips32_Programs/keypad_move.asm"




loop:
sh $s2 , 0($s1)
lbu $t0, 4($s0)
beq $t0,$zero,loop
beq $t0, $t2, left
beq $t0, $t1, right
beq $t0, $t3, up
beq $t0, $t4, down


j loop

right: 
keyzero:
lbu $t0, 4($s0)
bne $t0 , $zero, keyzero
addi $s1 , $s1 , 2
sh $s2, 0($s1)
move $s4 , $s1
addi $s4 , $s4 , -2
sh $s3 , 0($s4)

j loop

left:
keyzero1:
lbu $t0, 4($s0)
bne $t0 , $zero, keyzero1
addi $s1 , $s1 , -2
sh $s2 , 0($s1)
move $s4 , $s1
addi $s4, $s4, 2
sh $s3 , 0($s4)

j loop

up:
keyzero2:
lbu $t0, 4($s0)
bne $t0 , $zero, keyzero2
addi $s1, $s1, 160
sh $s2 , 0($s1)
move $s4 , $s1
addi $s4, $s4, -160
sh $s3, 0($s4)
j loop

down:
keyzero3:
lbu $t0, 4($s0)
bne $t0, $zero, keyzero3
addi $s1, $s1, -160
sh $s2, 0($s1)
move $s4, $s1
addi $s4, $s4, 160
sh $s3, 0($s4)	
j loop








#show $t0 binary;










