; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc < %s -mtriple=x86_64-- -mattr=+sse2       | FileCheck %s --check-prefixes=SSE,SSE2
; RUN: llc < %s -mtriple=x86_64-- -mattr=+sse4.2     | FileCheck %s --check-prefixes=SSE,SSE4
; RUN: llc < %s -mtriple=x86_64-- -mattr=+avx        | FileCheck %s --check-prefixes=AVX,AVX1
; RUN: llc < %s -mtriple=x86_64-- -mattr=+avx2       | FileCheck %s --check-prefixes=AVX,AVX2

define <4 x i32> @add_op1_constant(i32* %p) nounwind {
; SSE-LABEL: add_op1_constant:
; SSE:       # %bb.0:
; SSE-NEXT:    movl (%rdi), %eax
; SSE-NEXT:    addl $42, %eax
; SSE-NEXT:    movd %eax, %xmm0
; SSE-NEXT:    retq
;
; AVX-LABEL: add_op1_constant:
; AVX:       # %bb.0:
; AVX-NEXT:    movl (%rdi), %eax
; AVX-NEXT:    addl $42, %eax
; AVX-NEXT:    vmovd %eax, %xmm0
; AVX-NEXT:    retq
  %x = load i32, i32* %p
  %b = add i32 %x, 42
  %r = insertelement <4 x i32> undef, i32 %b, i32 0
  ret <4 x i32> %r
}

define <8 x i16> @add_op0_constant(i16* %p) nounwind {
; SSE-LABEL: add_op0_constant:
; SSE:       # %bb.0:
; SSE-NEXT:    movzwl (%rdi), %eax
; SSE-NEXT:    addl $42, %eax
; SSE-NEXT:    movd %eax, %xmm0
; SSE-NEXT:    retq
;
; AVX-LABEL: add_op0_constant:
; AVX:       # %bb.0:
; AVX-NEXT:    movzwl (%rdi), %eax
; AVX-NEXT:    addl $42, %eax
; AVX-NEXT:    vmovd %eax, %xmm0
; AVX-NEXT:    retq
  %x = load i16, i16* %p
  %b = add i16 42, %x
  %r = insertelement <8 x i16> undef, i16 %b, i32 0
  ret <8 x i16> %r
}

define <2 x i64> @sub_op0_constant(i64* %p) nounwind {
; SSE-LABEL: sub_op0_constant:
; SSE:       # %bb.0:
; SSE-NEXT:    movl $42, %eax
; SSE-NEXT:    subq (%rdi), %rax
; SSE-NEXT:    movq %rax, %xmm0
; SSE-NEXT:    retq
;
; AVX-LABEL: sub_op0_constant:
; AVX:       # %bb.0:
; AVX-NEXT:    movl $42, %eax
; AVX-NEXT:    subq (%rdi), %rax
; AVX-NEXT:    vmovq %rax, %xmm0
; AVX-NEXT:    retq
  %x = load i64, i64* %p
  %b = sub i64 42, %x
  %r = insertelement <2 x i64> undef, i64 %b, i32 0
  ret <2 x i64> %r
}

define <16 x i8> @sub_op1_constant(i8* %p) nounwind {
; SSE-LABEL: sub_op1_constant:
; SSE:       # %bb.0:
; SSE-NEXT:    movb (%rdi), %al
; SSE-NEXT:    addb $-42, %al
; SSE-NEXT:    movzbl %al, %eax
; SSE-NEXT:    movd %eax, %xmm0
; SSE-NEXT:    retq
;
; AVX-LABEL: sub_op1_constant:
; AVX:       # %bb.0:
; AVX-NEXT:    movb (%rdi), %al
; AVX-NEXT:    addb $-42, %al
; AVX-NEXT:    movzbl %al, %eax
; AVX-NEXT:    vmovd %eax, %xmm0
; AVX-NEXT:    retq
  %x = load i8, i8* %p
  %b = sub i8 %x, 42
  %r = insertelement <16 x i8> undef, i8 %b, i32 0
  ret <16 x i8> %r
}

