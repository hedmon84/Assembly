li $s1 , 0xcac0
li $s0 , 0xb800
li $t0 , 0x4e204e20
li $t1, 0x0fff0fff
li $a1, 0x0;

and $t0, $t0, $t1
move $a1, $a0
sll $a0,$a0,28
sll $a1, $a1, 12
or $a0,$a0 ,$a1
or $t0,$t0, $a0

loop:
sw $t0 , 0($s0)
addi $s0, $s0, 4
bne $s0 , $s1, loop
