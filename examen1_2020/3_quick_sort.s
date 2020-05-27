	.file	1 "3_quick_sort.c"
	.section .mdebug.abi32
	.previous
	.nan	legacy
	.module	fp=32
	.module	nooddspreg
	.text
	.align	2
	.globl	quicksort
	.set	nomips16
	.set	nomicromips
	.ent	quicksort
	.type	quicksort, @function
quicksort:
	.frame	$sp,32,$31		# vars= 0, regs= 4/0, args= 16, gp= 0
	.mask	0x80070000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	slt	$2,$5,$6
	beq	$2,$0,$L15
	nop

	addiu	$sp,$sp,-32
	sw	$31,28($sp)
	sw	$18,24($sp)
	sw	$17,20($sp)
	sw	$16,16($sp)
	move	$18,$4
	move	$17,$6
	sll	$11,$5,2
	addu	$11,$4,$11
	move	$16,$6
	move	$3,$5
	b	$L3
	nop

$L8:
	sll	$2,$16,2
	addu	$10,$18,$2
	lw	$7,0($10)
	nop
	slt	$8,$4,$7
	beq	$8,$0,$L6
	nop

	addiu	$2,$2,-4
	addu	$2,$18,$2
$L9:
	addiu	$16,$16,-1
	move	$10,$2
	addiu	$2,$2,-4
	lw	$7,4($2)
	nop
	slt	$8,$4,$7
	bne	$8,$0,$L9
	nop

$L6:
	slt	$2,$3,$16
	beq	$2,$0,$L10
	nop

	sw	$7,0($9)
	sw	$6,0($10)
$L3:
	sll	$2,$3,2
	addu	$9,$18,$2
	lw	$6,0($9)
	lw	$4,0($11)
	nop
	slt	$7,$4,$6
	bne	$7,$0,$L8
	nop

	slt	$7,$3,$17
	beq	$7,$0,$L8
	nop

	addiu	$2,$2,4
	addu	$2,$18,$2
$L7:
	addiu	$3,$3,1
	move	$9,$2
	lw	$6,0($2)
	nop
	slt	$7,$4,$6
	bne	$7,$0,$L8
	nop

	addiu	$2,$2,4
	bne	$17,$3,$L7
	nop

	b	$L8
	nop

$L10:
	sll	$2,$16,2
	addu	$2,$18,$2
	lw	$3,0($2)
	nop
	sw	$3,0($11)
	sw	$4,0($2)
	addiu	$6,$16,-1
	move	$4,$18
	jal	quicksort
	nop

	move	$6,$17
	addiu	$5,$16,1
	move	$4,$18
	jal	quicksort
	nop

	lw	$31,28($sp)
	lw	$18,24($sp)
	lw	$17,20($sp)
	lw	$16,16($sp)
	addiu	$sp,$sp,32
	jr	$31
	nop

$L15:
	jr	$31
	nop

	.set	macro
	.set	reorder
	.end	quicksort
	.size	quicksort, .-quicksort
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
$LC1:
	.ascii	"Sorted array: \000"
	.rdata
	.align	2
$LC0:
	.word	43
	.word	17
	.word	46
	.word	15
	.word	78
	.word	35
	.word	60
	.word	61
	.word	3
	.word	51
	.word	5
	.word	92
	.word	5
	.text
	.align	2
	.globl	main
	.set	nomips16
	.set	nomicromips
	.ent	main
	.type	main, @function
main:
	.frame	$sp,88,$31		# vars= 56, regs= 3/0, args= 16, gp= 0
	.mask	0x80030000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-88
	sw	$31,84($sp)
	sw	$17,80($sp)
	sw	$16,76($sp)
	lui	$2,%hi($LC0)
	addiu	$2,$2,%lo($LC0)
	addiu	$3,$sp,16
	addiu	$8,$2,48
$L19:
	lw	$7,0($2)
	lw	$6,4($2)
	lw	$5,8($2)
	lw	$4,12($2)
	sw	$7,0($3)
	sw	$6,4($3)
	sw	$5,8($3)
	sw	$4,12($3)
	addiu	$2,$2,16
	addiu	$3,$3,16
	bne	$2,$8,$L19
	nop

	lw	$2,0($2)
	nop
	sw	$2,0($3)
	li	$6,12			# 0xc
	move	$5,$0
	addiu	$4,$sp,16
	jal	quicksort
	nop

	lui	$4,%hi($LC1)
	addiu	$4,$4,%lo($LC1)
	jal	print_str
	nop

	addiu	$16,$sp,16
	addiu	$17,$sp,68
$L20:
	lw	$4,0($16)
	jal	print_number
	nop

	addiu	$16,$16,4
	bne	$16,$17,$L20
	nop

	move	$2,$0
	lw	$31,84($sp)
	lw	$17,80($sp)
	lw	$16,76($sp)
	addiu	$sp,$sp,88
	jr	$31
	nop

	.set	macro
	.set	reorder
	.end	main
	.size	main, .-main
	.ident	"GCC: (GNU) 9.1.0"