define <4 x i32> @mul_op1_constant(i32* %p) nounwind {
; SSE-LABEL: mul_op1_constant:
; SSE:       # %bb.0:
; SSE-NEXT:    imull $42, (%rdi), %eax
; SSE-NEXT:    movd %eax, %xmm0
; SSE-NEXT:    retq
;
; AVX-LABEL: mul_op1_constant:
; AVX:       # %bb.0:
; AVX-NEXT:    imull $42, (%rdi), %eax
; AVX-NEXT:    vmovd %eax, %xmm0
; AVX-NEXT:    retq
  %x = load i32, i32* %p
  %b = mul i32 %x, 42
  %r = insertelement <4 x i32> undef, i32 %b, i32 0
  ret <4 x i32> %r
}

define <8 x i16> @mul_op0_constant(i16* %p) nounwind {
; SSE-LABEL: mul_op0_constant:
; SSE:       # %bb.0:
; SSE-NEXT:    movzwl (%rdi), %eax
; SSE-NEXT:    imull $42, %eax, %eax
; SSE-NEXT:    movd %eax, %xmm0
; SSE-NEXT:    retq
;
; AVX-LABEL: mul_op0_constant:
; AVX:       # %bb.0:
; AVX-NEXT:    movzwl (%rdi), %eax
; AVX-NEXT:    imull $42, %eax, %eax
; AVX-NEXT:    vmovd %eax, %xmm0
; AVX-NEXT:    retq
  %x = load i16, i16* %p
  %b = mul i16 42, %x
  %r = insertelement <8 x i16> undef, i16 %b, i32 0
  ret <8 x i16> %r
}

define <4 x i32> @and_op1_constant(i32* %p) nounwind {
; SSE-LABEL: and_op1_constant:
; SSE:       # %bb.0:
; SSE-NEXT:    movl (%rdi), %eax
; SSE-NEXT:    andl $42, %eax
; SSE-NEXT:    movd %eax, %xmm0
; SSE-NEXT:    retq
;
; AVX-LABEL: and_op1_constant:
; AVX:       # %bb.0:
; AVX-NEXT:    movl (%rdi), %eax
; AVX-NEXT:    andl $42, %eax
; AVX-NEXT:    vmovd %eax, %xmm0
; AVX-NEXT:    retq
  %x = load i32, i32* %p
  %b = and i32 %x, 42
  %r = insertelement <4 x i32> undef, i32 %b, i32 0
  ret <4 x i32> %r
}

define <2 x i64> @or_op1_constant(i64* %p) nounwind {
; SSE-LABEL: or_op1_constant:
; SSE:       # %bb.0:
; SSE-NEXT:    movq (%rdi), %rax
; SSE-NEXT:    orq $42, %rax
; SSE-NEXT:    movq %rax, %xmm0
; SSE-NEXT:    retq
;
; AVX-LABEL: or_op1_constant:
; AVX:       # %bb.0:
; AVX-NEXT:    movq (%rdi), %rax
; AVX-NEXT:    orq $42, %rax
; AVX-NEXT:    vmovq %rax, %xmm0
; AVX-NEXT:    retq
  %x = load i64, i64* %p
  %b = or i64 %x, 42
  %r = insertelement <2 x i64> undef, i64 %b, i32 0
  ret <2 x i64> %r
}

define <8 x i16> @xor_op1_constant(i16* %p) nounwind {
; SSE-LABEL: xor_op1_constant:
; SSE:       # %bb.0:
; SSE-NEXT:    movzwl (%rdi), %eax
; SSE-NEXT:    xorl $42, %eax
; SSE-NEXT:    movd %eax, %xmm0
; SSE-NEXT:    retq
;
; AVX-LABEL: xor_op1_constant:
; AVX:       # %bb.0:
; AVX-NEXT:    movzwl (%rdi), %eax
; AVX-NEXT:    xorl $42, %eax
; AVX-NEXT:    vmovd %eax, %xmm0
; AVX-NEXT:    retq
  %x = load i16, i16* %p
  %b = xor i16 %x, 42
  %r = insertelement <8 x i16> undef, i16 %b, i32 0
  ret <8 x i16> %r
}

