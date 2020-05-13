li $s1 , 0xcac0
li $s0 , 0xb800
li $t0 , 0x4e20

andi $t0, $t0, 0x0fff
sll $a0, $a0, 12
or $t0,$t0, $a0

loop:
beq $s1 , $s0, end_loop
sh $t0, 0($s0)
addi $s0, $s0, 2
j loop
end_loop:
