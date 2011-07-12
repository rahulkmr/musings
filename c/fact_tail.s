	.file	"fact_tail.c"
	.text
.globl fact
	.type	fact, @function
fact:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	movq	%rsp, %rbp
	.cfi_offset 6, -16
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	%edi, -4(%rbp)
	movl	%esi, -8(%rbp)
	cmpl	$0, -4(%rbp)
	jg	.L2
	movl	-8(%rbp), %eax
	jmp	.L3
.L2:
	movl	-4(%rbp), %eax
	imull	-8(%rbp), %eax
	movl	-4(%rbp), %edx
	subl	$1, %edx
	movl	%eax, %esi
	movl	%edx, %edi
	call	fact
.L3:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	fact, .-fact
	.ident	"GCC: (Ubuntu/Linaro 4.5.2-8ubuntu4) 4.5.2"
	.section	.note.GNU-stack,"",@progbits