define <4 x i32> @shl_op0_constant(i32* %p) nounwind {
; SSE-LABEL: shl_op0_constant:
; SSE:       # %bb.0:
; SSE-NEXT:    movb (%rdi), %cl
; SSE-NEXT:    movl $42, %eax
; SSE-NEXT:    shll %cl, %eax
; SSE-NEXT:    movd %eax, %xmm0
; SSE-NEXT:    retq
;
; AVX-LABEL: shl_op0_constant:
; AVX:       # %bb.0:
; AVX-NEXT:    movb (%rdi), %cl
; AVX-NEXT:    movl $42, %eax
; AVX-NEXT:    shll %cl, %eax
; AVX-NEXT:    vmovd %eax, %xmm0
; AVX-NEXT:    retq
  %x = load i32, i32* %p
  %b = shl i32 42, %x
  %r = insertelement <4 x i32> undef, i32 %b, i32 0
  ret <4 x i32> %r
}

define <16 x i8> @shl_op1_constant(i8* %p) nounwind {
; SSE-LABEL: shl_op1_constant:
; SSE:       # %bb.0:
; SSE-NEXT:    movb (%rdi), %al
; SSE-NEXT:    shlb $5, %al
; SSE-NEXT:    movzbl %al, %eax
; SSE-NEXT:    movd %eax, %xmm0
; SSE-NEXT:    retq
;
; AVX-LABEL: shl_op1_constant:
; AVX:       # %bb.0:
; AVX-NEXT:    movb (%rdi), %al
; AVX-NEXT:    shlb $5, %al
; AVX-NEXT:    movzbl %al, %eax
; AVX-NEXT:    vmovd %eax, %xmm0
; AVX-NEXT:    retq
  %x = load i8, i8* %p
  %b = shl i8 %x, 5
  %r = insertelement <16 x i8> undef, i8 %b, i32 0
  ret <16 x i8> %r
}

define <2 x i64> @lshr_op0_constant(i64* %p) nounwind {
; SSE-LABEL: lshr_op0_constant:
; SSE:       # %bb.0:
; SSE-NEXT:    movb (%rdi), %cl
; SSE-NEXT:    movl $42, %eax
; SSE-NEXT:    shrq %cl, %rax
; SSE-NEXT:    movq %rax, %xmm0
; SSE-NEXT:    retq
;
; AVX-LABEL: lshr_op0_constant:
; AVX:       # %bb.0:
; AVX-NEXT:    movb (%rdi), %cl
; AVX-NEXT:    movl $42, %eax
; AVX-NEXT:    shrq %cl, %rax
; AVX-NEXT:    vmovq %rax, %xmm0
; AVX-NEXT:    retq
  %x = load i64, i64* %p
  %b = lshr i64 42, %x
  %r = insertelement <2 x i64> undef, i64 %b, i32 0
  ret <2 x i64> %r
}

define <4 x i32> @lshr_op1_constant(i32* %p) nounwind {
; SSE-LABEL: lshr_op1_constant:
; SSE:       # %bb.0:
; SSE-NEXT:    movl (%rdi), %eax
; SSE-NEXT:    shrl $17, %eax
; SSE-NEXT:    movd %eax, %xmm0
; SSE-NEXT:    retq
;
; AVX-LABEL: lshr_op1_constant:
; AVX:       # %bb.0:
; AVX-NEXT:    movl (%rdi), %eax
; AVX-NEXT:    shrl $17, %eax
; AVX-NEXT:    vmovd %eax, %xmm0
; AVX-NEXT:    retq
  %x = load i32, i32* %p
  %b = lshr i32 %x, 17
  %r = insertelement <4 x i32> undef, i32 %b, i32 0
  ret <4 x i32> %r
}

