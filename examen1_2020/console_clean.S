put_char:
#show [$a0] ascii
jr $ra


print_str:
	addiu	$sp,$sp,-24
	sw	$ra,20($sp)
	sw	$s0,16($sp)
	move	$s0,$a0
	lb	$a0,0($a0)
	beq	$a0,$zero,$L1
$L3:
	addiu	$s0,$s0,1
	jal	put_char
	lb	$a0,0($s0)
	bne	$a0,$zero,$L3
$L1:
	lw	$ra,20($sp)
	lw	$s0,16($sp)
	addiu	$sp,$sp,24
	jr	$ra
print_number:
	addiu	$sp,$sp,-40
	sw	$ra,36($sp)
	beq	$a0,$zero,$L13
	move	$v1,$a0
	bltz	$a0,$L14
$Ls9:
	sb	$zero,27($sp)
	addiu	$a0,$sp,27
	li	$a1,10			
$Ls10:
	move	$v0,$v1
	div	$zero,$v1,$a1
	bne	$a1,$zero,$fn
	break	7
$fn:
	mfhi	$a2
	mflo	$v1
	addiu	$a0,$a0,-1
	addiu	$a2,$a2,48
	sb	$a2,0($a0)
	slti	$v0,$v0,10
	beq	$v0,$zero,$Ls10
	jal	print_str
$Ls6:
	lw	$ra,36($sp)
	addiu	$sp,$sp,40
	jr	$ra
$L13:
	li	$a0,48			
	jal	put_char
	j	$Ls6
$L14:
	subu	$v1,$zero,$a0
	j	$Ls9
