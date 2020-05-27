jal main
#stop


quicksort:
	slt	$v0,$a1,$a2
	beq	$v0,$zero,$L15
	addiu	$sp,$sp,-32
	sw	$ra,28($sp)
	sw	$s2,24($sp)
	sw	$s1,20($sp)
	sw	$s0,16($sp)
	move	$s2,$a0
	move	$s1,$a2
	sll	$t3,$a1,2
	addu	$t3,$a0,$t3
	move	$s0,$a2
	move	$v1,$a1
	j	$Ls3
$L8:
	sll	$v0,$s0,2
	addu	$t2,$s2,$v0
	lw	$a3,0($t2)
	slt	$t0,$a0,$a3
	beq	$t0,$zero,$L6
	addiu	$v0,$v0,-4
	addu	$v0,$s2,$v0
$L9:
	addiu	$s0,$s0,-1
	move	$t2,$v0
	addiu	$v0,$v0,-4
	lw	$a3,4($v0)
	slt	$t0,$a0,$a3
	bne	$t0,$zero,$L9
$L6:
	slt	$v0,$v1,$s0
	beq	$v0,$zero,$L10
	sw	$a3,0($t1)
	sw	$a2,0($t2)
$Ls3:
	sll	$v0,$v1,2
	addu	$t1,$s2,$v0
	lw	$a2,0($t1)
	lw	$a0,0($t3)
	slt	$a3,$a0,$a2
	bne	$a3,$zero,$L8
	slt	$a3,$v1,$s1
	beq	$a3,$zero,$L8
	addiu	$v0,$v0,4
	addu	$v0,$s2,$v0
$L7:
	addiu	$v1,$v1,1
	move	$t1,$v0
	lw	$a2,0($v0)
	slt	$a3,$a0,$a2
	bne	$a3,$zero,$L8
	addiu	$v0,$v0,4
	bne	$s1,$v1,$L7
	j	$L8
$L10:
	sll	$v0,$s0,2
	addu	$v0,$s2,$v0
	lw	$v1,0($v0)
	sw	$v1,0($t3)
	sw	$a0,0($v0)
	addiu	$a2,$s0,-1
	move	$a0,$s2
	jal	quicksort
	move	$a2,$s1
	addiu	$a1,$s0,1
	move	$a0,$s2
	jal	quicksort
	lw	$ra,28($sp)
	lw	$s2,24($sp)
	lw	$s1,20($sp)
	lw	$s0,16($sp)
	addiu	$sp,$sp,32
	jr	$ra
$L15:
	jr	$ra
main:
	addiu	$sp,$sp,-88
	sw	$ra,84($sp)
	sw	$s1,80($sp)
	sw	$s0,76($sp)
	#set memory word 16($sp) = [ 100, 2, 67, 38, 76, 12, 50, 62, 14, 60, 294, 193, 351 ]
	li	$a2,12			
	move	$a1,$zero
	addiu	$a0,$sp,16
	jal	quicksort
	#set memory byte 0x10000000 = ['s', 'o','r', 't', 'e', 'd','a','r','r','a','y' , ' ']
	li $a0, 0x10000000
	jal	print_str
	addiu	$s0,$sp,16
	addiu	$s1,$sp,68
$L20:
	lw	$a0,0($s0)
	jal	print_number
	#show [' ']
	addiu	$s0,$s0,4
	bne	$s0,$s1,$L20
	move	$v0,$zero
	lw	$ra,84($sp)
	lw	$s1,80($sp)
	lw	$s0,76($sp)
	addiu	$sp,$sp,88
	jr	$ra