define <8 x i16> @ashr_op0_constant(i16* %p) nounwind {
; SSE-LABEL: ashr_op0_constant:
; SSE:       # %bb.0:
; SSE-NEXT:    movb (%rdi), %cl
; SSE-NEXT:    movw $-42, %ax
; SSE-NEXT:    sarw %cl, %ax
; SSE-NEXT:    movd %eax, %xmm0
; SSE-NEXT:    retq
;
; AVX-LABEL: ashr_op0_constant:
; AVX:       # %bb.0:
; AVX-NEXT:    movb (%rdi), %cl
; AVX-NEXT:    movw $-42, %ax
; AVX-NEXT:    sarw %cl, %ax
; AVX-NEXT:    vmovd %eax, %xmm0
; AVX-NEXT:    retq
  %x = load i16, i16* %p
  %b = ashr i16 -42, %x
  %r = insertelement <8 x i16> undef, i16 %b, i32 0
  ret <8 x i16> %r
}

define <8 x i16> @ashr_op1_constant(i16* %p) nounwind {
; SSE-LABEL: ashr_op1_constant:
; SSE:       # %bb.0:
; SSE-NEXT:    movzwl (%rdi), %eax
; SSE-NEXT:    sarw $7, %ax
; SSE-NEXT:    movd %eax, %xmm0
; SSE-NEXT:    retq
;
; AVX-LABEL: ashr_op1_constant:
; AVX:       # %bb.0:
; AVX-NEXT:    movzwl (%rdi), %eax
; AVX-NEXT:    sarw $7, %ax
; AVX-NEXT:    vmovd %eax, %xmm0
; AVX-NEXT:    retq
  %x = load i16, i16* %p
  %b = ashr i16 %x, 7
  %r = insertelement <8 x i16> undef, i16 %b, i32 0
  ret <8 x i16> %r
}

define <4 x i32> @sdiv_op0_constant(i32* %p) nounwind {
; SSE-LABEL: sdiv_op0_constant:
; SSE:       # %bb.0:
; SSE-NEXT:    movl $42, %eax
; SSE-NEXT:    xorl %edx, %edx
; SSE-NEXT:    idivl (%rdi)
; SSE-NEXT:    movd %eax, %xmm0
; SSE-NEXT:    retq
;
; AVX-LABEL: sdiv_op0_constant:
; AVX:       # %bb.0:
; AVX-NEXT:    movl $42, %eax
; AVX-NEXT:    xorl %edx, %edx
; AVX-NEXT:    idivl (%rdi)
; AVX-NEXT:    vmovd %eax, %xmm0
; AVX-NEXT:    retq
  %x = load i32, i32* %p
  %b = sdiv i32 42, %x
  %r = insertelement <4 x i32> undef, i32 %b, i32 0
  ret <4 x i32> %r
}

define <8 x i16> @sdiv_op1_constant(i16* %p) nounwind {
; SSE-LABEL: sdiv_op1_constant:
; SSE:       # %bb.0:
; SSE-NEXT:    movswl (%rdi), %eax
; SSE-NEXT:    imull $-15603, %eax, %ecx # imm = 0xC30D
; SSE-NEXT:    shrl $16, %ecx
; SSE-NEXT:    addl %eax, %ecx
; SSE-NEXT:    movzwl %cx, %eax
; SSE-NEXT:    sarw $5, %cx
; SSE-NEXT:    shrl $15, %eax
; SSE-NEXT:    addl %ecx, %eax
; SSE-NEXT:    movd %eax, %xmm0
; SSE-NEXT:    retq
;
; AVX-LABEL: sdiv_op1_constant:
; AVX:       # %bb.0:
; AVX-NEXT:    movswl (%rdi), %eax
; AVX-NEXT:    imull $-15603, %eax, %ecx # imm = 0xC30D
; AVX-NEXT:    shrl $16, %ecx
; AVX-NEXT:    addl %eax, %ecx
; AVX-NEXT:    movzwl %cx, %eax
; AVX-NEXT:    sarw $5, %cx
; AVX-NEXT:    shrl $15, %eax
; AVX-NEXT:    addl %ecx, %eax
; AVX-NEXT:    vmovd %eax, %xmm0
; AVX-NEXT:    retq
  %x = load i16, i16* %p
  %b = sdiv i16 %x, 42
  %r = insertelement <8 x i16> undef, i16 %b, i32 0
  ret <8 x i16> %r
}

