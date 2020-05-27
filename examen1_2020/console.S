	.file	1 "console.c"
	.section .mdebug.abi32
	.previous
	.nan	legacy
	.module	fp=32
	.module	nooddspreg
	.text
	.align	2
	.globl	print_str
	.set	nomips16
	.set	nomicromips
	.ent	print_str
	.type	print_str, @function
print_str:
	.frame	$sp,24,$31		# vars= 0, regs= 2/0, args= 16, gp= 0
	.mask	0x80010000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-24
	sw	$31,20($sp)
	sw	$16,16($sp)
	move	$16,$4
	lb	$4,0($4)
	nop
	beq	$4,$0,$L1
	nop

$L3:
	addiu	$16,$16,1
	jal	put_char
	nop

	lb	$4,0($16)
	nop
	bne	$4,$0,$L3
	nop

$L1:
	lw	$31,20($sp)
	lw	$16,16($sp)
	addiu	$sp,$sp,24
	jr	$31
	nop

	.set	macro
	.set	reorder
	.end	print_str
	.size	print_str, .-print_str
	.align	2
	.globl	print_number
	.set	nomips16
	.set	nomicromips
	.ent	print_number
	.type	print_number, @function
print_number:
	.frame	$sp,40,$31		# vars= 16, regs= 1/0, args= 16, gp= 0
	.mask	0x80000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-40
	sw	$31,36($sp)
	beq	$4,$0,$L13
	nop

	move	$3,$4
	bltz	$4,$L14
	nop

$L9:
	sb	$0,27($sp)
	addiu	$4,$sp,27
	li	$5,10			# 0xa
$L10:
	move	$2,$3
	div	$0,$3,$5
	bne	$5,$0,1f
	nop
	break	7
1:
	mfhi	$6
	mflo	$3
	addiu	$4,$4,-1
	addiu	$6,$6,48
	sb	$6,0($4)
	slt	$2,$2,10
	beq	$2,$0,$L10
	nop

	jal	print_str
	nop

$L6:
	lw	$31,36($sp)
	addiu	$sp,$sp,40
	jr	$31
	nop

$L13:
	li	$4,48			# 0x30
	jal	put_char
	nop

	b	$L6
	nop

$L14:
	subu	$3,$0,$4
	b	$L9
	nop

	.set	macro
	.set	reorder
	.end	print_number
	.size	print_number, .-print_number
	.ident	"GCC: (GNU) 9.1.0"
