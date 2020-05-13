li $t1, 0b10000000
li $s0, 0xffff0000
loop: lbu $t0, 4($s0)
andi $t2,$t0, 0b10000000
bne $t2, $t1, loop
#show $t0 binary