define <8 x i16> @srem_op0_constant(i16* %p) nounwind {
; SSE-LABEL: srem_op0_constant:
; SSE:       # %bb.0:
; SSE-NEXT:    movw $42, %ax
; SSE-NEXT:    xorl %edx, %edx
; SSE-NEXT:    idivw (%rdi)
; SSE-NEXT:    # kill: def $dx killed $dx def $edx
; SSE-NEXT:    movd %edx, %xmm0
; SSE-NEXT:    retq
;
; AVX-LABEL: srem_op0_constant:
; AVX:       # %bb.0:
; AVX-NEXT:    movw $42, %ax
; AVX-NEXT:    xorl %edx, %edx
; AVX-NEXT:    idivw (%rdi)
; AVX-NEXT:    # kill: def $dx killed $dx def $edx
; AVX-NEXT:    vmovd %edx, %xmm0
; AVX-NEXT:    retq
  %x = load i16, i16* %p
  %b = srem i16 42, %x
  %r = insertelement <8 x i16> undef, i16 %b, i32 0
  ret <8 x i16> %r
}

define <4 x i32> @srem_op1_constant(i32* %p) nounwind {
; SSE-LABEL: srem_op1_constant:
; SSE:       # %bb.0:
; SSE-NEXT:    movslq (%rdi), %rax
; SSE-NEXT:    imulq $818089009, %rax, %rcx # imm = 0x30C30C31
; SSE-NEXT:    movq %rcx, %rdx
; SSE-NEXT:    shrq $63, %rdx
; SSE-NEXT:    sarq $35, %rcx
; SSE-NEXT:    addl %edx, %ecx
; SSE-NEXT:    imull $42, %ecx, %ecx
; SSE-NEXT:    subl %ecx, %eax
; SSE-NEXT:    movd %eax, %xmm0
; SSE-NEXT:    retq
;
; AVX-LABEL: srem_op1_constant:
; AVX:       # %bb.0:
; AVX-NEXT:    movslq (%rdi), %rax
; AVX-NEXT:    imulq $818089009, %rax, %rcx # imm = 0x30C30C31
; AVX-NEXT:    movq %rcx, %rdx
; AVX-NEXT:    shrq $63, %rdx
; AVX-NEXT:    sarq $35, %rcx
; AVX-NEXT:    addl %edx, %ecx
; AVX-NEXT:    imull $42, %ecx, %ecx
; AVX-NEXT:    subl %ecx, %eax
; AVX-NEXT:    vmovd %eax, %xmm0
; AVX-NEXT:    retq
  %x = load i32, i32* %p
  %b = srem i32 %x, 42
  %r = insertelement <4 x i32> undef, i32 %b, i32 0
  ret <4 x i32> %r
}

define <4 x i32> @udiv_op0_constant(i32* %p) nounwind {
; SSE-LABEL: udiv_op0_constant:
; SSE:       # %bb.0:
; SSE-NEXT:    movl $42, %eax
; SSE-NEXT:    xorl %edx, %edx
; SSE-NEXT:    divl (%rdi)
; SSE-NEXT:    movd %eax, %xmm0
; SSE-NEXT:    retq
;
; AVX-LABEL: udiv_op0_constant:
; AVX:       # %bb.0:
; AVX-NEXT:    movl $42, %eax
; AVX-NEXT:    xorl %edx, %edx
; AVX-NEXT:    divl (%rdi)
; AVX-NEXT:    vmovd %eax, %xmm0
; AVX-NEXT:    retq
  %x = load i32, i32* %p
  %b = udiv i32 42, %x
  %r = insertelement <4 x i32> undef, i32 %b, i32 0
  ret <4 x i32> %r
}

define <2 x i64> @udiv_op1_constant(i64* %p) nounwind {
; SSE-LABEL: udiv_op1_constant:
; SSE:       # %bb.0:
; SSE-NEXT:    movq (%rdi), %rax
; SSE-NEXT:    shrq %rax
; SSE-NEXT:    movabsq $-4392081922311798003, %rcx # imm = 0xC30C30C30C30C30D
; SSE-NEXT:    mulq %rcx
; SSE-NEXT:    shrq $4, %rdx
; SSE-NEXT:    movq %rdx, %xmm0
; SSE-NEXT:    retq
;
; AVX-LABEL: udiv_op1_constant:
; AVX:       # %bb.0:
; AVX-NEXT:    movq (%rdi), %rax
; AVX-NEXT:    shrq %rax
; AVX-NEXT:    movabsq $-4392081922311798003, %rcx # imm = 0xC30C30C30C30C30D
; AVX-NEXT:    mulq %rcx
; AVX-NEXT:    shrq $4, %rdx
; AVX-NEXT:    vmovq %rdx, %xmm0
; AVX-NEXT:    retq
  %x = load i64, i64* %p
  %b = udiv i64 %x, 42
  %r = insertelement <2 x i64> undef, i64 %b, i32 0
  ret <2 x i64> %r
}

define <2 x i64> @urem_op0_constant(i64* %p) nounwind {
; SSE-LABEL: urem_op0_constant:
; SSE:       # %bb.0:
; SSE-NEXT:    movl $42, %eax
; SSE-NEXT:    xorl %edx, %edx
; SSE-NEXT:    divq (%rdi)
; SSE-NEXT:    movq %rdx, %xmm0
; SSE-NEXT:    retq
;
; AVX-LABEL: urem_op0_constant:
; AVX:       # %bb.0:
; AVX-NEXT:    movl $42, %eax
; AVX-NEXT:    xorl %edx, %edx
; AVX-NEXT:    divq (%rdi)
; AVX-NEXT:    vmovq %rdx, %xmm0
; AVX-NEXT:    retq
  %x = load i64, i64* %p
  %b = urem i64 42, %x
  %r = insertelement <2 x i64> undef, i64 %b, i32 0
  ret <2 x i64> %r
}

define <16 x i8> @urem_op1_constant(i8* %p) nounwind {
; SSE-LABEL: urem_op1_constant:
; SSE:       # %bb.0:
; SSE-NEXT:    movb (%rdi), %cl
; SSE-NEXT:    movl %ecx, %eax
; SSE-NEXT:    shrb %al
; SSE-NEXT:    movzbl %al, %eax
; SSE-NEXT:    imull $49, %eax, %eax
; SSE-NEXT:    shrl $10, %eax
; SSE-NEXT:    movb $42, %dl
; SSE-NEXT:    # kill: def $al killed $al killed $eax
; SSE-NEXT:    mulb %dl
; SSE-NEXT:    subb %al, %cl
; SSE-NEXT:    movzbl %cl, %eax
; SSE-NEXT:    movd %eax, %xmm0
; SSE-NEXT:    retq
;
; AVX-LABEL: urem_op1_constant:
; AVX:       # %bb.0:
; AVX-NEXT:    movb (%rdi), %cl
; AVX-NEXT:    movl %ecx, %eax
; AVX-NEXT:    shrb %al
; AVX-NEXT:    movzbl %al, %eax
; AVX-NEXT:    imull $49, %eax, %eax
; AVX-NEXT:    shrl $10, %eax
; AVX-NEXT:    movb $42, %dl
; AVX-NEXT:    # kill: def $al killed $al killed $eax
; AVX-NEXT:    mulb %dl
; AVX-NEXT:    subb %al, %cl
; AVX-NEXT:    movzbl %cl, %eax
; AVX-NEXT:    vmovd %eax, %xmm0
; AVX-NEXT:    retq
  %x = load i8, i8* %p
  %b = urem i8 %x, 42
  %r = insertelement <16 x i8> undef, i8 %b, i32 0
  ret <16 x i8> %r
}

define <4 x float> @fadd_op1_constant(float* %p) nounwind {
; SSE-LABEL: fadd_op1_constant:
; SSE:       # %bb.0:
; SSE-NEXT:    movss {{.*#+}} xmm0 = mem[0],zero,zero,zero
; SSE-NEXT:    addss {{.*}}(%rip), %xmm0
; SSE-NEXT:    retq
;
; AVX-LABEL: fadd_op1_constant:
; AVX:       # %bb.0:
; AVX-NEXT:    vmovss {{.*#+}} xmm0 = mem[0],zero,zero,zero
; AVX-NEXT:    vaddss {{.*}}(%rip), %xmm0, %xmm0
; AVX-NEXT:    retq
  %x = load float, float* %p
  %b = fadd float %x, 42.0
  %r = insertelement <4 x float> undef, float %b, i32 0
  ret <4 x float> %r
}

define <2 x double> @fsub_op1_constant(double* %p) nounwind {
; SSE-LABEL: fsub_op1_constant:
; SSE:       # %bb.0:
; SSE-NEXT:    movsd {{.*#+}} xmm0 = mem[0],zero
; SSE-NEXT:    addsd {{.*}}(%rip), %xmm0
; SSE-NEXT:    retq
;
; AVX-LABEL: fsub_op1_constant:
; AVX:       # %bb.0:
; AVX-NEXT:    vmovsd {{.*#+}} xmm0 = mem[0],zero
; AVX-NEXT:    vaddsd {{.*}}(%rip), %xmm0, %xmm0
; AVX-NEXT:    retq
  %x = load double, double* %p
  %b = fsub double %x, 42.0
  %r = insertelement <2 x double> undef, double %b, i32 0
  ret <2 x double> %r
}

define <4 x float> @fsub_op0_constant(float* %p) nounwind {
; SSE-LABEL: fsub_op0_constant:
; SSE:       # %bb.0:
; SSE-NEXT:    movss {{.*#+}} xmm0 = mem[0],zero,zero,zero
; SSE-NEXT:    subss (%rdi), %xmm0
; SSE-NEXT:    retq
;
; AVX-LABEL: fsub_op0_constant:
; AVX:       # %bb.0:
; AVX-NEXT:    vmovss {{.*#+}} xmm0 = mem[0],zero,zero,zero
; AVX-NEXT:    vsubss (%rdi), %xmm0, %xmm0
; AVX-NEXT:    retq
  %x = load float, float* %p
  %b = fsub float 42.0, %x
  %r = insertelement <4 x float> undef, float %b, i32 0
  ret <4 x float> %r
}

define <4 x float> @fmul_op1_constant(float* %p) nounwind {
; SSE-LABEL: fmul_op1_constant:
; SSE:       # %bb.0:
; SSE-NEXT:    movss {{.*#+}} xmm0 = mem[0],zero,zero,zero
; SSE-NEXT:    mulss {{.*}}(%rip), %xmm0
; SSE-NEXT:    retq
;
; AVX-LABEL: fmul_op1_constant:
; AVX:       # %bb.0:
; AVX-NEXT:    vmovss {{.*#+}} xmm0 = mem[0],zero,zero,zero
; AVX-NEXT:    vmulss {{.*}}(%rip), %xmm0, %xmm0
; AVX-NEXT:    retq
  %x = load float, float* %p
  %b = fmul float %x, 42.0
  %r = insertelement <4 x float> undef, float %b, i32 0
  ret <4 x float> %r
}

define <2 x double> @fdiv_op1_constant(double* %p) nounwind {
; SSE-LABEL: fdiv_op1_constant:
; SSE:       # %bb.0:
; SSE-NEXT:    movsd {{.*#+}} xmm0 = mem[0],zero
; SSE-NEXT:    divsd {{.*}}(%rip), %xmm0
; SSE-NEXT:    retq
;
; AVX-LABEL: fdiv_op1_constant:
; AVX:       # %bb.0:
; AVX-NEXT:    vmovsd {{.*#+}} xmm0 = mem[0],zero
; AVX-NEXT:    vdivsd {{.*}}(%rip), %xmm0, %xmm0
; AVX-NEXT:    retq
  %x = load double, double* %p
  %b = fdiv double %x, 42.0
  %r = insertelement <2 x double> undef, double %b, i32 0
  ret <2 x double> %r
}

define <4 x float> @fdiv_op0_constant(float* %p) nounwind {
; SSE-LABEL: fdiv_op0_constant:
; SSE:       # %bb.0:
; SSE-NEXT:    movss {{.*#+}} xmm0 = mem[0],zero,zero,zero
; SSE-NEXT:    divss (%rdi), %xmm0
; SSE-NEXT:    retq
;
; AVX-LABEL: fdiv_op0_constant:
; AVX:       # %bb.0:
; AVX-NEXT:    vmovss {{.*#+}} xmm0 = mem[0],zero,zero,zero
; AVX-NEXT:    vdivss (%rdi), %xmm0, %xmm0
; AVX-NEXT:    retq
  %x = load float, float* %p
  %b = fdiv float 42.0, %x
  %r = insertelement <4 x float> undef, float %b, i32 0
  ret <4 x float> %r
}

define <4 x float> @frem_op1_constant(float* %p) nounwind {
; SSE-LABEL: frem_op1_constant:
; SSE:       # %bb.0:
; SSE-NEXT:    pushq %rax
; SSE-NEXT:    movss {{.*#+}} xmm0 = mem[0],zero,zero,zero
; SSE-NEXT:    movss {{.*#+}} xmm1 = mem[0],zero,zero,zero
; SSE-NEXT:    callq fmodf
; SSE-NEXT:    popq %rax
; SSE-NEXT:    retq
;
; AVX-LABEL: frem_op1_constant:
; AVX:       # %bb.0:
; AVX-NEXT:    pushq %rax
; AVX-NEXT:    vmovss {{.*#+}} xmm0 = mem[0],zero,zero,zero
; AVX-NEXT:    vmovss {{.*#+}} xmm1 = mem[0],zero,zero,zero
; AVX-NEXT:    callq fmodf
; AVX-NEXT:    popq %rax
; AVX-NEXT:    retq
  %x = load float, float* %p
  %b = frem float %x, 42.0
  %r = insertelement <4 x float> undef, float %b, i32 0
  ret <4 x float> %r
}

define <2 x double> @frem_op0_constant(double* %p) nounwind {
; SSE-LABEL: frem_op0_constant:
; SSE:       # %bb.0:
; SSE-NEXT:    pushq %rax
; SSE-NEXT:    movsd {{.*#+}} xmm1 = mem[0],zero
; SSE-NEXT:    movsd {{.*#+}} xmm0 = mem[0],zero
; SSE-NEXT:    callq fmod
; SSE-NEXT:    popq %rax
; SSE-NEXT:    retq
;
; AVX-LABEL: frem_op0_constant:
; AVX:       # %bb.0:
; AVX-NEXT:    pushq %rax
; AVX-NEXT:    vmovsd {{.*#+}} xmm1 = mem[0],zero
; AVX-NEXT:    vmovsd {{.*#+}} xmm0 = mem[0],zero
; AVX-NEXT:    callq fmod
; AVX-NEXT:    popq %rax
; AVX-NEXT:    retq
  %x = load double, double* %p
  %b = frem double 42.0, %x
  %r = insertelement <2 x double> undef, double %b, i32 0
  ret <2 x double> %r
}
