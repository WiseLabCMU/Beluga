	.cpu cortex-m4
	.eabi_attribute 27, 1
	.eabi_attribute 28, 1
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 6
	.eabi_attribute 34, 1
	.eabi_attribute 18, 4
	.file	"deca_device.c"
	.text
.Ltext0:
	.section	.bss.dw1000local,"aw",%nobits
	.align	2
	.type	dw1000local, %object
	.size	dw1000local, 56
dw1000local:
	.space	56
	.section	.data.pdw1000local,"aw"
	.align	2
	.type	pdw1000local, %object
	.size	pdw1000local, 4
pdw1000local:
	.word	dw1000local
	.section	.text.dwt_setlocaldataptr,"ax",%progbits
	.align	1
	.global	dwt_setlocaldataptr
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	dwt_setlocaldataptr, %function
dwt_setlocaldataptr:
.LFB0:
	.file 1 "C:\\Users\\vikra\\Desktop\\decawave-ble\\NRF_UWB_Combo\\deca_driver\\deca_device.c"
	.loc 1 100 1
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	sub	sp, sp, #8
.LCFI0:
	str	r0, [sp, #4]
	.loc 1 102 8
	ldr	r3, [sp, #4]
	cmp	r3, #0
	bne	.L2
	.loc 1 104 16
	mov	r3, #-1
	b	.L3
.L2:
	.loc 1 107 20
	ldr	r2, [sp, #4]
	mov	r3, r2
	lsls	r3, r3, #3
	subs	r3, r3, r2
	lsls	r3, r3, #3
	ldr	r2, .L4
	add	r3, r3, r2
	.loc 1 107 18
	ldr	r2, .L4+4
	str	r3, [r2]
	.loc 1 109 12
	movs	r3, #0
.L3:
	.loc 1 110 1
	mov	r0, r3
	add	sp, sp, #8
.LCFI1:
	@ sp needed
	bx	lr
.L5:
	.align	2
.L4:
	.word	dw1000local
	.word	pdw1000local
.LFE0:
	.size	dwt_setlocaldataptr, .-dwt_setlocaldataptr
	.section	.text.dwt_initialise,"ax",%progbits
	.align	1
	.global	dwt_initialise
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	dwt_initialise, %function
dwt_initialise:
.LFB1:
	.loc 1 143 1
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
.LCFI2:
	sub	sp, sp, #24
.LCFI3:
	mov	r3, r0
	strh	r3, [sp, #6]	@ movhi
	.loc 1 144 12
	movs	r3, #0
	strh	r3, [sp, #22]	@ movhi
	.loc 1 145 12
	movs	r3, #0
	str	r3, [sp, #16]
	.loc 1 147 17
	ldr	r3, .L13
	ldr	r3, [r3]
	.loc 1 147 29
	movs	r2, #0
	strb	r2, [r3, #17]
	.loc 1 148 17
	ldr	r3, .L13
	ldr	r3, [r3]
	.loc 1 148 29
	movs	r2, #0
	strb	r2, [r3, #26]
	.loc 1 149 17
	ldr	r3, .L13
	ldr	r3, [r3]
	.loc 1 149 30
	movs	r2, #0
	strh	r2, [r3, #24]	@ movhi
	.loc 1 151 17
	ldr	r3, .L13
	ldr	r3, [r3]
	.loc 1 151 28
	movs	r2, #0
	str	r2, [r3, #40]
	.loc 1 152 17
	ldr	r3, .L13
	ldr	r3, [r3]
	.loc 1 152 26
	movs	r2, #0
	str	r2, [r3, #44]
	.loc 1 153 17
	ldr	r3, .L13
	ldr	r3, [r3]
	.loc 1 153 26
	movs	r2, #0
	str	r2, [r3, #48]
	.loc 1 154 17
	ldr	r3, .L13
	ldr	r3, [r3]
	.loc 1 154 27
	movs	r2, #0
	str	r2, [r3, #52]
	.loc 1 157 26
	bl	dwt_readdevid
	mov	r2, r0
	.loc 1 157 8
	ldr	r3, .L13+4
	cmp	r2, r3
	beq	.L7
	.loc 1 159 16
	mov	r3, #-1
	b	.L8
.L7:
	.loc 1 163 5
	bl	dwt_softreset
	.loc 1 165 5
	movs	r0, #0
	bl	_dwt_enableclocks
	.loc 1 168 5
	movs	r2, #4
	movs	r1, #0
	movs	r0, #36
	bl	dwt_write8bitoffsetreg
	.loc 1 171 16
	movs	r0, #30
	bl	_dwt_otpread
	mov	r3, r0
	.loc 1 171 14
	strh	r3, [sp, #22]	@ movhi
	.loc 1 172 26
	ldrh	r3, [sp, #22]
	lsrs	r3, r3, #8
	uxth	r2, r3
	.loc 1 172 17
	ldr	r3, .L13
	ldr	r3, [r3]
	.loc 1 172 26
	uxtb	r2, r2
	strb	r2, [r3, #9]
	.loc 1 175 16
	movs	r0, #4
	bl	_dwt_otpread
	str	r0, [sp, #16]
	.loc 1 176 18
	ldr	r3, [sp, #16]
	uxtb	r3, r3
	.loc 1 176 7
	cmp	r3, #0
	beq	.L9
	.loc 1 179 9
	movs	r2, #2
	movs	r1, #18
	movs	r0, #45
	bl	dwt_write8bitoffsetreg
	.loc 1 180 34
	ldr	r3, .L13
	ldr	r3, [r3]
	ldrh	r2, [r3, #24]
	ldr	r3, .L13
	ldr	r3, [r3]
	orr	r2, r2, #4096
	uxth	r2, r2
	strh	r2, [r3, #24]	@ movhi
.L9:
	.loc 1 184 17
	ldr	r3, .L13
	ldr	r4, [r3]
	.loc 1 184 28
	movs	r0, #6
	bl	_dwt_otpread
	mov	r3, r0
	.loc 1 184 26
	str	r3, [r4]
	.loc 1 185 17
	ldr	r3, .L13
	ldr	r4, [r3]
	.loc 1 185 27
	movs	r0, #7
	bl	_dwt_otpread
	mov	r3, r0
	.loc 1 185 25
	str	r3, [r4, #4]
	.loc 1 188 41
	ldrh	r3, [sp, #22]	@ movhi
	uxtb	r2, r3
	.loc 1 188 17
	ldr	r3, .L13
	ldr	r3, [r3]
	.loc 1 188 41
	and	r2, r2, #31
	uxtb	r2, r2
	.loc 1 188 30
	strb	r2, [r3, #16]
	.loc 1 189 22
	ldr	r3, .L13
	ldr	r3, [r3]
	ldrb	r3, [r3, #16]	@ zero_extendqisi2
	.loc 1 189 8
	cmp	r3, #0
	bne	.L10
	.loc 1 191 21
	ldr	r3, .L13
	ldr	r3, [r3]
	.loc 1 191 34
	movs	r2, #16
	strb	r2, [r3, #16]
.L10:
	.loc 1 194 33
	ldr	r3, .L13
	ldr	r3, [r3]
	.loc 1 194 5
	ldrb	r3, [r3, #16]	@ zero_extendqisi2
	mov	r0, r3
	bl	dwt_setxtaltrim
	.loc 1 197 15
	ldrh	r3, [sp, #6]
	and	r3, r3, #1
	.loc 1 197 7
	cmp	r3, #0
	beq	.L11
	.loc 1 199 9
	bl	_dwt_loaducodefromrom
	.loc 1 200 34
	ldr	r3, .L13
	ldr	r3, [r3]
	ldrh	r2, [r3, #24]
	ldr	r3, .L13
	ldr	r3, [r3]
	orr	r2, r2, #2048
	uxth	r2, r2
	strh	r2, [r3, #24]	@ movhi
	b	.L12
.L11:
.LBB2:
	.loc 1 204 23
	movs	r1, #5
	movs	r0, #54
	bl	dwt_read16bitoffsetreg
	mov	r3, r0
	strh	r3, [sp, #14]	@ movhi
	.loc 1 205 14
	ldrh	r3, [sp, #14]	@ movhi
	bic	r3, r3, #512
	strh	r3, [sp, #14]	@ movhi
	.loc 1 206 9
	ldrh	r3, [sp, #14]
	mov	r2, r3
	movs	r1, #5
	movs	r0, #54
	bl	dwt_write16bitoffsetreg
.L12:
.LBE2:
	.loc 1 209 5
	movs	r0, #1
	bl	_dwt_enableclocks
	.loc 1 212 5
	movs	r2, #0
	movs	r1, #10
	movs	r0, #44
	bl	dwt_write8bitoffsetreg
	.loc 1 215 17
	ldr	r3, .L13
	ldr	r4, [r3]
	.loc 1 215 31
	movs	r1, #0
	movs	r0, #4
	bl	dwt_read32bitoffsetreg
	mov	r3, r0
	.loc 1 215 29
	str	r3, [r4, #20]
	.loc 1 217 12
	movs	r3, #0
.L8:
	.loc 1 219 1
	mov	r0, r3
	add	sp, sp, #24
.LCFI4:
	@ sp needed
	pop	{r4, pc}
.L14:
	.align	2
.L13:
	.word	pdw1000local
	.word	-557186768
.LFE1:
	.size	dwt_initialise, .-dwt_initialise
	.section	.text.dwt_otprevision,"ax",%progbits
	.align	1
	.global	dwt_otprevision
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	dwt_otprevision, %function
dwt_otprevision:
.LFB2:
	.loc 1 235 1
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	.loc 1 236 24
	ldr	r3, .L17
	ldr	r3, [r3]
	ldrb	r3, [r3, #9]	@ zero_extendqisi2
	.loc 1 237 1
	mov	r0, r3
	bx	lr
.L18:
	.align	2
.L17:
	.word	pdw1000local
.LFE2:
	.size	dwt_otprevision, .-dwt_otprevision
	.section	.text.dwt_setfinegraintxseq,"ax",%progbits
	.align	1
	.global	dwt_setfinegraintxseq
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	dwt_setfinegraintxseq, %function
dwt_setfinegraintxseq:
.LFB3:
	.loc 1 252 1
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
.LCFI5:
	sub	sp, sp, #12
.LCFI6:
	str	r0, [sp, #4]
	.loc 1 253 8
	ldr	r3, [sp, #4]
	cmp	r3, #0
	beq	.L20
	.loc 1 255 9
	movw	r2, #2932
	movs	r1, #38
	movs	r0, #54
	bl	dwt_write16bitoffsetreg
	.loc 1 261 1
	b	.L22
.L20:
	.loc 1 259 9
	movs	r2, #0
	movs	r1, #38
	movs	r0, #54
	bl	dwt_write16bitoffsetreg
.L22:
	.loc 1 261 1
	nop
	add	sp, sp, #12
.LCFI7:
	@ sp needed
	ldr	pc, [sp], #4
.LFE3:
	.size	dwt_setfinegraintxseq, .-dwt_setfinegraintxseq
	.section	.text.dwt_setlnapamode,"ax",%progbits
	.align	1
	.global	dwt_setlnapamode
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	dwt_setlnapamode, %function
dwt_setlnapamode:
.LFB4:
	.loc 1 281 1
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
.LCFI8:
	sub	sp, sp, #20
.LCFI9:
	str	r0, [sp, #4]
	str	r1, [sp]
	.loc 1 282 24
	movs	r1, #0
	movs	r0, #38
	bl	dwt_read32bitoffsetreg
	str	r0, [sp, #12]
	.loc 1 283 15
	ldr	r3, [sp, #12]
	bic	r3, r3, #1032192
	str	r3, [sp, #12]
	.loc 1 284 8
	ldr	r3, [sp, #4]
	cmp	r3, #0
	beq	.L24
	.loc 1 286 19
	ldr	r3, [sp, #12]
	orr	r3, r3, #262144
	str	r3, [sp, #12]
.L24:
	.loc 1 288 8
	ldr	r3, [sp]
	cmp	r3, #0
	beq	.L25
	.loc 1 290 19
	ldr	r3, [sp, #12]
	orr	r3, r3, #81920
	str	r3, [sp, #12]
.L25:
	.loc 1 292 5
	ldr	r2, [sp, #12]
	movs	r1, #0
	movs	r0, #38
	bl	dwt_write32bitoffsetreg
	.loc 1 293 1
	nop
	add	sp, sp, #20
.LCFI10:
	@ sp needed
	ldr	pc, [sp], #4
.LFE4:
	.size	dwt_setlnapamode, .-dwt_setlnapamode
	.section	.text.dwt_setgpiodirection,"ax",%progbits
	.align	1
	.global	dwt_setgpiodirection
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	dwt_setgpiodirection, %function
dwt_setgpiodirection:
.LFB5:
	.loc 1 309 1
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
.LCFI11:
	sub	sp, sp, #20
.LCFI12:
	str	r0, [sp, #4]
	str	r1, [sp]
	.loc 1 311 12
	ldr	r2, [sp]
	ldr	r3, [sp, #4]
	orrs	r3, r3, r2
	str	r3, [sp, #12]
	.loc 1 313 12
	ldr	r3, [sp, #12]
	uxtb	r3, r3
	strb	r3, [sp, #8]
	.loc 1 314 23
	ldr	r3, [sp, #12]
	lsrs	r3, r3, #8
	.loc 1 314 12
	uxtb	r3, r3
	strb	r3, [sp, #9]
	.loc 1 315 23
	ldr	r3, [sp, #12]
	lsrs	r3, r3, #16
	.loc 1 315 12
	uxtb	r3, r3
	strb	r3, [sp, #10]
	.loc 1 317 5
	add	r3, sp, #8
	movs	r2, #3
	movs	r1, #8
	movs	r0, #38
	bl	dwt_writetodevice
	.loc 1 318 1
	nop
	add	sp, sp, #20
.LCFI13:
	@ sp needed
	ldr	pc, [sp], #4
.LFE5:
	.size	dwt_setgpiodirection, .-dwt_setgpiodirection
	.section	.text.dwt_setgpiovalue,"ax",%progbits
	.align	1
	.global	dwt_setgpiovalue
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	dwt_setgpiovalue, %function
dwt_setgpiovalue:
.LFB6:
	.loc 1 334 1
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
.LCFI14:
	sub	sp, sp, #20
.LCFI15:
	str	r0, [sp, #4]
	str	r1, [sp]
	.loc 1 336 12
	ldr	r2, [sp]
	ldr	r3, [sp, #4]
	orrs	r3, r3, r2
	str	r3, [sp, #12]
	.loc 1 338 12
	ldr	r3, [sp, #12]
	uxtb	r3, r3
	strb	r3, [sp, #8]
	.loc 1 339 23
	ldr	r3, [sp, #12]
	lsrs	r3, r3, #8
	.loc 1 339 12
	uxtb	r3, r3
	strb	r3, [sp, #9]
	.loc 1 340 23
	ldr	r3, [sp, #12]
	lsrs	r3, r3, #16
	.loc 1 340 12
	uxtb	r3, r3
	strb	r3, [sp, #10]
	.loc 1 342 5
	add	r3, sp, #8
	movs	r2, #3
	movs	r1, #12
	movs	r0, #38
	bl	dwt_writetodevice
	.loc 1 343 1
	nop
	add	sp, sp, #20
.LCFI16:
	@ sp needed
	ldr	pc, [sp], #4
.LFE6:
	.size	dwt_setgpiovalue, .-dwt_setgpiovalue
	.section	.text.dwt_getpartid,"ax",%progbits
	.align	1
	.global	dwt_getpartid
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	dwt_getpartid, %function
dwt_getpartid:
.LFB7:
	.loc 1 359 1
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	.loc 1 360 24
	ldr	r3, .L30
	ldr	r3, [r3]
	ldr	r3, [r3]
	.loc 1 361 1
	mov	r0, r3
	bx	lr
.L31:
	.align	2
.L30:
	.word	pdw1000local
.LFE7:
	.size	dwt_getpartid, .-dwt_getpartid
	.section	.text.dwt_getlotid,"ax",%progbits
	.align	1
	.global	dwt_getlotid
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	dwt_getlotid, %function
dwt_getlotid:
.LFB8:
	.loc 1 377 1
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	.loc 1 378 24
	ldr	r3, .L34
	ldr	r3, [r3]
	ldr	r3, [r3, #4]
	.loc 1 379 1
	mov	r0, r3
	bx	lr
.L35:
	.align	2
.L34:
	.word	pdw1000local
.LFE8:
	.size	dwt_getlotid, .-dwt_getlotid
	.section	.text.dwt_readdevid,"ax",%progbits
	.align	1
	.global	dwt_readdevid
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	dwt_readdevid, %function
dwt_readdevid:
.LFB9:
	.loc 1 393 1
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, lr}
.LCFI17:
	.loc 1 394 12
	movs	r1, #0
	movs	r0, #0
	bl	dwt_read32bitoffsetreg
	mov	r3, r0
	.loc 1 395 1
	mov	r0, r3
	pop	{r3, pc}
.LFE9:
	.size	dwt_readdevid, .-dwt_readdevid
	.section	.text.dwt_configuretxrf,"ax",%progbits
	.align	1
	.global	dwt_configuretxrf
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	dwt_configuretxrf, %function
dwt_configuretxrf:
.LFB10:
	.loc 1 412 1
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
.LCFI18:
	sub	sp, sp, #12
.LCFI19:
	str	r0, [sp, #4]
	.loc 1 415 5
	ldr	r3, [sp, #4]
	ldrb	r3, [r3]	@ zero_extendqisi2
	mov	r2, r3
	movs	r1, #11
	movs	r0, #42
	bl	dwt_write8bitoffsetreg
	.loc 1 418 5
	ldr	r3, [sp, #4]
	ldr	r3, [r3, #4]
	mov	r2, r3
	movs	r1, #0
	movs	r0, #30
	bl	dwt_write32bitoffsetreg
	.loc 1 420 1
	nop
	add	sp, sp, #12
.LCFI20:
	@ sp needed
	ldr	pc, [sp], #4
.LFE10:
	.size	dwt_configuretxrf, .-dwt_configuretxrf
	.section	.text.dwt_configure,"ax",%progbits
	.align	1
	.global	dwt_configure
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	dwt_configure, %function
dwt_configure:
.LFB11:
	.loc 1 438 1
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
.LCFI21:
	sub	sp, sp, #28
.LCFI22:
	str	r0, [sp, #4]
	.loc 1 439 11
	movs	r3, #0
	strb	r3, [sp, #23]
	.loc 1 440 11
	movs	r3, #0
	strb	r3, [sp, #22]
	.loc 1 441 11
	ldr	r3, [sp, #4]
	ldrb	r3, [r3]
	strb	r3, [sp, #19]
	.loc 1 443 43
	ldr	r3, [sp, #4]
	ldrb	r3, [r3, #5]	@ zero_extendqisi2
	mov	r2, r3
	.loc 1 443 12
	ldr	r3, .L50
	ldrh	r3, [r3, r2, lsl #1]	@ movhi
	strh	r3, [sp, #20]	@ movhi
	.loc 1 444 28
	ldr	r3, [sp, #4]
	ldrb	r3, [r3, #1]	@ zero_extendqisi2
	.loc 1 444 11
	subs	r3, r3, #1
	strb	r3, [sp, #18]
	.loc 1 445 49
	ldrb	r3, [sp, #19]	@ zero_extendqisi2
	cmp	r3, #4
	beq	.L40
	.loc 1 445 49 is_stmt 0 discriminator 2
	ldrb	r3, [sp, #19]	@ zero_extendqisi2
	cmp	r3, #7
	bne	.L41
.L40:
	.loc 1 445 49 discriminator 3
	movs	r3, #1
	b	.L42
.L41:
	.loc 1 445 49 discriminator 4
	movs	r3, #0
.L42:
	.loc 1 445 11 is_stmt 1 discriminator 6
	strb	r3, [sp, #17]
	.loc 1 462 29 discriminator 6
	ldr	r3, [sp, #4]
	ldrb	r3, [r3, #7]	@ zero_extendqisi2
	.loc 1 462 7 discriminator 6
	cmp	r3, #0
	bne	.L43
	.loc 1 464 33
	ldr	r3, .L50+4
	ldr	r3, [r3]
	ldr	r2, [r3, #20]
	ldr	r3, .L50+4
	ldr	r3, [r3]
	orr	r2, r2, #4194304
	str	r2, [r3, #20]
	.loc 1 465 15
	ldrh	r3, [sp, #20]
	lsrs	r3, r3, #3
	strh	r3, [sp, #20]	@ movhi
	b	.L44
.L43:
	.loc 1 469 33
	ldr	r3, .L50+4
	ldr	r3, [r3]
	ldr	r2, [r3, #20]
	ldr	r3, .L50+4
	ldr	r3, [r3]
	bic	r2, r2, #4194304
	str	r2, [r3, #20]
.L44:
	.loc 1 472 17
	ldr	r3, .L50+4
	ldr	r3, [r3]
	.loc 1 472 38
	ldr	r2, [sp, #4]
	ldrb	r2, [r2, #8]	@ zero_extendqisi2
	.loc 1 472 30
	strb	r2, [r3, #8]
	.loc 1 474 29
	ldr	r3, .L50+4
	ldr	r3, [r3]
	ldr	r2, [r3, #20]
	ldr	r3, .L50+4
	ldr	r3, [r3]
	bic	r2, r2, #196608
	str	r2, [r3, #20]
	.loc 1 475 29
	ldr	r3, .L50+4
	ldr	r3, [r3]
	ldr	r1, [r3, #20]
	.loc 1 475 62
	ldr	r3, [sp, #4]
	ldrb	r3, [r3, #8]	@ zero_extendqisi2
	.loc 1 475 72
	lsls	r3, r3, #16
	.loc 1 475 53
	and	r2, r3, #196608
	.loc 1 475 29
	ldr	r3, .L50+4
	ldr	r3, [r3]
	orrs	r2, r2, r1
	str	r2, [r3, #20]
	.loc 1 477 5
	ldr	r3, .L50+4
	ldr	r3, [r3]
	ldr	r3, [r3, #20]
	mov	r2, r3
	movs	r1, #0
	movs	r0, #4
	bl	dwt_write32bitoffsetreg
	.loc 1 479 5
	ldrh	r3, [sp, #20]
	mov	r2, r3
	movw	r1, #10244
	movs	r0, #46
	bl	dwt_write16bitoffsetreg
	.loc 1 481 5
	ldrb	r3, [sp, #18]	@ zero_extendqisi2
	mov	r0, r3
	bl	_dwt_configlde
	.loc 1 484 78
	ldrb	r3, [sp, #19]	@ zero_extendqisi2
	ldr	r2, .L50+8
	ldrb	r3, [r2, r3]	@ zero_extendqisi2
	mov	r2, r3
	.loc 1 484 5
	ldr	r3, .L50+12
	ldr	r3, [r3, r2, lsl #2]
	mov	r2, r3
	movs	r1, #7
	movs	r0, #43
	bl	dwt_write32bitoffsetreg
	.loc 1 485 79
	ldrb	r3, [sp, #19]	@ zero_extendqisi2
	ldr	r2, .L50+8
	ldrb	r3, [r2, r3]	@ zero_extendqisi2
	mov	r2, r3
	.loc 1 485 5
	ldr	r3, .L50+16
	ldrb	r3, [r3, r2]	@ zero_extendqisi2
	mov	r2, r3
	movs	r1, #11
	movs	r0, #43
	bl	dwt_write8bitoffsetreg
	.loc 1 488 5
	ldrb	r3, [sp, #17]	@ zero_extendqisi2
	ldr	r2, .L50+20
	ldrb	r3, [r2, r3]	@ zero_extendqisi2
	mov	r2, r3
	movs	r1, #11
	movs	r0, #40
	bl	dwt_write8bitoffsetreg
	.loc 1 492 77
	ldrb	r3, [sp, #19]	@ zero_extendqisi2
	ldr	r2, .L50+8
	ldrb	r3, [r2, r3]	@ zero_extendqisi2
	mov	r2, r3
	.loc 1 492 5
	ldr	r3, .L50+24
	ldr	r3, [r3, r2, lsl #2]
	mov	r2, r3
	movs	r1, #12
	movs	r0, #40
	bl	dwt_write32bitoffsetreg
	.loc 1 496 73
	ldr	r3, [sp, #4]
	ldrb	r3, [r3, #7]	@ zero_extendqisi2
	mov	r0, r3
	.loc 1 496 91
	ldr	r3, [sp, #4]
	ldrb	r3, [r3, #6]	@ zero_extendqisi2
	mov	r1, r3
	.loc 1 496 5
	ldr	r2, .L50+28
	lsls	r3, r0, #1
	add	r3, r3, r1
	ldrh	r3, [r2, r3, lsl #1]
	mov	r2, r3
	movs	r1, #2
	movs	r0, #39
	bl	dwt_write16bitoffsetreg
	.loc 1 499 5
	ldrb	r3, [sp, #18]	@ zero_extendqisi2
	ldr	r2, .L50+32
	ldrh	r3, [r2, r3, lsl #1]
	mov	r2, r3
	movs	r1, #4
	movs	r0, #39
	bl	dwt_write16bitoffsetreg
	.loc 1 501 14
	ldr	r3, [sp, #4]
	ldrb	r3, [r3, #7]	@ zero_extendqisi2
	.loc 1 501 7
	cmp	r3, #0
	bne	.L45
	.loc 1 503 9
	movs	r2, #100
	movs	r1, #6
	movs	r0, #39
	bl	dwt_write16bitoffsetreg
	b	.L46
.L45:
	.loc 1 507 18
	ldr	r3, [sp, #4]
	ldrb	r3, [r3, #2]	@ zero_extendqisi2
	.loc 1 507 11
	cmp	r3, #4
	bne	.L47
	.loc 1 509 13
	movs	r2, #16
	movs	r1, #6
	movs	r0, #39
	bl	dwt_write16bitoffsetreg
	.loc 1 510 13
	movs	r2, #16
	movs	r1, #38
	movs	r0, #39
	bl	dwt_write8bitoffsetreg
	b	.L46
.L47:
	.loc 1 514 13
	movs	r2, #32
	movs	r1, #6
	movs	r0, #39
	bl	dwt_write16bitoffsetreg
	.loc 1 515 13
	movs	r2, #40
	movs	r1, #38
	movs	r0, #39
	bl	dwt_write8bitoffsetreg
.L46:
	.loc 1 520 5
	ldrb	r3, [sp, #18]	@ zero_extendqisi2
	.loc 1 520 94
	ldr	r2, [sp, #4]
	ldrb	r2, [r2, #3]	@ zero_extendqisi2
	mov	r1, r2
	.loc 1 520 5
	ldr	r2, .L50+36
	lsls	r3, r3, #2
	add	r3, r3, r1
	ldr	r3, [r2, r3, lsl #2]
	mov	r2, r3
	movs	r1, #8
	movs	r0, #39
	bl	dwt_write32bitoffsetreg
	.loc 1 524 14
	ldr	r3, [sp, #4]
	ldrh	r3, [r3, #10]
	.loc 1 524 7
	cmp	r3, #0
	bne	.L48
	.loc 1 526 23
	ldr	r3, [sp, #4]
	movw	r2, #4161
	strh	r2, [r3, #10]	@ movhi
.L48:
	.loc 1 528 5
	ldr	r3, [sp, #4]
	ldrh	r3, [r3, #10]
	mov	r2, r3
	movs	r1, #32
	movs	r0, #39
	bl	dwt_write16bitoffsetreg
	.loc 1 531 5
	ldr	r3, .L50+40
	ldr	r3, [r3]
	mov	r2, r3
	movs	r1, #12
	movs	r0, #35
	bl	dwt_write32bitoffsetreg
	.loc 1 532 5
	ldrb	r3, [sp, #18]	@ zero_extendqisi2
	ldr	r2, .L50+40
	lsls	r3, r3, #1
	add	r3, r3, r2
	ldrh	r3, [r3, #4]
	mov	r2, r3
	movs	r1, #4
	movs	r0, #35
	bl	dwt_write16bitoffsetreg
	.loc 1 535 14
	ldr	r3, [sp, #4]
	ldrb	r3, [r3, #6]	@ zero_extendqisi2
	.loc 1 535 7
	cmp	r3, #0
	beq	.L49
	.loc 1 538 67
	ldr	r3, [sp, #4]
	ldrb	r3, [r3, #7]	@ zero_extendqisi2
	mov	r2, r3
	.loc 1 538 9
	ldr	r3, .L50+44
	ldrb	r3, [r3, r2]	@ zero_extendqisi2
	mov	r2, r3
	movs	r1, #0
	movs	r0, #33
	bl	dwt_write8bitoffsetreg
	.loc 1 539 22
	movs	r3, #3
	strb	r3, [sp, #23]
	.loc 1 540 20
	movs	r3, #1
	strb	r3, [sp, #22]
.L49:
	.loc 1 542 47
	ldrb	r3, [sp, #19]	@ zero_extendqisi2
	.loc 1 542 39
	and	r2, r3, #15
	.loc 1 543 47
	ldrb	r3, [sp, #19]	@ zero_extendqisi2
	lsls	r3, r3, #4
	.loc 1 543 39
	uxtb	r3, r3
	.loc 1 542 76
	orrs	r2, r2, r3
	.loc 1 544 47
	ldr	r3, [sp, #4]
	ldrb	r3, [r3, #1]	@ zero_extendqisi2
	.loc 1 544 53
	lsls	r3, r3, #18
	.loc 1 544 38
	and	r3, r3, #786432
	.loc 1 543 76
	orrs	r2, r2, r3
	.loc 1 545 68
	ldrb	r3, [sp, #23]	@ zero_extendqisi2
	lsls	r3, r3, #20
	.loc 1 545 52
	and	r3, r3, #3145728
	.loc 1 544 81
	orrs	r2, r2, r3
	.loc 1 546 46
	ldrb	r3, [sp, #22]	@ zero_extendqisi2
	lsls	r3, r3, #17
	.loc 1 546 32
	and	r3, r3, #131072
	.loc 1 545 96
	orrs	r2, r2, r3
	.loc 1 547 48
	ldr	r3, [sp, #4]
	ldrb	r3, [r3, #4]	@ zero_extendqisi2
	.loc 1 547 57
	lsls	r3, r3, #22
	.loc 1 547 39
	and	r3, r3, #130023424
	.loc 1 546 73
	orrs	r3, r3, r2
	.loc 1 548 48
	ldr	r2, [sp, #4]
	ldrb	r2, [r2, #5]	@ zero_extendqisi2
	.loc 1 548 57
	lsls	r2, r2, #27
	.loc 1 542 12
	orrs	r3, r3, r2
	str	r3, [sp, #12]
	.loc 1 550 5
	ldr	r2, [sp, #12]
	movs	r1, #0
	movs	r0, #31
	bl	dwt_write32bitoffsetreg
	.loc 1 553 37
	ldr	r3, [sp, #4]
	ldrb	r2, [r3, #2]	@ zero_extendqisi2
	.loc 1 553 62
	ldr	r3, [sp, #4]
	ldrb	r3, [r3, #1]	@ zero_extendqisi2
	.loc 1 553 54
	orrs	r3, r3, r2
	uxtb	r3, r3
	.loc 1 553 69
	lsls	r2, r3, #16
	.loc 1 553 102
	ldr	r3, [sp, #4]
	ldrb	r3, [r3, #7]	@ zero_extendqisi2
	.loc 1 553 113
	lsls	r3, r3, #13
	.loc 1 553 93
	orrs	r2, r2, r3
	.loc 1 553 17
	ldr	r3, .L50+4
	ldr	r3, [r3]
	.loc 1 553 27
	str	r2, [r3, #12]
	.loc 1 554 5
	ldr	r3, .L50+4
	ldr	r3, [r3]
	ldr	r3, [r3, #12]
	mov	r2, r3
	movs	r1, #0
	movs	r0, #8
	bl	dwt_write32bitoffsetreg
	.loc 1 560 5
	movs	r2, #66
	movs	r1, #0
	movs	r0, #13
	bl	dwt_write8bitoffsetreg
	.loc 1 561 1
	nop
	add	sp, sp, #28
.LCFI23:
	@ sp needed
	ldr	pc, [sp], #4
.L51:
	.align	2
.L50:
	.word	lde_replicaCoeff
	.word	pdw1000local
	.word	chan_idx
	.word	fs_pll_cfg
	.word	fs_pll_tune
	.word	rx_config
	.word	tx_config
	.word	sftsh
	.word	dtune1
	.word	digital_bb_config
	.word	agc_config
	.word	dwnsSFDlen
.LFE11:
	.size	dwt_configure, .-dwt_configure
	.section	.text.dwt_setrxantennadelay,"ax",%progbits
	.align	1
	.global	dwt_setrxantennadelay
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	dwt_setrxantennadelay, %function
dwt_setrxantennadelay:
.LFB12:
	.loc 1 577 1
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
.LCFI24:
	sub	sp, sp, #12
.LCFI25:
	mov	r3, r0
	strh	r3, [sp, #6]	@ movhi
	.loc 1 579 5
	ldrh	r3, [sp, #6]
	mov	r2, r3
	movw	r1, #6148
	movs	r0, #46
	bl	dwt_write16bitoffsetreg
	.loc 1 580 1
	nop
	add	sp, sp, #12
.LCFI26:
	@ sp needed
	ldr	pc, [sp], #4
.LFE12:
	.size	dwt_setrxantennadelay, .-dwt_setrxantennadelay
	.section	.text.dwt_settxantennadelay,"ax",%progbits
	.align	1
	.global	dwt_settxantennadelay
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	dwt_settxantennadelay, %function
dwt_settxantennadelay:
.LFB13:
	.loc 1 596 1
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
.LCFI27:
	sub	sp, sp, #12
.LCFI28:
	mov	r3, r0
	strh	r3, [sp, #6]	@ movhi
	.loc 1 598 5
	ldrh	r3, [sp, #6]
	mov	r2, r3
	movs	r1, #0
	movs	r0, #24
	bl	dwt_write16bitoffsetreg
	.loc 1 599 1
	nop
	add	sp, sp, #12
.LCFI29:
	@ sp needed
	ldr	pc, [sp], #4
.LFE13:
	.size	dwt_settxantennadelay, .-dwt_settxantennadelay
	.section	.text.dwt_writetxdata,"ax",%progbits
	.align	1
	.global	dwt_writetxdata
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	dwt_writetxdata, %function
dwt_writetxdata:
.LFB14:
	.loc 1 622 1
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
.LCFI30:
	sub	sp, sp, #12
.LCFI31:
	mov	r3, r0
	str	r1, [sp]
	strh	r3, [sp, #6]	@ movhi
	mov	r3, r2	@ movhi
	strh	r3, [sp, #4]	@ movhi
	.loc 1 629 25
	ldrh	r2, [sp, #4]
	ldrh	r3, [sp, #6]
	add	r3, r3, r2
	.loc 1 629 8
	cmp	r3, #1024
	bgt	.L55
	.loc 1 632 71
	ldrh	r3, [sp, #6]
	subs	r3, r3, #2
	.loc 1 632 9
	mov	r2, r3
	ldrh	r1, [sp, #4]
	ldr	r3, [sp]
	movs	r0, #9
	bl	dwt_writetodevice
	.loc 1 633 16
	movs	r3, #0
	b	.L56
.L55:
	.loc 1 637 16
	mov	r3, #-1
.L56:
	.loc 1 639 1
	mov	r0, r3
	add	sp, sp, #12
.LCFI32:
	@ sp needed
	ldr	pc, [sp], #4
.LFE14:
	.size	dwt_writetxdata, .-dwt_writetxdata
	.section	.text.dwt_writetxfctrl,"ax",%progbits
	.align	1
	.global	dwt_writetxfctrl
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	dwt_writetxfctrl, %function
dwt_writetxfctrl:
.LFB15:
	.loc 1 659 1
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
.LCFI33:
	sub	sp, sp, #20
.LCFI34:
	mov	r3, r0
	str	r2, [sp]
	strh	r3, [sp, #6]	@ movhi
	mov	r3, r1	@ movhi
	strh	r3, [sp, #4]	@ movhi
	.loc 1 667 32
	ldr	r3, .L58
	ldr	r3, [r3]
	ldr	r2, [r3, #12]
	.loc 1 667 42
	ldrh	r3, [sp, #6]
	orrs	r3, r3, r2
	.loc 1 667 76
	ldrh	r2, [sp, #4]
	lsls	r2, r2, #22
	.loc 1 667 58
	orrs	r3, r3, r2
	.loc 1 667 113
	ldr	r2, [sp]
	lsls	r2, r2, #15
	.loc 1 667 12
	orrs	r3, r3, r2
	str	r3, [sp, #12]
	.loc 1 668 5
	ldr	r2, [sp, #12]
	movs	r1, #0
	movs	r0, #8
	bl	dwt_write32bitoffsetreg
	.loc 1 669 1
	nop
	add	sp, sp, #20
.LCFI35:
	@ sp needed
	ldr	pc, [sp], #4
.L59:
	.align	2
.L58:
	.word	pdw1000local
.LFE15:
	.size	dwt_writetxfctrl, .-dwt_writetxfctrl
	.section	.text.dwt_readrxdata,"ax",%progbits
	.align	1
	.global	dwt_readrxdata
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	dwt_readrxdata, %function
dwt_readrxdata:
.LFB16:
	.loc 1 687 1
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
.LCFI36:
	sub	sp, sp, #12
.LCFI37:
	str	r0, [sp, #4]
	mov	r3, r1
	strh	r3, [sp, #2]	@ movhi
	mov	r3, r2	@ movhi
	strh	r3, [sp]	@ movhi
	.loc 1 688 5
	ldrh	r2, [sp, #2]
	ldrh	r1, [sp]
	ldr	r3, [sp, #4]
	movs	r0, #17
	bl	dwt_readfromdevice
	.loc 1 689 1
	nop
	add	sp, sp, #12
.LCFI38:
	@ sp needed
	ldr	pc, [sp], #4
.LFE16:
	.size	dwt_readrxdata, .-dwt_readrxdata
	.section	.text.dwt_readaccdata,"ax",%progbits
	.align	1
	.global	dwt_readaccdata
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	dwt_readaccdata, %function
dwt_readaccdata:
.LFB17:
	.loc 1 709 1
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
.LCFI39:
	sub	sp, sp, #12
.LCFI40:
	str	r0, [sp, #4]
	mov	r3, r1
	strh	r3, [sp, #2]	@ movhi
	mov	r3, r2	@ movhi
	strh	r3, [sp]	@ movhi
	.loc 1 711 5
	movs	r0, #7
	bl	_dwt_enableclocks
	.loc 1 713 5
	ldrh	r2, [sp, #2]
	ldrh	r1, [sp]
	ldr	r3, [sp, #4]
	movs	r0, #37
	bl	dwt_readfromdevice
	.loc 1 715 5
	movs	r0, #8
	bl	_dwt_enableclocks
	.loc 1 716 1
	nop
	add	sp, sp, #12
.LCFI41:
	@ sp needed
	ldr	pc, [sp], #4
.LFE17:
	.size	dwt_readaccdata, .-dwt_readaccdata
	.section	.text.dwt_readcarrierintegrator,"ax",%progbits
	.align	1
	.global	dwt_readcarrierintegrator
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	dwt_readcarrierintegrator, %function
dwt_readcarrierintegrator:
.LFB18:
	.loc 1 736 1
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
.LCFI42:
	sub	sp, sp, #20
.LCFI43:
	.loc 1 737 13
	movs	r3, #0
	str	r3, [sp, #12]
	.loc 1 743 5
	add	r3, sp, #4
	movs	r2, #3
	movs	r1, #40
	movs	r0, #39
	bl	dwt_readfromdevice
	.loc 1 745 12
	movs	r3, #2
	str	r3, [sp, #8]
	.loc 1 745 5
	b	.L63
.L64:
	.loc 1 747 26 discriminator 3
	ldr	r3, [sp, #12]
	lsls	r3, r3, #8
	.loc 1 747 40 discriminator 3
	add	r1, sp, #4
	ldr	r2, [sp, #8]
	add	r2, r2, r1
	ldrb	r2, [r2]	@ zero_extendqisi2
	.loc 1 747 16 discriminator 3
	add	r3, r3, r2
	str	r3, [sp, #12]
	.loc 1 745 29 discriminator 3
	ldr	r3, [sp, #8]
	subs	r3, r3, #1
	str	r3, [sp, #8]
.L63:
	.loc 1 745 5 discriminator 1
	ldr	r3, [sp, #8]
	cmp	r3, #0
	bge	.L64
	.loc 1 750 16
	ldr	r3, [sp, #12]
	and	r3, r3, #1048576
	.loc 1 750 8
	cmp	r3, #0
	beq	.L65
	.loc 1 750 47 discriminator 1
	ldr	r3, [sp, #12]
	mvn	r3, r3, lsl #12
	mvn	r3, r3, lsr #12
	str	r3, [sp, #12]
	b	.L66
.L65:
	.loc 1 751 17
	ldr	r3, [sp, #12]
	ubfx	r3, r3, #0, #21
	str	r3, [sp, #12]
.L66:
	.loc 1 753 12
	ldr	r3, [sp, #12]
	.loc 1 754 1
	mov	r0, r3
	add	sp, sp, #20
.LCFI44:
	@ sp needed
	ldr	pc, [sp], #4
.LFE18:
	.size	dwt_readcarrierintegrator, .-dwt_readcarrierintegrator
	.section	.text.dwt_readdiagnostics,"ax",%progbits
	.align	1
	.global	dwt_readdiagnostics
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	dwt_readdiagnostics, %function
dwt_readdiagnostics:
.LFB19:
	.loc 1 769 1
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
.LCFI45:
	sub	sp, sp, #12
.LCFI46:
	str	r0, [sp, #4]
	.loc 1 771 30
	movs	r1, #5
	movs	r0, #21
	bl	dwt_read16bitoffsetreg
	mov	r3, r0
	mov	r2, r3
	.loc 1 771 28
	ldr	r3, [sp, #4]
	strh	r2, [r3, #14]	@ movhi
	.loc 1 774 29
	movs	r1, #0
	movs	r0, #46
	bl	dwt_read16bitoffsetreg
	mov	r3, r0
	mov	r2, r3
	.loc 1 774 27
	ldr	r3, [sp, #4]
	strh	r2, [r3]	@ movhi
	.loc 1 777 53
	ldr	r3, [sp, #4]
	adds	r3, r3, #4
	.loc 1 777 5
	movs	r2, #8
	movs	r1, #0
	movs	r0, #18
	bl	dwt_readfromdevice
	.loc 1 779 34
	movs	r1, #7
	movs	r0, #21
	bl	dwt_read16bitoffsetreg
	mov	r3, r0
	mov	r2, r3
	.loc 1 779 32
	ldr	r3, [sp, #4]
	strh	r2, [r3, #2]	@ movhi
	.loc 1 781 34
	movs	r1, #0
	movs	r0, #16
	bl	dwt_read32bitoffsetreg
	mov	r3, r0
	.loc 1 781 88
	lsrs	r3, r3, #20
	uxth	r3, r3
	ubfx	r3, r3, #0, #12
	uxth	r2, r3
	.loc 1 781 31
	ldr	r3, [sp, #4]
	strh	r2, [r3, #12]	@ movhi
	.loc 1 782 1
	nop
	add	sp, sp, #12
.LCFI47:
	@ sp needed
	ldr	pc, [sp], #4
.LFE19:
	.size	dwt_readdiagnostics, .-dwt_readdiagnostics
	.section	.text.dwt_readtxtimestamp,"ax",%progbits
	.align	1
	.global	dwt_readtxtimestamp
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	dwt_readtxtimestamp, %function
dwt_readtxtimestamp:
.LFB20:
	.loc 1 797 1
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
.LCFI48:
	sub	sp, sp, #12
.LCFI49:
	str	r0, [sp, #4]
	.loc 1 798 5
	ldr	r3, [sp, #4]
	movs	r2, #5
	movs	r1, #0
	movs	r0, #23
	bl	dwt_readfromdevice
	.loc 1 799 1
	nop
	add	sp, sp, #12
.LCFI50:
	@ sp needed
	ldr	pc, [sp], #4
.LFE20:
	.size	dwt_readtxtimestamp, .-dwt_readtxtimestamp
	.section	.text.dwt_readtxtimestamphi32,"ax",%progbits
	.align	1
	.global	dwt_readtxtimestamphi32
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	dwt_readtxtimestamphi32, %function
dwt_readtxtimestamphi32:
.LFB21:
	.loc 1 813 1
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, lr}
.LCFI51:
	.loc 1 814 12
	movs	r1, #1
	movs	r0, #23
	bl	dwt_read32bitoffsetreg
	mov	r3, r0
	.loc 1 815 1
	mov	r0, r3
	pop	{r3, pc}
.LFE21:
	.size	dwt_readtxtimestamphi32, .-dwt_readtxtimestamphi32
	.section	.text.dwt_readtxtimestamplo32,"ax",%progbits
	.align	1
	.global	dwt_readtxtimestamplo32
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	dwt_readtxtimestamplo32, %function
dwt_readtxtimestamplo32:
.LFB22:
	.loc 1 829 1
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, lr}
.LCFI52:
	.loc 1 830 12
	movs	r1, #0
	movs	r0, #23
	bl	dwt_read32bitoffsetreg
	mov	r3, r0
	.loc 1 831 1
	mov	r0, r3
	pop	{r3, pc}
.LFE22:
	.size	dwt_readtxtimestamplo32, .-dwt_readtxtimestamplo32
	.section	.text.dwt_readrxtimestamp,"ax",%progbits
	.align	1
	.global	dwt_readrxtimestamp
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	dwt_readrxtimestamp, %function
dwt_readrxtimestamp:
.LFB23:
	.loc 1 846 1
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
.LCFI53:
	sub	sp, sp, #12
.LCFI54:
	str	r0, [sp, #4]
	.loc 1 847 5
	ldr	r3, [sp, #4]
	movs	r2, #5
	movs	r1, #0
	movs	r0, #21
	bl	dwt_readfromdevice
	.loc 1 848 1
	nop
	add	sp, sp, #12
.LCFI55:
	@ sp needed
	ldr	pc, [sp], #4
.LFE23:
	.size	dwt_readrxtimestamp, .-dwt_readrxtimestamp
	.section	.text.dwt_readrxtimestamphi32,"ax",%progbits
	.align	1
	.global	dwt_readrxtimestamphi32
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	dwt_readrxtimestamphi32, %function
dwt_readrxtimestamphi32:
.LFB24:
	.loc 1 862 1
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, lr}
.LCFI56:
	.loc 1 863 12
	movs	r1, #1
	movs	r0, #21
	bl	dwt_read32bitoffsetreg
	mov	r3, r0
	.loc 1 864 1
	mov	r0, r3
	pop	{r3, pc}
.LFE24:
	.size	dwt_readrxtimestamphi32, .-dwt_readrxtimestamphi32
	.section	.text.dwt_readrxtimestamplo32,"ax",%progbits
	.align	1
	.global	dwt_readrxtimestamplo32
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	dwt_readrxtimestamplo32, %function
dwt_readrxtimestamplo32:
.LFB25:
	.loc 1 878 1
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, lr}
.LCFI57:
	.loc 1 879 12
	movs	r1, #0
	movs	r0, #21
	bl	dwt_read32bitoffsetreg
	mov	r3, r0
	.loc 1 880 1
	mov	r0, r3
	pop	{r3, pc}
.LFE25:
	.size	dwt_readrxtimestamplo32, .-dwt_readrxtimestamplo32
	.section	.text.dwt_readsystimestamphi32,"ax",%progbits
	.align	1
	.global	dwt_readsystimestamphi32
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	dwt_readsystimestamphi32, %function
dwt_readsystimestamphi32:
.LFB26:
	.loc 1 894 1
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, lr}
.LCFI58:
	.loc 1 895 12
	movs	r1, #1
	movs	r0, #6
	bl	dwt_read32bitoffsetreg
	mov	r3, r0
	.loc 1 896 1
	mov	r0, r3
	pop	{r3, pc}
.LFE26:
	.size	dwt_readsystimestamphi32, .-dwt_readsystimestamphi32
	.section	.text.dwt_readsystime,"ax",%progbits
	.align	1
	.global	dwt_readsystime
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	dwt_readsystime, %function
dwt_readsystime:
.LFB27:
	.loc 1 912 1
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
.LCFI59:
	sub	sp, sp, #12
.LCFI60:
	str	r0, [sp, #4]
	.loc 1 913 5
	ldr	r3, [sp, #4]
	movs	r2, #5
	movs	r1, #0
	movs	r0, #6
	bl	dwt_readfromdevice
	.loc 1 914 1
	nop
	add	sp, sp, #12
.LCFI61:
	@ sp needed
	ldr	pc, [sp], #4
.LFE27:
	.size	dwt_readsystime, .-dwt_readsystime
	.section	.text.dwt_writetodevice,"ax",%progbits
	.align	1
	.global	dwt_writetodevice
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	dwt_writetodevice, %function
dwt_writetodevice:
.LFB28:
	.loc 1 946 1
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
.LCFI62:
	sub	sp, sp, #28
.LCFI63:
	str	r2, [sp, #8]
	str	r3, [sp, #4]
	mov	r3, r0	@ movhi
	strh	r3, [sp, #14]	@ movhi
	mov	r3, r1	@ movhi
	strh	r3, [sp, #12]	@ movhi
	.loc 1 948 11
	movs	r3, #0
	str	r3, [sp, #20]
	.loc 1 954 8
	ldrh	r3, [sp, #12]
	cmp	r3, #0
	bne	.L83
	.loc 1 956 23
	ldrh	r3, [sp, #14]	@ movhi
	uxtb	r2, r3
	.loc 1 956 19
	ldr	r3, [sp, #20]
	adds	r1, r3, #1
	str	r1, [sp, #20]
	.loc 1 956 23
	orn	r2, r2, #127
	uxtb	r2, r2
	add	r1, sp, #24
	add	r3, r3, r1
	strb	r2, [r3, #-8]
	b	.L84
.L83:
	.loc 1 963 23
	ldrh	r3, [sp, #14]	@ movhi
	uxtb	r2, r3
	.loc 1 963 19
	ldr	r3, [sp, #20]
	adds	r1, r3, #1
	str	r1, [sp, #20]
	.loc 1 963 23
	orn	r2, r2, #63
	uxtb	r2, r2
	add	r1, sp, #24
	add	r3, r3, r1
	strb	r2, [r3, #-8]
	.loc 1 965 12
	ldrh	r3, [sp, #12]
	cmp	r3, #127
	bhi	.L85
	.loc 1 967 23
	ldr	r3, [sp, #20]
	adds	r2, r3, #1
	str	r2, [sp, #20]
	.loc 1 967 29
	ldrh	r2, [sp, #12]	@ movhi
	uxtb	r2, r2
	.loc 1 967 27
	add	r1, sp, #24
	add	r3, r3, r1
	strb	r2, [r3, #-8]
	b	.L84
.L85:
	.loc 1 971 36
	ldrh	r3, [sp, #12]	@ movhi
	uxtb	r2, r3
	.loc 1 971 23
	ldr	r3, [sp, #20]
	adds	r1, r3, #1
	str	r1, [sp, #20]
	.loc 1 971 27
	orn	r2, r2, #127
	uxtb	r2, r2
	add	r1, sp, #24
	add	r3, r3, r1
	strb	r2, [r3, #-8]
	.loc 1 972 30
	ldrh	r3, [sp, #12]
	lsrs	r3, r3, #7
	uxth	r1, r3
	.loc 1 972 23
	ldr	r3, [sp, #20]
	adds	r2, r3, #1
	str	r2, [sp, #20]
	.loc 1 972 30
	uxtb	r2, r1
	.loc 1 972 27
	add	r1, sp, #24
	add	r3, r3, r1
	strb	r2, [r3, #-8]
.L84:
	.loc 1 977 5
	ldr	r3, [sp, #20]
	uxth	r0, r3
	add	r1, sp, #16
	ldr	r3, [sp, #4]
	ldr	r2, [sp, #8]
	bl	writetospi
	.loc 1 978 1
	nop
	add	sp, sp, #28
.LCFI64:
	@ sp needed
	ldr	pc, [sp], #4
.LFE28:
	.size	dwt_writetodevice, .-dwt_writetodevice
	.section	.text.dwt_readfromdevice,"ax",%progbits
	.align	1
	.global	dwt_readfromdevice
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	dwt_readfromdevice, %function
dwt_readfromdevice:
.LFB29:
	.loc 1 1010 1
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
.LCFI65:
	sub	sp, sp, #28
.LCFI66:
	str	r2, [sp, #8]
	str	r3, [sp, #4]
	mov	r3, r0	@ movhi
	strh	r3, [sp, #14]	@ movhi
	mov	r3, r1	@ movhi
	strh	r3, [sp, #12]	@ movhi
	.loc 1 1012 11
	movs	r3, #0
	str	r3, [sp, #20]
	.loc 1 1018 8
	ldrh	r3, [sp, #12]
	cmp	r3, #0
	bne	.L87
	.loc 1 1020 19
	ldr	r3, [sp, #20]
	adds	r2, r3, #1
	str	r2, [sp, #20]
	.loc 1 1020 25
	ldrh	r2, [sp, #14]	@ movhi
	uxtb	r2, r2
	.loc 1 1020 23
	add	r1, sp, #24
	add	r3, r3, r1
	strb	r2, [r3, #-8]
	b	.L88
.L87:
	.loc 1 1027 25
	ldrh	r3, [sp, #14]	@ movhi
	uxtb	r2, r3
	.loc 1 1027 19
	ldr	r3, [sp, #20]
	adds	r1, r3, #1
	str	r1, [sp, #20]
	.loc 1 1027 25
	orr	r2, r2, #64
	uxtb	r2, r2
	.loc 1 1027 23
	add	r1, sp, #24
	add	r3, r3, r1
	strb	r2, [r3, #-8]
	.loc 1 1029 12
	ldrh	r3, [sp, #12]
	cmp	r3, #127
	bhi	.L89
	.loc 1 1031 23
	ldr	r3, [sp, #20]
	adds	r2, r3, #1
	str	r2, [sp, #20]
	.loc 1 1031 29
	ldrh	r2, [sp, #12]	@ movhi
	uxtb	r2, r2
	.loc 1 1031 27
	add	r1, sp, #24
	add	r3, r3, r1
	strb	r2, [r3, #-8]
	b	.L88
.L89:
	.loc 1 1035 36
	ldrh	r3, [sp, #12]	@ movhi
	uxtb	r2, r3
	.loc 1 1035 23
	ldr	r3, [sp, #20]
	adds	r1, r3, #1
	str	r1, [sp, #20]
	.loc 1 1035 27
	orn	r2, r2, #127
	uxtb	r2, r2
	add	r1, sp, #24
	add	r3, r3, r1
	strb	r2, [r3, #-8]
	.loc 1 1036 30
	ldrh	r3, [sp, #12]
	lsrs	r3, r3, #7
	uxth	r1, r3
	.loc 1 1036 23
	ldr	r3, [sp, #20]
	adds	r2, r3, #1
	str	r2, [sp, #20]
	.loc 1 1036 30
	uxtb	r2, r1
	.loc 1 1036 27
	add	r1, sp, #24
	add	r3, r3, r1
	strb	r2, [r3, #-8]
.L88:
	.loc 1 1041 5
	ldr	r3, [sp, #20]
	uxth	r0, r3
	add	r1, sp, #16
	ldr	r3, [sp, #4]
	ldr	r2, [sp, #8]
	bl	readfromspi
	.loc 1 1042 1
	nop
	add	sp, sp, #28
.LCFI67:
	@ sp needed
	ldr	pc, [sp], #4
.LFE29:
	.size	dwt_readfromdevice, .-dwt_readfromdevice
	.section	.text.dwt_read32bitoffsetreg,"ax",%progbits
	.align	1
	.global	dwt_read32bitoffsetreg
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	dwt_read32bitoffsetreg, %function
dwt_read32bitoffsetreg:
.LFB30:
	.loc 1 1060 1
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
.LCFI68:
	sub	sp, sp, #28
.LCFI69:
	str	r0, [sp, #4]
	str	r1, [sp]
	.loc 1 1061 13
	movs	r3, #0
	str	r3, [sp, #20]
	.loc 1 1065 5
	ldr	r3, [sp, #4]
	uxth	r0, r3
	ldr	r3, [sp]
	uxth	r1, r3
	add	r3, sp, #12
	movs	r2, #4
	bl	dwt_readfromdevice
	.loc 1 1067 12
	movs	r3, #3
	str	r3, [sp, #16]
	.loc 1 1067 5
	b	.L91
.L92:
	.loc 1 1069 26 discriminator 3
	ldr	r3, [sp, #20]
	lsls	r3, r3, #8
	.loc 1 1069 40 discriminator 3
	add	r1, sp, #12
	ldr	r2, [sp, #16]
	add	r2, r2, r1
	ldrb	r2, [r2]	@ zero_extendqisi2
	.loc 1 1069 16 discriminator 3
	add	r3, r3, r2
	str	r3, [sp, #20]
	.loc 1 1067 29 discriminator 3
	ldr	r3, [sp, #16]
	subs	r3, r3, #1
	str	r3, [sp, #16]
.L91:
	.loc 1 1067 5 discriminator 1
	ldr	r3, [sp, #16]
	cmp	r3, #0
	bge	.L92
	.loc 1 1071 12
	ldr	r3, [sp, #20]
	.loc 1 1073 1
	mov	r0, r3
	add	sp, sp, #28
.LCFI70:
	@ sp needed
	ldr	pc, [sp], #4
.LFE30:
	.size	dwt_read32bitoffsetreg, .-dwt_read32bitoffsetreg
	.section	.text.dwt_read16bitoffsetreg,"ax",%progbits
	.align	1
	.global	dwt_read16bitoffsetreg
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	dwt_read16bitoffsetreg, %function
dwt_read16bitoffsetreg:
.LFB31:
	.loc 1 1089 1
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
.LCFI71:
	sub	sp, sp, #20
.LCFI72:
	str	r0, [sp, #4]
	str	r1, [sp]
	.loc 1 1090 13
	movs	r3, #0
	strh	r3, [sp, #14]	@ movhi
	.loc 1 1093 5
	ldr	r3, [sp, #4]
	uxth	r0, r3
	ldr	r3, [sp]
	uxth	r1, r3
	add	r3, sp, #12
	movs	r2, #2
	bl	dwt_readfromdevice
	.loc 1 1095 21
	ldrb	r3, [sp, #13]	@ zero_extendqisi2
	uxth	r3, r3
	.loc 1 1095 25
	lsls	r3, r3, #8
	uxth	r2, r3
	.loc 1 1095 39
	ldrb	r3, [sp, #12]	@ zero_extendqisi2
	uxth	r3, r3
	.loc 1 1095 12
	add	r3, r3, r2
	strh	r3, [sp, #14]	@ movhi
	.loc 1 1096 12
	ldrh	r3, [sp, #14]
	.loc 1 1098 1
	mov	r0, r3
	add	sp, sp, #20
.LCFI73:
	@ sp needed
	ldr	pc, [sp], #4
.LFE31:
	.size	dwt_read16bitoffsetreg, .-dwt_read16bitoffsetreg
	.section	.text.dwt_read8bitoffsetreg,"ax",%progbits
	.align	1
	.global	dwt_read8bitoffsetreg
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	dwt_read8bitoffsetreg, %function
dwt_read8bitoffsetreg:
.LFB32:
	.loc 1 1114 1
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
.LCFI74:
	sub	sp, sp, #20
.LCFI75:
	str	r0, [sp, #4]
	str	r1, [sp]
	.loc 1 1117 5
	ldr	r3, [sp, #4]
	uxth	r0, r3
	ldr	r3, [sp]
	uxth	r1, r3
	add	r3, sp, #15
	movs	r2, #1
	bl	dwt_readfromdevice
	.loc 1 1119 12
	ldrb	r3, [sp, #15]	@ zero_extendqisi2
	.loc 1 1120 1
	mov	r0, r3
	add	sp, sp, #20
.LCFI76:
	@ sp needed
	ldr	pc, [sp], #4
.LFE32:
	.size	dwt_read8bitoffsetreg, .-dwt_read8bitoffsetreg
	.section	.text.dwt_write8bitoffsetreg,"ax",%progbits
	.align	1
	.global	dwt_write8bitoffsetreg
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	dwt_write8bitoffsetreg, %function
dwt_write8bitoffsetreg:
.LFB33:
	.loc 1 1137 1
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
.LCFI77:
	sub	sp, sp, #20
.LCFI78:
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	mov	r3, r2
	strb	r3, [sp, #7]
	.loc 1 1138 5
	ldr	r3, [sp, #12]
	uxth	r0, r3
	ldr	r3, [sp, #8]
	uxth	r1, r3
	add	r3, sp, #7
	movs	r2, #1
	bl	dwt_writetodevice
	.loc 1 1139 1
	nop
	add	sp, sp, #20
.LCFI79:
	@ sp needed
	ldr	pc, [sp], #4
.LFE33:
	.size	dwt_write8bitoffsetreg, .-dwt_write8bitoffsetreg
	.section	.text.dwt_write16bitoffsetreg,"ax",%progbits
	.align	1
	.global	dwt_write16bitoffsetreg
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	dwt_write16bitoffsetreg, %function
dwt_write16bitoffsetreg:
.LFB34:
	.loc 1 1156 1
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
.LCFI80:
	sub	sp, sp, #28
.LCFI81:
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	mov	r3, r2
	strh	r3, [sp, #6]	@ movhi
	.loc 1 1159 15
	ldrh	r3, [sp, #6]	@ movhi
	uxtb	r3, r3
	strb	r3, [sp, #20]
	.loc 1 1160 15
	ldrh	r3, [sp, #6]
	lsrs	r3, r3, #8
	uxth	r3, r3
	uxtb	r3, r3
	strb	r3, [sp, #21]
	.loc 1 1162 5
	ldr	r3, [sp, #12]
	uxth	r0, r3
	ldr	r3, [sp, #8]
	uxth	r1, r3
	add	r3, sp, #20
	movs	r2, #2
	bl	dwt_writetodevice
	.loc 1 1163 1
	nop
	add	sp, sp, #28
.LCFI82:
	@ sp needed
	ldr	pc, [sp], #4
.LFE34:
	.size	dwt_write16bitoffsetreg, .-dwt_write16bitoffsetreg
	.section	.text.dwt_write32bitoffsetreg,"ax",%progbits
	.align	1
	.global	dwt_write32bitoffsetreg
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	dwt_write32bitoffsetreg, %function
dwt_write32bitoffsetreg:
.LFB35:
	.loc 1 1180 1
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
.LCFI83:
	sub	sp, sp, #28
.LCFI84:
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	.loc 1 1184 13
	movs	r3, #0
	str	r3, [sp, #20]
	.loc 1 1184 5
	b	.L101
.L102:
	.loc 1 1186 19 discriminator 3
	ldr	r3, [sp, #4]
	uxtb	r1, r3
	add	r2, sp, #16
	ldr	r3, [sp, #20]
	add	r3, r3, r2
	mov	r2, r1
	strb	r2, [r3]
	.loc 1 1187 16 discriminator 3
	ldr	r3, [sp, #4]
	lsrs	r3, r3, #8
	str	r3, [sp, #4]
	.loc 1 1184 28 discriminator 3
	ldr	r3, [sp, #20]
	adds	r3, r3, #1
	str	r3, [sp, #20]
.L101:
	.loc 1 1184 5 discriminator 1
	ldr	r3, [sp, #20]
	cmp	r3, #3
	ble	.L102
	.loc 1 1190 5
	ldr	r3, [sp, #12]
	uxth	r0, r3
	ldr	r3, [sp, #8]
	uxth	r1, r3
	add	r3, sp, #16
	movs	r2, #4
	bl	dwt_writetodevice
	.loc 1 1191 1
	nop
	add	sp, sp, #28
.LCFI85:
	@ sp needed
	ldr	pc, [sp], #4
.LFE35:
	.size	dwt_write32bitoffsetreg, .-dwt_write32bitoffsetreg
	.section	.text.dwt_enableframefilter,"ax",%progbits
	.align	1
	.global	dwt_enableframefilter
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	dwt_enableframefilter, %function
dwt_enableframefilter:
.LFB36:
	.loc 1 1214 1
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
.LCFI86:
	sub	sp, sp, #20
.LCFI87:
	mov	r3, r0
	strh	r3, [sp, #6]	@ movhi
	.loc 1 1215 39
	movs	r1, #0
	movs	r0, #4
	bl	dwt_read32bitoffsetreg
	mov	r3, r0
	.loc 1 1215 12
	bic	r3, r3, #263192576
	bic	r3, r3, #524288
	str	r3, [sp, #12]
	.loc 1 1217 7
	ldrh	r3, [sp, #6]
	cmp	r3, #0
	beq	.L104
	.loc 1 1220 19
	ldr	r3, [sp, #12]
	bic	r3, r3, #510
	str	r3, [sp, #12]
	.loc 1 1221 30
	ldrh	r3, [sp, #6]
	and	r2, r3, #510
	.loc 1 1221 19
	ldr	r3, [sp, #12]
	orrs	r3, r3, r2
	orr	r3, r3, #1
	str	r3, [sp, #12]
	b	.L105
.L104:
	.loc 1 1225 19
	ldr	r3, [sp, #12]
	bic	r3, r3, #1
	str	r3, [sp, #12]
.L105:
	.loc 1 1228 17
	ldr	r3, .L106
	ldr	r3, [r3]
	.loc 1 1228 29
	ldr	r2, [sp, #12]
	str	r2, [r3, #20]
	.loc 1 1229 5
	ldr	r2, [sp, #12]
	movs	r1, #0
	movs	r0, #4
	bl	dwt_write32bitoffsetreg
	.loc 1 1230 1
	nop
	add	sp, sp, #20
.LCFI88:
	@ sp needed
	ldr	pc, [sp], #4
.L107:
	.align	2
.L106:
	.word	pdw1000local
.LFE36:
	.size	dwt_enableframefilter, .-dwt_enableframefilter
	.section	.text.dwt_setpanid,"ax",%progbits
	.align	1
	.global	dwt_setpanid
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	dwt_setpanid, %function
dwt_setpanid:
.LFB37:
	.loc 1 1245 1
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
.LCFI89:
	sub	sp, sp, #12
.LCFI90:
	mov	r3, r0
	strh	r3, [sp, #6]	@ movhi
	.loc 1 1247 5
	ldrh	r3, [sp, #6]
	mov	r2, r3
	movs	r1, #2
	movs	r0, #3
	bl	dwt_write16bitoffsetreg
	.loc 1 1248 1
	nop
	add	sp, sp, #12
.LCFI91:
	@ sp needed
	ldr	pc, [sp], #4
.LFE37:
	.size	dwt_setpanid, .-dwt_setpanid
	.section	.text.dwt_setaddress16,"ax",%progbits
	.align	1
	.global	dwt_setaddress16
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	dwt_setaddress16, %function
dwt_setaddress16:
.LFB38:
	.loc 1 1263 1
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
.LCFI92:
	sub	sp, sp, #12
.LCFI93:
	mov	r3, r0
	strh	r3, [sp, #6]	@ movhi
	.loc 1 1265 5
	ldrh	r3, [sp, #6]
	mov	r2, r3
	movs	r1, #0
	movs	r0, #3
	bl	dwt_write16bitoffsetreg
	.loc 1 1266 1
	nop
	add	sp, sp, #12
.LCFI94:
	@ sp needed
	ldr	pc, [sp], #4
.LFE38:
	.size	dwt_setaddress16, .-dwt_setaddress16
	.section	.text.dwt_seteui,"ax",%progbits
	.align	1
	.global	dwt_seteui
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	dwt_seteui, %function
dwt_seteui:
.LFB39:
	.loc 1 1281 1
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
.LCFI95:
	sub	sp, sp, #12
.LCFI96:
	str	r0, [sp, #4]
	.loc 1 1282 5
	ldr	r3, [sp, #4]
	movs	r2, #8
	movs	r1, #0
	movs	r0, #1
	bl	dwt_writetodevice
	.loc 1 1283 1
	nop
	add	sp, sp, #12
.LCFI97:
	@ sp needed
	ldr	pc, [sp], #4
.LFE39:
	.size	dwt_seteui, .-dwt_seteui
	.section	.text.dwt_geteui,"ax",%progbits
	.align	1
	.global	dwt_geteui
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	dwt_geteui, %function
dwt_geteui:
.LFB40:
	.loc 1 1298 1
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
.LCFI98:
	sub	sp, sp, #12
.LCFI99:
	str	r0, [sp, #4]
	.loc 1 1299 5
	ldr	r3, [sp, #4]
	movs	r2, #8
	movs	r1, #0
	movs	r0, #1
	bl	dwt_readfromdevice
	.loc 1 1300 1
	nop
	add	sp, sp, #12
.LCFI100:
	@ sp needed
	ldr	pc, [sp], #4
.LFE40:
	.size	dwt_geteui, .-dwt_geteui
	.section	.text.dwt_otpread,"ax",%progbits
	.align	1
	.global	dwt_otpread
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	dwt_otpread, %function
dwt_otpread:
.LFB41:
	.loc 1 1317 1
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
.LCFI101:
	sub	sp, sp, #24
.LCFI102:
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	mov	r3, r2
	strb	r3, [sp, #7]
	.loc 1 1320 5
	movs	r0, #0
	bl	_dwt_enableclocks
	.loc 1 1322 10
	movs	r3, #0
	str	r3, [sp, #20]
	.loc 1 1322 5
	b	.L113
.L114:
	.loc 1 1324 20 discriminator 3
	ldr	r2, [sp, #20]
	ldr	r3, [sp, #12]
	adds	r1, r2, r3
	.loc 1 1324 14 discriminator 3
	ldr	r3, [sp, #20]
	lsls	r3, r3, #2
	ldr	r2, [sp, #8]
	adds	r4, r2, r3
	.loc 1 1324 20 discriminator 3
	mov	r0, r1
	bl	_dwt_otpread
	mov	r3, r0
	.loc 1 1324 18 discriminator 3
	str	r3, [r4]
	.loc 1 1322 25 discriminator 3
	ldr	r3, [sp, #20]
	adds	r3, r3, #1
	str	r3, [sp, #20]
.L113:
	.loc 1 1322 15 discriminator 1
	ldrb	r3, [sp, #7]	@ zero_extendqisi2
	.loc 1 1322 5 discriminator 1
	ldr	r2, [sp, #20]
	cmp	r2, r3
	blt	.L114
	.loc 1 1327 5
	movs	r0, #1
	bl	_dwt_enableclocks
	.loc 1 1329 5
	nop
	.loc 1 1330 1
	add	sp, sp, #24
.LCFI103:
	@ sp needed
	pop	{r4, pc}
.LFE41:
	.size	dwt_otpread, .-dwt_otpread
	.section	.text._dwt_otpread,"ax",%progbits
	.align	1
	.global	_dwt_otpread
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	_dwt_otpread, %function
_dwt_otpread:
.LFB42:
	.loc 1 1345 1
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
.LCFI104:
	sub	sp, sp, #20
.LCFI105:
	str	r0, [sp, #4]
	.loc 1 1349 5
	ldr	r3, [sp, #4]
	uxth	r3, r3
	mov	r2, r3
	movs	r1, #4
	movs	r0, #45
	bl	dwt_write16bitoffsetreg
	.loc 1 1352 5
	movs	r2, #3
	movs	r1, #6
	movs	r0, #45
	bl	dwt_write8bitoffsetreg
	.loc 1 1353 5
	movs	r2, #0
	movs	r1, #6
	movs	r0, #45
	bl	dwt_write8bitoffsetreg
	.loc 1 1356 16
	movs	r1, #10
	movs	r0, #45
	bl	dwt_read32bitoffsetreg
	str	r0, [sp, #12]
	.loc 1 1359 12
	ldr	r3, [sp, #12]
	.loc 1 1360 1
	mov	r0, r3
	add	sp, sp, #20
.LCFI106:
	@ sp needed
	ldr	pc, [sp], #4
.LFE42:
	.size	_dwt_otpread, .-_dwt_otpread
	.section	.text._dwt_otpsetmrregs,"ax",%progbits
	.align	1
	.global	_dwt_otpsetmrregs
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	_dwt_otpsetmrregs, %function
_dwt_otpsetmrregs:
.LFB43:
	.loc 1 1383 1
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
.LCFI107:
	sub	sp, sp, #36
.LCFI108:
	str	r0, [sp, #4]
	.loc 1 1386 12
	movs	r3, #0
	str	r3, [sp, #28]
	.loc 1 1386 18
	movs	r3, #0
	str	r3, [sp, #24]
	.loc 1 1386 24
	movs	r3, #0
	str	r3, [sp, #20]
	.loc 1 1390 15
	movs	r3, #3
	strb	r3, [sp, #12]
	.loc 1 1391 5
	add	r3, sp, #12
	movs	r2, #1
	movs	r1, #7
	movs	r0, #45
	bl	dwt_writetodevice
	.loc 1 1394 16
	ldr	r3, [sp, #4]
	and	r3, r3, #15
	.loc 1 1394 5
	cmp	r3, #5
	bhi	.L119
	adr	r2, .L121
	ldr	pc, [r2, r3, lsl #2]
	.p2align 2
.L121:
	.word	.L126+1
	.word	.L125+1
	.word	.L124+1
	.word	.L123+1
	.word	.L122+1
	.word	.L120+1
	.p2align 1
.L126:
	.loc 1 1396 12
	movs	r3, #0
	str	r3, [sp, #20]
	.loc 1 1397 12
	movs	r3, #0
	str	r3, [sp, #28]
	.loc 1 1398 12
	movs	r3, #0
	str	r3, [sp, #24]
	.loc 1 1399 9
	b	.L127
.L125:
	.loc 1 1401 12
	movw	r3, #4132
	str	r3, [sp, #20]
	.loc 1 1402 12
	movw	r3, #37408
	str	r3, [sp, #28]
	.loc 1 1403 12
	movs	r3, #14
	str	r3, [sp, #24]
	.loc 1 1404 9
	b	.L127
.L124:
	.loc 1 1406 12
	movw	r3, #6180
	str	r3, [sp, #20]
	.loc 1 1407 12
	movw	r3, #37408
	str	r3, [sp, #28]
	.loc 1 1408 12
	movs	r3, #3
	str	r3, [sp, #24]
	.loc 1 1409 9
	b	.L127
.L123:
	.loc 1 1411 12
	movw	r3, #6180
	str	r3, [sp, #20]
	.loc 1 1412 12
	movw	r3, #37408
	str	r3, [sp, #28]
	.loc 1 1413 12
	movs	r3, #78
	str	r3, [sp, #24]
	.loc 1 1414 9
	b	.L127
.L122:
	.loc 1 1416 12
	movs	r3, #0
	str	r3, [sp, #20]
	.loc 1 1417 12
	movs	r3, #0
	str	r3, [sp, #28]
	.loc 1 1418 12
	movs	r3, #3
	str	r3, [sp, #24]
	.loc 1 1419 9
	b	.L127
.L120:
	.loc 1 1421 12
	movs	r3, #36
	str	r3, [sp, #20]
	.loc 1 1422 12
	movs	r3, #0
	str	r3, [sp, #28]
	.loc 1 1423 12
	movs	r3, #3
	str	r3, [sp, #24]
	.loc 1 1424 9
	b	.L127
.L119:
	.loc 1 1426 16
	mov	r3, #-1
	b	.L131
.L127:
	.loc 1 1429 15
	ldr	r3, [sp, #28]
	uxtb	r3, r3
	strb	r3, [sp, #12]
	.loc 1 1430 31
	ldr	r3, [sp, #28]
	lsrs	r3, r3, #8
	.loc 1 1430 15
	uxtb	r3, r3
	strb	r3, [sp, #13]
	.loc 1 1431 5
	add	r3, sp, #12
	movs	r2, #2
	movs	r1, #0
	movs	r0, #45
	bl	dwt_writetodevice
	.loc 1 1435 15
	movs	r3, #8
	strb	r3, [sp, #12]
	.loc 1 1436 5
	add	r3, sp, #12
	movs	r2, #1
	movs	r1, #6
	movs	r0, #45
	bl	dwt_writetodevice
	.loc 1 1441 15
	movs	r3, #2
	strb	r3, [sp, #12]
	.loc 1 1442 5
	add	r3, sp, #12
	movs	r2, #1
	movs	r1, #7
	movs	r0, #45
	bl	dwt_writetodevice
	.loc 1 1445 15
	movs	r3, #136
	strb	r3, [sp, #12]
	.loc 1 1446 5
	add	r3, sp, #12
	movs	r2, #1
	movs	r1, #6
	movs	r0, #45
	bl	dwt_writetodevice
	.loc 1 1448 15
	movs	r3, #128
	strb	r3, [sp, #12]
	.loc 1 1449 5
	add	r3, sp, #12
	movs	r2, #1
	movs	r1, #6
	movs	r0, #45
	bl	dwt_writetodevice
	.loc 1 1451 15
	movs	r3, #0
	strb	r3, [sp, #12]
	.loc 1 1452 5
	add	r3, sp, #12
	movs	r2, #1
	movs	r1, #6
	movs	r0, #45
	bl	dwt_writetodevice
	.loc 1 1457 15
	movs	r3, #5
	strb	r3, [sp, #12]
	.loc 1 1458 5
	add	r3, sp, #12
	movs	r2, #1
	movs	r1, #7
	movs	r0, #45
	bl	dwt_writetodevice
	.loc 1 1460 15
	ldr	r3, [sp, #24]
	uxtb	r3, r3
	strb	r3, [sp, #12]
	.loc 1 1461 31
	ldr	r3, [sp, #24]
	lsrs	r3, r3, #8
	.loc 1 1461 15
	uxtb	r3, r3
	strb	r3, [sp, #13]
	.loc 1 1462 5
	add	r3, sp, #12
	movs	r2, #2
	movs	r1, #0
	movs	r0, #45
	bl	dwt_writetodevice
	.loc 1 1465 15
	movs	r3, #8
	strb	r3, [sp, #12]
	.loc 1 1466 5
	add	r3, sp, #12
	movs	r2, #1
	movs	r1, #6
	movs	r0, #45
	bl	dwt_writetodevice
	.loc 1 1471 15
	movs	r3, #4
	strb	r3, [sp, #12]
	.loc 1 1472 5
	add	r3, sp, #12
	movs	r2, #1
	movs	r1, #7
	movs	r0, #45
	bl	dwt_writetodevice
	.loc 1 1475 15
	movs	r3, #136
	strb	r3, [sp, #12]
	.loc 1 1476 5
	add	r3, sp, #12
	movs	r2, #1
	movs	r1, #6
	movs	r0, #45
	bl	dwt_writetodevice
	.loc 1 1478 15
	movs	r3, #128
	strb	r3, [sp, #12]
	.loc 1 1479 5
	add	r3, sp, #12
	movs	r2, #1
	movs	r1, #6
	movs	r0, #45
	bl	dwt_writetodevice
	.loc 1 1481 15
	movs	r3, #0
	strb	r3, [sp, #12]
	.loc 1 1482 5
	add	r3, sp, #12
	movs	r2, #1
	movs	r1, #6
	movs	r0, #45
	bl	dwt_writetodevice
	.loc 1 1487 15
	movs	r3, #1
	strb	r3, [sp, #12]
	.loc 1 1488 5
	add	r3, sp, #12
	movs	r2, #1
	movs	r1, #7
	movs	r0, #45
	bl	dwt_writetodevice
	.loc 1 1491 15
	ldr	r3, [sp, #20]
	uxtb	r3, r3
	strb	r3, [sp, #12]
	.loc 1 1492 30
	ldr	r3, [sp, #20]
	lsrs	r3, r3, #8
	.loc 1 1492 15
	uxtb	r3, r3
	strb	r3, [sp, #13]
	.loc 1 1493 5
	add	r3, sp, #12
	movs	r2, #2
	movs	r1, #0
	movs	r0, #45
	bl	dwt_writetodevice
	.loc 1 1496 15
	movs	r3, #8
	strb	r3, [sp, #12]
	.loc 1 1497 5
	add	r3, sp, #12
	movs	r2, #1
	movs	r1, #6
	movs	r0, #45
	bl	dwt_writetodevice
	.loc 1 1500 5
	movs	r0, #10
	bl	deca_sleep
	.loc 1 1502 15
	movs	r3, #0
	strb	r3, [sp, #12]
	.loc 1 1503 5
	add	r3, sp, #12
	movs	r2, #1
	movs	r1, #7
	movs	r0, #45
	bl	dwt_writetodevice
	.loc 1 1507 15
	movs	r3, #1
	strb	r3, [sp, #12]
	.loc 1 1508 5
	add	r3, sp, #12
	movs	r2, #1
	movs	r1, #6
	movs	r0, #45
	bl	dwt_writetodevice
	.loc 1 1509 15
	movs	r3, #2
	strb	r3, [sp, #12]
	.loc 1 1510 5
	add	r3, sp, #12
	movs	r2, #1
	movs	r1, #7
	movs	r0, #45
	bl	dwt_writetodevice
	.loc 1 1512 15
	movs	r3, #4
	strb	r3, [sp, #12]
	.loc 1 1513 5
	add	r3, sp, #12
	movs	r2, #1
	movs	r1, #7
	movs	r0, #45
	bl	dwt_writetodevice
	.loc 1 1514 5
	movs	r0, #100
	bl	deca_sleep
	.loc 1 1517 15
	movs	r3, #0
	strb	r3, [sp, #12]
	.loc 1 1518 5
	add	r3, sp, #12
	movs	r2, #1
	movs	r1, #7
	movs	r0, #45
	bl	dwt_writetodevice
	.loc 1 1520 15
	movs	r3, #0
	strb	r3, [sp, #12]
	.loc 1 1521 5
	add	r3, sp, #12
	movs	r2, #1
	movs	r1, #6
	movs	r0, #45
	bl	dwt_writetodevice
	.loc 1 1523 5
	movs	r0, #10
	bl	deca_sleep
	.loc 1 1525 15
	ldr	r3, [sp, #4]
	and	r3, r3, #15
	.loc 1 1525 8
	cmp	r3, #1
	beq	.L129
	.loc 1 1525 37 discriminator 1
	ldr	r3, [sp, #4]
	and	r3, r3, #15
	.loc 1 1525 29 discriminator 1
	cmp	r3, #2
	bne	.L130
.L129:
	.loc 1 1528 9
	add	r3, sp, #16
	movs	r2, #1
	movs	r1, #8
	movs	r0, #45
	bl	dwt_readfromdevice
.L130:
	.loc 1 1531 12
	movs	r3, #0
.L131:
	.loc 1 1532 1 discriminator 1
	mov	r0, r3
	add	sp, sp, #36
.LCFI109:
	@ sp needed
	ldr	pc, [sp], #4
.LFE43:
	.size	_dwt_otpsetmrregs, .-_dwt_otpsetmrregs
	.section	.text._dwt_otpprogword32,"ax",%progbits
	.align	1
	.global	_dwt_otpprogword32
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	_dwt_otpprogword32, %function
_dwt_otpprogword32:
.LFB44:
	.loc 1 1549 1
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
.LCFI110:
	sub	sp, sp, #20
.LCFI111:
	str	r0, [sp, #4]
	mov	r3, r1
	strh	r3, [sp, #2]	@ movhi
	.loc 1 1555 5
	add	r3, sp, #12
	movs	r2, #1
	movs	r1, #8
	movs	r0, #45
	bl	dwt_readfromdevice
	.loc 1 1557 15
	ldrb	r3, [sp, #12]	@ zero_extendqisi2
	.loc 1 1557 19
	and	r3, r3, #2
	.loc 1 1557 7
	cmp	r3, #0
	bne	.L133
	.loc 1 1559 16
	mov	r3, #-1
	b	.L137
.L133:
	.loc 1 1563 22
	ldr	r3, [sp, #4]
	lsrs	r3, r3, #24
	.loc 1 1563 15
	uxtb	r3, r3
	strb	r3, [sp, #11]
	.loc 1 1564 22
	ldr	r3, [sp, #4]
	lsrs	r3, r3, #16
	.loc 1 1564 15
	uxtb	r3, r3
	strb	r3, [sp, #10]
	.loc 1 1565 22
	ldr	r3, [sp, #4]
	lsrs	r3, r3, #8
	.loc 1 1565 15
	uxtb	r3, r3
	strb	r3, [sp, #9]
	.loc 1 1566 15
	ldr	r3, [sp, #4]
	uxtb	r3, r3
	strb	r3, [sp, #8]
	.loc 1 1567 5
	add	r3, sp, #8
	movs	r2, #4
	movs	r1, #0
	movs	r0, #45
	bl	dwt_writetodevice
	.loc 1 1570 30
	ldrh	r3, [sp, #2]
	lsrs	r3, r3, #8
	uxth	r3, r3
	uxtb	r3, r3
	and	r3, r3, #7
	uxtb	r3, r3
	.loc 1 1570 15
	strb	r3, [sp, #9]
	.loc 1 1571 15
	ldrh	r3, [sp, #2]	@ movhi
	uxtb	r3, r3
	strb	r3, [sp, #8]
	.loc 1 1572 5
	add	r3, sp, #8
	movs	r2, #2
	movs	r1, #4
	movs	r0, #45
	bl	dwt_writetodevice
	.loc 1 1575 15
	movs	r3, #64
	strb	r3, [sp, #8]
	.loc 1 1576 5
	add	r3, sp, #8
	movs	r2, #1
	movs	r1, #6
	movs	r0, #45
	bl	dwt_writetodevice
	.loc 1 1577 15
	movs	r3, #0
	strb	r3, [sp, #8]
	.loc 1 1578 5
	add	r3, sp, #8
	movs	r2, #1
	movs	r1, #6
	movs	r0, #45
	bl	dwt_writetodevice
	.loc 1 1581 14
	movs	r3, #0
	strb	r3, [sp, #15]
	.loc 1 1582 10
	b	.L135
.L136:
	.loc 1 1584 9
	movs	r0, #1
	bl	deca_sleep
	.loc 1 1585 9
	add	r3, sp, #12
	movs	r2, #1
	movs	r1, #8
	movs	r0, #45
	bl	dwt_readfromdevice
	.loc 1 1587 19
	ldrb	r3, [sp, #12]	@ zero_extendqisi2
	.loc 1 1587 23
	and	r3, r3, #1
	.loc 1 1587 11
	cmp	r3, #0
	beq	.L135
	.loc 1 1589 22
	movs	r3, #1
	strb	r3, [sp, #15]
.L135:
	.loc 1 1582 10
	ldrb	r3, [sp, #15]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L136
	.loc 1 1593 12
	movs	r3, #0
.L137:
	.loc 1 1594 1 discriminator 1
	mov	r0, r3
	add	sp, sp, #20
.LCFI112:
	@ sp needed
	ldr	pc, [sp], #4
.LFE44:
	.size	_dwt_otpprogword32, .-_dwt_otpprogword32
	.section	.text.dwt_otpwriteandverify,"ax",%progbits
	.align	1
	.global	dwt_otpwriteandverify
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	dwt_otpwriteandverify, %function
dwt_otpwriteandverify:
.LFB45:
	.loc 1 1610 1
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
.LCFI113:
	sub	sp, sp, #20
.LCFI114:
	str	r0, [sp, #4]
	mov	r3, r1
	strh	r3, [sp, #2]	@ movhi
	.loc 1 1611 9
	movs	r3, #0
	str	r3, [sp, #12]
	.loc 1 1612 9
	movs	r3, #0
	str	r3, [sp, #8]
	.loc 1 1614 5
	movs	r0, #0
	bl	_dwt_enableclocks
	.loc 1 1621 5
	movs	r0, #1
	bl	_dwt_otpsetmrregs
.L142:
	.loc 1 1626 9
	ldrh	r3, [sp, #2]
	mov	r1, r3
	ldr	r0, [sp, #4]
	bl	_dwt_otpprogword32
	.loc 1 1628 12
	ldrh	r3, [sp, #2]
	mov	r0, r3
	bl	_dwt_otpread
	mov	r2, r0
	.loc 1 1628 11
	ldr	r3, [sp, #4]
	cmp	r3, r2
	beq	.L145
	.loc 1 1632 14
	ldr	r3, [sp, #8]
	adds	r3, r3, #1
	str	r3, [sp, #8]
	.loc 1 1633 11
	ldr	r3, [sp, #8]
	cmp	r3, #5
	beq	.L146
	.loc 1 1626 9
	b	.L142
.L145:
	.loc 1 1630 13
	nop
	b	.L140
.L146:
	.loc 1 1635 13
	nop
.L140:
	.loc 1 1641 5
	movs	r0, #4
	bl	_dwt_otpsetmrregs
	.loc 1 1643 8
	ldrh	r3, [sp, #2]
	mov	r0, r3
	bl	_dwt_otpread
	mov	r2, r0
	.loc 1 1643 7
	ldr	r3, [sp, #4]
	cmp	r3, r2
	beq	.L143
	.loc 1 1645 17
	mov	r3, #-1
	str	r3, [sp, #12]
.L143:
	.loc 1 1648 5
	movs	r0, #0
	bl	_dwt_otpsetmrregs
	.loc 1 1650 12
	ldr	r3, [sp, #12]
	.loc 1 1651 1
	mov	r0, r3
	add	sp, sp, #20
.LCFI115:
	@ sp needed
	ldr	pc, [sp], #4
.LFE45:
	.size	dwt_otpwriteandverify, .-dwt_otpwriteandverify
	.section	.text._dwt_aonconfigupload,"ax",%progbits
	.align	1
	.global	_dwt_aonconfigupload
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	_dwt_aonconfigupload, %function
_dwt_aonconfigupload:
.LFB46:
	.loc 1 1665 1
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, lr}
.LCFI116:
	.loc 1 1666 5
	movs	r2, #4
	movs	r1, #2
	movs	r0, #44
	bl	dwt_write8bitoffsetreg
	.loc 1 1667 5
	movs	r2, #0
	movs	r1, #2
	movs	r0, #44
	bl	dwt_write8bitoffsetreg
	.loc 1 1668 1
	nop
	pop	{r3, pc}
.LFE46:
	.size	_dwt_aonconfigupload, .-_dwt_aonconfigupload
	.section	.text._dwt_aonarrayupload,"ax",%progbits
	.align	1
	.global	_dwt_aonarrayupload
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	_dwt_aonarrayupload, %function
_dwt_aonarrayupload:
.LFB47:
	.loc 1 1683 1
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, lr}
.LCFI117:
	.loc 1 1684 5
	movs	r2, #0
	movs	r1, #2
	movs	r0, #44
	bl	dwt_write8bitoffsetreg
	.loc 1 1685 5
	movs	r2, #2
	movs	r1, #2
	movs	r0, #44
	bl	dwt_write8bitoffsetreg
	.loc 1 1686 1
	nop
	pop	{r3, pc}
.LFE47:
	.size	_dwt_aonarrayupload, .-_dwt_aonarrayupload
	.section	.text.dwt_entersleep,"ax",%progbits
	.align	1
	.global	dwt_entersleep
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	dwt_entersleep, %function
dwt_entersleep:
.LFB48:
	.loc 1 1701 1
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, lr}
.LCFI118:
	.loc 1 1703 5
	bl	_dwt_aonarrayupload
	.loc 1 1704 1
	nop
	pop	{r3, pc}
.LFE48:
	.size	dwt_entersleep, .-dwt_entersleep
	.section	.text.dwt_configuresleepcnt,"ax",%progbits
	.align	1
	.global	dwt_configuresleepcnt
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	dwt_configuresleepcnt, %function
dwt_configuresleepcnt:
.LFB49:
	.loc 1 1721 1
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
.LCFI119:
	sub	sp, sp, #12
.LCFI120:
	mov	r3, r0
	strh	r3, [sp, #6]	@ movhi
	.loc 1 1723 5
	movs	r0, #0
	bl	_dwt_enableclocks
	.loc 1 1726 5
	movs	r2, #0
	movs	r1, #6
	movs	r0, #44
	bl	dwt_write8bitoffsetreg
	.loc 1 1727 5
	movs	r2, #0
	movs	r1, #10
	movs	r0, #44
	bl	dwt_write8bitoffsetreg
	.loc 1 1730 5
	bl	_dwt_aonconfigupload
	.loc 1 1733 5
	ldrh	r3, [sp, #6]
	mov	r2, r3
	movs	r1, #8
	movs	r0, #44
	bl	dwt_write16bitoffsetreg
	.loc 1 1734 5
	bl	_dwt_aonconfigupload
	.loc 1 1737 5
	movs	r2, #1
	movs	r1, #10
	movs	r0, #44
	bl	dwt_write8bitoffsetreg
	.loc 1 1738 5
	bl	_dwt_aonconfigupload
	.loc 1 1741 5
	movs	r0, #1
	bl	_dwt_enableclocks
	.loc 1 1742 1
	nop
	add	sp, sp, #12
.LCFI121:
	@ sp needed
	ldr	pc, [sp], #4
.LFE49:
	.size	dwt_configuresleepcnt, .-dwt_configuresleepcnt
	.section	.text.dwt_calibratesleepcnt,"ax",%progbits
	.align	1
	.global	dwt_calibratesleepcnt
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	dwt_calibratesleepcnt, %function
dwt_calibratesleepcnt:
.LFB50:
	.loc 1 1759 1
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
.LCFI122:
	sub	sp, sp, #12
.LCFI123:
	.loc 1 1763 5
	movs	r2, #4
	movs	r1, #10
	movs	r0, #44
	bl	dwt_write8bitoffsetreg
	.loc 1 1764 5
	bl	_dwt_aonconfigupload
	.loc 1 1767 5
	movs	r2, #0
	movs	r1, #10
	movs	r0, #44
	bl	dwt_write8bitoffsetreg
	.loc 1 1768 5
	bl	_dwt_aonconfigupload
	.loc 1 1771 5
	movs	r0, #0
	bl	_dwt_enableclocks
	.loc 1 1773 5
	movs	r0, #1
	bl	deca_sleep
	.loc 1 1777 5
	movs	r2, #118
	movs	r1, #4
	movs	r0, #44
	bl	dwt_write8bitoffsetreg
	.loc 1 1780 5
	movs	r2, #128
	movs	r1, #2
	movs	r0, #44
	bl	dwt_write8bitoffsetreg
	.loc 1 1783 5
	movs	r2, #136
	movs	r1, #2
	movs	r0, #44
	bl	dwt_write8bitoffsetreg
	.loc 1 1786 14
	movs	r1, #3
	movs	r0, #44
	bl	dwt_read8bitoffsetreg
	mov	r3, r0
	.loc 1 1786 12
	strh	r3, [sp, #6]	@ movhi
	.loc 1 1787 12
	ldrh	r3, [sp, #6]	@ movhi
	lsls	r3, r3, #8
	strh	r3, [sp, #6]	@ movhi
	.loc 1 1790 5
	movs	r2, #117
	movs	r1, #4
	movs	r0, #44
	bl	dwt_write8bitoffsetreg
	.loc 1 1793 5
	movs	r2, #128
	movs	r1, #2
	movs	r0, #44
	bl	dwt_write8bitoffsetreg
	.loc 1 1796 5
	movs	r2, #136
	movs	r1, #2
	movs	r0, #44
	bl	dwt_write8bitoffsetreg
	.loc 1 1799 15
	movs	r1, #3
	movs	r0, #44
	bl	dwt_read8bitoffsetreg
	mov	r3, r0
	uxth	r2, r3
	.loc 1 1799 12
	ldrh	r3, [sp, #6]	@ movhi
	orrs	r3, r3, r2
	strh	r3, [sp, #6]	@ movhi
	.loc 1 1802 5
	movs	r2, #0
	movs	r1, #2
	movs	r0, #44
	bl	dwt_write8bitoffsetreg
	.loc 1 1805 5
	movs	r0, #1
	bl	_dwt_enableclocks
	.loc 1 1809 12
	ldrh	r3, [sp, #6]
	.loc 1 1810 1
	mov	r0, r3
	add	sp, sp, #12
.LCFI124:
	@ sp needed
	ldr	pc, [sp], #4
.LFE50:
	.size	dwt_calibratesleepcnt, .-dwt_calibratesleepcnt
	.section	.text.dwt_configuresleep,"ax",%progbits
	.align	1
	.global	dwt_configuresleep
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	dwt_configuresleep, %function
dwt_configuresleep:
.LFB51:
	.loc 1 1846 1
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
.LCFI125:
	sub	sp, sp, #12
.LCFI126:
	mov	r3, r0
	mov	r2, r1
	strh	r3, [sp, #6]	@ movhi
	mov	r3, r2
	strb	r3, [sp, #5]
	.loc 1 1848 25
	ldr	r3, .L154
	ldr	r3, [r3]
	ldrh	r2, [r3, #24]
	.loc 1 1848 10
	ldrh	r3, [sp, #6]	@ movhi
	orrs	r3, r3, r2
	strh	r3, [sp, #6]	@ movhi
	.loc 1 1849 5
	ldrh	r3, [sp, #6]
	mov	r2, r3
	movs	r1, #0
	movs	r0, #44
	bl	dwt_write16bitoffsetreg
	.loc 1 1851 5
	ldrb	r3, [sp, #5]	@ zero_extendqisi2
	mov	r2, r3
	movs	r1, #6
	movs	r0, #44
	bl	dwt_write8bitoffsetreg
	.loc 1 1852 1
	nop
	add	sp, sp, #12
.LCFI127:
	@ sp needed
	ldr	pc, [sp], #4
.L155:
	.align	2
.L154:
	.word	pdw1000local
.LFE51:
	.size	dwt_configuresleep, .-dwt_configuresleep
	.section	.text.dwt_entersleepaftertx,"ax",%progbits
	.align	1
	.global	dwt_entersleepaftertx
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	dwt_entersleepaftertx, %function
dwt_entersleepaftertx:
.LFB52:
	.loc 1 1871 1
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
.LCFI128:
	sub	sp, sp, #20
.LCFI129:
	str	r0, [sp, #4]
	.loc 1 1872 18
	movs	r1, #4
	movs	r0, #54
	bl	dwt_read32bitoffsetreg
	str	r0, [sp, #12]
	.loc 1 1874 7
	ldr	r3, [sp, #4]
	cmp	r3, #0
	beq	.L157
	.loc 1 1876 13
	ldr	r3, [sp, #12]
	orr	r3, r3, #2048
	str	r3, [sp, #12]
	b	.L158
.L157:
	.loc 1 1880 13
	ldr	r3, [sp, #12]
	bic	r3, r3, #2048
	str	r3, [sp, #12]
.L158:
	.loc 1 1882 5
	ldr	r2, [sp, #12]
	movs	r1, #4
	movs	r0, #54
	bl	dwt_write32bitoffsetreg
	.loc 1 1883 1
	nop
	add	sp, sp, #20
.LCFI130:
	@ sp needed
	ldr	pc, [sp], #4
.LFE52:
	.size	dwt_entersleepaftertx, .-dwt_entersleepaftertx
	.section	.text.dwt_spicswakeup,"ax",%progbits
	.align	1
	.global	dwt_spicswakeup
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	dwt_spicswakeup, %function
dwt_spicswakeup:
.LFB53:
	.loc 1 1910 1
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
.LCFI131:
	sub	sp, sp, #12
.LCFI132:
	str	r0, [sp, #4]
	mov	r3, r1
	strh	r3, [sp, #2]	@ movhi
	.loc 1 1911 8
	bl	dwt_readdevid
	mov	r2, r0
	.loc 1 1911 7
	ldr	r3, .L165
	cmp	r2, r3
	beq	.L160
	.loc 1 1914 9
	ldrh	r2, [sp, #2]
	ldr	r3, [sp, #4]
	movs	r1, #0
	movs	r0, #0
	bl	dwt_readfromdevice
	.loc 1 1918 9
	movs	r0, #5
	bl	deca_sleep
	.loc 1 1925 8
	bl	dwt_readdevid
	mov	r2, r0
	.loc 1 1925 7
	ldr	r3, .L165
	cmp	r2, r3
	beq	.L163
	b	.L164
.L160:
	.loc 1 1922 16
	movs	r3, #0
	b	.L162
.L164:
	.loc 1 1927 16
	mov	r3, #-1
	b	.L162
.L163:
	.loc 1 1930 12
	movs	r3, #0
.L162:
	.loc 1 1931 1
	mov	r0, r3
	add	sp, sp, #12
.LCFI133:
	@ sp needed
	ldr	pc, [sp], #4
.L166:
	.align	2
.L165:
	.word	-557186768
.LFE53:
	.size	dwt_spicswakeup, .-dwt_spicswakeup
	.section	.text._dwt_configlde,"ax",%progbits
	.align	1
	.global	_dwt_configlde
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	_dwt_configlde, %function
_dwt_configlde:
.LFB54:
	.loc 1 1946 1
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
.LCFI134:
	sub	sp, sp, #12
.LCFI135:
	str	r0, [sp, #4]
	.loc 1 1947 5
	movs	r2, #109
	movw	r1, #2054
	movs	r0, #46
	bl	dwt_write8bitoffsetreg
	.loc 1 1949 7
	ldr	r3, [sp, #4]
	cmp	r3, #0
	beq	.L168
	.loc 1 1951 9
	movw	r2, #1543
	movw	r1, #6150
	movs	r0, #46
	bl	dwt_write16bitoffsetreg
	.loc 1 1957 1
	b	.L170
.L168:
	.loc 1 1955 9
	movw	r2, #5639
	movw	r1, #6150
	movs	r0, #46
	bl	dwt_write16bitoffsetreg
.L170:
	.loc 1 1957 1
	nop
	add	sp, sp, #12
.LCFI136:
	@ sp needed
	ldr	pc, [sp], #4
.LFE54:
	.size	_dwt_configlde, .-_dwt_configlde
	.section	.text._dwt_loaducodefromrom,"ax",%progbits
	.align	1
	.global	_dwt_loaducodefromrom
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	_dwt_loaducodefromrom, %function
_dwt_loaducodefromrom:
.LFB55:
	.loc 1 1972 1
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, lr}
.LCFI137:
	.loc 1 1974 5
	movs	r0, #14
	bl	_dwt_enableclocks
	.loc 1 1977 5
	mov	r2, #32768
	movs	r1, #6
	movs	r0, #45
	bl	dwt_write16bitoffsetreg
	.loc 1 1979 5
	movs	r0, #1
	bl	deca_sleep
	.loc 1 1982 5
	movs	r0, #1
	bl	_dwt_enableclocks
	.loc 1 1983 1
	nop
	pop	{r3, pc}
.LFE55:
	.size	_dwt_loaducodefromrom, .-_dwt_loaducodefromrom
	.section	.text.dwt_loadopsettabfromotp,"ax",%progbits
	.align	1
	.global	dwt_loadopsettabfromotp
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	dwt_loadopsettabfromotp, %function
dwt_loadopsettabfromotp:
.LFB56:
	.loc 1 2001 1
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
.LCFI138:
	sub	sp, sp, #20
.LCFI139:
	mov	r3, r0
	strb	r3, [sp, #7]
	.loc 1 2002 28
	ldrb	r3, [sp, #7]	@ zero_extendqisi2
	lsls	r3, r3, #5
	.loc 1 2002 52
	sxth	r3, r3
	and	r3, r3, #96
	sxth	r3, r3
	.loc 1 2002 75
	orr	r3, r3, #1
	sxth	r3, r3
	.loc 1 2002 12
	strh	r3, [sp, #14]	@ movhi
	.loc 1 2005 5
	movs	r0, #14
	bl	_dwt_enableclocks
	.loc 1 2007 5
	ldrh	r3, [sp, #14]
	mov	r2, r3
	movs	r1, #18
	movs	r0, #45
	bl	dwt_write16bitoffsetreg
	.loc 1 2010 5
	movs	r0, #1
	bl	_dwt_enableclocks
	.loc 1 2012 1
	nop
	add	sp, sp, #20
.LCFI140:
	@ sp needed
	ldr	pc, [sp], #4
.LFE56:
	.size	dwt_loadopsettabfromotp, .-dwt_loadopsettabfromotp
	.section	.text.dwt_setsmarttxpower,"ax",%progbits
	.align	1
	.global	dwt_setsmarttxpower
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	dwt_setsmarttxpower, %function
dwt_setsmarttxpower:
.LFB57:
	.loc 1 2027 1
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
.LCFI141:
	sub	sp, sp, #8
.LCFI142:
	str	r0, [sp, #4]
	.loc 1 2029 17
	ldr	r3, .L176
	ldr	r4, [r3]
	.loc 1 2029 31
	movs	r1, #0
	movs	r0, #4
	bl	dwt_read32bitoffsetreg
	mov	r3, r0
	.loc 1 2029 29
	str	r3, [r4, #20]
	.loc 1 2032 7
	ldr	r3, [sp, #4]
	cmp	r3, #0
	beq	.L174
	.loc 1 2034 33
	ldr	r3, .L176
	ldr	r3, [r3]
	ldr	r2, [r3, #20]
	ldr	r3, .L176
	ldr	r3, [r3]
	bic	r2, r2, #262144
	str	r2, [r3, #20]
	b	.L175
.L174:
	.loc 1 2038 33
	ldr	r3, .L176
	ldr	r3, [r3]
	ldr	r2, [r3, #20]
	ldr	r3, .L176
	ldr	r3, [r3]
	orr	r2, r2, #262144
	str	r2, [r3, #20]
.L175:
	.loc 1 2041 5
	ldr	r3, .L176
	ldr	r3, [r3]
	ldr	r3, [r3, #20]
	mov	r2, r3
	movs	r1, #0
	movs	r0, #4
	bl	dwt_write32bitoffsetreg
	.loc 1 2042 1
	nop
	add	sp, sp, #8
.LCFI143:
	@ sp needed
	pop	{r4, pc}
.L177:
	.align	2
.L176:
	.word	pdw1000local
.LFE57:
	.size	dwt_setsmarttxpower, .-dwt_setsmarttxpower
	.section	.text.dwt_enableautoack,"ax",%progbits
	.align	1
	.global	dwt_enableautoack
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	dwt_enableautoack, %function
dwt_enableautoack:
.LFB58:
	.loc 1 2060 1
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
.LCFI144:
	sub	sp, sp, #12
.LCFI145:
	mov	r3, r0
	strb	r3, [sp, #7]
	.loc 1 2062 5
	ldrb	r3, [sp, #7]	@ zero_extendqisi2
	mov	r2, r3
	movs	r1, #3
	movs	r0, #26
	bl	dwt_write8bitoffsetreg
	.loc 1 2064 29
	ldr	r3, .L179
	ldr	r3, [r3]
	ldr	r2, [r3, #20]
	ldr	r3, .L179
	ldr	r3, [r3]
	orr	r2, r2, #1073741824
	str	r2, [r3, #20]
	.loc 1 2065 5
	ldr	r3, .L179
	ldr	r3, [r3]
	ldr	r3, [r3, #20]
	mov	r2, r3
	movs	r1, #0
	movs	r0, #4
	bl	dwt_write32bitoffsetreg
	.loc 1 2066 1
	nop
	add	sp, sp, #12
.LCFI146:
	@ sp needed
	ldr	pc, [sp], #4
.L180:
	.align	2
.L179:
	.word	pdw1000local
.LFE58:
	.size	dwt_enableautoack, .-dwt_enableautoack
	.section	.text.dwt_setdblrxbuffmode,"ax",%progbits
	.align	1
	.global	dwt_setdblrxbuffmode
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	dwt_setdblrxbuffmode, %function
dwt_setdblrxbuffmode:
.LFB59:
	.loc 1 2081 1
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
.LCFI147:
	sub	sp, sp, #12
.LCFI148:
	str	r0, [sp, #4]
	.loc 1 2082 7
	ldr	r3, [sp, #4]
	cmp	r3, #0
	beq	.L182
	.loc 1 2085 33
	ldr	r3, .L184
	ldr	r3, [r3]
	ldr	r2, [r3, #20]
	ldr	r3, .L184
	ldr	r3, [r3]
	bic	r2, r2, #4096
	str	r2, [r3, #20]
	.loc 1 2086 21
	ldr	r3, .L184
	ldr	r3, [r3]
	.loc 1 2086 33
	movs	r2, #1
	strb	r2, [r3, #17]
	b	.L183
.L182:
	.loc 1 2091 33
	ldr	r3, .L184
	ldr	r3, [r3]
	ldr	r2, [r3, #20]
	ldr	r3, .L184
	ldr	r3, [r3]
	orr	r2, r2, #4096
	str	r2, [r3, #20]
	.loc 1 2092 21
	ldr	r3, .L184
	ldr	r3, [r3]
	.loc 1 2092 33
	movs	r2, #0
	strb	r2, [r3, #17]
.L183:
	.loc 1 2095 5
	ldr	r3, .L184
	ldr	r3, [r3]
	ldr	r3, [r3, #20]
	mov	r2, r3
	movs	r1, #0
	movs	r0, #4
	bl	dwt_write32bitoffsetreg
	.loc 1 2096 1
	nop
	add	sp, sp, #12
.LCFI149:
	@ sp needed
	ldr	pc, [sp], #4
.L185:
	.align	2
.L184:
	.word	pdw1000local
.LFE59:
	.size	dwt_setdblrxbuffmode, .-dwt_setdblrxbuffmode
	.section	.text.dwt_setrxaftertxdelay,"ax",%progbits
	.align	1
	.global	dwt_setrxaftertxdelay
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	dwt_setrxaftertxdelay, %function
dwt_setrxaftertxdelay:
.LFB60:
	.loc 1 2111 1
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
.LCFI150:
	sub	sp, sp, #20
.LCFI151:
	str	r0, [sp, #4]
	.loc 1 2112 18
	movs	r1, #0
	movs	r0, #26
	bl	dwt_read32bitoffsetreg
	str	r0, [sp, #12]
	.loc 1 2114 9
	ldr	r3, [sp, #12]
	lsrs	r3, r3, #20
	lsls	r3, r3, #20
	str	r3, [sp, #12]
	.loc 1 2116 25
	ldr	r3, [sp, #4]
	ubfx	r3, r3, #0, #20
	.loc 1 2116 9
	ldr	r2, [sp, #12]
	orrs	r3, r3, r2
	str	r3, [sp, #12]
	.loc 1 2118 5
	ldr	r2, [sp, #12]
	movs	r1, #0
	movs	r0, #26
	bl	dwt_write32bitoffsetreg
	.loc 1 2119 1
	nop
	add	sp, sp, #20
.LCFI152:
	@ sp needed
	ldr	pc, [sp], #4
.LFE60:
	.size	dwt_setrxaftertxdelay, .-dwt_setrxaftertxdelay
	.section	.text.dwt_setcallbacks,"ax",%progbits
	.align	1
	.global	dwt_setcallbacks
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	dwt_setcallbacks, %function
dwt_setcallbacks:
.LFB61:
	.loc 1 2140 1
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	sub	sp, sp, #16
.LCFI153:
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	.loc 1 2141 17
	ldr	r3, .L188
	ldr	r3, [r3]
	.loc 1 2141 28
	ldr	r2, [sp, #12]
	str	r2, [r3, #40]
	.loc 1 2142 17
	ldr	r3, .L188
	ldr	r3, [r3]
	.loc 1 2142 26
	ldr	r2, [sp, #8]
	str	r2, [r3, #44]
	.loc 1 2143 17
	ldr	r3, .L188
	ldr	r3, [r3]
	.loc 1 2143 26
	ldr	r2, [sp, #4]
	str	r2, [r3, #48]
	.loc 1 2144 17
	ldr	r3, .L188
	ldr	r3, [r3]
	.loc 1 2144 27
	ldr	r2, [sp]
	str	r2, [r3, #52]
	.loc 1 2145 1
	nop
	add	sp, sp, #16
.LCFI154:
	@ sp needed
	bx	lr
.L189:
	.align	2
.L188:
	.word	pdw1000local
.LFE61:
	.size	dwt_setcallbacks, .-dwt_setcallbacks
	.section	.text.dwt_checkirq,"ax",%progbits
	.align	1
	.global	dwt_checkirq
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	dwt_checkirq, %function
dwt_checkirq:
.LFB62:
	.loc 1 2159 1
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, lr}
.LCFI155:
	.loc 1 2160 13
	movs	r1, #0
	movs	r0, #15
	bl	dwt_read8bitoffsetreg
	mov	r3, r0
	.loc 1 2160 69
	and	r3, r3, #1
	uxtb	r3, r3
	.loc 1 2161 1
	mov	r0, r3
	pop	{r3, pc}
.LFE62:
	.size	dwt_checkirq, .-dwt_checkirq
	.section	.text.dwt_isr,"ax",%progbits
	.align	1
	.global	dwt_isr
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	dwt_isr, %function
dwt_isr:
.LFB63:
	.loc 1 2188 1
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
.LCFI156:
	sub	sp, sp, #16
.LCFI157:
	.loc 1 2189 33
	ldr	r3, .L203
	ldr	r4, [r3]
	.loc 1 2189 51
	movs	r1, #0
	movs	r0, #15
	bl	dwt_read32bitoffsetreg
	mov	r3, r0
	.loc 1 2189 49
	str	r3, [r4, #28]
	.loc 1 2189 12
	ldr	r3, [r4, #28]
	str	r3, [sp, #8]
	.loc 1 2192 15
	ldr	r3, [sp, #8]
	and	r3, r3, #16384
	.loc 1 2192 7
	cmp	r3, #0
	beq	.L193
.LBB3:
	.loc 1 2197 9
	mov	r2, #28416
	movs	r1, #0
	movs	r0, #15
	bl	dwt_write32bitoffsetreg
	.loc 1 2199 21
	ldr	r3, .L203
	ldr	r3, [r3]
	.loc 1 2199 39
	movs	r2, #0
	strb	r2, [r3, #36]
	.loc 1 2202 19
	movs	r1, #0
	movs	r0, #16
	bl	dwt_read16bitoffsetreg
	mov	r3, r0
	strh	r3, [sp, #6]	@ movhi
	.loc 1 2205 13
	ldrh	r3, [sp, #6]	@ movhi
	ubfx	r3, r3, #0, #10
	strh	r3, [sp, #14]	@ movhi
	.loc 1 2206 24
	ldr	r3, .L203
	ldr	r3, [r3]
	ldrb	r3, [r3, #8]	@ zero_extendqisi2
	.loc 1 2206 11
	cmp	r3, #0
	bne	.L194
	.loc 1 2208 17
	ldrh	r3, [sp, #14]	@ movhi
	and	r3, r3, #127
	strh	r3, [sp, #14]	@ movhi
.L194:
	.loc 1 2210 21
	ldr	r3, .L203
	ldr	r3, [r3]
	.loc 1 2210 41
	ldrh	r2, [sp, #14]	@ movhi
	strh	r2, [r3, #32]	@ movhi
	.loc 1 2213 12
	ldrsh	r3, [sp, #6]
	.loc 1 2213 11
	cmp	r3, #0
	bge	.L195
	.loc 1 2215 43
	ldr	r3, .L203
	ldr	r3, [r3]
	ldrb	r2, [r3, #36]	@ zero_extendqisi2
	ldr	r3, .L203
	ldr	r3, [r3]
	orr	r2, r2, #1
	uxtb	r2, r2
	strb	r2, [r3, #36]
.L195:
	.loc 1 2219 72
	ldr	r3, .L203
	ldr	r3, [r3]
	.loc 1 2219 80
	adds	r3, r3, #34
	.loc 1 2219 9
	movs	r2, #2
	movs	r1, #0
	movs	r0, #17
	bl	dwt_readfromdevice
	.loc 1 2225 20
	ldr	r3, [sp, #8]
	and	r3, r3, #8
	.loc 1 2225 11
	cmp	r3, #0
	beq	.L196
	.loc 1 2225 55 discriminator 1
	ldr	r3, .L203
	ldr	r3, [r3]
	.loc 1 2225 69 discriminator 1
	ldrb	r3, [r3, #34]	@ zero_extendqisi2
	.loc 1 2225 73 discriminator 1
	and	r3, r3, #32
	.loc 1 2225 38 discriminator 1
	cmp	r3, #0
	bne	.L196
	.loc 1 2227 13
	movs	r2, #8
	movs	r1, #0
	movs	r0, #15
	bl	dwt_write32bitoffsetreg
	.loc 1 2228 41
	ldr	r3, .L203
	ldr	r3, [r3]
	ldr	r2, [r3, #28]
	ldr	r3, .L203
	ldr	r3, [r3]
	bic	r2, r2, #8
	str	r2, [r3, #28]
	.loc 1 2229 25
	ldr	r3, .L203
	ldr	r3, [r3]
	.loc 1 2229 37
	movs	r2, #0
	strb	r2, [r3, #26]
.L196:
	.loc 1 2233 24
	ldr	r3, .L203
	ldr	r3, [r3]
	ldr	r3, [r3, #44]
	.loc 1 2233 11
	cmp	r3, #0
	beq	.L197
	.loc 1 2235 25
	ldr	r3, .L203
	ldr	r3, [r3]
	ldr	r3, [r3, #44]
	.loc 1 2235 47
	ldr	r2, .L203
	ldr	r2, [r2]
	.loc 1 2235 34
	adds	r2, r2, #28
	.loc 1 2235 13
	mov	r0, r2
	blx	r3
.LVL0:
.L197:
	.loc 1 2238 25
	ldr	r3, .L203
	ldr	r3, [r3]
	ldrb	r3, [r3, #17]	@ zero_extendqisi2
	.loc 1 2238 12
	cmp	r3, #0
	beq	.L193
	.loc 1 2241 13
	movs	r2, #1
	movs	r1, #3
	movs	r0, #13
	bl	dwt_write8bitoffsetreg
.L193:
.LBE3:
	.loc 1 2246 15
	ldr	r3, [sp, #8]
	and	r3, r3, #128
	.loc 1 2246 7
	cmp	r3, #0
	beq	.L198
	.loc 1 2248 9
	movs	r2, #248
	movs	r1, #0
	movs	r0, #15
	bl	dwt_write32bitoffsetreg
	.loc 1 2255 20
	ldr	r3, [sp, #8]
	and	r3, r3, #8
	.loc 1 2255 11
	cmp	r3, #0
	beq	.L199
	.loc 1 2255 53 discriminator 1
	ldr	r3, .L203
	ldr	r3, [r3]
	ldrb	r3, [r3, #26]	@ zero_extendqisi2
	.loc 1 2255 38 discriminator 1
	cmp	r3, #0
	beq	.L199
	.loc 1 2257 13
	bl	dwt_forcetrxoff
	.loc 1 2258 13
	bl	dwt_rxreset
.L199:
	.loc 1 2262 24
	ldr	r3, .L203
	ldr	r3, [r3]
	ldr	r3, [r3, #40]
	.loc 1 2262 11
	cmp	r3, #0
	beq	.L198
	.loc 1 2264 25
	ldr	r3, .L203
	ldr	r3, [r3]
	ldr	r3, [r3, #40]
	.loc 1 2264 49
	ldr	r2, .L203
	ldr	r2, [r2]
	.loc 1 2264 36
	adds	r2, r2, #28
	.loc 1 2264 13
	mov	r0, r2
	blx	r3
.LVL1:
.L198:
	.loc 1 2269 15
	ldr	r3, [sp, #8]
	and	r3, r3, #2228224
	.loc 1 2269 7
	cmp	r3, #0
	beq	.L200
	.loc 1 2271 9
	mov	r2, #131072
	movs	r1, #0
	movs	r0, #15
	bl	dwt_write32bitoffsetreg
	.loc 1 2273 21
	ldr	r3, .L203
	ldr	r3, [r3]
	.loc 1 2273 33
	movs	r2, #0
	strb	r2, [r3, #26]
	.loc 1 2278 9
	bl	dwt_forcetrxoff
	.loc 1 2279 9
	bl	dwt_rxreset
	.loc 1 2282 24
	ldr	r3, .L203
	ldr	r3, [r3]
	ldr	r3, [r3, #48]
	.loc 1 2282 11
	cmp	r3, #0
	beq	.L200
	.loc 1 2284 25
	ldr	r3, .L203
	ldr	r3, [r3]
	ldr	r3, [r3, #48]
	.loc 1 2284 47
	ldr	r2, .L203
	ldr	r2, [r2]
	.loc 1 2284 34
	adds	r2, r2, #28
	.loc 1 2284 13
	mov	r0, r2
	blx	r3
.LVL2:
.L200:
	.loc 1 2289 15
	ldr	r2, [sp, #8]
	ldr	r3, .L203+4
	ands	r3, r3, r2
	.loc 1 2289 7
	cmp	r3, #0
	beq	.L202
	.loc 1 2291 9
	ldr	r2, .L203+4
	movs	r1, #0
	movs	r0, #15
	bl	dwt_write32bitoffsetreg
	.loc 1 2293 21
	ldr	r3, .L203
	ldr	r3, [r3]
	.loc 1 2293 33
	movs	r2, #0
	strb	r2, [r3, #26]
	.loc 1 2298 9
	bl	dwt_forcetrxoff
	.loc 1 2299 9
	bl	dwt_rxreset
	.loc 1 2302 24
	ldr	r3, .L203
	ldr	r3, [r3]
	ldr	r3, [r3, #52]
	.loc 1 2302 11
	cmp	r3, #0
	beq	.L202
	.loc 1 2304 25
	ldr	r3, .L203
	ldr	r3, [r3]
	ldr	r3, [r3, #52]
	.loc 1 2304 48
	ldr	r2, .L203
	ldr	r2, [r2]
	.loc 1 2304 35
	adds	r2, r2, #28
	.loc 1 2304 13
	mov	r0, r2
	blx	r3
.LVL3:
.L202:
	.loc 1 2307 1
	nop
	add	sp, sp, #16
.LCFI158:
	@ sp needed
	pop	{r4, pc}
.L204:
	.align	2
.L203:
	.word	pdw1000local
	.word	604344320
.LFE63:
	.size	dwt_isr, .-dwt_isr
	.section	.text.dwt_lowpowerlistenisr,"ax",%progbits
	.align	1
	.global	dwt_lowpowerlistenisr
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	dwt_lowpowerlistenisr, %function
dwt_lowpowerlistenisr:
.LFB64:
	.loc 1 2325 1
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
.LCFI159:
	sub	sp, sp, #16
.LCFI160:
	.loc 1 2326 33
	ldr	r3, .L211
	ldr	r4, [r3]
	.loc 1 2326 51
	movs	r1, #0
	movs	r0, #15
	bl	dwt_read32bitoffsetreg
	mov	r3, r0
	.loc 1 2326 49
	str	r3, [r4, #28]
	.loc 1 2326 12
	ldr	r3, [r4, #28]
	str	r3, [sp, #8]
	.loc 1 2333 5
	movs	r0, #0
	bl	dwt_setlowpowerlistening
	.loc 1 2335 5
	mov	r2, #28416
	movs	r1, #0
	movs	r0, #15
	bl	dwt_write32bitoffsetreg
	.loc 1 2337 17
	ldr	r3, .L211
	ldr	r3, [r3]
	.loc 1 2337 35
	movs	r2, #0
	strb	r2, [r3, #36]
	.loc 1 2340 15
	movs	r1, #0
	movs	r0, #16
	bl	dwt_read16bitoffsetreg
	mov	r3, r0
	strh	r3, [sp, #6]	@ movhi
	.loc 1 2343 9
	ldrh	r3, [sp, #6]	@ movhi
	ubfx	r3, r3, #0, #10
	strh	r3, [sp, #14]	@ movhi
	.loc 1 2344 20
	ldr	r3, .L211
	ldr	r3, [r3]
	ldrb	r3, [r3, #8]	@ zero_extendqisi2
	.loc 1 2344 7
	cmp	r3, #0
	bne	.L206
	.loc 1 2346 13
	ldrh	r3, [sp, #14]	@ movhi
	and	r3, r3, #127
	strh	r3, [sp, #14]	@ movhi
.L206:
	.loc 1 2348 17
	ldr	r3, .L211
	ldr	r3, [r3]
	.loc 1 2348 37
	ldrh	r2, [sp, #14]	@ movhi
	strh	r2, [r3, #32]	@ movhi
	.loc 1 2351 8
	ldrsh	r3, [sp, #6]
	.loc 1 2351 7
	cmp	r3, #0
	bge	.L207
	.loc 1 2353 39
	ldr	r3, .L211
	ldr	r3, [r3]
	ldrb	r2, [r3, #36]	@ zero_extendqisi2
	ldr	r3, .L211
	ldr	r3, [r3]
	orr	r2, r2, #1
	uxtb	r2, r2
	strb	r2, [r3, #36]
.L207:
	.loc 1 2357 68
	ldr	r3, .L211
	ldr	r3, [r3]
	.loc 1 2357 76
	adds	r3, r3, #34
	.loc 1 2357 5
	movs	r2, #2
	movs	r1, #0
	movs	r0, #17
	bl	dwt_readfromdevice
	.loc 1 2363 16
	ldr	r3, [sp, #8]
	and	r3, r3, #8
	.loc 1 2363 7
	cmp	r3, #0
	beq	.L208
	.loc 1 2363 51 discriminator 1
	ldr	r3, .L211
	ldr	r3, [r3]
	.loc 1 2363 65 discriminator 1
	ldrb	r3, [r3, #34]	@ zero_extendqisi2
	.loc 1 2363 69 discriminator 1
	and	r3, r3, #32
	.loc 1 2363 34 discriminator 1
	cmp	r3, #0
	bne	.L208
	.loc 1 2365 9
	movs	r2, #8
	movs	r1, #0
	movs	r0, #15
	bl	dwt_write32bitoffsetreg
	.loc 1 2366 37
	ldr	r3, .L211
	ldr	r3, [r3]
	ldr	r2, [r3, #28]
	ldr	r3, .L211
	ldr	r3, [r3]
	bic	r2, r2, #8
	str	r2, [r3, #28]
	.loc 1 2367 21
	ldr	r3, .L211
	ldr	r3, [r3]
	.loc 1 2367 33
	movs	r2, #0
	strb	r2, [r3, #26]
.L208:
	.loc 1 2371 20
	ldr	r3, .L211
	ldr	r3, [r3]
	ldr	r3, [r3, #44]
	.loc 1 2371 7
	cmp	r3, #0
	beq	.L210
	.loc 1 2373 21
	ldr	r3, .L211
	ldr	r3, [r3]
	ldr	r3, [r3, #44]
	.loc 1 2373 43
	ldr	r2, .L211
	ldr	r2, [r2]
	.loc 1 2373 30
	adds	r2, r2, #28
	.loc 1 2373 9
	mov	r0, r2
	blx	r3
.LVL4:
.L210:
	.loc 1 2375 1
	nop
	add	sp, sp, #16
.LCFI161:
	@ sp needed
	pop	{r4, pc}
.L212:
	.align	2
.L211:
	.word	pdw1000local
.LFE64:
	.size	dwt_lowpowerlistenisr, .-dwt_lowpowerlistenisr
	.section	.text.dwt_setleds,"ax",%progbits
	.align	1
	.global	dwt_setleds
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	dwt_setleds, %function
dwt_setleds:
.LFB65:
	.loc 1 2395 1
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
.LCFI162:
	sub	sp, sp, #20
.LCFI163:
	mov	r3, r0
	strb	r3, [sp, #7]
	.loc 1 2398 14
	ldrb	r3, [sp, #7]	@ zero_extendqisi2
	and	r3, r3, #1
	.loc 1 2398 8
	cmp	r3, #0
	beq	.L214
	.loc 1 2401 15
	movs	r1, #0
	movs	r0, #38
	bl	dwt_read32bitoffsetreg
	str	r0, [sp, #12]
	.loc 1 2402 13
	ldr	r3, [sp, #12]
	bic	r3, r3, #15360
	str	r3, [sp, #12]
	.loc 1 2403 13
	ldr	r3, [sp, #12]
	orr	r3, r3, #5120
	str	r3, [sp, #12]
	.loc 1 2404 9
	ldr	r2, [sp, #12]
	movs	r1, #0
	movs	r0, #38
	bl	dwt_write32bitoffsetreg
	.loc 1 2407 15
	movs	r1, #0
	movs	r0, #54
	bl	dwt_read32bitoffsetreg
	str	r0, [sp, #12]
	.loc 1 2408 13
	ldr	r3, [sp, #12]
	orr	r3, r3, #8650752
	str	r3, [sp, #12]
	.loc 1 2409 9
	ldr	r2, [sp, #12]
	movs	r1, #0
	movs	r0, #54
	bl	dwt_write32bitoffsetreg
	.loc 1 2412 13
	mov	r3, #272
	str	r3, [sp, #12]
	.loc 1 2414 18
	ldrb	r3, [sp, #7]	@ zero_extendqisi2
	and	r3, r3, #2
	.loc 1 2414 12
	cmp	r3, #0
	beq	.L215
	.loc 1 2416 17
	ldr	r3, [sp, #12]
	orr	r3, r3, #983040
	str	r3, [sp, #12]
.L215:
	.loc 1 2418 9
	ldr	r2, [sp, #12]
	movs	r1, #40
	movs	r0, #54
	bl	dwt_write32bitoffsetreg
	.loc 1 2420 17
	ldrb	r3, [sp, #7]	@ zero_extendqisi2
	and	r3, r3, #2
	.loc 1 2420 11
	cmp	r3, #0
	beq	.L218
	.loc 1 2422 17
	ldr	r3, [sp, #12]
	bic	r3, r3, #983040
	str	r3, [sp, #12]
	.loc 1 2423 13
	ldr	r2, [sp, #12]
	movs	r1, #40
	movs	r0, #54
	bl	dwt_write32bitoffsetreg
	.loc 1 2433 1
	b	.L218
.L214:
	.loc 1 2429 15
	movs	r1, #0
	movs	r0, #38
	bl	dwt_read32bitoffsetreg
	str	r0, [sp, #12]
	.loc 1 2430 13
	ldr	r3, [sp, #12]
	bic	r3, r3, #15360
	str	r3, [sp, #12]
	.loc 1 2431 9
	ldr	r2, [sp, #12]
	movs	r1, #0
	movs	r0, #38
	bl	dwt_write32bitoffsetreg
.L218:
	.loc 1 2433 1
	nop
	add	sp, sp, #20
.LCFI164:
	@ sp needed
	ldr	pc, [sp], #4
.LFE65:
	.size	dwt_setleds, .-dwt_setleds
	.section	.text._dwt_enableclocks,"ax",%progbits
	.align	1
	.global	_dwt_enableclocks
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	_dwt_enableclocks, %function
_dwt_enableclocks:
.LFB66:
	.loc 1 2448 1
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
.LCFI165:
	sub	sp, sp, #20
.LCFI166:
	str	r0, [sp, #4]
	.loc 1 2451 5
	add	r3, sp, #12
	movs	r2, #2
	movs	r1, #0
	movs	r0, #54
	bl	dwt_readfromdevice
	.loc 1 2452 5
	ldr	r3, [sp, #4]
	cmp	r3, #14
	bhi	.L232
	adr	r2, .L222
	ldr	pc, [r2, r3, lsl #2]
	.p2align 2
.L222:
	.word	.L230+1
	.word	.L229+1
	.word	.L228+1
	.word	.L232+1
	.word	.L232+1
	.word	.L232+1
	.word	.L232+1
	.word	.L227+1
	.word	.L226+1
	.word	.L232+1
	.word	.L232+1
	.word	.L225+1
	.word	.L224+1
	.word	.L223+1
	.word	.L221+1
	.p2align 1
.L229:
	.loc 1 2456 20
	movs	r3, #0
	strb	r3, [sp, #12]
	.loc 1 2457 25
	ldrb	r3, [sp, #13]	@ zero_extendqisi2
	.loc 1 2457 29
	bic	r3, r3, #1
	uxtb	r3, r3
	.loc 1 2457 20
	strb	r3, [sp, #13]
	.loc 1 2459 9
	b	.L231
.L230:
	.loc 1 2463 33
	ldrb	r3, [sp, #12]	@ zero_extendqisi2
	sxtb	r3, r3
	.loc 1 2463 37
	bic	r3, r3, #3
	sxtb	r3, r3
	.loc 1 2463 27
	orr	r3, r3, #1
	sxtb	r3, r3
	uxtb	r3, r3
	.loc 1 2463 20
	strb	r3, [sp, #12]
	.loc 1 2465 9
	b	.L231
.L228:
	.loc 1 2469 33
	ldrb	r3, [sp, #12]	@ zero_extendqisi2
	sxtb	r3, r3
	.loc 1 2469 37
	bic	r3, r3, #3
	sxtb	r3, r3
	.loc 1 2469 27
	orr	r3, r3, #2
	sxtb	r3, r3
	uxtb	r3, r3
	.loc 1 2469 20
	strb	r3, [sp, #12]
	.loc 1 2471 9
	b	.L231
.L227:
	.loc 1 2474 33
	ldrb	r3, [sp, #12]	@ zero_extendqisi2
	sxtb	r3, r3
	.loc 1 2474 37
	bic	r3, r3, #76
	sxtb	r3, r3
	.loc 1 2474 27
	orr	r3, r3, #72
	sxtb	r3, r3
	uxtb	r3, r3
	.loc 1 2474 20
	strb	r3, [sp, #12]
	.loc 1 2475 32
	ldrb	r3, [sp, #13]	@ zero_extendqisi2
	.loc 1 2475 20
	orn	r3, r3, #127
	uxtb	r3, r3
	strb	r3, [sp, #13]
	.loc 1 2477 9
	b	.L231
.L226:
	.loc 1 2480 25
	ldrb	r3, [sp, #12]	@ zero_extendqisi2
	.loc 1 2480 29
	bic	r3, r3, #76
	uxtb	r3, r3
	.loc 1 2480 20
	strb	r3, [sp, #12]
	.loc 1 2481 32
	ldrb	r3, [sp, #13]	@ zero_extendqisi2
	.loc 1 2481 27
	and	r3, r3, #127
	uxtb	r3, r3
	.loc 1 2481 20
	strb	r3, [sp, #13]
	.loc 1 2483 9
	b	.L231
.L225:
	.loc 1 2486 32
	ldrb	r3, [sp, #13]	@ zero_extendqisi2
	.loc 1 2486 20
	orr	r3, r3, #2
	uxtb	r3, r3
	strb	r3, [sp, #13]
	.loc 1 2488 9
	b	.L231
.L224:
	.loc 1 2491 25
	ldrb	r3, [sp, #13]	@ zero_extendqisi2
	.loc 1 2491 29
	bic	r3, r3, #2
	uxtb	r3, r3
	.loc 1 2491 20
	strb	r3, [sp, #13]
	.loc 1 2493 9
	b	.L231
.L223:
	.loc 1 2496 33
	ldrb	r3, [sp, #12]	@ zero_extendqisi2
	sxtb	r3, r3
	.loc 1 2496 37
	bic	r3, r3, #48
	sxtb	r3, r3
	.loc 1 2496 27
	orr	r3, r3, #32
	sxtb	r3, r3
	uxtb	r3, r3
	.loc 1 2496 20
	strb	r3, [sp, #12]
	.loc 1 2498 9
	b	.L231
.L221:
	.loc 1 2501 20
	movs	r3, #1
	strb	r3, [sp, #12]
	.loc 1 2502 20
	movs	r3, #3
	strb	r3, [sp, #13]
	.loc 1 2504 9
	b	.L231
.L232:
	.loc 1 2506 9
	nop
.L231:
	.loc 1 2511 5
	add	r3, sp, #12
	movs	r2, #1
	movs	r1, #0
	movs	r0, #54
	bl	dwt_writetodevice
	.loc 1 2512 5
	add	r3, sp, #12
	adds	r3, r3, #1
	movs	r2, #1
	movs	r1, #1
	movs	r0, #54
	bl	dwt_writetodevice
	.loc 1 2514 1
	nop
	add	sp, sp, #20
.LCFI167:
	@ sp needed
	ldr	pc, [sp], #4
.LFE66:
	.size	_dwt_enableclocks, .-_dwt_enableclocks
	.section	.text._dwt_disablesequencing,"ax",%progbits
	.align	1
	.global	_dwt_disablesequencing
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	_dwt_disablesequencing, %function
_dwt_disablesequencing:
.LFB67:
	.loc 1 2528 1
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, lr}
.LCFI168:
	.loc 1 2529 5
	movs	r0, #0
	bl	_dwt_enableclocks
	.loc 1 2531 5
	movs	r2, #0
	movs	r1, #4
	movs	r0, #54
	bl	dwt_write16bitoffsetreg
	.loc 1 2532 1
	nop
	pop	{r3, pc}
.LFE67:
	.size	_dwt_disablesequencing, .-_dwt_disablesequencing
	.section	.text.dwt_setdelayedtrxtime,"ax",%progbits
	.align	1
	.global	dwt_setdelayedtrxtime
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	dwt_setdelayedtrxtime, %function
dwt_setdelayedtrxtime:
.LFB68:
	.loc 1 2548 1
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
.LCFI169:
	sub	sp, sp, #12
.LCFI170:
	str	r0, [sp, #4]
	.loc 1 2549 5
	ldr	r2, [sp, #4]
	movs	r1, #1
	movs	r0, #10
	bl	dwt_write32bitoffsetreg
	.loc 1 2551 1
	nop
	add	sp, sp, #12
.LCFI171:
	@ sp needed
	ldr	pc, [sp], #4
.LFE68:
	.size	dwt_setdelayedtrxtime, .-dwt_setdelayedtrxtime
	.section	.text.dwt_starttx,"ax",%progbits
	.align	1
	.global	dwt_starttx
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	dwt_starttx, %function
dwt_starttx:
.LFB69:
	.loc 1 2569 1
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
.LCFI172:
	sub	sp, sp, #20
.LCFI173:
	mov	r3, r0
	strb	r3, [sp, #7]
	.loc 1 2570 9
	movs	r3, #0
	str	r3, [sp, #12]
	.loc 1 2571 11
	movs	r3, #0
	strb	r3, [sp, #11]
	.loc 1 2572 12
	movs	r3, #0
	strh	r3, [sp, #8]	@ movhi
	.loc 1 2574 13
	ldrb	r3, [sp, #7]	@ zero_extendqisi2
	and	r3, r3, #2
	.loc 1 2574 7
	cmp	r3, #0
	beq	.L236
	.loc 1 2576 14
	movs	r3, #128
	strb	r3, [sp, #11]
	.loc 1 2577 9
	ldrb	r3, [sp, #11]	@ zero_extendqisi2
	mov	r2, r3
	movs	r1, #0
	movs	r0, #13
	bl	dwt_write8bitoffsetreg
	.loc 1 2578 21
	ldr	r3, .L242
	ldr	r3, [r3]
	.loc 1 2578 33
	movs	r2, #1
	strb	r2, [r3, #26]
.L236:
	.loc 1 2581 14
	ldrb	r3, [sp, #7]	@ zero_extendqisi2
	and	r3, r3, #1
	.loc 1 2581 8
	cmp	r3, #0
	beq	.L237
	.loc 1 2584 14
	ldrb	r3, [sp, #11]
	orr	r3, r3, #6
	strb	r3, [sp, #11]
	.loc 1 2585 9
	ldrb	r3, [sp, #11]	@ zero_extendqisi2
	mov	r2, r3
	movs	r1, #0
	movs	r0, #13
	bl	dwt_write8bitoffsetreg
	.loc 1 2586 21
	movs	r1, #3
	movs	r0, #15
	bl	dwt_read16bitoffsetreg
	mov	r3, r0
	strh	r3, [sp, #8]	@ movhi
	.loc 1 2587 24
	ldrh	r3, [sp, #8]
	and	r3, r3, #1032
	.loc 1 2587 12
	cmp	r3, #0
	bne	.L238
	.loc 1 2589 20
	movs	r3, #0
	str	r3, [sp, #12]
	b	.L240
.L238:
	.loc 1 2595 18
	movs	r3, #64
	strb	r3, [sp, #11]
	.loc 1 2596 13
	ldrb	r3, [sp, #11]	@ zero_extendqisi2
	mov	r2, r3
	movs	r1, #0
	movs	r0, #13
	bl	dwt_write8bitoffsetreg
	.loc 1 2600 25
	ldr	r3, .L242
	ldr	r3, [r3]
	.loc 1 2600 37
	movs	r2, #0
	strb	r2, [r3, #26]
	.loc 1 2601 20
	mov	r3, #-1
	str	r3, [sp, #12]
	b	.L240
.L237:
	.loc 1 2606 14
	ldrb	r3, [sp, #11]
	orr	r3, r3, #2
	strb	r3, [sp, #11]
	.loc 1 2607 9
	ldrb	r3, [sp, #11]	@ zero_extendqisi2
	mov	r2, r3
	movs	r1, #0
	movs	r0, #13
	bl	dwt_write8bitoffsetreg
.L240:
	.loc 1 2610 12
	ldr	r3, [sp, #12]
	.loc 1 2612 1
	mov	r0, r3
	add	sp, sp, #20
.LCFI174:
	@ sp needed
	ldr	pc, [sp], #4
.L243:
	.align	2
.L242:
	.word	pdw1000local
.LFE69:
	.size	dwt_starttx, .-dwt_starttx
	.section	.text.dwt_forcetrxoff,"ax",%progbits
	.align	1
	.global	dwt_forcetrxoff
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	dwt_forcetrxoff, %function
dwt_forcetrxoff:
.LFB70:
	.loc 1 2626 1
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
.LCFI175:
	sub	sp, sp, #12
.LCFI176:
	.loc 1 2630 12
	movs	r1, #0
	movs	r0, #14
	bl	dwt_read32bitoffsetreg
	str	r0, [sp, #4]
	.loc 1 2636 12
	bl	decamutexon
	str	r0, [sp]
	.loc 1 2638 5
	movs	r2, #0
	movs	r1, #0
	movs	r0, #14
	bl	dwt_write32bitoffsetreg
	.loc 1 2640 5
	movs	r2, #64
	movs	r1, #0
	movs	r0, #13
	bl	dwt_write8bitoffsetreg
	.loc 1 2643 5
	ldr	r2, .L245
	movs	r1, #0
	movs	r0, #15
	bl	dwt_write32bitoffsetreg
	.loc 1 2645 5
	bl	dwt_syncrxbufptrs
	.loc 1 2647 5
	ldr	r2, [sp, #4]
	movs	r1, #0
	movs	r0, #14
	bl	dwt_write32bitoffsetreg
	.loc 1 2650 5
	ldr	r0, [sp]
	bl	decamutexoff
	.loc 1 2651 17
	ldr	r3, .L245+4
	ldr	r3, [r3]
	.loc 1 2651 29
	movs	r2, #0
	strb	r2, [r3, #26]
	.loc 1 2653 1
	nop
	add	sp, sp, #12
.LCFI177:
	@ sp needed
	ldr	pc, [sp], #4
.L246:
	.align	2
.L245:
	.word	606601208
	.word	pdw1000local
.LFE70:
	.size	dwt_forcetrxoff, .-dwt_forcetrxoff
	.section	.text.dwt_syncrxbufptrs,"ax",%progbits
	.align	1
	.global	dwt_syncrxbufptrs
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	dwt_syncrxbufptrs, %function
dwt_syncrxbufptrs:
.LFB71:
	.loc 1 2668 1
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
.LCFI178:
	sub	sp, sp, #12
.LCFI179:
	.loc 1 2671 12
	movs	r1, #3
	movs	r0, #15
	bl	dwt_read8bitoffsetreg
	mov	r3, r0
	strb	r3, [sp, #7]
	.loc 1 2673 42
	ldrb	r2, [sp, #7]	@ zero_extendqisi2
	.loc 1 2674 41
	ldrb	r3, [sp, #7]	@ zero_extendqisi2
	lsls	r3, r3, #1
	.loc 1 2673 42
	eors	r3, r3, r2
	and	r3, r3, #128
	.loc 1 2673 7
	cmp	r3, #0
	beq	.L249
	.loc 1 2676 9
	movs	r2, #1
	movs	r1, #3
	movs	r0, #13
	bl	dwt_write8bitoffsetreg
.L249:
	.loc 1 2678 1
	nop
	add	sp, sp, #12
.LCFI180:
	@ sp needed
	ldr	pc, [sp], #4
.LFE71:
	.size	dwt_syncrxbufptrs, .-dwt_syncrxbufptrs
	.section	.text.dwt_setsniffmode,"ax",%progbits
	.align	1
	.global	dwt_setsniffmode
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	dwt_setsniffmode, %function
dwt_setsniffmode:
.LFB72:
	.loc 1 2700 1
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
.LCFI181:
	sub	sp, sp, #20
.LCFI182:
	str	r0, [sp, #4]
	mov	r3, r1
	strb	r3, [sp, #3]
	mov	r3, r2
	strb	r3, [sp, #2]
	.loc 1 2702 8
	ldr	r3, [sp, #4]
	cmp	r3, #0
	beq	.L251
.LBB4:
	.loc 1 2705 38
	ldrb	r3, [sp, #2]	@ zero_extendqisi2
	lsls	r3, r3, #8
	.loc 1 2705 44
	sxth	r2, r3
	ldrb	r3, [sp, #3]	@ zero_extendqisi2
	sxth	r3, r3
	orrs	r3, r3, r2
	sxth	r3, r3
	uxth	r3, r3
	.loc 1 2705 16
	bic	r3, r3, #240
	strh	r3, [sp, #14]	@ movhi
	.loc 1 2706 9
	ldrh	r3, [sp, #14]
	mov	r2, r3
	movs	r1, #0
	movs	r0, #29
	bl	dwt_write16bitoffsetreg
	.loc 1 2707 20
	movs	r1, #0
	movs	r0, #54
	bl	dwt_read32bitoffsetreg
	str	r0, [sp, #8]
	.loc 1 2708 18
	ldr	r3, [sp, #8]
	orr	r3, r3, #16777216
	str	r3, [sp, #8]
	.loc 1 2709 9
	ldr	r2, [sp, #8]
	movs	r1, #0
	movs	r0, #54
	bl	dwt_write32bitoffsetreg
.LBE4:
	.loc 1 2719 1
	b	.L253
.L251:
	.loc 1 2714 9
	movs	r2, #0
	movs	r1, #0
	movs	r0, #29
	bl	dwt_write16bitoffsetreg
	.loc 1 2715 20
	movs	r1, #0
	movs	r0, #54
	bl	dwt_read32bitoffsetreg
	str	r0, [sp, #8]
	.loc 1 2716 18
	ldr	r3, [sp, #8]
	bic	r3, r3, #16777216
	str	r3, [sp, #8]
	.loc 1 2717 9
	ldr	r2, [sp, #8]
	movs	r1, #0
	movs	r0, #54
	bl	dwt_write32bitoffsetreg
.L253:
	.loc 1 2719 1
	nop
	add	sp, sp, #20
.LCFI183:
	@ sp needed
	ldr	pc, [sp], #4
.LFE72:
	.size	dwt_setsniffmode, .-dwt_setsniffmode
	.section	.text.dwt_setlowpowerlistening,"ax",%progbits
	.align	1
	.global	dwt_setlowpowerlistening
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	dwt_setlowpowerlistening, %function
dwt_setlowpowerlistening:
.LFB73:
	.loc 1 2752 1
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
.LCFI184:
	sub	sp, sp, #20
.LCFI185:
	str	r0, [sp, #4]
	.loc 1 2753 23
	movs	r1, #4
	movs	r0, #54
	bl	dwt_read32bitoffsetreg
	str	r0, [sp, #12]
	.loc 1 2754 8
	ldr	r3, [sp, #4]
	cmp	r3, #0
	beq	.L255
	.loc 1 2757 18
	ldr	r3, [sp, #12]
	orr	r3, r3, #12288
	str	r3, [sp, #12]
	b	.L256
.L255:
	.loc 1 2762 18
	ldr	r3, [sp, #12]
	bic	r3, r3, #12288
	str	r3, [sp, #12]
.L256:
	.loc 1 2764 5
	ldr	r2, [sp, #12]
	movs	r1, #4
	movs	r0, #54
	bl	dwt_write32bitoffsetreg
	.loc 1 2765 1
	nop
	add	sp, sp, #20
.LCFI186:
	@ sp needed
	ldr	pc, [sp], #4
.LFE73:
	.size	dwt_setlowpowerlistening, .-dwt_setlowpowerlistening
	.section	.text.dwt_setsnoozetime,"ax",%progbits
	.align	1
	.global	dwt_setsnoozetime
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	dwt_setsnoozetime, %function
dwt_setsnoozetime:
.LFB74:
	.loc 1 2782 1
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
.LCFI187:
	sub	sp, sp, #12
.LCFI188:
	mov	r3, r0
	strb	r3, [sp, #7]
	.loc 1 2783 5
	ldrb	r3, [sp, #7]	@ zero_extendqisi2
	mov	r2, r3
	movs	r1, #12
	movs	r0, #54
	bl	dwt_write8bitoffsetreg
	.loc 1 2784 1
	nop
	add	sp, sp, #12
.LCFI189:
	@ sp needed
	ldr	pc, [sp], #4
.LFE74:
	.size	dwt_setsnoozetime, .-dwt_setsnoozetime
	.section	.text.dwt_rxenable,"ax",%progbits
	.align	1
	.global	dwt_rxenable
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	dwt_rxenable, %function
dwt_rxenable:
.LFB75:
	.loc 1 2806 1
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
.LCFI190:
	sub	sp, sp, #20
.LCFI191:
	str	r0, [sp, #4]
	.loc 1 2810 15
	ldr	r3, [sp, #4]
	and	r3, r3, #4
	.loc 1 2810 8
	cmp	r3, #0
	bne	.L259
	.loc 1 2812 9
	bl	dwt_syncrxbufptrs
.L259:
	.loc 1 2815 10
	mov	r3, #256
	strh	r3, [sp, #14]	@ movhi
	.loc 1 2817 14
	ldr	r3, [sp, #4]
	and	r3, r3, #1
	.loc 1 2817 8
	cmp	r3, #0
	beq	.L260
	.loc 1 2819 14
	ldrh	r3, [sp, #14]	@ movhi
	orr	r3, r3, #512
	strh	r3, [sp, #14]	@ movhi
.L260:
	.loc 1 2822 5
	ldrh	r3, [sp, #14]
	mov	r2, r3
	movs	r1, #0
	movs	r0, #13
	bl	dwt_write16bitoffsetreg
	.loc 1 2824 14
	ldr	r3, [sp, #4]
	and	r3, r3, #1
	.loc 1 2824 8
	cmp	r3, #0
	beq	.L261
	.loc 1 2826 17
	movs	r1, #3
	movs	r0, #15
	bl	dwt_read8bitoffsetreg
	mov	r3, r0
	strb	r3, [sp, #13]
	.loc 1 2827 20
	ldrb	r3, [sp, #13]	@ zero_extendqisi2
	and	r3, r3, #8
	.loc 1 2827 12
	cmp	r3, #0
	beq	.L261
	.loc 1 2829 13
	bl	dwt_forcetrxoff
	.loc 1 2831 22
	ldr	r3, [sp, #4]
	and	r3, r3, #2
	.loc 1 2831 15
	cmp	r3, #0
	bne	.L262
	.loc 1 2833 17
	mov	r2, #256
	movs	r1, #0
	movs	r0, #13
	bl	dwt_write16bitoffsetreg
.L262:
	.loc 1 2835 20
	mov	r3, #-1
	b	.L263
.L261:
	.loc 1 2839 12
	movs	r3, #0
.L263:
	.loc 1 2840 1
	mov	r0, r3
	add	sp, sp, #20
.LCFI192:
	@ sp needed
	ldr	pc, [sp], #4
.LFE75:
	.size	dwt_rxenable, .-dwt_rxenable
	.section	.text.dwt_setrxtimeout,"ax",%progbits
	.align	1
	.global	dwt_setrxtimeout
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	dwt_setrxtimeout, %function
dwt_setrxtimeout:
.LFB76:
	.loc 1 2857 1
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
.LCFI193:
	sub	sp, sp, #20
.LCFI194:
	mov	r3, r0
	strh	r3, [sp, #6]	@ movhi
	.loc 1 2860 12
	movs	r1, #3
	movs	r0, #4
	bl	dwt_read8bitoffsetreg
	mov	r3, r0
	strb	r3, [sp, #15]
	.loc 1 2862 7
	ldrh	r3, [sp, #6]
	cmp	r3, #0
	beq	.L265
	.loc 1 2864 9
	ldrh	r3, [sp, #6]
	mov	r2, r3
	movs	r1, #0
	movs	r0, #12
	bl	dwt_write16bitoffsetreg
	.loc 1 2866 14
	ldrb	r3, [sp, #15]
	orr	r3, r3, #16
	strb	r3, [sp, #15]
	.loc 1 2868 33
	ldr	r3, .L268
	ldr	r3, [r3]
	ldr	r2, [r3, #20]
	ldr	r3, .L268
	ldr	r3, [r3]
	orr	r2, r2, #268435456
	str	r2, [r3, #20]
	.loc 1 2870 9
	ldrb	r3, [sp, #15]	@ zero_extendqisi2
	mov	r2, r3
	movs	r1, #3
	movs	r0, #4
	bl	dwt_write8bitoffsetreg
	.loc 1 2881 1
	b	.L267
.L265:
	.loc 1 2874 14
	ldrb	r3, [sp, #15]
	bic	r3, r3, #16
	strb	r3, [sp, #15]
	.loc 1 2876 33
	ldr	r3, .L268
	ldr	r3, [r3]
	ldr	r2, [r3, #20]
	ldr	r3, .L268
	ldr	r3, [r3]
	bic	r2, r2, #268435456
	str	r2, [r3, #20]
	.loc 1 2878 9
	ldrb	r3, [sp, #15]	@ zero_extendqisi2
	mov	r2, r3
	movs	r1, #3
	movs	r0, #4
	bl	dwt_write8bitoffsetreg
.L267:
	.loc 1 2881 1
	nop
	add	sp, sp, #20
.LCFI195:
	@ sp needed
	ldr	pc, [sp], #4
.L269:
	.align	2
.L268:
	.word	pdw1000local
.LFE76:
	.size	dwt_setrxtimeout, .-dwt_setrxtimeout
	.section	.text.dwt_setpreambledetecttimeout,"ax",%progbits
	.align	1
	.global	dwt_setpreambledetecttimeout
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	dwt_setpreambledetecttimeout, %function
dwt_setpreambledetecttimeout:
.LFB77:
	.loc 1 2898 1
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
.LCFI196:
	sub	sp, sp, #12
.LCFI197:
	mov	r3, r0
	strh	r3, [sp, #6]	@ movhi
	.loc 1 2899 5
	ldrh	r3, [sp, #6]
	mov	r2, r3
	movs	r1, #36
	movs	r0, #39
	bl	dwt_write16bitoffsetreg
	.loc 1 2900 1
	nop
	add	sp, sp, #12
.LCFI198:
	@ sp needed
	ldr	pc, [sp], #4
.LFE77:
	.size	dwt_setpreambledetecttimeout, .-dwt_setpreambledetecttimeout
	.section	.text.dwt_setinterrupt,"ax",%progbits
	.align	1
	.global	dwt_setinterrupt
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	dwt_setinterrupt, %function
dwt_setinterrupt:
.LFB78:
	.loc 1 2927 1
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
.LCFI199:
	sub	sp, sp, #20
.LCFI200:
	str	r0, [sp, #4]
	mov	r3, r1
	strb	r3, [sp, #3]
	.loc 1 2932 12
	bl	decamutexon
	str	r0, [sp, #8]
	.loc 1 2934 12
	movs	r1, #0
	movs	r0, #14
	bl	dwt_read32bitoffsetreg
	str	r0, [sp, #12]
	.loc 1 2936 7
	ldrb	r3, [sp, #3]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L272
	.loc 1 2938 14
	ldr	r2, [sp, #12]
	ldr	r3, [sp, #4]
	orrs	r3, r3, r2
	str	r3, [sp, #12]
	b	.L273
.L272:
	.loc 1 2942 17
	ldr	r3, [sp, #4]
	mvns	r3, r3
	.loc 1 2942 14
	ldr	r2, [sp, #12]
	ands	r3, r3, r2
	str	r3, [sp, #12]
.L273:
	.loc 1 2944 5
	ldr	r2, [sp, #12]
	movs	r1, #0
	movs	r0, #14
	bl	dwt_write32bitoffsetreg
	.loc 1 2946 5
	ldr	r0, [sp, #8]
	bl	decamutexoff
	.loc 1 2947 1
	nop
	add	sp, sp, #20
.LCFI201:
	@ sp needed
	ldr	pc, [sp], #4
.LFE78:
	.size	dwt_setinterrupt, .-dwt_setinterrupt
	.section	.text.dwt_configeventcounters,"ax",%progbits
	.align	1
	.global	dwt_configeventcounters
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	dwt_configeventcounters, %function
dwt_configeventcounters:
.LFB79:
	.loc 1 2961 1
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
.LCFI202:
	sub	sp, sp, #12
.LCFI203:
	str	r0, [sp, #4]
	.loc 1 2963 5
	movs	r2, #2
	movs	r1, #0
	movs	r0, #47
	bl	dwt_write8bitoffsetreg
	.loc 1 2965 7
	ldr	r3, [sp, #4]
	cmp	r3, #0
	beq	.L276
	.loc 1 2967 9
	movs	r2, #1
	movs	r1, #0
	movs	r0, #47
	bl	dwt_write8bitoffsetreg
.L276:
	.loc 1 2969 1
	nop
	add	sp, sp, #12
.LCFI204:
	@ sp needed
	ldr	pc, [sp], #4
.LFE79:
	.size	dwt_configeventcounters, .-dwt_configeventcounters
	.section	.text.dwt_readeventcounters,"ax",%progbits
	.align	1
	.global	dwt_readeventcounters
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	dwt_readeventcounters, %function
dwt_readeventcounters:
.LFB80:
	.loc 1 2984 1
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
.LCFI205:
	sub	sp, sp, #20
.LCFI206:
	str	r0, [sp, #4]
	.loc 1 2987 11
	movs	r1, #4
	movs	r0, #47
	bl	dwt_read32bitoffsetreg
	str	r0, [sp, #12]
	.loc 1 2988 26
	ldr	r3, [sp, #12]
	uxth	r3, r3
	ubfx	r3, r3, #0, #12
	uxth	r2, r3
	.loc 1 2988 19
	ldr	r3, [sp, #4]
	strh	r2, [r3]	@ movhi
	.loc 1 2989 27
	ldr	r3, [sp, #12]
	lsrs	r3, r3, #16
	.loc 1 2989 34
	uxth	r3, r3
	ubfx	r3, r3, #0, #12
	uxth	r2, r3
	.loc 1 2989 19
	ldr	r3, [sp, #4]
	strh	r2, [r3, #2]	@ movhi
	.loc 1 2991 12
	movs	r1, #8
	movs	r0, #47
	bl	dwt_read32bitoffsetreg
	str	r0, [sp, #12]
	.loc 1 2992 27
	ldr	r3, [sp, #12]
	uxth	r3, r3
	ubfx	r3, r3, #0, #12
	uxth	r2, r3
	.loc 1 2992 20
	ldr	r3, [sp, #4]
	strh	r2, [r3, #4]	@ movhi
	.loc 1 2993 28
	ldr	r3, [sp, #12]
	lsrs	r3, r3, #16
	.loc 1 2993 35
	uxth	r3, r3
	ubfx	r3, r3, #0, #12
	uxth	r2, r3
	.loc 1 2993 20
	ldr	r3, [sp, #4]
	strh	r2, [r3, #6]	@ movhi
	.loc 1 2995 12
	movs	r1, #12
	movs	r0, #47
	bl	dwt_read32bitoffsetreg
	str	r0, [sp, #12]
	.loc 1 2996 27
	ldr	r3, [sp, #12]
	uxth	r3, r3
	ubfx	r3, r3, #0, #12
	uxth	r2, r3
	.loc 1 2996 20
	ldr	r3, [sp, #4]
	strh	r2, [r3, #8]	@ movhi
	.loc 1 2997 28
	ldr	r3, [sp, #12]
	lsrs	r3, r3, #16
	.loc 1 2997 35
	uxth	r3, r3
	ubfx	r3, r3, #0, #12
	uxth	r2, r3
	.loc 1 2997 20
	ldr	r3, [sp, #4]
	strh	r2, [r3, #10]	@ movhi
	.loc 1 2999 12
	movs	r1, #16
	movs	r0, #47
	bl	dwt_read32bitoffsetreg
	str	r0, [sp, #12]
	.loc 1 3000 27
	ldr	r3, [sp, #12]
	lsrs	r3, r3, #16
	.loc 1 3000 34
	uxth	r3, r3
	ubfx	r3, r3, #0, #12
	uxth	r2, r3
	.loc 1 3000 19
	ldr	r3, [sp, #4]
	strh	r2, [r3, #14]	@ movhi
	.loc 1 3001 28
	ldr	r3, [sp, #12]
	uxth	r3, r3
	ubfx	r3, r3, #0, #12
	uxth	r2, r3
	.loc 1 3001 21
	ldr	r3, [sp, #4]
	strh	r2, [r3, #12]	@ movhi
	.loc 1 3003 12
	movs	r1, #20
	movs	r0, #47
	bl	dwt_read32bitoffsetreg
	str	r0, [sp, #12]
	.loc 1 3004 27
	ldr	r3, [sp, #12]
	lsrs	r3, r3, #16
	.loc 1 3004 34
	uxth	r3, r3
	ubfx	r3, r3, #0, #12
	uxth	r2, r3
	.loc 1 3004 19
	ldr	r3, [sp, #4]
	strh	r2, [r3, #18]	@ movhi
	.loc 1 3005 26
	ldr	r3, [sp, #12]
	uxth	r3, r3
	ubfx	r3, r3, #0, #12
	uxth	r2, r3
	.loc 1 3005 19
	ldr	r3, [sp, #4]
	strh	r2, [r3, #16]	@ movhi
	.loc 1 3007 12
	movs	r1, #24
	movs	r0, #47
	bl	dwt_read32bitoffsetreg
	str	r0, [sp, #12]
	.loc 1 3008 26
	ldr	r3, [sp, #12]
	uxth	r3, r3
	ubfx	r3, r3, #0, #12
	uxth	r2, r3
	.loc 1 3008 19
	ldr	r3, [sp, #4]
	strh	r2, [r3, #20]	@ movhi
	.loc 1 3009 27
	ldr	r3, [sp, #12]
	lsrs	r3, r3, #16
	.loc 1 3009 34
	uxth	r3, r3
	ubfx	r3, r3, #0, #12
	uxth	r2, r3
	.loc 1 3009 19
	ldr	r3, [sp, #4]
	strh	r2, [r3, #22]	@ movhi
	.loc 1 3011 1
	nop
	add	sp, sp, #20
.LCFI207:
	@ sp needed
	ldr	pc, [sp], #4
.LFE80:
	.size	dwt_readeventcounters, .-dwt_readeventcounters
	.section	.text.dwt_rxreset,"ax",%progbits
	.align	1
	.global	dwt_rxreset
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	dwt_rxreset, %function
dwt_rxreset:
.LFB81:
	.loc 1 3025 1
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, lr}
.LCFI208:
	.loc 1 3027 5
	movs	r2, #224
	movs	r1, #3
	movs	r0, #54
	bl	dwt_write8bitoffsetreg
	.loc 1 3030 5
	movs	r2, #240
	movs	r1, #3
	movs	r0, #54
	bl	dwt_write8bitoffsetreg
	.loc 1 3031 1
	nop
	pop	{r3, pc}
.LFE81:
	.size	dwt_rxreset, .-dwt_rxreset
	.section	.text.dwt_softreset,"ax",%progbits
	.align	1
	.global	dwt_softreset
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	dwt_softreset, %function
dwt_softreset:
.LFB82:
	.loc 1 3045 1
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, lr}
.LCFI209:
	.loc 1 3046 5
	bl	_dwt_disablesequencing
	.loc 1 3049 5
	movs	r2, #0
	movs	r1, #0
	movs	r0, #44
	bl	dwt_write16bitoffsetreg
	.loc 1 3051 5
	movs	r2, #0
	movs	r1, #6
	movs	r0, #44
	bl	dwt_write8bitoffsetreg
	.loc 1 3053 5
	bl	_dwt_aonarrayupload
	.loc 1 3056 5
	movs	r2, #0
	movs	r1, #3
	movs	r0, #54
	bl	dwt_write8bitoffsetreg
	.loc 1 3060 5
	movs	r0, #1
	bl	deca_sleep
	.loc 1 3063 5
	movs	r2, #240
	movs	r1, #3
	movs	r0, #54
	bl	dwt_write8bitoffsetreg
	.loc 1 3065 17
	ldr	r3, .L280
	ldr	r3, [r3]
	.loc 1 3065 29
	movs	r2, #0
	strb	r2, [r3, #26]
	.loc 1 3066 1
	nop
	pop	{r3, pc}
.L281:
	.align	2
.L280:
	.word	pdw1000local
.LFE82:
	.size	dwt_softreset, .-dwt_softreset
	.section	.text.dwt_setxtaltrim,"ax",%progbits
	.align	1
	.global	dwt_setxtaltrim
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	dwt_setxtaltrim, %function
dwt_setxtaltrim:
.LFB83:
	.loc 1 3081 1
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
.LCFI210:
	sub	sp, sp, #20
.LCFI211:
	mov	r3, r0
	strb	r3, [sp, #7]
	.loc 1 3083 39
	ldrsb	r3, [sp, #7]
	and	r3, r3, #31
	sxtb	r3, r3
	.loc 1 3083 30
	orr	r3, r3, #96
	sxtb	r3, r3
	.loc 1 3083 11
	strb	r3, [sp, #15]
	.loc 1 3084 5
	ldrb	r3, [sp, #15]	@ zero_extendqisi2
	mov	r2, r3
	movs	r1, #14
	movs	r0, #43
	bl	dwt_write8bitoffsetreg
	.loc 1 3085 1
	nop
	add	sp, sp, #20
.LCFI212:
	@ sp needed
	ldr	pc, [sp], #4
.LFE83:
	.size	dwt_setxtaltrim, .-dwt_setxtaltrim
	.section	.text.dwt_getinitxtaltrim,"ax",%progbits
	.align	1
	.global	dwt_getinitxtaltrim
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	dwt_getinitxtaltrim, %function
dwt_getinitxtaltrim:
.LFB84:
	.loc 1 3102 1
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	.loc 1 3103 24
	ldr	r3, .L285
	ldr	r3, [r3]
	ldrb	r3, [r3, #16]	@ zero_extendqisi2
	.loc 1 3104 1
	mov	r0, r3
	bx	lr
.L286:
	.align	2
.L285:
	.word	pdw1000local
.LFE84:
	.size	dwt_getinitxtaltrim, .-dwt_getinitxtaltrim
	.section	.text.dwt_configcwmode,"ax",%progbits
	.align	1
	.global	dwt_configcwmode
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	dwt_configcwmode, %function
dwt_configcwmode:
.LFB85:
	.loc 1 3119 1
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
.LCFI213:
	sub	sp, sp, #12
.LCFI214:
	mov	r3, r0
	strb	r3, [sp, #7]
	.loc 1 3127 5
	bl	_dwt_disablesequencing
	.loc 1 3131 78
	ldrb	r3, [sp, #7]	@ zero_extendqisi2
	ldr	r2, .L288
	ldrb	r3, [r2, r3]	@ zero_extendqisi2
	mov	r2, r3
	.loc 1 3131 5
	ldr	r3, .L288+4
	ldr	r3, [r3, r2, lsl #2]
	mov	r2, r3
	movs	r1, #7
	movs	r0, #43
	bl	dwt_write32bitoffsetreg
	.loc 1 3132 79
	ldrb	r3, [sp, #7]	@ zero_extendqisi2
	ldr	r2, .L288
	ldrb	r3, [r2, r3]	@ zero_extendqisi2
	mov	r2, r3
	.loc 1 3132 5
	ldr	r3, .L288+8
	ldrb	r3, [r3, r2]	@ zero_extendqisi2
	mov	r2, r3
	movs	r1, #11
	movs	r0, #43
	bl	dwt_write8bitoffsetreg
	.loc 1 3136 77
	ldrb	r3, [sp, #7]	@ zero_extendqisi2
	ldr	r2, .L288
	ldrb	r3, [r2, r3]	@ zero_extendqisi2
	mov	r2, r3
	.loc 1 3136 5
	ldr	r3, .L288+12
	ldr	r3, [r3, r2, lsl #2]
	mov	r2, r3
	movs	r1, #12
	movs	r0, #40
	bl	dwt_write32bitoffsetreg
	.loc 1 3141 5
	mov	r2, #2088960
	movs	r1, #0
	movs	r0, #40
	bl	dwt_write32bitoffsetreg
	.loc 1 3142 5
	ldr	r2, .L288+16
	movs	r1, #0
	movs	r0, #40
	bl	dwt_write32bitoffsetreg
	.loc 1 3147 5
	movs	r2, #34
	movs	r1, #0
	movs	r0, #54
	bl	dwt_write8bitoffsetreg
	.loc 1 3148 5
	movs	r2, #7
	movs	r1, #1
	movs	r0, #54
	bl	dwt_write8bitoffsetreg
	.loc 1 3151 5
	movs	r0, #0
	bl	dwt_setfinegraintxseq
	.loc 1 3154 5
	movs	r2, #19
	movs	r1, #12
	movs	r0, #42
	bl	dwt_write8bitoffsetreg
	.loc 1 3155 1
	nop
	add	sp, sp, #12
.LCFI215:
	@ sp needed
	ldr	pc, [sp], #4
.L289:
	.align	2
.L288:
	.word	chan_idx
	.word	fs_pll_cfg
	.word	fs_pll_tune
	.word	tx_config
	.word	6291200
.LFE85:
	.size	dwt_configcwmode, .-dwt_configcwmode
	.section	.text.dwt_configcontinuousframemode,"ax",%progbits
	.align	1
	.global	dwt_configcontinuousframemode
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	dwt_configcontinuousframemode, %function
dwt_configcontinuousframemode:
.LFB86:
	.loc 1 3171 1
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
.LCFI216:
	sub	sp, sp, #12
.LCFI217:
	str	r0, [sp, #4]
	.loc 1 3175 5
	bl	_dwt_disablesequencing
	.loc 1 3180 5
	mov	r2, #2088960
	movs	r1, #0
	movs	r0, #40
	bl	dwt_write32bitoffsetreg
	.loc 1 3181 5
	ldr	r2, .L292
	movs	r1, #0
	movs	r0, #40
	bl	dwt_write32bitoffsetreg
	.loc 1 3186 5
	movs	r0, #2
	bl	_dwt_enableclocks
	.loc 1 3187 5
	movs	r0, #13
	bl	_dwt_enableclocks
	.loc 1 3190 7
	ldr	r3, [sp, #4]
	cmp	r3, #3
	bhi	.L291
	.loc 1 3192 29
	movs	r3, #4
	str	r3, [sp, #4]
.L291:
	.loc 1 3194 5
	ldr	r2, [sp, #4]
	movs	r1, #0
	movs	r0, #10
	bl	dwt_write32bitoffsetreg
	.loc 1 3199 5
	movs	r2, #16
	movs	r1, #36
	movs	r0, #47
	bl	dwt_write8bitoffsetreg
	.loc 1 3200 1
	nop
	add	sp, sp, #12
.LCFI218:
	@ sp needed
	ldr	pc, [sp], #4
.L293:
	.align	2
.L292:
	.word	6291200
.LFE86:
	.size	dwt_configcontinuousframemode, .-dwt_configcontinuousframemode
	.section	.text.dwt_readtempvbat,"ax",%progbits
	.align	1
	.global	dwt_readtempvbat
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	dwt_readtempvbat, %function
dwt_readtempvbat:
.LFB87:
	.loc 1 3224 1
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
.LCFI219:
	sub	sp, sp, #20
.LCFI220:
	mov	r3, r0
	strb	r3, [sp, #7]
	.loc 1 3230 15
	movs	r3, #128
	strb	r3, [sp, #12]
	.loc 1 3231 5
	add	r3, sp, #12
	movs	r2, #1
	movs	r1, #17
	movs	r0, #40
	bl	dwt_writetodevice
	.loc 1 3233 15
	movs	r3, #10
	strb	r3, [sp, #12]
	.loc 1 3234 5
	add	r3, sp, #12
	movs	r2, #1
	movs	r1, #18
	movs	r0, #40
	bl	dwt_writetodevice
	.loc 1 3236 15
	movs	r3, #15
	strb	r3, [sp, #12]
	.loc 1 3237 5
	add	r3, sp, #12
	movs	r2, #1
	movs	r1, #18
	movs	r0, #40
	bl	dwt_writetodevice
	.loc 1 3240 15
	movs	r3, #0
	strb	r3, [sp, #12]
	.loc 1 3241 5
	add	r3, sp, #12
	movs	r2, #1
	movs	r1, #0
	movs	r0, #42
	bl	dwt_writetodevice
	.loc 1 3242 15
	movs	r3, #1
	strb	r3, [sp, #12]
	.loc 1 3243 5
	add	r3, sp, #12
	movs	r2, #1
	movs	r1, #0
	movs	r0, #42
	bl	dwt_writetodevice
	.loc 1 3245 7
	ldrb	r3, [sp, #7]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L295
	.loc 1 3247 9
	movs	r0, #1
	bl	deca_sleep
	.loc 1 3249 9
	add	r3, sp, #12
	movs	r2, #2
	movs	r1, #3
	movs	r0, #42
	bl	dwt_readfromdevice
	b	.L296
.L295:
	.loc 1 3253 9
	movs	r0, #0
	bl	_dwt_enableclocks
	.loc 1 3255 9
	add	r3, sp, #12
	movs	r2, #2
	movs	r1, #3
	movs	r0, #42
	bl	dwt_readfromdevice
	.loc 1 3257 9
	movs	r0, #1
	bl	_dwt_enableclocks
.L296:
	.loc 1 3260 14
	ldrb	r3, [sp, #12]
	strb	r3, [sp, #15]
	.loc 1 3261 14
	ldrb	r3, [sp, #13]
	strb	r3, [sp, #14]
	.loc 1 3263 15
	movs	r3, #0
	strb	r3, [sp, #12]
	.loc 1 3264 5
	add	r3, sp, #12
	movs	r2, #1
	movs	r1, #0
	movs	r0, #42
	bl	dwt_writetodevice
	.loc 1 3266 22
	ldrb	r3, [sp, #14]	@ zero_extendqisi2
	lsls	r3, r3, #8
	.loc 1 3266 26
	sxth	r2, r3
	ldrb	r3, [sp, #15]	@ zero_extendqisi2
	sxth	r3, r3
	orrs	r3, r3, r2
	sxth	r3, r3
	uxth	r3, r3
	.loc 1 3267 1
	mov	r0, r3
	add	sp, sp, #20
.LCFI221:
	@ sp needed
	ldr	pc, [sp], #4
.LFE87:
	.size	dwt_readtempvbat, .-dwt_readtempvbat
	.section	.text.dwt_readwakeuptemp,"ax",%progbits
	.align	1
	.global	dwt_readwakeuptemp
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	dwt_readwakeuptemp, %function
dwt_readwakeuptemp:
.LFB88:
	.loc 1 3283 1
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, lr}
.LCFI222:
	.loc 1 3284 12
	movs	r1, #4
	movs	r0, #42
	bl	dwt_read8bitoffsetreg
	mov	r3, r0
	.loc 1 3285 1
	mov	r0, r3
	pop	{r3, pc}
.LFE88:
	.size	dwt_readwakeuptemp, .-dwt_readwakeuptemp
	.section	.text.dwt_readwakeupvbat,"ax",%progbits
	.align	1
	.global	dwt_readwakeupvbat
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	dwt_readwakeupvbat, %function
dwt_readwakeupvbat:
.LFB89:
	.loc 1 3301 1
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, lr}
.LCFI223:
	.loc 1 3302 12
	movs	r1, #3
	movs	r0, #42
	bl	dwt_read8bitoffsetreg
	mov	r3, r0
	.loc 1 3303 1
	mov	r0, r3
	pop	{r3, pc}
.LFE89:
	.size	dwt_readwakeupvbat, .-dwt_readwakeupvbat
	.section	.text.dwt_calcbandwidthtempadj,"ax",%progbits
	.align	1
	.global	dwt_calcbandwidthtempadj
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	dwt_calcbandwidthtempadj, %function
dwt_calcbandwidthtempadj:
.LFB90:
	.loc 1 3319 1
	@ args = 0, pretend = 0, frame = 48
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
.LCFI224:
	sub	sp, sp, #52
.LCFI225:
	mov	r3, r0
	strh	r3, [sp, #6]	@ movhi
	.loc 1 3322 11
	movs	r3, #0
	str	r3, [sp, #24]
	.loc 1 3323 12
	movs	r3, #0
	str	r3, [sp, #32]
	.loc 1 3324 12
	movs	r3, #0
	strh	r3, [sp, #22]	@ movhi
	.loc 1 3333 22
	movs	r1, #0
	movs	r0, #54
	bl	dwt_read8bitoffsetreg
	mov	r3, r0
	strb	r3, [sp, #21]
	.loc 1 3334 22
	movs	r1, #4
	movs	r0, #54
	bl	dwt_read16bitoffsetreg
	mov	r3, r0
	strh	r3, [sp, #18]	@ movhi
	.loc 1 3335 30
	movs	r1, #0
	movs	r0, #40
	bl	dwt_read32bitoffsetreg
	str	r0, [sp, #12]
	.loc 1 3338 5
	movs	r2, #1
	movs	r1, #0
	movs	r0, #54
	bl	dwt_write8bitoffsetreg
	.loc 1 3341 5
	movs	r2, #0
	movs	r1, #4
	movs	r0, #54
	bl	dwt_write16bitoffsetreg
	.loc 1 3344 5
	ldr	r2, .L309
	movs	r1, #0
	movs	r0, #40
	bl	dwt_write32bitoffsetreg
	.loc 1 3347 5
	movs	r2, #34
	movs	r1, #0
	movs	r0, #54
	bl	dwt_write8bitoffsetreg
	.loc 1 3350 13
	movs	r3, #128
	str	r3, [sp, #36]
	.loc 1 3352 15
	movs	r3, #128
	str	r3, [sp, #40]
	.loc 1 3356 18
	mov	r3, #300
	str	r3, [sp, #28]
	.loc 1 3358 12
	movs	r3, #0
	str	r3, [sp, #44]
	.loc 1 3358 5
	b	.L303
.L307:
	.loc 1 3361 19
	ldr	r3, [sp, #40]
	lsrs	r3, r3, #1
	str	r3, [sp, #40]
	.loc 1 3362 17
	ldr	r2, [sp, #36]
	ldr	r3, [sp, #40]
	orrs	r3, r3, r2
	str	r3, [sp, #36]
	.loc 1 3365 9
	ldr	r3, [sp, #36]
	uxtb	r3, r3
	mov	r2, r3
	movs	r1, #11
	movs	r0, #42
	bl	dwt_write8bitoffsetreg
	.loc 1 3368 9
	movs	r2, #188
	movs	r1, #8
	movs	r0, #42
	bl	dwt_write8bitoffsetreg
	.loc 1 3371 9
	movs	r2, #189
	movs	r1, #8
	movs	r0, #42
	bl	dwt_write8bitoffsetreg
	.loc 1 3373 9
	movs	r0, #100
	bl	deca_sleep
	.loc 1 3376 21
	movs	r1, #9
	movs	r0, #42
	bl	dwt_read16bitoffsetreg
	mov	r3, r0
	.loc 1 3376 19
	ubfx	r3, r3, #0, #12
	strh	r3, [sp, #22]	@ movhi
	.loc 1 3379 27
	ldrh	r2, [sp, #22]
	.loc 1 3379 44
	ldrh	r3, [sp, #6]
	.loc 1 3379 23
	subs	r3, r2, r3
	mov	r0, r3
	bl	abs
	str	r0, [sp, #24]
	.loc 1 3380 12
	ldr	r2, [sp, #24]
	ldr	r3, [sp, #28]
	cmp	r2, r3
	bge	.L304
	.loc 1 3382 26
	ldr	r3, [sp, #24]
	str	r3, [sp, #28]
	.loc 1 3383 21
	ldr	r3, [sp, #36]
	str	r3, [sp, #32]
.L304:
	.loc 1 3387 12
	ldrh	r2, [sp, #22]
	ldrh	r3, [sp, #6]
	cmp	r2, r3
	bls	.L305
	.loc 1 3389 21
	ldr	r2, [sp, #36]
	ldr	r3, [sp, #40]
	orrs	r3, r3, r2
	str	r3, [sp, #36]
	b	.L306
.L305:
	.loc 1 3392 34
	ldr	r3, [sp, #40]
	mvns	r3, r3
	.loc 1 3392 21
	ldr	r2, [sp, #36]
	ands	r3, r3, r2
	str	r3, [sp, #36]
.L306:
	.loc 1 3358 25 discriminator 2
	ldr	r3, [sp, #44]
	adds	r3, r3, #1
	str	r3, [sp, #44]
.L303:
	.loc 1 3358 5 discriminator 1
	ldr	r3, [sp, #44]
	cmp	r3, #6
	ble	.L307
	.loc 1 3396 5
	ldrb	r3, [sp, #21]	@ zero_extendqisi2
	mov	r2, r3
	movs	r1, #0
	movs	r0, #54
	bl	dwt_write8bitoffsetreg
	.loc 1 3397 5
	ldrh	r3, [sp, #18]
	mov	r2, r3
	movs	r1, #4
	movs	r0, #54
	bl	dwt_write16bitoffsetreg
	.loc 1 3398 5
	ldr	r2, [sp, #12]
	movs	r1, #0
	movs	r0, #40
	bl	dwt_write32bitoffsetreg
	.loc 1 3401 12
	ldr	r3, [sp, #32]
	.loc 1 3402 1
	mov	r0, r3
	add	sp, sp, #52
.LCFI226:
	@ sp needed
	ldr	pc, [sp], #4
.L310:
	.align	2
.L309:
	.word	2074368
.LFE90:
	.size	dwt_calcbandwidthtempadj, .-dwt_calcbandwidthtempadj
	.section	.text._dwt_computetxpowersetting,"ax",%progbits
	.align	1
	.global	_dwt_computetxpowersetting
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	_dwt_computetxpowersetting, %function
_dwt_computetxpowersetting:
.LFB91:
	.loc 1 3420 1
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	sub	sp, sp, #32
.LCFI227:
	str	r0, [sp, #4]
	str	r1, [sp]
	.loc 1 3424 12
	movs	r3, #0
	str	r3, [sp, #20]
	.loc 1 3427 11
	movs	r3, #0
	str	r3, [sp, #16]
	.loc 1 3427 5
	b	.L312
.L316:
	.loc 1 3429 24
	movs	r3, #0
	str	r3, [sp, #28]
	.loc 1 3430 27
	ldr	r3, [sp]
	str	r3, [sp, #24]
	.loc 1 3431 47
	ldr	r3, [sp, #16]
	lsls	r3, r3, #3
	.loc 1 3431 42
	ldr	r2, [sp, #4]
	lsr	r3, r2, r3
	.loc 1 3431 60
	lsrs	r3, r3, #5
	uxtb	r3, r3
	.loc 1 3431 25
	and	r3, r3, #7
	strb	r3, [sp, #15]
	.loc 1 3432 49
	ldr	r3, [sp, #16]
	lsls	r3, r3, #3
	.loc 1 3432 44
	ldr	r2, [sp, #4]
	lsr	r3, r2, r3
	.loc 1 3432 54
	uxtb	r3, r3
	.loc 1 3432 28
	and	r3, r3, #31
	strb	r3, [sp, #14]
	.loc 1 3435 14
	b	.L313
.L315:
	.loc 1 3439 35
	ldrb	r2, [sp, #14]	@ zero_extendqisi2
	ldr	r3, [sp, #24]
	add	r3, r3, r2
	.loc 1 3439 15
	cmp	r3, #20
	ble	.L314
	.loc 1 3441 32
	ldr	r3, [sp, #28]
	adds	r3, r3, #1
	str	r3, [sp, #28]
	.loc 1 3442 35
	ldr	r3, [sp, #24]
	subs	r3, r3, #5
	str	r3, [sp, #24]
	b	.L313
.L314:
	.loc 1 3444 40
	ldrb	r2, [sp, #14]	@ zero_extendqisi2
	ldr	r3, [sp, #24]
	add	r3, r3, r2
	.loc 1 3444 20
	cmp	r3, #3
	bgt	.L313
	.loc 1 3446 32
	ldr	r3, [sp, #28]
	adds	r3, r3, #1
	str	r3, [sp, #28]
	.loc 1 3447 35
	ldr	r3, [sp, #24]
	adds	r3, r3, #5
	str	r3, [sp, #24]
.L313:
	.loc 1 3435 35
	ldrb	r2, [sp, #14]	@ zero_extendqisi2
	ldr	r3, [sp, #24]
	add	r3, r3, r2
	.loc 1 3435 14
	cmp	r3, #3
	ble	.L315
	.loc 1 3436 35 discriminator 1
	ldrb	r2, [sp, #14]	@ zero_extendqisi2
	ldr	r3, [sp, #24]
	add	r3, r3, r2
	.loc 1 3435 60 discriminator 1
	cmp	r3, #20
	bgt	.L315
	.loc 1 3451 39 discriminator 2
	ldr	r3, [sp, #28]
	uxtb	r2, r3
	.loc 1 3451 21 discriminator 2
	ldrb	r3, [sp, #15]
	add	r3, r3, r2
	strb	r3, [sp, #13]
	.loc 1 3452 45 discriminator 2
	ldr	r3, [sp, #24]
	uxtb	r2, r3
	.loc 1 3452 24 discriminator 2
	ldrb	r3, [sp, #14]
	add	r3, r3, r2
	strb	r3, [sp, #12]
	.loc 1 3454 47 discriminator 2
	ldrb	r3, [sp, #13]	@ zero_extendqisi2
	lsls	r2, r3, #5
	.loc 1 3454 53 discriminator 2
	ldrb	r3, [sp, #12]	@ zero_extendqisi2
	orrs	r3, r3, r2
	.loc 1 3454 24 discriminator 2
	mov	r2, r3
	.loc 1 3454 78 discriminator 2
	ldr	r3, [sp, #16]
	lsls	r3, r3, #3
	.loc 1 3454 72 discriminator 2
	lsl	r3, r2, r3
	.loc 1 3454 20 discriminator 2
	ldr	r2, [sp, #20]
	orrs	r3, r3, r2
	str	r3, [sp, #20]
	.loc 1 3427 24 discriminator 2
	ldr	r3, [sp, #16]
	adds	r3, r3, #1
	str	r3, [sp, #16]
.L312:
	.loc 1 3427 5 discriminator 1
	ldr	r3, [sp, #16]
	cmp	r3, #3
	ble	.L316
	.loc 1 3457 12
	ldr	r3, [sp, #20]
	.loc 1 3458 1
	mov	r0, r3
	add	sp, sp, #32
.LCFI228:
	@ sp needed
	bx	lr
.LFE91:
	.size	_dwt_computetxpowersetting, .-_dwt_computetxpowersetting
	.global	__aeabi_dsub
	.global	__aeabi_dmul
	.global	__aeabi_ddiv
	.global	__aeabi_d2iz
	.section	.text.dwt_calcpowertempadj,"ax",%progbits
	.align	1
	.global	dwt_calcpowertempadj
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	dwt_calcpowertempadj, %function
dwt_calcpowertempadj:
.LFB92:
	.loc 1 3482 1
	@ args = 0, pretend = 0, frame = 40
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
.LCFI229:
	sub	sp, sp, #40
.LCFI230:
	mov	r3, r0
	str	r1, [sp, #16]
	vstr.64	d0, [sp, #8]
	vstr.64	d1, [sp]
	strb	r3, [sp, #23]
	.loc 1 3487 16
	ldrd	r2, [sp]
	ldrd	r0, [sp, #8]
	bl	__aeabi_dsub
.LVL5:
	mov	r3, r0
	mov	r4, r1
	strd	r3, [sp, #32]
	.loc 1 3490 59
	ldrb	r3, [sp, #23]	@ zero_extendqisi2
	ldr	r2, .L320
	ldrb	r3, [r2, r3]	@ zero_extendqisi2
	.loc 1 3490 50
	ldr	r2, .L320+4
	lsls	r3, r3, #3
	add	r3, r3, r2
	ldrd	r3, [r3]
	.loc 1 3490 17
	mov	r2, r3
	mov	r3, r4
	ldrd	r0, [sp, #32]
	bl	__aeabi_dmul
.LVL6:
	mov	r3, r0
	mov	r4, r1
	strd	r3, [sp, #24]
	.loc 1 3493 73
	mov	r2, #0
	ldr	r3, .L320+8
	ldrd	r0, [sp, #24]
	bl	__aeabi_ddiv
.LVL7:
	mov	r3, r0
	mov	r4, r1
	.loc 1 3493 12
	mov	r0, r3
	mov	r1, r4
	bl	__aeabi_d2iz
.LVL8:
	mov	r3, r0
	mov	r1, r3
	ldr	r0, [sp, #16]
	bl	_dwt_computetxpowersetting
	mov	r3, r0
	.loc 1 3494 1
	mov	r0, r3
	add	sp, sp, #40
.LCFI231:
	@ sp needed
	pop	{r4, pc}
.L321:
	.align	2
.L320:
	.word	chan_idx
	.word	txpwr_compensation
	.word	1071644672
.LFE92:
	.size	dwt_calcpowertempadj, .-dwt_calcpowertempadj
	.section	.text.dwt_calcpgcount,"ax",%progbits
	.align	1
	.global	dwt_calcpgcount
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	dwt_calcpgcount, %function
dwt_calcpgcount:
.LFB93:
	.loc 1 3511 1
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
.LCFI232:
	sub	sp, sp, #36
.LCFI233:
	mov	r3, r0
	strb	r3, [sp, #7]
	.loc 1 3513 15
	movs	r3, #10
	str	r3, [sp, #20]
	.loc 1 3514 12
	movs	r3, #0
	str	r3, [sp, #28]
	.loc 1 3515 12
	movs	r3, #0
	strh	r3, [sp, #18]	@ movhi
	.loc 1 3515 31
	movs	r3, #0
	strh	r3, [sp, #16]	@ movhi
	.loc 1 3516 9
	movs	r3, #0
	str	r3, [sp, #24]
	.loc 1 3524 22
	movs	r1, #0
	movs	r0, #54
	bl	dwt_read8bitoffsetreg
	mov	r3, r0
	strb	r3, [sp, #15]
	.loc 1 3525 22
	movs	r1, #4
	movs	r0, #54
	bl	dwt_read16bitoffsetreg
	mov	r3, r0
	strh	r3, [sp, #12]	@ movhi
	.loc 1 3526 30
	movs	r1, #0
	movs	r0, #40
	bl	dwt_read32bitoffsetreg
	str	r0, [sp, #8]
	.loc 1 3529 5
	movs	r2, #1
	movs	r1, #0
	movs	r0, #54
	bl	dwt_write8bitoffsetreg
	.loc 1 3531 5
	movs	r2, #0
	movs	r1, #4
	movs	r0, #54
	bl	dwt_write16bitoffsetreg
	.loc 1 3533 5
	ldr	r2, .L326
	movs	r1, #0
	movs	r0, #40
	bl	dwt_write32bitoffsetreg
	.loc 1 3535 5
	movs	r2, #34
	movs	r1, #0
	movs	r0, #54
	bl	dwt_write8bitoffsetreg
	.loc 1 3537 11
	movs	r3, #0
	str	r3, [sp, #24]
	.loc 1 3537 5
	b	.L323
.L324:
	.loc 1 3539 9 discriminator 3
	ldrb	r3, [sp, #7]	@ zero_extendqisi2
	mov	r2, r3
	movs	r1, #11
	movs	r0, #42
	bl	dwt_write8bitoffsetreg
	.loc 1 3542 9 discriminator 3
	movs	r2, #188
	movs	r1, #8
	movs	r0, #42
	bl	dwt_write8bitoffsetreg
	.loc 1 3545 9 discriminator 3
	movs	r2, #189
	movs	r1, #8
	movs	r0, #42
	bl	dwt_write8bitoffsetreg
	.loc 1 3548 9 discriminator 3
	movs	r0, #100
	bl	deca_sleep
	.loc 1 3551 17 discriminator 3
	movs	r1, #9
	movs	r0, #42
	bl	dwt_read16bitoffsetreg
	mov	r3, r0
	.loc 1 3551 15 discriminator 3
	ubfx	r3, r3, #0, #12
	strh	r3, [sp, #16]	@ movhi
	.loc 1 3553 19 discriminator 3
	ldrh	r3, [sp, #16]
	ldr	r2, [sp, #28]
	add	r3, r3, r2
	str	r3, [sp, #28]
	.loc 1 3537 34 discriminator 3
	ldr	r3, [sp, #24]
	adds	r3, r3, #1
	str	r3, [sp, #24]
.L323:
	.loc 1 3537 5 discriminator 1
	ldr	r2, [sp, #24]
	ldr	r3, [sp, #20]
	cmp	r2, r3
	blt	.L324
	.loc 1 3557 5
	ldrb	r3, [sp, #15]	@ zero_extendqisi2
	mov	r2, r3
	movs	r1, #0
	movs	r0, #54
	bl	dwt_write8bitoffsetreg
	.loc 1 3558 5
	ldrh	r3, [sp, #12]
	mov	r2, r3
	movs	r1, #4
	movs	r0, #54
	bl	dwt_write16bitoffsetreg
	.loc 1 3559 5
	ldr	r2, [sp, #8]
	movs	r1, #0
	movs	r0, #40
	bl	dwt_write32bitoffsetreg
	.loc 1 3561 37
	ldr	r3, [sp, #20]
	ldr	r2, [sp, #28]
	udiv	r3, r2, r3
	.loc 1 3561 19
	strh	r3, [sp, #18]	@ movhi
	.loc 1 3562 12
	ldrh	r3, [sp, #18]
	.loc 1 3563 1
	mov	r0, r3
	add	sp, sp, #36
.LCFI234:
	@ sp needed
	ldr	pc, [sp], #4
.L327:
	.align	2
.L326:
	.word	2074368
.LFE93:
	.size	dwt_calcpgcount, .-dwt_calcpgcount
	.section	.debug_frame,"",%progbits
.Lframe0:
	.4byte	.LECIE0-.LSCIE0
.LSCIE0:
	.4byte	0xffffffff
	.byte	0x3
	.ascii	"\000"
	.uleb128 0x1
	.sleb128 -4
	.uleb128 0xe
	.byte	0xc
	.uleb128 0xd
	.uleb128 0
	.align	2
.LECIE0:
.LSFDE0:
	.4byte	.LEFDE0-.LASFDE0
.LASFDE0:
	.4byte	.Lframe0
	.4byte	.LFB0
	.4byte	.LFE0-.LFB0
	.byte	0x4
	.4byte	.LCFI0-.LFB0
	.byte	0xe
	.uleb128 0x8
	.byte	0x4
	.4byte	.LCFI1-.LCFI0
	.byte	0xe
	.uleb128 0
	.align	2
.LEFDE0:
.LSFDE2:
	.4byte	.LEFDE2-.LASFDE2
.LASFDE2:
	.4byte	.Lframe0
	.4byte	.LFB1
	.4byte	.LFE1-.LFB1
	.byte	0x4
	.4byte	.LCFI2-.LFB1
	.byte	0xe
	.uleb128 0x8
	.byte	0x84
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI3-.LCFI2
	.byte	0xe
	.uleb128 0x20
	.byte	0x4
	.4byte	.LCFI4-.LCFI3
	.byte	0xe
	.uleb128 0x8
	.align	2
.LEFDE2:
.LSFDE4:
	.4byte	.LEFDE4-.LASFDE4
.LASFDE4:
	.4byte	.Lframe0
	.4byte	.LFB2
	.4byte	.LFE2-.LFB2
	.align	2
.LEFDE4:
.LSFDE6:
	.4byte	.LEFDE6-.LASFDE6
.LASFDE6:
	.4byte	.Lframe0
	.4byte	.LFB3
	.4byte	.LFE3-.LFB3
	.byte	0x4
	.4byte	.LCFI5-.LFB3
	.byte	0xe
	.uleb128 0x4
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI6-.LCFI5
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI7-.LCFI6
	.byte	0xe
	.uleb128 0x4
	.align	2
.LEFDE6:
.LSFDE8:
	.4byte	.LEFDE8-.LASFDE8
.LASFDE8:
	.4byte	.Lframe0
	.4byte	.LFB4
	.4byte	.LFE4-.LFB4
	.byte	0x4
	.4byte	.LCFI8-.LFB4
	.byte	0xe
	.uleb128 0x4
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI9-.LCFI8
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.4byte	.LCFI10-.LCFI9
	.byte	0xe
	.uleb128 0x4
	.align	2
.LEFDE8:
.LSFDE10:
	.4byte	.LEFDE10-.LASFDE10
.LASFDE10:
	.4byte	.Lframe0
	.4byte	.LFB5
	.4byte	.LFE5-.LFB5
	.byte	0x4
	.4byte	.LCFI11-.LFB5
	.byte	0xe
	.uleb128 0x4
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI12-.LCFI11
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.4byte	.LCFI13-.LCFI12
	.byte	0xe
	.uleb128 0x4
	.align	2
.LEFDE10:
.LSFDE12:
	.4byte	.LEFDE12-.LASFDE12
.LASFDE12:
	.4byte	.Lframe0
	.4byte	.LFB6
	.4byte	.LFE6-.LFB6
	.byte	0x4
	.4byte	.LCFI14-.LFB6
	.byte	0xe
	.uleb128 0x4
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI15-.LCFI14
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.4byte	.LCFI16-.LCFI15
	.byte	0xe
	.uleb128 0x4
	.align	2
.LEFDE12:
.LSFDE14:
	.4byte	.LEFDE14-.LASFDE14
.LASFDE14:
	.4byte	.Lframe0
	.4byte	.LFB7
	.4byte	.LFE7-.LFB7
	.align	2
.LEFDE14:
.LSFDE16:
	.4byte	.LEFDE16-.LASFDE16
.LASFDE16:
	.4byte	.Lframe0
	.4byte	.LFB8
	.4byte	.LFE8-.LFB8
	.align	2
.LEFDE16:
.LSFDE18:
	.4byte	.LEFDE18-.LASFDE18
.LASFDE18:
	.4byte	.Lframe0
	.4byte	.LFB9
	.4byte	.LFE9-.LFB9
	.byte	0x4
	.4byte	.LCFI17-.LFB9
	.byte	0xe
	.uleb128 0x8
	.byte	0x83
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.align	2
.LEFDE18:
.LSFDE20:
	.4byte	.LEFDE20-.LASFDE20
.LASFDE20:
	.4byte	.Lframe0
	.4byte	.LFB10
	.4byte	.LFE10-.LFB10
	.byte	0x4
	.4byte	.LCFI18-.LFB10
	.byte	0xe
	.uleb128 0x4
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI19-.LCFI18
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI20-.LCFI19
	.byte	0xe
	.uleb128 0x4
	.align	2
.LEFDE20:
.LSFDE22:
	.4byte	.LEFDE22-.LASFDE22
.LASFDE22:
	.4byte	.Lframe0
	.4byte	.LFB11
	.4byte	.LFE11-.LFB11
	.byte	0x4
	.4byte	.LCFI21-.LFB11
	.byte	0xe
	.uleb128 0x4
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI22-.LCFI21
	.byte	0xe
	.uleb128 0x20
	.byte	0x4
	.4byte	.LCFI23-.LCFI22
	.byte	0xe
	.uleb128 0x4
	.align	2
.LEFDE22:
.LSFDE24:
	.4byte	.LEFDE24-.LASFDE24
.LASFDE24:
	.4byte	.Lframe0
	.4byte	.LFB12
	.4byte	.LFE12-.LFB12
	.byte	0x4
	.4byte	.LCFI24-.LFB12
	.byte	0xe
	.uleb128 0x4
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI25-.LCFI24
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI26-.LCFI25
	.byte	0xe
	.uleb128 0x4
	.align	2
.LEFDE24:
.LSFDE26:
	.4byte	.LEFDE26-.LASFDE26
.LASFDE26:
	.4byte	.Lframe0
	.4byte	.LFB13
	.4byte	.LFE13-.LFB13
	.byte	0x4
	.4byte	.LCFI27-.LFB13
	.byte	0xe
	.uleb128 0x4
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI28-.LCFI27
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI29-.LCFI28
	.byte	0xe
	.uleb128 0x4
	.align	2
.LEFDE26:
.LSFDE28:
	.4byte	.LEFDE28-.LASFDE28
.LASFDE28:
	.4byte	.Lframe0
	.4byte	.LFB14
	.4byte	.LFE14-.LFB14
	.byte	0x4
	.4byte	.LCFI30-.LFB14
	.byte	0xe
	.uleb128 0x4
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI31-.LCFI30
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI32-.LCFI31
	.byte	0xe
	.uleb128 0x4
	.align	2
.LEFDE28:
.LSFDE30:
	.4byte	.LEFDE30-.LASFDE30
.LASFDE30:
	.4byte	.Lframe0
	.4byte	.LFB15
	.4byte	.LFE15-.LFB15
	.byte	0x4
	.4byte	.LCFI33-.LFB15
	.byte	0xe
	.uleb128 0x4
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI34-.LCFI33
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.4byte	.LCFI35-.LCFI34
	.byte	0xe
	.uleb128 0x4
	.align	2
.LEFDE30:
.LSFDE32:
	.4byte	.LEFDE32-.LASFDE32
.LASFDE32:
	.4byte	.Lframe0
	.4byte	.LFB16
	.4byte	.LFE16-.LFB16
	.byte	0x4
	.4byte	.LCFI36-.LFB16
	.byte	0xe
	.uleb128 0x4
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI37-.LCFI36
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI38-.LCFI37
	.byte	0xe
	.uleb128 0x4
	.align	2
.LEFDE32:
.LSFDE34:
	.4byte	.LEFDE34-.LASFDE34
.LASFDE34:
	.4byte	.Lframe0
	.4byte	.LFB17
	.4byte	.LFE17-.LFB17
	.byte	0x4
	.4byte	.LCFI39-.LFB17
	.byte	0xe
	.uleb128 0x4
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI40-.LCFI39
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI41-.LCFI40
	.byte	0xe
	.uleb128 0x4
	.align	2
.LEFDE34:
.LSFDE36:
	.4byte	.LEFDE36-.LASFDE36
.LASFDE36:
	.4byte	.Lframe0
	.4byte	.LFB18
	.4byte	.LFE18-.LFB18
	.byte	0x4
	.4byte	.LCFI42-.LFB18
	.byte	0xe
	.uleb128 0x4
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI43-.LCFI42
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.4byte	.LCFI44-.LCFI43
	.byte	0xe
	.uleb128 0x4
	.align	2
.LEFDE36:
.LSFDE38:
	.4byte	.LEFDE38-.LASFDE38
.LASFDE38:
	.4byte	.Lframe0
	.4byte	.LFB19
	.4byte	.LFE19-.LFB19
	.byte	0x4
	.4byte	.LCFI45-.LFB19
	.byte	0xe
	.uleb128 0x4
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI46-.LCFI45
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI47-.LCFI46
	.byte	0xe
	.uleb128 0x4
	.align	2
.LEFDE38:
.LSFDE40:
	.4byte	.LEFDE40-.LASFDE40
.LASFDE40:
	.4byte	.Lframe0
	.4byte	.LFB20
	.4byte	.LFE20-.LFB20
	.byte	0x4
	.4byte	.LCFI48-.LFB20
	.byte	0xe
	.uleb128 0x4
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI49-.LCFI48
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI50-.LCFI49
	.byte	0xe
	.uleb128 0x4
	.align	2
.LEFDE40:
.LSFDE42:
	.4byte	.LEFDE42-.LASFDE42
.LASFDE42:
	.4byte	.Lframe0
	.4byte	.LFB21
	.4byte	.LFE21-.LFB21
	.byte	0x4
	.4byte	.LCFI51-.LFB21
	.byte	0xe
	.uleb128 0x8
	.byte	0x83
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.align	2
.LEFDE42:
.LSFDE44:
	.4byte	.LEFDE44-.LASFDE44
.LASFDE44:
	.4byte	.Lframe0
	.4byte	.LFB22
	.4byte	.LFE22-.LFB22
	.byte	0x4
	.4byte	.LCFI52-.LFB22
	.byte	0xe
	.uleb128 0x8
	.byte	0x83
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.align	2
.LEFDE44:
.LSFDE46:
	.4byte	.LEFDE46-.LASFDE46
.LASFDE46:
	.4byte	.Lframe0
	.4byte	.LFB23
	.4byte	.LFE23-.LFB23
	.byte	0x4
	.4byte	.LCFI53-.LFB23
	.byte	0xe
	.uleb128 0x4
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI54-.LCFI53
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI55-.LCFI54
	.byte	0xe
	.uleb128 0x4
	.align	2
.LEFDE46:
.LSFDE48:
	.4byte	.LEFDE48-.LASFDE48
.LASFDE48:
	.4byte	.Lframe0
	.4byte	.LFB24
	.4byte	.LFE24-.LFB24
	.byte	0x4
	.4byte	.LCFI56-.LFB24
	.byte	0xe
	.uleb128 0x8
	.byte	0x83
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.align	2
.LEFDE48:
.LSFDE50:
	.4byte	.LEFDE50-.LASFDE50
.LASFDE50:
	.4byte	.Lframe0
	.4byte	.LFB25
	.4byte	.LFE25-.LFB25
	.byte	0x4
	.4byte	.LCFI57-.LFB25
	.byte	0xe
	.uleb128 0x8
	.byte	0x83
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.align	2
.LEFDE50:
.LSFDE52:
	.4byte	.LEFDE52-.LASFDE52
.LASFDE52:
	.4byte	.Lframe0
	.4byte	.LFB26
	.4byte	.LFE26-.LFB26
	.byte	0x4
	.4byte	.LCFI58-.LFB26
	.byte	0xe
	.uleb128 0x8
	.byte	0x83
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.align	2
.LEFDE52:
.LSFDE54:
	.4byte	.LEFDE54-.LASFDE54
.LASFDE54:
	.4byte	.Lframe0
	.4byte	.LFB27
	.4byte	.LFE27-.LFB27
	.byte	0x4
	.4byte	.LCFI59-.LFB27
	.byte	0xe
	.uleb128 0x4
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI60-.LCFI59
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI61-.LCFI60
	.byte	0xe
	.uleb128 0x4
	.align	2
.LEFDE54:
.LSFDE56:
	.4byte	.LEFDE56-.LASFDE56
.LASFDE56:
	.4byte	.Lframe0
	.4byte	.LFB28
	.4byte	.LFE28-.LFB28
	.byte	0x4
	.4byte	.LCFI62-.LFB28
	.byte	0xe
	.uleb128 0x4
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI63-.LCFI62
	.byte	0xe
	.uleb128 0x20
	.byte	0x4
	.4byte	.LCFI64-.LCFI63
	.byte	0xe
	.uleb128 0x4
	.align	2
.LEFDE56:
.LSFDE58:
	.4byte	.LEFDE58-.LASFDE58
.LASFDE58:
	.4byte	.Lframe0
	.4byte	.LFB29
	.4byte	.LFE29-.LFB29
	.byte	0x4
	.4byte	.LCFI65-.LFB29
	.byte	0xe
	.uleb128 0x4
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI66-.LCFI65
	.byte	0xe
	.uleb128 0x20
	.byte	0x4
	.4byte	.LCFI67-.LCFI66
	.byte	0xe
	.uleb128 0x4
	.align	2
.LEFDE58:
.LSFDE60:
	.4byte	.LEFDE60-.LASFDE60
.LASFDE60:
	.4byte	.Lframe0
	.4byte	.LFB30
	.4byte	.LFE30-.LFB30
	.byte	0x4
	.4byte	.LCFI68-.LFB30
	.byte	0xe
	.uleb128 0x4
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI69-.LCFI68
	.byte	0xe
	.uleb128 0x20
	.byte	0x4
	.4byte	.LCFI70-.LCFI69
	.byte	0xe
	.uleb128 0x4
	.align	2
.LEFDE60:
.LSFDE62:
	.4byte	.LEFDE62-.LASFDE62
.LASFDE62:
	.4byte	.Lframe0
	.4byte	.LFB31
	.4byte	.LFE31-.LFB31
	.byte	0x4
	.4byte	.LCFI71-.LFB31
	.byte	0xe
	.uleb128 0x4
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI72-.LCFI71
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.4byte	.LCFI73-.LCFI72
	.byte	0xe
	.uleb128 0x4
	.align	2
.LEFDE62:
.LSFDE64:
	.4byte	.LEFDE64-.LASFDE64
.LASFDE64:
	.4byte	.Lframe0
	.4byte	.LFB32
	.4byte	.LFE32-.LFB32
	.byte	0x4
	.4byte	.LCFI74-.LFB32
	.byte	0xe
	.uleb128 0x4
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI75-.LCFI74
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.4byte	.LCFI76-.LCFI75
	.byte	0xe
	.uleb128 0x4
	.align	2
.LEFDE64:
.LSFDE66:
	.4byte	.LEFDE66-.LASFDE66
.LASFDE66:
	.4byte	.Lframe0
	.4byte	.LFB33
	.4byte	.LFE33-.LFB33
	.byte	0x4
	.4byte	.LCFI77-.LFB33
	.byte	0xe
	.uleb128 0x4
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI78-.LCFI77
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.4byte	.LCFI79-.LCFI78
	.byte	0xe
	.uleb128 0x4
	.align	2
.LEFDE66:
.LSFDE68:
	.4byte	.LEFDE68-.LASFDE68
.LASFDE68:
	.4byte	.Lframe0
	.4byte	.LFB34
	.4byte	.LFE34-.LFB34
	.byte	0x4
	.4byte	.LCFI80-.LFB34
	.byte	0xe
	.uleb128 0x4
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI81-.LCFI80
	.byte	0xe
	.uleb128 0x20
	.byte	0x4
	.4byte	.LCFI82-.LCFI81
	.byte	0xe
	.uleb128 0x4
	.align	2
.LEFDE68:
.LSFDE70:
	.4byte	.LEFDE70-.LASFDE70
.LASFDE70:
	.4byte	.Lframe0
	.4byte	.LFB35
	.4byte	.LFE35-.LFB35
	.byte	0x4
	.4byte	.LCFI83-.LFB35
	.byte	0xe
	.uleb128 0x4
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI84-.LCFI83
	.byte	0xe
	.uleb128 0x20
	.byte	0x4
	.4byte	.LCFI85-.LCFI84
	.byte	0xe
	.uleb128 0x4
	.align	2
.LEFDE70:
.LSFDE72:
	.4byte	.LEFDE72-.LASFDE72
.LASFDE72:
	.4byte	.Lframe0
	.4byte	.LFB36
	.4byte	.LFE36-.LFB36
	.byte	0x4
	.4byte	.LCFI86-.LFB36
	.byte	0xe
	.uleb128 0x4
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI87-.LCFI86
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.4byte	.LCFI88-.LCFI87
	.byte	0xe
	.uleb128 0x4
	.align	2
.LEFDE72:
.LSFDE74:
	.4byte	.LEFDE74-.LASFDE74
.LASFDE74:
	.4byte	.Lframe0
	.4byte	.LFB37
	.4byte	.LFE37-.LFB37
	.byte	0x4
	.4byte	.LCFI89-.LFB37
	.byte	0xe
	.uleb128 0x4
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI90-.LCFI89
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI91-.LCFI90
	.byte	0xe
	.uleb128 0x4
	.align	2
.LEFDE74:
.LSFDE76:
	.4byte	.LEFDE76-.LASFDE76
.LASFDE76:
	.4byte	.Lframe0
	.4byte	.LFB38
	.4byte	.LFE38-.LFB38
	.byte	0x4
	.4byte	.LCFI92-.LFB38
	.byte	0xe
	.uleb128 0x4
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI93-.LCFI92
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI94-.LCFI93
	.byte	0xe
	.uleb128 0x4
	.align	2
.LEFDE76:
.LSFDE78:
	.4byte	.LEFDE78-.LASFDE78
.LASFDE78:
	.4byte	.Lframe0
	.4byte	.LFB39
	.4byte	.LFE39-.LFB39
	.byte	0x4
	.4byte	.LCFI95-.LFB39
	.byte	0xe
	.uleb128 0x4
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI96-.LCFI95
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI97-.LCFI96
	.byte	0xe
	.uleb128 0x4
	.align	2
.LEFDE78:
.LSFDE80:
	.4byte	.LEFDE80-.LASFDE80
.LASFDE80:
	.4byte	.Lframe0
	.4byte	.LFB40
	.4byte	.LFE40-.LFB40
	.byte	0x4
	.4byte	.LCFI98-.LFB40
	.byte	0xe
	.uleb128 0x4
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI99-.LCFI98
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI100-.LCFI99
	.byte	0xe
	.uleb128 0x4
	.align	2
.LEFDE80:
.LSFDE82:
	.4byte	.LEFDE82-.LASFDE82
.LASFDE82:
	.4byte	.Lframe0
	.4byte	.LFB41
	.4byte	.LFE41-.LFB41
	.byte	0x4
	.4byte	.LCFI101-.LFB41
	.byte	0xe
	.uleb128 0x8
	.byte	0x84
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI102-.LCFI101
	.byte	0xe
	.uleb128 0x20
	.byte	0x4
	.4byte	.LCFI103-.LCFI102
	.byte	0xe
	.uleb128 0x8
	.align	2
.LEFDE82:
.LSFDE84:
	.4byte	.LEFDE84-.LASFDE84
.LASFDE84:
	.4byte	.Lframe0
	.4byte	.LFB42
	.4byte	.LFE42-.LFB42
	.byte	0x4
	.4byte	.LCFI104-.LFB42
	.byte	0xe
	.uleb128 0x4
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI105-.LCFI104
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.4byte	.LCFI106-.LCFI105
	.byte	0xe
	.uleb128 0x4
	.align	2
.LEFDE84:
.LSFDE86:
	.4byte	.LEFDE86-.LASFDE86
.LASFDE86:
	.4byte	.Lframe0
	.4byte	.LFB43
	.4byte	.LFE43-.LFB43
	.byte	0x4
	.4byte	.LCFI107-.LFB43
	.byte	0xe
	.uleb128 0x4
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI108-.LCFI107
	.byte	0xe
	.uleb128 0x28
	.byte	0x4
	.4byte	.LCFI109-.LCFI108
	.byte	0xe
	.uleb128 0x4
	.align	2
.LEFDE86:
.LSFDE88:
	.4byte	.LEFDE88-.LASFDE88
.LASFDE88:
	.4byte	.Lframe0
	.4byte	.LFB44
	.4byte	.LFE44-.LFB44
	.byte	0x4
	.4byte	.LCFI110-.LFB44
	.byte	0xe
	.uleb128 0x4
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI111-.LCFI110
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.4byte	.LCFI112-.LCFI111
	.byte	0xe
	.uleb128 0x4
	.align	2
.LEFDE88:
.LSFDE90:
	.4byte	.LEFDE90-.LASFDE90
.LASFDE90:
	.4byte	.Lframe0
	.4byte	.LFB45
	.4byte	.LFE45-.LFB45
	.byte	0x4
	.4byte	.LCFI113-.LFB45
	.byte	0xe
	.uleb128 0x4
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI114-.LCFI113
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.4byte	.LCFI115-.LCFI114
	.byte	0xe
	.uleb128 0x4
	.align	2
.LEFDE90:
.LSFDE92:
	.4byte	.LEFDE92-.LASFDE92
.LASFDE92:
	.4byte	.Lframe0
	.4byte	.LFB46
	.4byte	.LFE46-.LFB46
	.byte	0x4
	.4byte	.LCFI116-.LFB46
	.byte	0xe
	.uleb128 0x8
	.byte	0x83
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.align	2
.LEFDE92:
.LSFDE94:
	.4byte	.LEFDE94-.LASFDE94
.LASFDE94:
	.4byte	.Lframe0
	.4byte	.LFB47
	.4byte	.LFE47-.LFB47
	.byte	0x4
	.4byte	.LCFI117-.LFB47
	.byte	0xe
	.uleb128 0x8
	.byte	0x83
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.align	2
.LEFDE94:
.LSFDE96:
	.4byte	.LEFDE96-.LASFDE96
.LASFDE96:
	.4byte	.Lframe0
	.4byte	.LFB48
	.4byte	.LFE48-.LFB48
	.byte	0x4
	.4byte	.LCFI118-.LFB48
	.byte	0xe
	.uleb128 0x8
	.byte	0x83
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.align	2
.LEFDE96:
.LSFDE98:
	.4byte	.LEFDE98-.LASFDE98
.LASFDE98:
	.4byte	.Lframe0
	.4byte	.LFB49
	.4byte	.LFE49-.LFB49
	.byte	0x4
	.4byte	.LCFI119-.LFB49
	.byte	0xe
	.uleb128 0x4
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI120-.LCFI119
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI121-.LCFI120
	.byte	0xe
	.uleb128 0x4
	.align	2
.LEFDE98:
.LSFDE100:
	.4byte	.LEFDE100-.LASFDE100
.LASFDE100:
	.4byte	.Lframe0
	.4byte	.LFB50
	.4byte	.LFE50-.LFB50
	.byte	0x4
	.4byte	.LCFI122-.LFB50
	.byte	0xe
	.uleb128 0x4
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI123-.LCFI122
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI124-.LCFI123
	.byte	0xe
	.uleb128 0x4
	.align	2
.LEFDE100:
.LSFDE102:
	.4byte	.LEFDE102-.LASFDE102
.LASFDE102:
	.4byte	.Lframe0
	.4byte	.LFB51
	.4byte	.LFE51-.LFB51
	.byte	0x4
	.4byte	.LCFI125-.LFB51
	.byte	0xe
	.uleb128 0x4
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI126-.LCFI125
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI127-.LCFI126
	.byte	0xe
	.uleb128 0x4
	.align	2
.LEFDE102:
.LSFDE104:
	.4byte	.LEFDE104-.LASFDE104
.LASFDE104:
	.4byte	.Lframe0
	.4byte	.LFB52
	.4byte	.LFE52-.LFB52
	.byte	0x4
	.4byte	.LCFI128-.LFB52
	.byte	0xe
	.uleb128 0x4
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI129-.LCFI128
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.4byte	.LCFI130-.LCFI129
	.byte	0xe
	.uleb128 0x4
	.align	2
.LEFDE104:
.LSFDE106:
	.4byte	.LEFDE106-.LASFDE106
.LASFDE106:
	.4byte	.Lframe0
	.4byte	.LFB53
	.4byte	.LFE53-.LFB53
	.byte	0x4
	.4byte	.LCFI131-.LFB53
	.byte	0xe
	.uleb128 0x4
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI132-.LCFI131
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI133-.LCFI132
	.byte	0xe
	.uleb128 0x4
	.align	2
.LEFDE106:
.LSFDE108:
	.4byte	.LEFDE108-.LASFDE108
.LASFDE108:
	.4byte	.Lframe0
	.4byte	.LFB54
	.4byte	.LFE54-.LFB54
	.byte	0x4
	.4byte	.LCFI134-.LFB54
	.byte	0xe
	.uleb128 0x4
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI135-.LCFI134
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI136-.LCFI135
	.byte	0xe
	.uleb128 0x4
	.align	2
.LEFDE108:
.LSFDE110:
	.4byte	.LEFDE110-.LASFDE110
.LASFDE110:
	.4byte	.Lframe0
	.4byte	.LFB55
	.4byte	.LFE55-.LFB55
	.byte	0x4
	.4byte	.LCFI137-.LFB55
	.byte	0xe
	.uleb128 0x8
	.byte	0x83
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.align	2
.LEFDE110:
.LSFDE112:
	.4byte	.LEFDE112-.LASFDE112
.LASFDE112:
	.4byte	.Lframe0
	.4byte	.LFB56
	.4byte	.LFE56-.LFB56
	.byte	0x4
	.4byte	.LCFI138-.LFB56
	.byte	0xe
	.uleb128 0x4
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI139-.LCFI138
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.4byte	.LCFI140-.LCFI139
	.byte	0xe
	.uleb128 0x4
	.align	2
.LEFDE112:
.LSFDE114:
	.4byte	.LEFDE114-.LASFDE114
.LASFDE114:
	.4byte	.Lframe0
	.4byte	.LFB57
	.4byte	.LFE57-.LFB57
	.byte	0x4
	.4byte	.LCFI141-.LFB57
	.byte	0xe
	.uleb128 0x8
	.byte	0x84
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI142-.LCFI141
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI143-.LCFI142
	.byte	0xe
	.uleb128 0x8
	.align	2
.LEFDE114:
.LSFDE116:
	.4byte	.LEFDE116-.LASFDE116
.LASFDE116:
	.4byte	.Lframe0
	.4byte	.LFB58
	.4byte	.LFE58-.LFB58
	.byte	0x4
	.4byte	.LCFI144-.LFB58
	.byte	0xe
	.uleb128 0x4
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI145-.LCFI144
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI146-.LCFI145
	.byte	0xe
	.uleb128 0x4
	.align	2
.LEFDE116:
.LSFDE118:
	.4byte	.LEFDE118-.LASFDE118
.LASFDE118:
	.4byte	.Lframe0
	.4byte	.LFB59
	.4byte	.LFE59-.LFB59
	.byte	0x4
	.4byte	.LCFI147-.LFB59
	.byte	0xe
	.uleb128 0x4
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI148-.LCFI147
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI149-.LCFI148
	.byte	0xe
	.uleb128 0x4
	.align	2
.LEFDE118:
.LSFDE120:
	.4byte	.LEFDE120-.LASFDE120
.LASFDE120:
	.4byte	.Lframe0
	.4byte	.LFB60
	.4byte	.LFE60-.LFB60
	.byte	0x4
	.4byte	.LCFI150-.LFB60
	.byte	0xe
	.uleb128 0x4
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI151-.LCFI150
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.4byte	.LCFI152-.LCFI151
	.byte	0xe
	.uleb128 0x4
	.align	2
.LEFDE120:
.LSFDE122:
	.4byte	.LEFDE122-.LASFDE122
.LASFDE122:
	.4byte	.Lframe0
	.4byte	.LFB61
	.4byte	.LFE61-.LFB61
	.byte	0x4
	.4byte	.LCFI153-.LFB61
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI154-.LCFI153
	.byte	0xe
	.uleb128 0
	.align	2
.LEFDE122:
.LSFDE124:
	.4byte	.LEFDE124-.LASFDE124
.LASFDE124:
	.4byte	.Lframe0
	.4byte	.LFB62
	.4byte	.LFE62-.LFB62
	.byte	0x4
	.4byte	.LCFI155-.LFB62
	.byte	0xe
	.uleb128 0x8
	.byte	0x83
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.align	2
.LEFDE124:
.LSFDE126:
	.4byte	.LEFDE126-.LASFDE126
.LASFDE126:
	.4byte	.Lframe0
	.4byte	.LFB63
	.4byte	.LFE63-.LFB63
	.byte	0x4
	.4byte	.LCFI156-.LFB63
	.byte	0xe
	.uleb128 0x8
	.byte	0x84
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI157-.LCFI156
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.4byte	.LCFI158-.LCFI157
	.byte	0xe
	.uleb128 0x8
	.align	2
.LEFDE126:
.LSFDE128:
	.4byte	.LEFDE128-.LASFDE128
.LASFDE128:
	.4byte	.Lframe0
	.4byte	.LFB64
	.4byte	.LFE64-.LFB64
	.byte	0x4
	.4byte	.LCFI159-.LFB64
	.byte	0xe
	.uleb128 0x8
	.byte	0x84
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI160-.LCFI159
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.4byte	.LCFI161-.LCFI160
	.byte	0xe
	.uleb128 0x8
	.align	2
.LEFDE128:
.LSFDE130:
	.4byte	.LEFDE130-.LASFDE130
.LASFDE130:
	.4byte	.Lframe0
	.4byte	.LFB65
	.4byte	.LFE65-.LFB65
	.byte	0x4
	.4byte	.LCFI162-.LFB65
	.byte	0xe
	.uleb128 0x4
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI163-.LCFI162
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.4byte	.LCFI164-.LCFI163
	.byte	0xe
	.uleb128 0x4
	.align	2
.LEFDE130:
.LSFDE132:
	.4byte	.LEFDE132-.LASFDE132
.LASFDE132:
	.4byte	.Lframe0
	.4byte	.LFB66
	.4byte	.LFE66-.LFB66
	.byte	0x4
	.4byte	.LCFI165-.LFB66
	.byte	0xe
	.uleb128 0x4
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI166-.LCFI165
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.4byte	.LCFI167-.LCFI166
	.byte	0xe
	.uleb128 0x4
	.align	2
.LEFDE132:
.LSFDE134:
	.4byte	.LEFDE134-.LASFDE134
.LASFDE134:
	.4byte	.Lframe0
	.4byte	.LFB67
	.4byte	.LFE67-.LFB67
	.byte	0x4
	.4byte	.LCFI168-.LFB67
	.byte	0xe
	.uleb128 0x8
	.byte	0x83
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.align	2
.LEFDE134:
.LSFDE136:
	.4byte	.LEFDE136-.LASFDE136
.LASFDE136:
	.4byte	.Lframe0
	.4byte	.LFB68
	.4byte	.LFE68-.LFB68
	.byte	0x4
	.4byte	.LCFI169-.LFB68
	.byte	0xe
	.uleb128 0x4
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI170-.LCFI169
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI171-.LCFI170
	.byte	0xe
	.uleb128 0x4
	.align	2
.LEFDE136:
.LSFDE138:
	.4byte	.LEFDE138-.LASFDE138
.LASFDE138:
	.4byte	.Lframe0
	.4byte	.LFB69
	.4byte	.LFE69-.LFB69
	.byte	0x4
	.4byte	.LCFI172-.LFB69
	.byte	0xe
	.uleb128 0x4
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI173-.LCFI172
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.4byte	.LCFI174-.LCFI173
	.byte	0xe
	.uleb128 0x4
	.align	2
.LEFDE138:
.LSFDE140:
	.4byte	.LEFDE140-.LASFDE140
.LASFDE140:
	.4byte	.Lframe0
	.4byte	.LFB70
	.4byte	.LFE70-.LFB70
	.byte	0x4
	.4byte	.LCFI175-.LFB70
	.byte	0xe
	.uleb128 0x4
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI176-.LCFI175
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI177-.LCFI176
	.byte	0xe
	.uleb128 0x4
	.align	2
.LEFDE140:
.LSFDE142:
	.4byte	.LEFDE142-.LASFDE142
.LASFDE142:
	.4byte	.Lframe0
	.4byte	.LFB71
	.4byte	.LFE71-.LFB71
	.byte	0x4
	.4byte	.LCFI178-.LFB71
	.byte	0xe
	.uleb128 0x4
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI179-.LCFI178
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI180-.LCFI179
	.byte	0xe
	.uleb128 0x4
	.align	2
.LEFDE142:
.LSFDE144:
	.4byte	.LEFDE144-.LASFDE144
.LASFDE144:
	.4byte	.Lframe0
	.4byte	.LFB72
	.4byte	.LFE72-.LFB72
	.byte	0x4
	.4byte	.LCFI181-.LFB72
	.byte	0xe
	.uleb128 0x4
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI182-.LCFI181
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.4byte	.LCFI183-.LCFI182
	.byte	0xe
	.uleb128 0x4
	.align	2
.LEFDE144:
.LSFDE146:
	.4byte	.LEFDE146-.LASFDE146
.LASFDE146:
	.4byte	.Lframe0
	.4byte	.LFB73
	.4byte	.LFE73-.LFB73
	.byte	0x4
	.4byte	.LCFI184-.LFB73
	.byte	0xe
	.uleb128 0x4
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI185-.LCFI184
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.4byte	.LCFI186-.LCFI185
	.byte	0xe
	.uleb128 0x4
	.align	2
.LEFDE146:
.LSFDE148:
	.4byte	.LEFDE148-.LASFDE148
.LASFDE148:
	.4byte	.Lframe0
	.4byte	.LFB74
	.4byte	.LFE74-.LFB74
	.byte	0x4
	.4byte	.LCFI187-.LFB74
	.byte	0xe
	.uleb128 0x4
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI188-.LCFI187
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI189-.LCFI188
	.byte	0xe
	.uleb128 0x4
	.align	2
.LEFDE148:
.LSFDE150:
	.4byte	.LEFDE150-.LASFDE150
.LASFDE150:
	.4byte	.Lframe0
	.4byte	.LFB75
	.4byte	.LFE75-.LFB75
	.byte	0x4
	.4byte	.LCFI190-.LFB75
	.byte	0xe
	.uleb128 0x4
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI191-.LCFI190
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.4byte	.LCFI192-.LCFI191
	.byte	0xe
	.uleb128 0x4
	.align	2
.LEFDE150:
.LSFDE152:
	.4byte	.LEFDE152-.LASFDE152
.LASFDE152:
	.4byte	.Lframe0
	.4byte	.LFB76
	.4byte	.LFE76-.LFB76
	.byte	0x4
	.4byte	.LCFI193-.LFB76
	.byte	0xe
	.uleb128 0x4
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI194-.LCFI193
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.4byte	.LCFI195-.LCFI194
	.byte	0xe
	.uleb128 0x4
	.align	2
.LEFDE152:
.LSFDE154:
	.4byte	.LEFDE154-.LASFDE154
.LASFDE154:
	.4byte	.Lframe0
	.4byte	.LFB77
	.4byte	.LFE77-.LFB77
	.byte	0x4
	.4byte	.LCFI196-.LFB77
	.byte	0xe
	.uleb128 0x4
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI197-.LCFI196
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI198-.LCFI197
	.byte	0xe
	.uleb128 0x4
	.align	2
.LEFDE154:
.LSFDE156:
	.4byte	.LEFDE156-.LASFDE156
.LASFDE156:
	.4byte	.Lframe0
	.4byte	.LFB78
	.4byte	.LFE78-.LFB78
	.byte	0x4
	.4byte	.LCFI199-.LFB78
	.byte	0xe
	.uleb128 0x4
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI200-.LCFI199
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.4byte	.LCFI201-.LCFI200
	.byte	0xe
	.uleb128 0x4
	.align	2
.LEFDE156:
.LSFDE158:
	.4byte	.LEFDE158-.LASFDE158
.LASFDE158:
	.4byte	.Lframe0
	.4byte	.LFB79
	.4byte	.LFE79-.LFB79
	.byte	0x4
	.4byte	.LCFI202-.LFB79
	.byte	0xe
	.uleb128 0x4
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI203-.LCFI202
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI204-.LCFI203
	.byte	0xe
	.uleb128 0x4
	.align	2
.LEFDE158:
.LSFDE160:
	.4byte	.LEFDE160-.LASFDE160
.LASFDE160:
	.4byte	.Lframe0
	.4byte	.LFB80
	.4byte	.LFE80-.LFB80
	.byte	0x4
	.4byte	.LCFI205-.LFB80
	.byte	0xe
	.uleb128 0x4
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI206-.LCFI205
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.4byte	.LCFI207-.LCFI206
	.byte	0xe
	.uleb128 0x4
	.align	2
.LEFDE160:
.LSFDE162:
	.4byte	.LEFDE162-.LASFDE162
.LASFDE162:
	.4byte	.Lframe0
	.4byte	.LFB81
	.4byte	.LFE81-.LFB81
	.byte	0x4
	.4byte	.LCFI208-.LFB81
	.byte	0xe
	.uleb128 0x8
	.byte	0x83
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.align	2
.LEFDE162:
.LSFDE164:
	.4byte	.LEFDE164-.LASFDE164
.LASFDE164:
	.4byte	.Lframe0
	.4byte	.LFB82
	.4byte	.LFE82-.LFB82
	.byte	0x4
	.4byte	.LCFI209-.LFB82
	.byte	0xe
	.uleb128 0x8
	.byte	0x83
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.align	2
.LEFDE164:
.LSFDE166:
	.4byte	.LEFDE166-.LASFDE166
.LASFDE166:
	.4byte	.Lframe0
	.4byte	.LFB83
	.4byte	.LFE83-.LFB83
	.byte	0x4
	.4byte	.LCFI210-.LFB83
	.byte	0xe
	.uleb128 0x4
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI211-.LCFI210
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.4byte	.LCFI212-.LCFI211
	.byte	0xe
	.uleb128 0x4
	.align	2
.LEFDE166:
.LSFDE168:
	.4byte	.LEFDE168-.LASFDE168
.LASFDE168:
	.4byte	.Lframe0
	.4byte	.LFB84
	.4byte	.LFE84-.LFB84
	.align	2
.LEFDE168:
.LSFDE170:
	.4byte	.LEFDE170-.LASFDE170
.LASFDE170:
	.4byte	.Lframe0
	.4byte	.LFB85
	.4byte	.LFE85-.LFB85
	.byte	0x4
	.4byte	.LCFI213-.LFB85
	.byte	0xe
	.uleb128 0x4
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI214-.LCFI213
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI215-.LCFI214
	.byte	0xe
	.uleb128 0x4
	.align	2
.LEFDE170:
.LSFDE172:
	.4byte	.LEFDE172-.LASFDE172
.LASFDE172:
	.4byte	.Lframe0
	.4byte	.LFB86
	.4byte	.LFE86-.LFB86
	.byte	0x4
	.4byte	.LCFI216-.LFB86
	.byte	0xe
	.uleb128 0x4
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI217-.LCFI216
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI218-.LCFI217
	.byte	0xe
	.uleb128 0x4
	.align	2
.LEFDE172:
.LSFDE174:
	.4byte	.LEFDE174-.LASFDE174
.LASFDE174:
	.4byte	.Lframe0
	.4byte	.LFB87
	.4byte	.LFE87-.LFB87
	.byte	0x4
	.4byte	.LCFI219-.LFB87
	.byte	0xe
	.uleb128 0x4
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI220-.LCFI219
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.4byte	.LCFI221-.LCFI220
	.byte	0xe
	.uleb128 0x4
	.align	2
.LEFDE174:
.LSFDE176:
	.4byte	.LEFDE176-.LASFDE176
.LASFDE176:
	.4byte	.Lframe0
	.4byte	.LFB88
	.4byte	.LFE88-.LFB88
	.byte	0x4
	.4byte	.LCFI222-.LFB88
	.byte	0xe
	.uleb128 0x8
	.byte	0x83
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.align	2
.LEFDE176:
.LSFDE178:
	.4byte	.LEFDE178-.LASFDE178
.LASFDE178:
	.4byte	.Lframe0
	.4byte	.LFB89
	.4byte	.LFE89-.LFB89
	.byte	0x4
	.4byte	.LCFI223-.LFB89
	.byte	0xe
	.uleb128 0x8
	.byte	0x83
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.align	2
.LEFDE178:
.LSFDE180:
	.4byte	.LEFDE180-.LASFDE180
.LASFDE180:
	.4byte	.Lframe0
	.4byte	.LFB90
	.4byte	.LFE90-.LFB90
	.byte	0x4
	.4byte	.LCFI224-.LFB90
	.byte	0xe
	.uleb128 0x4
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI225-.LCFI224
	.byte	0xe
	.uleb128 0x38
	.byte	0x4
	.4byte	.LCFI226-.LCFI225
	.byte	0xe
	.uleb128 0x4
	.align	2
.LEFDE180:
.LSFDE182:
	.4byte	.LEFDE182-.LASFDE182
.LASFDE182:
	.4byte	.Lframe0
	.4byte	.LFB91
	.4byte	.LFE91-.LFB91
	.byte	0x4
	.4byte	.LCFI227-.LFB91
	.byte	0xe
	.uleb128 0x20
	.byte	0x4
	.4byte	.LCFI228-.LCFI227
	.byte	0xe
	.uleb128 0
	.align	2
.LEFDE182:
.LSFDE184:
	.4byte	.LEFDE184-.LASFDE184
.LASFDE184:
	.4byte	.Lframe0
	.4byte	.LFB92
	.4byte	.LFE92-.LFB92
	.byte	0x4
	.4byte	.LCFI229-.LFB92
	.byte	0xe
	.uleb128 0x8
	.byte	0x84
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI230-.LCFI229
	.byte	0xe
	.uleb128 0x30
	.byte	0x4
	.4byte	.LCFI231-.LCFI230
	.byte	0xe
	.uleb128 0x8
	.align	2
.LEFDE184:
.LSFDE186:
	.4byte	.LEFDE186-.LASFDE186
.LASFDE186:
	.4byte	.Lframe0
	.4byte	.LFB93
	.4byte	.LFE93-.LFB93
	.byte	0x4
	.4byte	.LCFI232-.LFB93
	.byte	0xe
	.uleb128 0x4
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI233-.LCFI232
	.byte	0xe
	.uleb128 0x28
	.byte	0x4
	.4byte	.LCFI234-.LCFI233
	.byte	0xe
	.uleb128 0x4
	.align	2
.LEFDE186:
	.text
.Letext0:
	.file 2 "C:/Program Files/SEGGER/SEGGER Embedded Studio for ARM 4.22/include/__crossworks.h"
	.file 3 "C:\\Users\\vikra\\Desktop\\decawave-ble\\NRF_UWB_Combo\\deca_driver\\deca_types.h"
	.file 4 "C:\\Users\\vikra\\Desktop\\decawave-ble\\NRF_UWB_Combo\\deca_driver\\deca_param_types.h"
	.file 5 "C:\\Users\\vikra\\Desktop\\decawave-ble\\NRF_UWB_Combo\\deca_driver\\deca_device_api.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x220f
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF1867
	.byte	0xc
	.4byte	.LASF1868
	.4byte	.LASF1869
	.4byte	.Ldebug_ranges0+0
	.4byte	0
	.4byte	.Ldebug_line0
	.4byte	.Ldebug_macro0
	.uleb128 0x2
	.4byte	.LASF1564
	.byte	0x8
	.byte	0x2
	.byte	0x7e
	.byte	0x8
	.4byte	0x51
	.uleb128 0x3
	.4byte	.LASF1512
	.byte	0x2
	.byte	0x7f
	.byte	0x7
	.4byte	0x51
	.byte	0
	.uleb128 0x3
	.4byte	.LASF1513
	.byte	0x2
	.byte	0x80
	.byte	0x8
	.4byte	0x5d
	.byte	0x4
	.byte	0
	.uleb128 0x4
	.byte	0x4
	.byte	0x5
	.ascii	"int\000"
	.uleb128 0x5
	.4byte	0x51
	.uleb128 0x6
	.byte	0x4
	.byte	0x5
	.4byte	.LASF1514
	.uleb128 0x7
	.4byte	0x51
	.4byte	0x7d
	.uleb128 0x8
	.4byte	0x7d
	.uleb128 0x8
	.4byte	0x8f
	.uleb128 0x8
	.4byte	0x96
	.byte	0
	.uleb128 0x9
	.byte	0x4
	.4byte	0x83
	.uleb128 0x6
	.byte	0x1
	.byte	0x8
	.4byte	.LASF1515
	.uleb128 0x5
	.4byte	0x83
	.uleb128 0x6
	.byte	0x4
	.byte	0x7
	.4byte	.LASF1516
	.uleb128 0x9
	.byte	0x4
	.4byte	0x29
	.uleb128 0x7
	.4byte	0x51
	.4byte	0xba
	.uleb128 0x8
	.4byte	0xba
	.uleb128 0x8
	.4byte	0xc0
	.uleb128 0x8
	.4byte	0x8f
	.uleb128 0x8
	.4byte	0x96
	.byte	0
	.uleb128 0x9
	.byte	0x4
	.4byte	0x8f
	.uleb128 0x9
	.byte	0x4
	.4byte	0x8a
	.uleb128 0xa
	.byte	0x58
	.byte	0x2
	.byte	0x86
	.byte	0x9
	.4byte	0x270
	.uleb128 0x3
	.4byte	.LASF1517
	.byte	0x2
	.byte	0x88
	.byte	0xf
	.4byte	0xc0
	.byte	0
	.uleb128 0x3
	.4byte	.LASF1518
	.byte	0x2
	.byte	0x89
	.byte	0xf
	.4byte	0xc0
	.byte	0x4
	.uleb128 0x3
	.4byte	.LASF1519
	.byte	0x2
	.byte	0x8a
	.byte	0xf
	.4byte	0xc0
	.byte	0x8
	.uleb128 0x3
	.4byte	.LASF1520
	.byte	0x2
	.byte	0x8c
	.byte	0xf
	.4byte	0xc0
	.byte	0xc
	.uleb128 0x3
	.4byte	.LASF1521
	.byte	0x2
	.byte	0x8d
	.byte	0xf
	.4byte	0xc0
	.byte	0x10
	.uleb128 0x3
	.4byte	.LASF1522
	.byte	0x2
	.byte	0x8e
	.byte	0xf
	.4byte	0xc0
	.byte	0x14
	.uleb128 0x3
	.4byte	.LASF1523
	.byte	0x2
	.byte	0x8f
	.byte	0xf
	.4byte	0xc0
	.byte	0x18
	.uleb128 0x3
	.4byte	.LASF1524
	.byte	0x2
	.byte	0x90
	.byte	0xf
	.4byte	0xc0
	.byte	0x1c
	.uleb128 0x3
	.4byte	.LASF1525
	.byte	0x2
	.byte	0x91
	.byte	0xf
	.4byte	0xc0
	.byte	0x20
	.uleb128 0x3
	.4byte	.LASF1526
	.byte	0x2
	.byte	0x92
	.byte	0xf
	.4byte	0xc0
	.byte	0x24
	.uleb128 0x3
	.4byte	.LASF1527
	.byte	0x2
	.byte	0x94
	.byte	0x8
	.4byte	0x83
	.byte	0x28
	.uleb128 0x3
	.4byte	.LASF1528
	.byte	0x2
	.byte	0x95
	.byte	0x8
	.4byte	0x83
	.byte	0x29
	.uleb128 0x3
	.4byte	.LASF1529
	.byte	0x2
	.byte	0x96
	.byte	0x8
	.4byte	0x83
	.byte	0x2a
	.uleb128 0x3
	.4byte	.LASF1530
	.byte	0x2
	.byte	0x97
	.byte	0x8
	.4byte	0x83
	.byte	0x2b
	.uleb128 0x3
	.4byte	.LASF1531
	.byte	0x2
	.byte	0x98
	.byte	0x8
	.4byte	0x83
	.byte	0x2c
	.uleb128 0x3
	.4byte	.LASF1532
	.byte	0x2
	.byte	0x99
	.byte	0x8
	.4byte	0x83
	.byte	0x2d
	.uleb128 0x3
	.4byte	.LASF1533
	.byte	0x2
	.byte	0x9a
	.byte	0x8
	.4byte	0x83
	.byte	0x2e
	.uleb128 0x3
	.4byte	.LASF1534
	.byte	0x2
	.byte	0x9b
	.byte	0x8
	.4byte	0x83
	.byte	0x2f
	.uleb128 0x3
	.4byte	.LASF1535
	.byte	0x2
	.byte	0x9c
	.byte	0x8
	.4byte	0x83
	.byte	0x30
	.uleb128 0x3
	.4byte	.LASF1536
	.byte	0x2
	.byte	0x9d
	.byte	0x8
	.4byte	0x83
	.byte	0x31
	.uleb128 0x3
	.4byte	.LASF1537
	.byte	0x2
	.byte	0x9e
	.byte	0x8
	.4byte	0x83
	.byte	0x32
	.uleb128 0x3
	.4byte	.LASF1538
	.byte	0x2
	.byte	0x9f
	.byte	0x8
	.4byte	0x83
	.byte	0x33
	.uleb128 0x3
	.4byte	.LASF1539
	.byte	0x2
	.byte	0xa0
	.byte	0x8
	.4byte	0x83
	.byte	0x34
	.uleb128 0x3
	.4byte	.LASF1540
	.byte	0x2
	.byte	0xa1
	.byte	0x8
	.4byte	0x83
	.byte	0x35
	.uleb128 0x3
	.4byte	.LASF1541
	.byte	0x2
	.byte	0xa6
	.byte	0xf
	.4byte	0xc0
	.byte	0x38
	.uleb128 0x3
	.4byte	.LASF1542
	.byte	0x2
	.byte	0xa7
	.byte	0xf
	.4byte	0xc0
	.byte	0x3c
	.uleb128 0x3
	.4byte	.LASF1543
	.byte	0x2
	.byte	0xa8
	.byte	0xf
	.4byte	0xc0
	.byte	0x40
	.uleb128 0x3
	.4byte	.LASF1544
	.byte	0x2
	.byte	0xa9
	.byte	0xf
	.4byte	0xc0
	.byte	0x44
	.uleb128 0x3
	.4byte	.LASF1545
	.byte	0x2
	.byte	0xaa
	.byte	0xf
	.4byte	0xc0
	.byte	0x48
	.uleb128 0x3
	.4byte	.LASF1546
	.byte	0x2
	.byte	0xab
	.byte	0xf
	.4byte	0xc0
	.byte	0x4c
	.uleb128 0x3
	.4byte	.LASF1547
	.byte	0x2
	.byte	0xac
	.byte	0xf
	.4byte	0xc0
	.byte	0x50
	.uleb128 0x3
	.4byte	.LASF1548
	.byte	0x2
	.byte	0xad
	.byte	0xf
	.4byte	0xc0
	.byte	0x54
	.byte	0
	.uleb128 0xb
	.4byte	.LASF1558
	.byte	0x2
	.byte	0xae
	.byte	0x3
	.4byte	0xc6
	.uleb128 0x5
	.4byte	0x270
	.uleb128 0x6
	.byte	0x1
	.byte	0x8
	.4byte	.LASF1549
	.uleb128 0x5
	.4byte	0x281
	.uleb128 0xa
	.byte	0x20
	.byte	0x2
	.byte	0xc4
	.byte	0x9
	.4byte	0x2ff
	.uleb128 0x3
	.4byte	.LASF1550
	.byte	0x2
	.byte	0xc6
	.byte	0x9
	.4byte	0x313
	.byte	0
	.uleb128 0x3
	.4byte	.LASF1551
	.byte	0x2
	.byte	0xc7
	.byte	0x9
	.4byte	0x328
	.byte	0x4
	.uleb128 0x3
	.4byte	.LASF1552
	.byte	0x2
	.byte	0xc8
	.byte	0x9
	.4byte	0x328
	.byte	0x8
	.uleb128 0x3
	.4byte	.LASF1553
	.byte	0x2
	.byte	0xcb
	.byte	0x9
	.4byte	0x342
	.byte	0xc
	.uleb128 0x3
	.4byte	.LASF1554
	.byte	0x2
	.byte	0xcc
	.byte	0xa
	.4byte	0x357
	.byte	0x10
	.uleb128 0x3
	.4byte	.LASF1555
	.byte	0x2
	.byte	0xcd
	.byte	0xa
	.4byte	0x357
	.byte	0x14
	.uleb128 0x3
	.4byte	.LASF1556
	.byte	0x2
	.byte	0xd0
	.byte	0x9
	.4byte	0x35d
	.byte	0x18
	.uleb128 0x3
	.4byte	.LASF1557
	.byte	0x2
	.byte	0xd1
	.byte	0x9
	.4byte	0x363
	.byte	0x1c
	.byte	0
	.uleb128 0x7
	.4byte	0x51
	.4byte	0x313
	.uleb128 0x8
	.4byte	0x51
	.uleb128 0x8
	.4byte	0x51
	.byte	0
	.uleb128 0x9
	.byte	0x4
	.4byte	0x2ff
	.uleb128 0x7
	.4byte	0x51
	.4byte	0x328
	.uleb128 0x8
	.4byte	0x51
	.byte	0
	.uleb128 0x9
	.byte	0x4
	.4byte	0x319
	.uleb128 0x7
	.4byte	0x51
	.4byte	0x342
	.uleb128 0x8
	.4byte	0x5d
	.uleb128 0x8
	.4byte	0x51
	.byte	0
	.uleb128 0x9
	.byte	0x4
	.4byte	0x32e
	.uleb128 0x7
	.4byte	0x5d
	.4byte	0x357
	.uleb128 0x8
	.4byte	0x5d
	.byte	0
	.uleb128 0x9
	.byte	0x4
	.4byte	0x348
	.uleb128 0x9
	.byte	0x4
	.4byte	0x64
	.uleb128 0x9
	.byte	0x4
	.4byte	0x9c
	.uleb128 0xb
	.4byte	.LASF1559
	.byte	0x2
	.byte	0xd2
	.byte	0x3
	.4byte	0x28d
	.uleb128 0x5
	.4byte	0x369
	.uleb128 0xa
	.byte	0xc
	.byte	0x2
	.byte	0xd4
	.byte	0x9
	.4byte	0x3ab
	.uleb128 0x3
	.4byte	.LASF1560
	.byte	0x2
	.byte	0xd5
	.byte	0xf
	.4byte	0xc0
	.byte	0
	.uleb128 0x3
	.4byte	.LASF1561
	.byte	0x2
	.byte	0xd6
	.byte	0x25
	.4byte	0x3ab
	.byte	0x4
	.uleb128 0x3
	.4byte	.LASF1562
	.byte	0x2
	.byte	0xd7
	.byte	0x28
	.4byte	0x3b1
	.byte	0x8
	.byte	0
	.uleb128 0x9
	.byte	0x4
	.4byte	0x27c
	.uleb128 0x9
	.byte	0x4
	.4byte	0x375
	.uleb128 0xb
	.4byte	.LASF1563
	.byte	0x2
	.byte	0xd8
	.byte	0x3
	.4byte	0x37a
	.uleb128 0x5
	.4byte	0x3b7
	.uleb128 0x2
	.4byte	.LASF1565
	.byte	0x14
	.byte	0x2
	.byte	0xdc
	.byte	0x10
	.4byte	0x3e3
	.uleb128 0x3
	.4byte	.LASF1566
	.byte	0x2
	.byte	0xdd
	.byte	0x20
	.4byte	0x3e3
	.byte	0
	.byte	0
	.uleb128 0xc
	.4byte	0x3f3
	.4byte	0x3f3
	.uleb128 0xd
	.4byte	0x8f
	.byte	0x4
	.byte	0
	.uleb128 0x9
	.byte	0x4
	.4byte	0x3c3
	.uleb128 0xe
	.4byte	.LASF1567
	.byte	0x2
	.2byte	0x106
	.byte	0x1a
	.4byte	0x3c8
	.uleb128 0xe
	.4byte	.LASF1568
	.byte	0x2
	.2byte	0x10d
	.byte	0x24
	.4byte	0x3c3
	.uleb128 0xe
	.4byte	.LASF1569
	.byte	0x2
	.2byte	0x110
	.byte	0x2c
	.4byte	0x375
	.uleb128 0xe
	.4byte	.LASF1570
	.byte	0x2
	.2byte	0x111
	.byte	0x2c
	.4byte	0x375
	.uleb128 0xc
	.4byte	0x288
	.4byte	0x43d
	.uleb128 0xd
	.4byte	0x8f
	.byte	0x7f
	.byte	0
	.uleb128 0x5
	.4byte	0x42d
	.uleb128 0xe
	.4byte	.LASF1571
	.byte	0x2
	.2byte	0x113
	.byte	0x23
	.4byte	0x43d
	.uleb128 0xc
	.4byte	0x8a
	.4byte	0x45a
	.uleb128 0xf
	.byte	0
	.uleb128 0x5
	.4byte	0x44f
	.uleb128 0xe
	.4byte	.LASF1572
	.byte	0x2
	.2byte	0x115
	.byte	0x13
	.4byte	0x45a
	.uleb128 0xe
	.4byte	.LASF1573
	.byte	0x2
	.2byte	0x116
	.byte	0x13
	.4byte	0x45a
	.uleb128 0xe
	.4byte	.LASF1574
	.byte	0x2
	.2byte	0x117
	.byte	0x13
	.4byte	0x45a
	.uleb128 0xe
	.4byte	.LASF1575
	.byte	0x2
	.2byte	0x118
	.byte	0x13
	.4byte	0x45a
	.uleb128 0xe
	.4byte	.LASF1576
	.byte	0x2
	.2byte	0x11a
	.byte	0x13
	.4byte	0x45a
	.uleb128 0xe
	.4byte	.LASF1577
	.byte	0x2
	.2byte	0x11b
	.byte	0x13
	.4byte	0x45a
	.uleb128 0xe
	.4byte	.LASF1578
	.byte	0x2
	.2byte	0x11c
	.byte	0x13
	.4byte	0x45a
	.uleb128 0xe
	.4byte	.LASF1579
	.byte	0x2
	.2byte	0x11d
	.byte	0x13
	.4byte	0x45a
	.uleb128 0xe
	.4byte	.LASF1580
	.byte	0x2
	.2byte	0x11e
	.byte	0x13
	.4byte	0x45a
	.uleb128 0xe
	.4byte	.LASF1581
	.byte	0x2
	.2byte	0x11f
	.byte	0x13
	.4byte	0x45a
	.uleb128 0x7
	.4byte	0x51
	.4byte	0x4f0
	.uleb128 0x8
	.4byte	0x4f0
	.byte	0
	.uleb128 0x9
	.byte	0x4
	.4byte	0x4fb
	.uleb128 0x10
	.4byte	.LASF1870
	.uleb128 0x5
	.4byte	0x4f6
	.uleb128 0xe
	.4byte	.LASF1582
	.byte	0x2
	.2byte	0x135
	.byte	0xe
	.4byte	0x50d
	.uleb128 0x9
	.byte	0x4
	.4byte	0x4e1
	.uleb128 0x7
	.4byte	0x51
	.4byte	0x522
	.uleb128 0x8
	.4byte	0x522
	.byte	0
	.uleb128 0x9
	.byte	0x4
	.4byte	0x4f6
	.uleb128 0xe
	.4byte	.LASF1583
	.byte	0x2
	.2byte	0x136
	.byte	0xe
	.4byte	0x535
	.uleb128 0x9
	.byte	0x4
	.4byte	0x513
	.uleb128 0x6
	.byte	0x2
	.byte	0x7
	.4byte	.LASF1584
	.uleb128 0x11
	.4byte	.LASF1585
	.byte	0x2
	.2byte	0x14d
	.byte	0x18
	.4byte	0x54f
	.uleb128 0x9
	.byte	0x4
	.4byte	0x555
	.uleb128 0x7
	.4byte	0xc0
	.4byte	0x564
	.uleb128 0x8
	.4byte	0x51
	.byte	0
	.uleb128 0x12
	.4byte	.LASF1586
	.byte	0x8
	.byte	0x2
	.2byte	0x14f
	.byte	0x10
	.4byte	0x58f
	.uleb128 0x13
	.4byte	.LASF1587
	.byte	0x2
	.2byte	0x151
	.byte	0x1c
	.4byte	0x542
	.byte	0
	.uleb128 0x13
	.4byte	.LASF1588
	.byte	0x2
	.2byte	0x152
	.byte	0x21
	.4byte	0x58f
	.byte	0x4
	.byte	0
	.uleb128 0x9
	.byte	0x4
	.4byte	0x564
	.uleb128 0x11
	.4byte	.LASF1589
	.byte	0x2
	.2byte	0x153
	.byte	0x3
	.4byte	0x564
	.uleb128 0xe
	.4byte	.LASF1590
	.byte	0x2
	.2byte	0x157
	.byte	0x1f
	.4byte	0x5af
	.uleb128 0x9
	.byte	0x4
	.4byte	0x595
	.uleb128 0x6
	.byte	0x8
	.byte	0x5
	.4byte	.LASF1591
	.uleb128 0xb
	.4byte	.LASF1592
	.byte	0x3
	.byte	0x17
	.byte	0x17
	.4byte	0x281
	.uleb128 0x5
	.4byte	0x5bc
	.uleb128 0xb
	.4byte	.LASF1593
	.byte	0x3
	.byte	0x1e
	.byte	0x18
	.4byte	0x53b
	.uleb128 0x5
	.4byte	0x5cd
	.uleb128 0xb
	.4byte	.LASF1594
	.byte	0x3
	.byte	0x25
	.byte	0x17
	.4byte	0x5ef
	.uleb128 0x5
	.4byte	0x5de
	.uleb128 0x6
	.byte	0x4
	.byte	0x7
	.4byte	.LASF1595
	.uleb128 0x6
	.byte	0x1
	.byte	0x6
	.4byte	.LASF1596
	.uleb128 0x6
	.byte	0x2
	.byte	0x5
	.4byte	.LASF1597
	.uleb128 0xb
	.4byte	.LASF1598
	.byte	0x3
	.byte	0x3a
	.byte	0x15
	.4byte	0x5d
	.uleb128 0xa
	.byte	0x8
	.byte	0x4
	.byte	0x1e
	.byte	0x9
	.4byte	0x634
	.uleb128 0x3
	.4byte	.LASF1599
	.byte	0x4
	.byte	0x1f
	.byte	0xc
	.4byte	0x5de
	.byte	0
	.uleb128 0x3
	.4byte	.LASF1600
	.byte	0x4
	.byte	0x20
	.byte	0xc
	.4byte	0x634
	.byte	0x4
	.byte	0
	.uleb128 0xc
	.4byte	0x5cd
	.4byte	0x644
	.uleb128 0xd
	.4byte	0x8f
	.byte	0x1
	.byte	0
	.uleb128 0xb
	.4byte	.LASF1601
	.byte	0x4
	.byte	0x21
	.byte	0x3
	.4byte	0x610
	.uleb128 0x5
	.4byte	0x644
	.uleb128 0x14
	.4byte	.LASF1602
	.byte	0x4
	.byte	0x23
	.byte	0x1d
	.4byte	0x650
	.uleb128 0xc
	.4byte	0x5d9
	.4byte	0x677
	.uleb128 0xd
	.4byte	0x8f
	.byte	0x2
	.uleb128 0xd
	.4byte	0x8f
	.byte	0x1
	.byte	0
	.uleb128 0x5
	.4byte	0x661
	.uleb128 0x14
	.4byte	.LASF1603
	.byte	0x4
	.byte	0x26
	.byte	0x15
	.4byte	0x677
	.uleb128 0xc
	.4byte	0x5d9
	.4byte	0x698
	.uleb128 0xd
	.4byte	0x8f
	.byte	0x1
	.byte	0
	.uleb128 0x5
	.4byte	0x688
	.uleb128 0x14
	.4byte	.LASF1604
	.byte	0x4
	.byte	0x28
	.byte	0x15
	.4byte	0x698
	.uleb128 0xc
	.4byte	0x5ea
	.4byte	0x6b9
	.uleb128 0xd
	.4byte	0x8f
	.byte	0x5
	.byte	0
	.uleb128 0x5
	.4byte	0x6a9
	.uleb128 0x14
	.4byte	.LASF1605
	.byte	0x4
	.byte	0x2c
	.byte	0x15
	.4byte	0x6b9
	.uleb128 0xc
	.4byte	0x5c8
	.4byte	0x6da
	.uleb128 0xd
	.4byte	0x8f
	.byte	0x5
	.byte	0
	.uleb128 0x5
	.4byte	0x6ca
	.uleb128 0x14
	.4byte	.LASF1606
	.byte	0x4
	.byte	0x2d
	.byte	0x14
	.4byte	0x6da
	.uleb128 0xc
	.4byte	0x5c8
	.4byte	0x6fb
	.uleb128 0xd
	.4byte	0x8f
	.byte	0x1
	.byte	0
	.uleb128 0x5
	.4byte	0x6eb
	.uleb128 0x14
	.4byte	.LASF1607
	.byte	0x4
	.byte	0x2e
	.byte	0x14
	.4byte	0x6fb
	.uleb128 0x14
	.4byte	.LASF1608
	.byte	0x4
	.byte	0x2f
	.byte	0x15
	.4byte	0x6b9
	.uleb128 0xc
	.4byte	0x5c8
	.4byte	0x728
	.uleb128 0xd
	.4byte	0x8f
	.byte	0x2
	.byte	0
	.uleb128 0x5
	.4byte	0x718
	.uleb128 0x14
	.4byte	.LASF1609
	.byte	0x4
	.byte	0x30
	.byte	0x14
	.4byte	0x728
	.uleb128 0xc
	.4byte	0x5ea
	.4byte	0x74f
	.uleb128 0xd
	.4byte	0x8f
	.byte	0x1
	.uleb128 0xd
	.4byte	0x8f
	.byte	0x3
	.byte	0
	.uleb128 0x5
	.4byte	0x739
	.uleb128 0x14
	.4byte	.LASF1610
	.byte	0x4
	.byte	0x31
	.byte	0x15
	.4byte	0x74f
	.uleb128 0xc
	.4byte	0x5c8
	.4byte	0x770
	.uleb128 0xd
	.4byte	0x8f
	.byte	0x7
	.byte	0
	.uleb128 0x5
	.4byte	0x760
	.uleb128 0x14
	.4byte	.LASF1611
	.byte	0x4
	.byte	0x32
	.byte	0x14
	.4byte	0x770
	.uleb128 0xc
	.4byte	0x79d
	.4byte	0x791
	.uleb128 0xd
	.4byte	0x8f
	.byte	0x5
	.byte	0
	.uleb128 0x5
	.4byte	0x781
	.uleb128 0x6
	.byte	0x8
	.byte	0x4
	.4byte	.LASF1612
	.uleb128 0x5
	.4byte	0x796
	.uleb128 0x14
	.4byte	.LASF1613
	.byte	0x4
	.byte	0x33
	.byte	0x15
	.4byte	0x791
	.uleb128 0xc
	.4byte	0x5d9
	.4byte	0x7be
	.uleb128 0xd
	.4byte	0x8f
	.byte	0x18
	.byte	0
	.uleb128 0x5
	.4byte	0x7ae
	.uleb128 0x14
	.4byte	.LASF1614
	.byte	0x4
	.byte	0x3f
	.byte	0x15
	.4byte	0x7be
	.uleb128 0xa
	.byte	0xc
	.byte	0x5
	.byte	0xaf
	.byte	0x9
	.4byte	0x80d
	.uleb128 0x3
	.4byte	.LASF1615
	.byte	0x5
	.byte	0xb1
	.byte	0xc
	.4byte	0x5de
	.byte	0
	.uleb128 0x3
	.4byte	.LASF1616
	.byte	0x5
	.byte	0xb2
	.byte	0xc
	.4byte	0x5cd
	.byte	0x4
	.uleb128 0x3
	.4byte	.LASF1617
	.byte	0x5
	.byte	0xb3
	.byte	0xc
	.4byte	0x80d
	.byte	0x6
	.uleb128 0x3
	.4byte	.LASF1618
	.byte	0x5
	.byte	0xb4
	.byte	0xc
	.4byte	0x5bc
	.byte	0x8
	.byte	0
	.uleb128 0xc
	.4byte	0x5bc
	.4byte	0x81d
	.uleb128 0xd
	.4byte	0x8f
	.byte	0x1
	.byte	0
	.uleb128 0xb
	.4byte	.LASF1619
	.byte	0x5
	.byte	0xb5
	.byte	0x3
	.4byte	0x7cf
	.uleb128 0x5
	.4byte	0x81d
	.uleb128 0xb
	.4byte	.LASF1620
	.byte	0x5
	.byte	0xb8
	.byte	0x10
	.4byte	0x83a
	.uleb128 0x9
	.byte	0x4
	.4byte	0x840
	.uleb128 0x15
	.4byte	0x84b
	.uleb128 0x8
	.4byte	0x84b
	.byte	0
	.uleb128 0x9
	.byte	0x4
	.4byte	0x829
	.uleb128 0xa
	.byte	0xc
	.byte	0x5
	.byte	0xc0
	.byte	0x9
	.4byte	0x8dd
	.uleb128 0x3
	.4byte	.LASF1621
	.byte	0x5
	.byte	0xc2
	.byte	0xb
	.4byte	0x5bc
	.byte	0
	.uleb128 0x16
	.ascii	"prf\000"
	.byte	0x5
	.byte	0xc3
	.byte	0xb
	.4byte	0x5bc
	.byte	0x1
	.uleb128 0x3
	.4byte	.LASF1622
	.byte	0x5
	.byte	0xc4
	.byte	0xb
	.4byte	0x5bc
	.byte	0x2
	.uleb128 0x3
	.4byte	.LASF1623
	.byte	0x5
	.byte	0xc5
	.byte	0xb
	.4byte	0x5bc
	.byte	0x3
	.uleb128 0x3
	.4byte	.LASF1624
	.byte	0x5
	.byte	0xc6
	.byte	0xb
	.4byte	0x5bc
	.byte	0x4
	.uleb128 0x3
	.4byte	.LASF1625
	.byte	0x5
	.byte	0xc7
	.byte	0xb
	.4byte	0x5bc
	.byte	0x5
	.uleb128 0x3
	.4byte	.LASF1626
	.byte	0x5
	.byte	0xc8
	.byte	0xb
	.4byte	0x5bc
	.byte	0x6
	.uleb128 0x3
	.4byte	.LASF1627
	.byte	0x5
	.byte	0xc9
	.byte	0xb
	.4byte	0x5bc
	.byte	0x7
	.uleb128 0x3
	.4byte	.LASF1628
	.byte	0x5
	.byte	0xca
	.byte	0xb
	.4byte	0x5bc
	.byte	0x8
	.uleb128 0x3
	.4byte	.LASF1629
	.byte	0x5
	.byte	0xcb
	.byte	0xc
	.4byte	0x5cd
	.byte	0xa
	.byte	0
	.uleb128 0xb
	.4byte	.LASF1630
	.byte	0x5
	.byte	0xcc
	.byte	0x3
	.4byte	0x851
	.uleb128 0xa
	.byte	0x8
	.byte	0x5
	.byte	0xcf
	.byte	0x9
	.4byte	0x90d
	.uleb128 0x3
	.4byte	.LASF1631
	.byte	0x5
	.byte	0xd1
	.byte	0xd
	.4byte	0x5bc
	.byte	0
	.uleb128 0x3
	.4byte	.LASF1632
	.byte	0x5
	.byte	0xd7
	.byte	0xd
	.4byte	0x5de
	.byte	0x4
	.byte	0
	.uleb128 0xb
	.4byte	.LASF1633
	.byte	0x5
	.byte	0xd9
	.byte	0x1
	.4byte	0x8e9
	.uleb128 0xa
	.byte	0x10
	.byte	0x5
	.byte	0xdc
	.byte	0x9
	.4byte	0x98b
	.uleb128 0x3
	.4byte	.LASF1634
	.byte	0x5
	.byte	0xdf
	.byte	0x11
	.4byte	0x5cd
	.byte	0
	.uleb128 0x3
	.4byte	.LASF1635
	.byte	0x5
	.byte	0xe0
	.byte	0x11
	.4byte	0x5cd
	.byte	0x2
	.uleb128 0x3
	.4byte	.LASF1636
	.byte	0x5
	.byte	0xe1
	.byte	0x11
	.4byte	0x5cd
	.byte	0x4
	.uleb128 0x3
	.4byte	.LASF1637
	.byte	0x5
	.byte	0xe2
	.byte	0x11
	.4byte	0x5cd
	.byte	0x6
	.uleb128 0x3
	.4byte	.LASF1638
	.byte	0x5
	.byte	0xe3
	.byte	0x11
	.4byte	0x5cd
	.byte	0x8
	.uleb128 0x3
	.4byte	.LASF1639
	.byte	0x5
	.byte	0xe4
	.byte	0x11
	.4byte	0x5cd
	.byte	0xa
	.uleb128 0x3
	.4byte	.LASF1640
	.byte	0x5
	.byte	0xe5
	.byte	0x11
	.4byte	0x5cd
	.byte	0xc
	.uleb128 0x3
	.4byte	.LASF1641
	.byte	0x5
	.byte	0xe6
	.byte	0x11
	.4byte	0x5cd
	.byte	0xe
	.byte	0
	.uleb128 0xb
	.4byte	.LASF1642
	.byte	0x5
	.byte	0xe7
	.byte	0x2
	.4byte	0x919
	.uleb128 0xa
	.byte	0x18
	.byte	0x5
	.byte	0xea
	.byte	0x9
	.4byte	0xa3d
	.uleb128 0x16
	.ascii	"PHE\000"
	.byte	0x5
	.byte	0xed
	.byte	0xc
	.4byte	0x5cd
	.byte	0
	.uleb128 0x16
	.ascii	"RSL\000"
	.byte	0x5
	.byte	0xee
	.byte	0xc
	.4byte	0x5cd
	.byte	0x2
	.uleb128 0x3
	.4byte	.LASF1643
	.byte	0x5
	.byte	0xef
	.byte	0xc
	.4byte	0x5cd
	.byte	0x4
	.uleb128 0x3
	.4byte	.LASF1644
	.byte	0x5
	.byte	0xf0
	.byte	0xc
	.4byte	0x5cd
	.byte	0x6
	.uleb128 0x3
	.4byte	.LASF1645
	.byte	0x5
	.byte	0xf1
	.byte	0xc
	.4byte	0x5cd
	.byte	0x8
	.uleb128 0x3
	.4byte	.LASF1646
	.byte	0x5
	.byte	0xf2
	.byte	0xc
	.4byte	0x5cd
	.byte	0xa
	.uleb128 0x3
	.4byte	.LASF1647
	.byte	0x5
	.byte	0xf3
	.byte	0xc
	.4byte	0x5cd
	.byte	0xc
	.uleb128 0x16
	.ascii	"PTO\000"
	.byte	0x5
	.byte	0xf4
	.byte	0xc
	.4byte	0x5cd
	.byte	0xe
	.uleb128 0x16
	.ascii	"RTO\000"
	.byte	0x5
	.byte	0xf5
	.byte	0xc
	.4byte	0x5cd
	.byte	0x10
	.uleb128 0x16
	.ascii	"TXF\000"
	.byte	0x5
	.byte	0xf6
	.byte	0xc
	.4byte	0x5cd
	.byte	0x12
	.uleb128 0x16
	.ascii	"HPW\000"
	.byte	0x5
	.byte	0xf7
	.byte	0xc
	.4byte	0x5cd
	.byte	0x14
	.uleb128 0x16
	.ascii	"TXW\000"
	.byte	0x5
	.byte	0xf8
	.byte	0xc
	.4byte	0x5cd
	.byte	0x16
	.byte	0
	.uleb128 0xb
	.4byte	.LASF1648
	.byte	0x5
	.byte	0xfa
	.byte	0x3
	.4byte	0x997
	.uleb128 0x11
	.4byte	.LASF1649
	.byte	0x5
	.2byte	0x6f3
	.byte	0xd
	.4byte	0x51
	.uleb128 0xa
	.byte	0x38
	.byte	0x1
	.byte	0x41
	.byte	0x9
	.4byte	0xb23
	.uleb128 0x3
	.4byte	.LASF1650
	.byte	0x1
	.byte	0x43
	.byte	0x11
	.4byte	0x5de
	.byte	0
	.uleb128 0x3
	.4byte	.LASF1651
	.byte	0x1
	.byte	0x44
	.byte	0x11
	.4byte	0x5de
	.byte	0x4
	.uleb128 0x3
	.4byte	.LASF1652
	.byte	0x1
	.byte	0x45
	.byte	0x11
	.4byte	0x5bc
	.byte	0x8
	.uleb128 0x3
	.4byte	.LASF1653
	.byte	0x1
	.byte	0x46
	.byte	0x11
	.4byte	0x5bc
	.byte	0x9
	.uleb128 0x3
	.4byte	.LASF1654
	.byte	0x1
	.byte	0x47
	.byte	0x11
	.4byte	0x5de
	.byte	0xc
	.uleb128 0x3
	.4byte	.LASF1655
	.byte	0x1
	.byte	0x48
	.byte	0x11
	.4byte	0x5bc
	.byte	0x10
	.uleb128 0x3
	.4byte	.LASF1656
	.byte	0x1
	.byte	0x49
	.byte	0x11
	.4byte	0x5bc
	.byte	0x11
	.uleb128 0x3
	.4byte	.LASF1657
	.byte	0x1
	.byte	0x4a
	.byte	0x11
	.4byte	0x5de
	.byte	0x14
	.uleb128 0x3
	.4byte	.LASF1658
	.byte	0x1
	.byte	0x4b
	.byte	0x11
	.4byte	0x5cd
	.byte	0x18
	.uleb128 0x3
	.4byte	.LASF1659
	.byte	0x1
	.byte	0x4c
	.byte	0x11
	.4byte	0x5bc
	.byte	0x1a
	.uleb128 0x3
	.4byte	.LASF1660
	.byte	0x1
	.byte	0x4d
	.byte	0x13
	.4byte	0x81d
	.byte	0x1c
	.uleb128 0x3
	.4byte	.LASF1661
	.byte	0x1
	.byte	0x4e
	.byte	0x11
	.4byte	0x82e
	.byte	0x28
	.uleb128 0x3
	.4byte	.LASF1662
	.byte	0x1
	.byte	0x4f
	.byte	0x11
	.4byte	0x82e
	.byte	0x2c
	.uleb128 0x3
	.4byte	.LASF1663
	.byte	0x1
	.byte	0x50
	.byte	0x11
	.4byte	0x82e
	.byte	0x30
	.uleb128 0x3
	.4byte	.LASF1664
	.byte	0x1
	.byte	0x51
	.byte	0x11
	.4byte	0x82e
	.byte	0x34
	.byte	0
	.uleb128 0xb
	.4byte	.LASF1665
	.byte	0x1
	.byte	0x52
	.byte	0x3
	.4byte	0xa56
	.uleb128 0xc
	.4byte	0xb23
	.4byte	0xb3f
	.uleb128 0xd
	.4byte	0x8f
	.byte	0
	.byte	0
	.uleb128 0x17
	.4byte	.LASF1666
	.byte	0x1
	.byte	0x54
	.byte	0x19
	.4byte	0xb2f
	.uleb128 0x5
	.byte	0x3
	.4byte	dw1000local
	.uleb128 0x17
	.4byte	.LASF1667
	.byte	0x1
	.byte	0x55
	.byte	0x1a
	.4byte	0xb63
	.uleb128 0x5
	.byte	0x3
	.4byte	pdw1000local
	.uleb128 0x9
	.byte	0x4
	.4byte	0xb23
	.uleb128 0x18
	.4byte	.LASF1675
	.byte	0x1
	.2byte	0xdb6
	.byte	0x8
	.4byte	0x5cd
	.4byte	.LFB93
	.4byte	.LFE93-.LFB93
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xc13
	.uleb128 0x19
	.4byte	.LASF1677
	.byte	0x1
	.2byte	0xdb6
	.byte	0x1e
	.4byte	0x5bc
	.uleb128 0x2
	.byte	0x91
	.sleb128 -33
	.uleb128 0x1a
	.4byte	.LASF1668
	.byte	0x1
	.2byte	0xdb9
	.byte	0xf
	.4byte	0x58
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x1a
	.4byte	.LASF1669
	.byte	0x1
	.2byte	0xdba
	.byte	0xc
	.4byte	0x5de
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x1a
	.4byte	.LASF1670
	.byte	0x1
	.2byte	0xdbb
	.byte	0xc
	.4byte	0x5cd
	.uleb128 0x2
	.byte	0x91
	.sleb128 -22
	.uleb128 0x1a
	.4byte	.LASF1671
	.byte	0x1
	.2byte	0xdbb
	.byte	0x1f
	.4byte	0x5cd
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x1b
	.ascii	"i\000"
	.byte	0x1
	.2byte	0xdbc
	.byte	0x9
	.4byte	0x51
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x1a
	.4byte	.LASF1672
	.byte	0x1
	.2byte	0xdbf
	.byte	0xb
	.4byte	0x5bc
	.uleb128 0x2
	.byte	0x91
	.sleb128 -25
	.uleb128 0x1a
	.4byte	.LASF1673
	.byte	0x1
	.2byte	0xdc0
	.byte	0xc
	.4byte	0x5cd
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x1a
	.4byte	.LASF1674
	.byte	0x1
	.2byte	0xdc1
	.byte	0xc
	.4byte	0x5de
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.byte	0
	.uleb128 0x18
	.4byte	.LASF1676
	.byte	0x1
	.2byte	0xd93
	.byte	0x9
	.4byte	0x5de
	.4byte	.LFB92
	.4byte	.LFE92-.LFB92
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xc8f
	.uleb128 0x19
	.4byte	.LASF1678
	.byte	0x1
	.2byte	0xd95
	.byte	0xe
	.4byte	0x5bc
	.uleb128 0x2
	.byte	0x91
	.sleb128 -25
	.uleb128 0x19
	.4byte	.LASF1679
	.byte	0x1
	.2byte	0xd96
	.byte	0xf
	.4byte	0x5de
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x19
	.4byte	.LASF1680
	.byte	0x1
	.2byte	0xd97
	.byte	0xf
	.4byte	0x796
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x19
	.4byte	.LASF1681
	.byte	0x1
	.2byte	0xd98
	.byte	0xf
	.4byte	0x796
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x1a
	.4byte	.LASF1682
	.byte	0x1
	.2byte	0xd9b
	.byte	0xc
	.4byte	0x796
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x1a
	.4byte	.LASF1683
	.byte	0x1
	.2byte	0xd9c
	.byte	0xc
	.4byte	0x796
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x1c
	.4byte	.LASF1684
	.byte	0x1
	.2byte	0xd5b
	.byte	0x8
	.4byte	0x5de
	.4byte	.LFB91
	.4byte	.LFE91-.LFB91
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xd49
	.uleb128 0x19
	.4byte	.LASF1679
	.byte	0x1
	.2byte	0xd5b
	.byte	0x2a
	.4byte	0x5de
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x19
	.4byte	.LASF1685
	.byte	0x1
	.2byte	0xd5b
	.byte	0x3e
	.4byte	0x604
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x1a
	.4byte	.LASF1686
	.byte	0x1
	.2byte	0xd5d
	.byte	0xb
	.4byte	0x604
	.uleb128 0x2
	.byte	0x91
	.sleb128 -4
	.uleb128 0x1a
	.4byte	.LASF1687
	.byte	0x1
	.2byte	0xd5d
	.byte	0x1b
	.4byte	0x604
	.uleb128 0x2
	.byte	0x91
	.sleb128 -8
	.uleb128 0x1a
	.4byte	.LASF1688
	.byte	0x1
	.2byte	0xd5e
	.byte	0xb
	.4byte	0x5bc
	.uleb128 0x2
	.byte	0x91
	.sleb128 -17
	.uleb128 0x1a
	.4byte	.LASF1689
	.byte	0x1
	.2byte	0xd5e
	.byte	0x1c
	.4byte	0x5bc
	.uleb128 0x2
	.byte	0x91
	.sleb128 -18
	.uleb128 0x1a
	.4byte	.LASF1690
	.byte	0x1
	.2byte	0xd5f
	.byte	0xb
	.4byte	0x5bc
	.uleb128 0x2
	.byte	0x91
	.sleb128 -19
	.uleb128 0x1a
	.4byte	.LASF1691
	.byte	0x1
	.2byte	0xd5f
	.byte	0x18
	.4byte	0x5bc
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x1a
	.4byte	.LASF1692
	.byte	0x1
	.2byte	0xd60
	.byte	0xc
	.4byte	0x5de
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x1b
	.ascii	"i\000"
	.byte	0x1
	.2byte	0xd61
	.byte	0x9
	.4byte	0x51
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.uleb128 0x18
	.4byte	.LASF1693
	.byte	0x1
	.2byte	0xcf6
	.byte	0x8
	.4byte	0x5de
	.4byte	.LFB90
	.4byte	.LFE90-.LFB90
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xe13
	.uleb128 0x19
	.4byte	.LASF1694
	.byte	0x1
	.2byte	0xcf6
	.byte	0x28
	.4byte	0x5cd
	.uleb128 0x2
	.byte	0x91
	.sleb128 -50
	.uleb128 0x1b
	.ascii	"i\000"
	.byte	0x1
	.2byte	0xcf8
	.byte	0x9
	.4byte	0x51
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x1a
	.4byte	.LASF1695
	.byte	0x1
	.2byte	0xcf9
	.byte	0xc
	.4byte	0x5de
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x1a
	.4byte	.LASF1696
	.byte	0x1
	.2byte	0xcf9
	.byte	0x17
	.4byte	0x5de
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x1a
	.4byte	.LASF1697
	.byte	0x1
	.2byte	0xcfa
	.byte	0xb
	.4byte	0x604
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x1a
	.4byte	.LASF1698
	.byte	0x1
	.2byte	0xcfb
	.byte	0xc
	.4byte	0x5de
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x1a
	.4byte	.LASF1699
	.byte	0x1
	.2byte	0xcfc
	.byte	0xc
	.4byte	0x5cd
	.uleb128 0x2
	.byte	0x91
	.sleb128 -34
	.uleb128 0x1a
	.4byte	.LASF1700
	.byte	0x1
	.2byte	0xcfd
	.byte	0xb
	.4byte	0x604
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x1a
	.4byte	.LASF1672
	.byte	0x1
	.2byte	0xd00
	.byte	0xb
	.4byte	0x5bc
	.uleb128 0x2
	.byte	0x91
	.sleb128 -35
	.uleb128 0x1a
	.4byte	.LASF1673
	.byte	0x1
	.2byte	0xd01
	.byte	0xc
	.4byte	0x5cd
	.uleb128 0x2
	.byte	0x91
	.sleb128 -38
	.uleb128 0x1a
	.4byte	.LASF1674
	.byte	0x1
	.2byte	0xd02
	.byte	0xc
	.4byte	0x5de
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.byte	0
	.uleb128 0x1d
	.4byte	.LASF1701
	.byte	0x1
	.2byte	0xce4
	.byte	0x7
	.4byte	0x5bc
	.4byte	.LFB89
	.4byte	.LFE89-.LFB89
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x1d
	.4byte	.LASF1702
	.byte	0x1
	.2byte	0xcd2
	.byte	0x7
	.4byte	0x5bc
	.4byte	.LFB88
	.4byte	.LFE88-.LFB88
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x18
	.4byte	.LASF1703
	.byte	0x1
	.2byte	0xc97
	.byte	0x8
	.4byte	0x5cd
	.4byte	.LFB87
	.4byte	.LFE87-.LFB87
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xe9d
	.uleb128 0x19
	.4byte	.LASF1704
	.byte	0x1
	.2byte	0xc97
	.byte	0x1f
	.4byte	0x5bc
	.uleb128 0x2
	.byte	0x91
	.sleb128 -17
	.uleb128 0x1a
	.4byte	.LASF1705
	.byte	0x1
	.2byte	0xc99
	.byte	0xb
	.4byte	0x80d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x1a
	.4byte	.LASF1706
	.byte	0x1
	.2byte	0xc9a
	.byte	0xb
	.4byte	0x5bc
	.uleb128 0x2
	.byte	0x91
	.sleb128 -9
	.uleb128 0x1a
	.4byte	.LASF1707
	.byte	0x1
	.2byte	0xc9b
	.byte	0xb
	.4byte	0x5bc
	.uleb128 0x2
	.byte	0x91
	.sleb128 -10
	.byte	0
	.uleb128 0x1e
	.4byte	.LASF1709
	.byte	0x1
	.2byte	0xc62
	.byte	0x6
	.4byte	.LFB86
	.4byte	.LFE86-.LFB86
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xec5
	.uleb128 0x19
	.4byte	.LASF1708
	.byte	0x1
	.2byte	0xc62
	.byte	0x2b
	.4byte	0x5de
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x1e
	.4byte	.LASF1710
	.byte	0x1
	.2byte	0xc2e
	.byte	0x6
	.4byte	.LFB85
	.4byte	.LFE85-.LFB85
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xeed
	.uleb128 0x19
	.4byte	.LASF1621
	.byte	0x1
	.2byte	0xc2e
	.byte	0x1d
	.4byte	0x5bc
	.uleb128 0x2
	.byte	0x91
	.sleb128 -9
	.byte	0
	.uleb128 0x1f
	.4byte	.LASF1711
	.byte	0x1
	.2byte	0xc1d
	.byte	0x7
	.4byte	0x5bc
	.4byte	.LFB84
	.4byte	.LFE84-.LFB84
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x1e
	.4byte	.LASF1712
	.byte	0x1
	.2byte	0xc08
	.byte	0x6
	.4byte	.LFB83
	.4byte	.LFE83-.LFB83
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xf3c
	.uleb128 0x19
	.4byte	.LASF1713
	.byte	0x1
	.2byte	0xc08
	.byte	0x1c
	.4byte	0x5bc
	.uleb128 0x2
	.byte	0x91
	.sleb128 -17
	.uleb128 0x1a
	.4byte	.LASF1714
	.byte	0x1
	.2byte	0xc0b
	.byte	0xb
	.4byte	0x5bc
	.uleb128 0x2
	.byte	0x91
	.sleb128 -9
	.byte	0
	.uleb128 0x20
	.4byte	.LASF1715
	.byte	0x1
	.2byte	0xbe4
	.byte	0x6
	.4byte	.LFB82
	.4byte	.LFE82-.LFB82
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x20
	.4byte	.LASF1716
	.byte	0x1
	.2byte	0xbd0
	.byte	0x6
	.4byte	.LFB81
	.4byte	.LFE81-.LFB81
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x1e
	.4byte	.LASF1717
	.byte	0x1
	.2byte	0xba7
	.byte	0x6
	.4byte	.LFB80
	.4byte	.LFE80-.LFB80
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xf9a
	.uleb128 0x19
	.4byte	.LASF1718
	.byte	0x1
	.2byte	0xba7
	.byte	0x31
	.4byte	0xf9a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x1a
	.4byte	.LASF1719
	.byte	0x1
	.2byte	0xba9
	.byte	0xc
	.4byte	0x5de
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x9
	.byte	0x4
	.4byte	0xa3d
	.uleb128 0x1e
	.4byte	.LASF1720
	.byte	0x1
	.2byte	0xb90
	.byte	0x6
	.4byte	.LFB79
	.4byte	.LFE79-.LFB79
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xfc8
	.uleb128 0x19
	.4byte	.LASF1721
	.byte	0x1
	.2byte	0xb90
	.byte	0x22
	.4byte	0x51
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x1e
	.4byte	.LASF1722
	.byte	0x1
	.2byte	0xb6e
	.byte	0x6
	.4byte	.LFB78
	.4byte	.LFE78-.LFB78
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1020
	.uleb128 0x19
	.4byte	.LASF1723
	.byte	0x1
	.2byte	0xb6e
	.byte	0x1e
	.4byte	0x5de
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x19
	.4byte	.LASF1721
	.byte	0x1
	.2byte	0xb6e
	.byte	0x2d
	.4byte	0x5bc
	.uleb128 0x2
	.byte	0x91
	.sleb128 -21
	.uleb128 0x1a
	.4byte	.LASF1724
	.byte	0x1
	.2byte	0xb70
	.byte	0x15
	.4byte	0xa49
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x1a
	.4byte	.LASF1725
	.byte	0x1
	.2byte	0xb71
	.byte	0xc
	.4byte	0x5de
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x1e
	.4byte	.LASF1726
	.byte	0x1
	.2byte	0xb51
	.byte	0x6
	.4byte	.LFB77
	.4byte	.LFE77-.LFB77
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1048
	.uleb128 0x19
	.4byte	.LASF1727
	.byte	0x1
	.2byte	0xb51
	.byte	0x2a
	.4byte	0x5cd
	.uleb128 0x2
	.byte	0x91
	.sleb128 -10
	.byte	0
	.uleb128 0x1e
	.4byte	.LASF1728
	.byte	0x1
	.2byte	0xb28
	.byte	0x6
	.4byte	.LFB76
	.4byte	.LFE76-.LFB76
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1080
	.uleb128 0x19
	.4byte	.LASF1729
	.byte	0x1
	.2byte	0xb28
	.byte	0x1e
	.4byte	0x5cd
	.uleb128 0x2
	.byte	0x91
	.sleb128 -18
	.uleb128 0x1a
	.4byte	.LASF1719
	.byte	0x1
	.2byte	0xb2a
	.byte	0xb
	.4byte	0x5bc
	.uleb128 0x2
	.byte	0x91
	.sleb128 -9
	.byte	0
	.uleb128 0x18
	.4byte	.LASF1730
	.byte	0x1
	.2byte	0xaf5
	.byte	0x5
	.4byte	0x51
	.4byte	.LFB75
	.4byte	.LFE75-.LFB75
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x10cc
	.uleb128 0x19
	.4byte	.LASF1731
	.byte	0x1
	.2byte	0xaf5
	.byte	0x16
	.4byte	0x51
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x1a
	.4byte	.LASF1719
	.byte	0x1
	.2byte	0xaf7
	.byte	0xc
	.4byte	0x5cd
	.uleb128 0x2
	.byte	0x91
	.sleb128 -10
	.uleb128 0x1a
	.4byte	.LASF1732
	.byte	0x1
	.2byte	0xaf8
	.byte	0xb
	.4byte	0x5bc
	.uleb128 0x2
	.byte	0x91
	.sleb128 -11
	.byte	0
	.uleb128 0x1e
	.4byte	.LASF1733
	.byte	0x1
	.2byte	0xadd
	.byte	0x6
	.4byte	.LFB74
	.4byte	.LFE74-.LFB74
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x10f4
	.uleb128 0x19
	.4byte	.LASF1734
	.byte	0x1
	.2byte	0xadd
	.byte	0x1e
	.4byte	0x5bc
	.uleb128 0x2
	.byte	0x91
	.sleb128 -9
	.byte	0
	.uleb128 0x1e
	.4byte	.LASF1735
	.byte	0x1
	.2byte	0xabf
	.byte	0x6
	.4byte	.LFB73
	.4byte	.LFE73-.LFB73
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x112c
	.uleb128 0x19
	.4byte	.LASF1721
	.byte	0x1
	.2byte	0xabf
	.byte	0x23
	.4byte	0x51
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x1a
	.4byte	.LASF1736
	.byte	0x1
	.2byte	0xac1
	.byte	0xc
	.4byte	0x5de
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x1e
	.4byte	.LASF1737
	.byte	0x1
	.2byte	0xa8b
	.byte	0x6
	.4byte	.LFB72
	.4byte	.LFE72-.LFB72
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x119e
	.uleb128 0x19
	.4byte	.LASF1721
	.byte	0x1
	.2byte	0xa8b
	.byte	0x1b
	.4byte	0x51
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x19
	.4byte	.LASF1738
	.byte	0x1
	.2byte	0xa8b
	.byte	0x29
	.4byte	0x5bc
	.uleb128 0x2
	.byte	0x91
	.sleb128 -21
	.uleb128 0x19
	.4byte	.LASF1739
	.byte	0x1
	.2byte	0xa8b
	.byte	0x37
	.4byte	0x5bc
	.uleb128 0x2
	.byte	0x91
	.sleb128 -22
	.uleb128 0x1a
	.4byte	.LASF1736
	.byte	0x1
	.2byte	0xa8d
	.byte	0xc
	.4byte	0x5de
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x21
	.4byte	.LBB4
	.4byte	.LBE4-.LBB4
	.uleb128 0x1a
	.4byte	.LASF1740
	.byte	0x1
	.2byte	0xa91
	.byte	0x10
	.4byte	0x5cd
	.uleb128 0x2
	.byte	0x91
	.sleb128 -10
	.byte	0
	.byte	0
	.uleb128 0x1e
	.4byte	.LASF1741
	.byte	0x1
	.2byte	0xa6b
	.byte	0x6
	.4byte	.LFB71
	.4byte	.LFE71-.LFB71
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x11c6
	.uleb128 0x1a
	.4byte	.LASF1742
	.byte	0x1
	.2byte	0xa6d
	.byte	0xc
	.4byte	0x5bc
	.uleb128 0x2
	.byte	0x91
	.sleb128 -9
	.byte	0
	.uleb128 0x1e
	.4byte	.LASF1743
	.byte	0x1
	.2byte	0xa41
	.byte	0x6
	.4byte	.LFB70
	.4byte	.LFE70-.LFB70
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x11fe
	.uleb128 0x1a
	.4byte	.LASF1724
	.byte	0x1
	.2byte	0xa43
	.byte	0x15
	.4byte	0xa49
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x1a
	.4byte	.LASF1725
	.byte	0x1
	.2byte	0xa44
	.byte	0xc
	.4byte	0x5de
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x18
	.4byte	.LASF1744
	.byte	0x1
	.2byte	0xa08
	.byte	0x5
	.4byte	0x51
	.4byte	.LFB69
	.4byte	.LFE69-.LFB69
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x125a
	.uleb128 0x19
	.4byte	.LASF1731
	.byte	0x1
	.2byte	0xa08
	.byte	0x17
	.4byte	0x5bc
	.uleb128 0x2
	.byte	0x91
	.sleb128 -17
	.uleb128 0x1a
	.4byte	.LASF1745
	.byte	0x1
	.2byte	0xa0a
	.byte	0x9
	.4byte	0x51
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x1a
	.4byte	.LASF1719
	.byte	0x1
	.2byte	0xa0b
	.byte	0xb
	.4byte	0x5bc
	.uleb128 0x2
	.byte	0x91
	.sleb128 -13
	.uleb128 0x1a
	.4byte	.LASF1746
	.byte	0x1
	.2byte	0xa0c
	.byte	0xc
	.4byte	0x5cd
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.uleb128 0x1e
	.4byte	.LASF1747
	.byte	0x1
	.2byte	0x9f3
	.byte	0x6
	.4byte	.LFB68
	.4byte	.LFE68-.LFB68
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1282
	.uleb128 0x19
	.4byte	.LASF1748
	.byte	0x1
	.2byte	0x9f3
	.byte	0x23
	.4byte	0x5de
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x20
	.4byte	.LASF1749
	.byte	0x1
	.2byte	0x9df
	.byte	0x6
	.4byte	.LFB67
	.4byte	.LFE67-.LFB67
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x1e
	.4byte	.LASF1750
	.byte	0x1
	.2byte	0x98f
	.byte	0x6
	.4byte	.LFB66
	.4byte	.LFE66-.LFB66
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x12cd
	.uleb128 0x19
	.4byte	.LASF1751
	.byte	0x1
	.2byte	0x98f
	.byte	0x1c
	.4byte	0x51
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x1b
	.ascii	"reg\000"
	.byte	0x1
	.2byte	0x991
	.byte	0xb
	.4byte	0x80d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x1e
	.4byte	.LASF1752
	.byte	0x1
	.2byte	0x95a
	.byte	0x6
	.4byte	.LFB65
	.4byte	.LFE65-.LFB65
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1305
	.uleb128 0x19
	.4byte	.LASF1731
	.byte	0x1
	.2byte	0x95a
	.byte	0x18
	.4byte	0x5bc
	.uleb128 0x2
	.byte	0x91
	.sleb128 -17
	.uleb128 0x1b
	.ascii	"reg\000"
	.byte	0x1
	.2byte	0x95c
	.byte	0xc
	.4byte	0x5de
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x1e
	.4byte	.LASF1753
	.byte	0x1
	.2byte	0x914
	.byte	0x6
	.4byte	.LFB64
	.4byte	.LFE64-.LFB64
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x134d
	.uleb128 0x1a
	.4byte	.LASF1615
	.byte	0x1
	.2byte	0x916
	.byte	0xc
	.4byte	0x5de
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x1a
	.4byte	.LASF1754
	.byte	0x1
	.2byte	0x917
	.byte	0xc
	.4byte	0x5cd
	.uleb128 0x2
	.byte	0x91
	.sleb128 -18
	.uleb128 0x1b
	.ascii	"len\000"
	.byte	0x1
	.2byte	0x918
	.byte	0xc
	.4byte	0x5cd
	.uleb128 0x2
	.byte	0x91
	.sleb128 -10
	.byte	0
	.uleb128 0x1e
	.4byte	.LASF1755
	.byte	0x1
	.2byte	0x88b
	.byte	0x6
	.4byte	.LFB63
	.4byte	.LFE63-.LFB63
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x139f
	.uleb128 0x1a
	.4byte	.LASF1615
	.byte	0x1
	.2byte	0x88d
	.byte	0xc
	.4byte	0x5de
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x21
	.4byte	.LBB3
	.4byte	.LBE3-.LBB3
	.uleb128 0x1a
	.4byte	.LASF1754
	.byte	0x1
	.2byte	0x892
	.byte	0x10
	.4byte	0x5cd
	.uleb128 0x2
	.byte	0x91
	.sleb128 -18
	.uleb128 0x1b
	.ascii	"len\000"
	.byte	0x1
	.2byte	0x893
	.byte	0x10
	.4byte	0x5cd
	.uleb128 0x2
	.byte	0x91
	.sleb128 -10
	.byte	0
	.byte	0
	.uleb128 0x1d
	.4byte	.LASF1756
	.byte	0x1
	.2byte	0x86e
	.byte	0x7
	.4byte	0x5bc
	.4byte	.LFB62
	.4byte	.LFE62-.LFB62
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x22
	.4byte	.LASF1757
	.byte	0x1
	.2byte	0x85b
	.byte	0x6
	.4byte	.LFB61
	.4byte	.LFE61-.LFB61
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x140e
	.uleb128 0x19
	.4byte	.LASF1661
	.byte	0x1
	.2byte	0x85b
	.byte	0x20
	.4byte	0x82e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -4
	.uleb128 0x19
	.4byte	.LASF1662
	.byte	0x1
	.2byte	0x85b
	.byte	0x33
	.4byte	0x82e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -8
	.uleb128 0x19
	.4byte	.LASF1663
	.byte	0x1
	.2byte	0x85b
	.byte	0x44
	.4byte	0x82e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x19
	.4byte	.LASF1664
	.byte	0x1
	.2byte	0x85b
	.byte	0x55
	.4byte	0x82e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.uleb128 0x1e
	.4byte	.LASF1758
	.byte	0x1
	.2byte	0x83e
	.byte	0x6
	.4byte	.LFB60
	.4byte	.LFE60-.LFB60
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1446
	.uleb128 0x19
	.4byte	.LASF1759
	.byte	0x1
	.2byte	0x83e
	.byte	0x23
	.4byte	0x5de
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x1b
	.ascii	"val\000"
	.byte	0x1
	.2byte	0x840
	.byte	0xc
	.4byte	0x5de
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x1e
	.4byte	.LASF1760
	.byte	0x1
	.2byte	0x820
	.byte	0x6
	.4byte	.LFB59
	.4byte	.LFE59-.LFB59
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x146e
	.uleb128 0x19
	.4byte	.LASF1721
	.byte	0x1
	.2byte	0x820
	.byte	0x1f
	.4byte	0x51
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x1e
	.4byte	.LASF1761
	.byte	0x1
	.2byte	0x80b
	.byte	0x6
	.4byte	.LFB58
	.4byte	.LFE58-.LFB58
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1496
	.uleb128 0x19
	.4byte	.LASF1762
	.byte	0x1
	.2byte	0x80b
	.byte	0x1e
	.4byte	0x5bc
	.uleb128 0x2
	.byte	0x91
	.sleb128 -9
	.byte	0
	.uleb128 0x1e
	.4byte	.LASF1763
	.byte	0x1
	.2byte	0x7ea
	.byte	0x6
	.4byte	.LFB57
	.4byte	.LFE57-.LFB57
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x14be
	.uleb128 0x19
	.4byte	.LASF1721
	.byte	0x1
	.2byte	0x7ea
	.byte	0x1e
	.4byte	0x51
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x1e
	.4byte	.LASF1764
	.byte	0x1
	.2byte	0x7d0
	.byte	0x6
	.4byte	.LFB56
	.4byte	.LFE56-.LFB56
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x14f6
	.uleb128 0x19
	.4byte	.LASF1765
	.byte	0x1
	.2byte	0x7d0
	.byte	0x24
	.4byte	0x5bc
	.uleb128 0x2
	.byte	0x91
	.sleb128 -17
	.uleb128 0x1b
	.ascii	"reg\000"
	.byte	0x1
	.2byte	0x7d2
	.byte	0xc
	.4byte	0x5cd
	.uleb128 0x2
	.byte	0x91
	.sleb128 -10
	.byte	0
	.uleb128 0x20
	.4byte	.LASF1766
	.byte	0x1
	.2byte	0x7b3
	.byte	0x6
	.4byte	.LFB55
	.4byte	.LFE55-.LFB55
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x1e
	.4byte	.LASF1767
	.byte	0x1
	.2byte	0x799
	.byte	0x6
	.4byte	.LFB54
	.4byte	.LFE54-.LFB54
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1531
	.uleb128 0x19
	.4byte	.LASF1768
	.byte	0x1
	.2byte	0x799
	.byte	0x19
	.4byte	0x51
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x18
	.4byte	.LASF1769
	.byte	0x1
	.2byte	0x775
	.byte	0x5
	.4byte	0x51
	.4byte	.LFB53
	.4byte	.LFE53-.LFB53
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x156d
	.uleb128 0x19
	.4byte	.LASF1742
	.byte	0x1
	.2byte	0x775
	.byte	0x1c
	.4byte	0x156d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x19
	.4byte	.LASF1770
	.byte	0x1
	.2byte	0x775
	.byte	0x29
	.4byte	0x5cd
	.uleb128 0x2
	.byte	0x91
	.sleb128 -14
	.byte	0
	.uleb128 0x9
	.byte	0x4
	.4byte	0x5bc
	.uleb128 0x1e
	.4byte	.LASF1771
	.byte	0x1
	.2byte	0x74e
	.byte	0x6
	.4byte	.LFB52
	.4byte	.LFE52-.LFB52
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x15ab
	.uleb128 0x19
	.4byte	.LASF1721
	.byte	0x1
	.2byte	0x74e
	.byte	0x20
	.4byte	0x51
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x1b
	.ascii	"reg\000"
	.byte	0x1
	.2byte	0x750
	.byte	0xc
	.4byte	0x5de
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x1e
	.4byte	.LASF1772
	.byte	0x1
	.2byte	0x735
	.byte	0x6
	.4byte	.LFB51
	.4byte	.LFE51-.LFB51
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x15e3
	.uleb128 0x19
	.4byte	.LASF1731
	.byte	0x1
	.2byte	0x735
	.byte	0x20
	.4byte	0x5cd
	.uleb128 0x2
	.byte	0x91
	.sleb128 -10
	.uleb128 0x19
	.4byte	.LASF1773
	.byte	0x1
	.2byte	0x735
	.byte	0x2c
	.4byte	0x5bc
	.uleb128 0x2
	.byte	0x91
	.sleb128 -11
	.byte	0
	.uleb128 0x18
	.4byte	.LASF1774
	.byte	0x1
	.2byte	0x6de
	.byte	0x8
	.4byte	0x5cd
	.4byte	.LFB50
	.4byte	.LFE50-.LFB50
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x160f
	.uleb128 0x1a
	.4byte	.LASF1775
	.byte	0x1
	.2byte	0x6e0
	.byte	0xc
	.4byte	0x5cd
	.uleb128 0x2
	.byte	0x91
	.sleb128 -10
	.byte	0
	.uleb128 0x1e
	.4byte	.LASF1776
	.byte	0x1
	.2byte	0x6b8
	.byte	0x6
	.4byte	.LFB49
	.4byte	.LFE49-.LFB49
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1637
	.uleb128 0x19
	.4byte	.LASF1777
	.byte	0x1
	.2byte	0x6b8
	.byte	0x23
	.4byte	0x5cd
	.uleb128 0x2
	.byte	0x91
	.sleb128 -10
	.byte	0
	.uleb128 0x20
	.4byte	.LASF1778
	.byte	0x1
	.2byte	0x6a4
	.byte	0x6
	.4byte	.LFB48
	.4byte	.LFE48-.LFB48
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x20
	.4byte	.LASF1779
	.byte	0x1
	.2byte	0x692
	.byte	0x6
	.4byte	.LFB47
	.4byte	.LFE47-.LFB47
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x20
	.4byte	.LASF1780
	.byte	0x1
	.2byte	0x680
	.byte	0x6
	.4byte	.LFB46
	.4byte	.LFE46-.LFB46
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x18
	.4byte	.LASF1781
	.byte	0x1
	.2byte	0x649
	.byte	0x5
	.4byte	0x51
	.4byte	.LFB45
	.4byte	.LFE45-.LFB45
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x16cc
	.uleb128 0x19
	.4byte	.LASF1713
	.byte	0x1
	.2byte	0x649
	.byte	0x22
	.4byte	0x5de
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x19
	.4byte	.LASF1782
	.byte	0x1
	.2byte	0x649
	.byte	0x30
	.4byte	0x5cd
	.uleb128 0x2
	.byte	0x91
	.sleb128 -22
	.uleb128 0x1a
	.4byte	.LASF1783
	.byte	0x1
	.2byte	0x64b
	.byte	0x9
	.4byte	0x51
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x1a
	.4byte	.LASF1784
	.byte	0x1
	.2byte	0x64c
	.byte	0x9
	.4byte	0x51
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.uleb128 0x18
	.4byte	.LASF1785
	.byte	0x1
	.2byte	0x60c
	.byte	0x8
	.4byte	0x5de
	.4byte	.LFB44
	.4byte	.LFE44-.LFB44
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1738
	.uleb128 0x19
	.4byte	.LASF1561
	.byte	0x1
	.2byte	0x60c
	.byte	0x22
	.4byte	0x5de
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x19
	.4byte	.LASF1782
	.byte	0x1
	.2byte	0x60c
	.byte	0x2f
	.4byte	0x5cd
	.uleb128 0x2
	.byte	0x91
	.sleb128 -22
	.uleb128 0x1a
	.4byte	.LASF1786
	.byte	0x1
	.2byte	0x60e
	.byte	0xb
	.4byte	0x1738
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x1a
	.4byte	.LASF1705
	.byte	0x1
	.2byte	0x60f
	.byte	0xb
	.4byte	0x1748
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x1a
	.4byte	.LASF1787
	.byte	0x1
	.2byte	0x610
	.byte	0xb
	.4byte	0x5bc
	.uleb128 0x2
	.byte	0x91
	.sleb128 -9
	.byte	0
	.uleb128 0xc
	.4byte	0x5bc
	.4byte	0x1748
	.uleb128 0xd
	.4byte	0x8f
	.byte	0
	.byte	0
	.uleb128 0xc
	.4byte	0x5bc
	.4byte	0x1758
	.uleb128 0xd
	.4byte	0x8f
	.byte	0x3
	.byte	0
	.uleb128 0x18
	.4byte	.LASF1788
	.byte	0x1
	.2byte	0x566
	.byte	0x8
	.4byte	0x5de
	.4byte	.LFB43
	.4byte	.LFE43-.LFB43
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x17d3
	.uleb128 0x19
	.4byte	.LASF1731
	.byte	0x1
	.2byte	0x566
	.byte	0x1e
	.4byte	0x51
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x1a
	.4byte	.LASF1786
	.byte	0x1
	.2byte	0x568
	.byte	0xb
	.4byte	0x1748
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x1a
	.4byte	.LASF1705
	.byte	0x1
	.2byte	0x569
	.byte	0xb
	.4byte	0x1748
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x1b
	.ascii	"mra\000"
	.byte	0x1
	.2byte	0x56a
	.byte	0xc
	.4byte	0x5de
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x1b
	.ascii	"mrb\000"
	.byte	0x1
	.2byte	0x56a
	.byte	0x12
	.4byte	0x5de
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x1b
	.ascii	"mr\000"
	.byte	0x1
	.2byte	0x56a
	.byte	0x18
	.4byte	0x5de
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x18
	.4byte	.LASF1789
	.byte	0x1
	.2byte	0x540
	.byte	0x8
	.4byte	0x5de
	.4byte	.LFB42
	.4byte	.LFE42-.LFB42
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x180f
	.uleb128 0x19
	.4byte	.LASF1782
	.byte	0x1
	.2byte	0x540
	.byte	0x1c
	.4byte	0x5de
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x1a
	.4byte	.LASF1790
	.byte	0x1
	.2byte	0x542
	.byte	0xc
	.4byte	0x5de
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x1e
	.4byte	.LASF1791
	.byte	0x1
	.2byte	0x524
	.byte	0x6
	.4byte	.LFB41
	.4byte	.LFE41-.LFB41
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1865
	.uleb128 0x19
	.4byte	.LASF1782
	.byte	0x1
	.2byte	0x524
	.byte	0x19
	.4byte	0x5de
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x19
	.4byte	.LASF1792
	.byte	0x1
	.2byte	0x524
	.byte	0x2a
	.4byte	0x1865
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x19
	.4byte	.LASF1770
	.byte	0x1
	.2byte	0x524
	.byte	0x37
	.4byte	0x5bc
	.uleb128 0x2
	.byte	0x91
	.sleb128 -25
	.uleb128 0x1b
	.ascii	"i\000"
	.byte	0x1
	.2byte	0x526
	.byte	0x9
	.4byte	0x51
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x9
	.byte	0x4
	.4byte	0x5de
	.uleb128 0x1e
	.4byte	.LASF1793
	.byte	0x1
	.2byte	0x511
	.byte	0x6
	.4byte	.LFB40
	.4byte	.LFE40-.LFB40
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1893
	.uleb128 0x19
	.4byte	.LASF1794
	.byte	0x1
	.2byte	0x511
	.byte	0x18
	.4byte	0x156d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x1e
	.4byte	.LASF1795
	.byte	0x1
	.2byte	0x500
	.byte	0x6
	.4byte	.LFB39
	.4byte	.LFE39-.LFB39
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x18bb
	.uleb128 0x19
	.4byte	.LASF1794
	.byte	0x1
	.2byte	0x500
	.byte	0x18
	.4byte	0x156d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x1e
	.4byte	.LASF1796
	.byte	0x1
	.2byte	0x4ee
	.byte	0x6
	.4byte	.LFB38
	.4byte	.LFE38-.LFB38
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x18e3
	.uleb128 0x19
	.4byte	.LASF1797
	.byte	0x1
	.2byte	0x4ee
	.byte	0x1e
	.4byte	0x5cd
	.uleb128 0x2
	.byte	0x91
	.sleb128 -10
	.byte	0
	.uleb128 0x1e
	.4byte	.LASF1798
	.byte	0x1
	.2byte	0x4dc
	.byte	0x6
	.4byte	.LFB37
	.4byte	.LFE37-.LFB37
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x190b
	.uleb128 0x19
	.4byte	.LASF1799
	.byte	0x1
	.2byte	0x4dc
	.byte	0x1a
	.4byte	0x5cd
	.uleb128 0x2
	.byte	0x91
	.sleb128 -10
	.byte	0
	.uleb128 0x1e
	.4byte	.LASF1800
	.byte	0x1
	.2byte	0x4bd
	.byte	0x6
	.4byte	.LFB36
	.4byte	.LFE36-.LFB36
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1943
	.uleb128 0x19
	.4byte	.LASF1721
	.byte	0x1
	.2byte	0x4bd
	.byte	0x23
	.4byte	0x5cd
	.uleb128 0x2
	.byte	0x91
	.sleb128 -18
	.uleb128 0x1a
	.4byte	.LASF1801
	.byte	0x1
	.2byte	0x4bf
	.byte	0xc
	.4byte	0x5de
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x1e
	.4byte	.LASF1802
	.byte	0x1
	.2byte	0x49b
	.byte	0x6
	.4byte	.LFB35
	.4byte	.LFE35-.LFB35
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x19a9
	.uleb128 0x19
	.4byte	.LASF1803
	.byte	0x1
	.2byte	0x49b
	.byte	0x22
	.4byte	0x51
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x19
	.4byte	.LASF1804
	.byte	0x1
	.2byte	0x49b
	.byte	0x30
	.4byte	0x51
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x19
	.4byte	.LASF1805
	.byte	0x1
	.2byte	0x49b
	.byte	0x41
	.4byte	0x5de
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x1b
	.ascii	"j\000"
	.byte	0x1
	.2byte	0x49d
	.byte	0xd
	.4byte	0x51
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x1a
	.4byte	.LASF1806
	.byte	0x1
	.2byte	0x49e
	.byte	0xd
	.4byte	0x1748
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.uleb128 0x1e
	.4byte	.LASF1807
	.byte	0x1
	.2byte	0x483
	.byte	0x6
	.4byte	.LFB34
	.4byte	.LFE34-.LFB34
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1a01
	.uleb128 0x19
	.4byte	.LASF1803
	.byte	0x1
	.2byte	0x483
	.byte	0x22
	.4byte	0x51
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x19
	.4byte	.LASF1804
	.byte	0x1
	.2byte	0x483
	.byte	0x30
	.4byte	0x51
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x19
	.4byte	.LASF1805
	.byte	0x1
	.2byte	0x483
	.byte	0x41
	.4byte	0x5cd
	.uleb128 0x2
	.byte	0x91
	.sleb128 -26
	.uleb128 0x1a
	.4byte	.LASF1806
	.byte	0x1
	.2byte	0x485
	.byte	0xd
	.4byte	0x80d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x1e
	.4byte	.LASF1808
	.byte	0x1
	.2byte	0x470
	.byte	0x6
	.4byte	.LFB33
	.4byte	.LFE33-.LFB33
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1a49
	.uleb128 0x19
	.4byte	.LASF1803
	.byte	0x1
	.2byte	0x470
	.byte	0x21
	.4byte	0x51
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x19
	.4byte	.LASF1804
	.byte	0x1
	.2byte	0x470
	.byte	0x30
	.4byte	0x51
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x19
	.4byte	.LASF1805
	.byte	0x1
	.2byte	0x470
	.byte	0x41
	.4byte	0x5bc
	.uleb128 0x2
	.byte	0x91
	.sleb128 -17
	.byte	0
	.uleb128 0x18
	.4byte	.LASF1809
	.byte	0x1
	.2byte	0x459
	.byte	0x7
	.4byte	0x5bc
	.4byte	.LFB32
	.4byte	.LFE32-.LFB32
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1a95
	.uleb128 0x19
	.4byte	.LASF1803
	.byte	0x1
	.2byte	0x459
	.byte	0x21
	.4byte	0x51
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x19
	.4byte	.LASF1804
	.byte	0x1
	.2byte	0x459
	.byte	0x30
	.4byte	0x51
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x1a
	.4byte	.LASF1805
	.byte	0x1
	.2byte	0x45b
	.byte	0xb
	.4byte	0x5bc
	.uleb128 0x2
	.byte	0x91
	.sleb128 -9
	.byte	0
	.uleb128 0x18
	.4byte	.LASF1810
	.byte	0x1
	.2byte	0x440
	.byte	0x8
	.4byte	0x5cd
	.4byte	.LFB31
	.4byte	.LFE31-.LFB31
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1af1
	.uleb128 0x19
	.4byte	.LASF1803
	.byte	0x1
	.2byte	0x440
	.byte	0x23
	.4byte	0x51
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x19
	.4byte	.LASF1804
	.byte	0x1
	.2byte	0x440
	.byte	0x31
	.4byte	0x51
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x1a
	.4byte	.LASF1805
	.byte	0x1
	.2byte	0x442
	.byte	0xd
	.4byte	0x5cd
	.uleb128 0x2
	.byte	0x91
	.sleb128 -10
	.uleb128 0x1a
	.4byte	.LASF1806
	.byte	0x1
	.2byte	0x443
	.byte	0xd
	.4byte	0x80d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x18
	.4byte	.LASF1811
	.byte	0x1
	.2byte	0x423
	.byte	0x8
	.4byte	0x5de
	.4byte	.LFB30
	.4byte	.LFE30-.LFB30
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1b5b
	.uleb128 0x19
	.4byte	.LASF1803
	.byte	0x1
	.2byte	0x423
	.byte	0x23
	.4byte	0x51
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x19
	.4byte	.LASF1804
	.byte	0x1
	.2byte	0x423
	.byte	0x31
	.4byte	0x51
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x1a
	.4byte	.LASF1805
	.byte	0x1
	.2byte	0x425
	.byte	0xd
	.4byte	0x5de
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x1b
	.ascii	"j\000"
	.byte	0x1
	.2byte	0x426
	.byte	0xd
	.4byte	0x51
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x1a
	.4byte	.LASF1806
	.byte	0x1
	.2byte	0x427
	.byte	0xd
	.4byte	0x1748
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x1e
	.4byte	.LASF1812
	.byte	0x1
	.2byte	0x3eb
	.byte	0x6
	.4byte	.LFB29
	.4byte	.LFE29-.LFB29
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1bd3
	.uleb128 0x19
	.4byte	.LASF1813
	.byte	0x1
	.2byte	0x3ed
	.byte	0xd
	.4byte	0x5cd
	.uleb128 0x2
	.byte	0x91
	.sleb128 -18
	.uleb128 0x19
	.4byte	.LASF1814
	.byte	0x1
	.2byte	0x3ee
	.byte	0xd
	.4byte	0x5cd
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x19
	.4byte	.LASF1770
	.byte	0x1
	.2byte	0x3ef
	.byte	0xd
	.4byte	0x5de
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x19
	.4byte	.LASF1806
	.byte	0x1
	.2byte	0x3f0
	.byte	0xe
	.4byte	0x156d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x1a
	.4byte	.LASF1815
	.byte	0x1
	.2byte	0x3f3
	.byte	0xb
	.4byte	0x1bd3
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x1b
	.ascii	"cnt\000"
	.byte	0x1
	.2byte	0x3f4
	.byte	0xb
	.4byte	0x51
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0xc
	.4byte	0x5bc
	.4byte	0x1be3
	.uleb128 0xd
	.4byte	0x8f
	.byte	0x2
	.byte	0
	.uleb128 0x1e
	.4byte	.LASF1816
	.byte	0x1
	.2byte	0x3ab
	.byte	0x6
	.4byte	.LFB28
	.4byte	.LFE28-.LFB28
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1c5b
	.uleb128 0x19
	.4byte	.LASF1813
	.byte	0x1
	.2byte	0x3ad
	.byte	0x11
	.4byte	0x5cd
	.uleb128 0x2
	.byte	0x91
	.sleb128 -18
	.uleb128 0x19
	.4byte	.LASF1814
	.byte	0x1
	.2byte	0x3ae
	.byte	0x11
	.4byte	0x5cd
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x19
	.4byte	.LASF1770
	.byte	0x1
	.2byte	0x3af
	.byte	0x11
	.4byte	0x5de
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x19
	.4byte	.LASF1806
	.byte	0x1
	.2byte	0x3b0
	.byte	0x12
	.4byte	0x1c5b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x1a
	.4byte	.LASF1815
	.byte	0x1
	.2byte	0x3b3
	.byte	0xb
	.4byte	0x1bd3
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x1b
	.ascii	"cnt\000"
	.byte	0x1
	.2byte	0x3b4
	.byte	0xb
	.4byte	0x51
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x9
	.byte	0x4
	.4byte	0x5c8
	.uleb128 0x1e
	.4byte	.LASF1817
	.byte	0x1
	.2byte	0x38f
	.byte	0x6
	.4byte	.LFB27
	.4byte	.LFE27-.LFB27
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1c89
	.uleb128 0x19
	.4byte	.LASF1818
	.byte	0x1
	.2byte	0x38f
	.byte	0x1e
	.4byte	0x156d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x1d
	.4byte	.LASF1819
	.byte	0x1
	.2byte	0x37d
	.byte	0x8
	.4byte	0x5de
	.4byte	.LFB26
	.4byte	.LFE26-.LFB26
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x1d
	.4byte	.LASF1820
	.byte	0x1
	.2byte	0x36d
	.byte	0x8
	.4byte	0x5de
	.4byte	.LFB25
	.4byte	.LFE25-.LFB25
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x1d
	.4byte	.LASF1821
	.byte	0x1
	.2byte	0x35d
	.byte	0x8
	.4byte	0x5de
	.4byte	.LFB24
	.4byte	.LFE24-.LFB24
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x1e
	.4byte	.LASF1822
	.byte	0x1
	.2byte	0x34d
	.byte	0x6
	.4byte	.LFB23
	.4byte	.LFE23-.LFB23
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1cf6
	.uleb128 0x19
	.4byte	.LASF1818
	.byte	0x1
	.2byte	0x34d
	.byte	0x22
	.4byte	0x156d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x1d
	.4byte	.LASF1823
	.byte	0x1
	.2byte	0x33c
	.byte	0x8
	.4byte	0x5de
	.4byte	.LFB22
	.4byte	.LFE22-.LFB22
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x1d
	.4byte	.LASF1824
	.byte	0x1
	.2byte	0x32c
	.byte	0x8
	.4byte	0x5de
	.4byte	.LFB21
	.4byte	.LFE21-.LFB21
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x1e
	.4byte	.LASF1825
	.byte	0x1
	.2byte	0x31c
	.byte	0x6
	.4byte	.LFB20
	.4byte	.LFE20-.LFB20
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1d4c
	.uleb128 0x19
	.4byte	.LASF1818
	.byte	0x1
	.2byte	0x31c
	.byte	0x22
	.4byte	0x156d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x1e
	.4byte	.LASF1826
	.byte	0x1
	.2byte	0x300
	.byte	0x6
	.4byte	.LFB19
	.4byte	.LFE19-.LFB19
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1d74
	.uleb128 0x19
	.4byte	.LASF1827
	.byte	0x1
	.2byte	0x300
	.byte	0x28
	.4byte	0x1d74
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x9
	.byte	0x4
	.4byte	0x98b
	.uleb128 0x18
	.4byte	.LASF1828
	.byte	0x1
	.2byte	0x2df
	.byte	0x7
	.4byte	0x604
	.4byte	.LFB18
	.4byte	.LFE18-.LFB18
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1dc4
	.uleb128 0x1a
	.4byte	.LASF1805
	.byte	0x1
	.2byte	0x2e1
	.byte	0xd
	.4byte	0x5de
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x1b
	.ascii	"j\000"
	.byte	0x1
	.2byte	0x2e2
	.byte	0xd
	.4byte	0x51
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x1a
	.4byte	.LASF1806
	.byte	0x1
	.2byte	0x2e3
	.byte	0xd
	.4byte	0x1bd3
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x1e
	.4byte	.LASF1829
	.byte	0x1
	.2byte	0x2c4
	.byte	0x6
	.4byte	.LFB17
	.4byte	.LFE17-.LFB17
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1e0c
	.uleb128 0x19
	.4byte	.LASF1806
	.byte	0x1
	.2byte	0x2c4
	.byte	0x1d
	.4byte	0x156d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x23
	.ascii	"len\000"
	.byte	0x1
	.2byte	0x2c4
	.byte	0x2c
	.4byte	0x5cd
	.uleb128 0x2
	.byte	0x91
	.sleb128 -14
	.uleb128 0x19
	.4byte	.LASF1830
	.byte	0x1
	.2byte	0x2c4
	.byte	0x38
	.4byte	0x5cd
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.uleb128 0x1e
	.4byte	.LASF1831
	.byte	0x1
	.2byte	0x2ae
	.byte	0x6
	.4byte	.LFB16
	.4byte	.LFE16-.LFB16
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1e54
	.uleb128 0x19
	.4byte	.LASF1806
	.byte	0x1
	.2byte	0x2ae
	.byte	0x1c
	.4byte	0x156d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x19
	.4byte	.LASF1770
	.byte	0x1
	.2byte	0x2ae
	.byte	0x2b
	.4byte	0x5cd
	.uleb128 0x2
	.byte	0x91
	.sleb128 -14
	.uleb128 0x19
	.4byte	.LASF1832
	.byte	0x1
	.2byte	0x2ae
	.byte	0x3a
	.4byte	0x5cd
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.uleb128 0x1e
	.4byte	.LASF1833
	.byte	0x1
	.2byte	0x292
	.byte	0x6
	.4byte	.LFB15
	.4byte	.LFE15-.LFB15
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1eac
	.uleb128 0x19
	.4byte	.LASF1834
	.byte	0x1
	.2byte	0x292
	.byte	0x1e
	.4byte	0x5cd
	.uleb128 0x2
	.byte	0x91
	.sleb128 -18
	.uleb128 0x19
	.4byte	.LASF1835
	.byte	0x1
	.2byte	0x292
	.byte	0x34
	.4byte	0x5cd
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x19
	.4byte	.LASF1836
	.byte	0x1
	.2byte	0x292
	.byte	0x48
	.4byte	0x51
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x1a
	.4byte	.LASF1837
	.byte	0x1
	.2byte	0x29b
	.byte	0xc
	.4byte	0x5de
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x18
	.4byte	.LASF1838
	.byte	0x1
	.2byte	0x26d
	.byte	0x5
	.4byte	0x51
	.4byte	.LFB14
	.4byte	.LFE14-.LFB14
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1ef8
	.uleb128 0x19
	.4byte	.LASF1834
	.byte	0x1
	.2byte	0x26d
	.byte	0x1c
	.4byte	0x5cd
	.uleb128 0x2
	.byte	0x91
	.sleb128 -10
	.uleb128 0x19
	.4byte	.LASF1839
	.byte	0x1
	.2byte	0x26d
	.byte	0x32
	.4byte	0x156d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x19
	.4byte	.LASF1835
	.byte	0x1
	.2byte	0x26d
	.byte	0x47
	.4byte	0x5cd
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x1e
	.4byte	.LASF1840
	.byte	0x1
	.2byte	0x253
	.byte	0x6
	.4byte	.LFB13
	.4byte	.LFE13-.LFB13
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1f20
	.uleb128 0x19
	.4byte	.LASF1841
	.byte	0x1
	.2byte	0x253
	.byte	0x23
	.4byte	0x5cd
	.uleb128 0x2
	.byte	0x91
	.sleb128 -10
	.byte	0
	.uleb128 0x1e
	.4byte	.LASF1842
	.byte	0x1
	.2byte	0x240
	.byte	0x6
	.4byte	.LFB12
	.4byte	.LFE12-.LFB12
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1f48
	.uleb128 0x19
	.4byte	.LASF1843
	.byte	0x1
	.2byte	0x240
	.byte	0x23
	.4byte	0x5cd
	.uleb128 0x2
	.byte	0x91
	.sleb128 -10
	.byte	0
	.uleb128 0x1e
	.4byte	.LASF1844
	.byte	0x1
	.2byte	0x1b5
	.byte	0x6
	.4byte	.LFB11
	.4byte	.LFE11-.LFB11
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1fdf
	.uleb128 0x19
	.4byte	.LASF1845
	.byte	0x1
	.2byte	0x1b5
	.byte	0x22
	.4byte	0x1fdf
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x1a
	.4byte	.LASF1846
	.byte	0x1
	.2byte	0x1b7
	.byte	0xb
	.4byte	0x5bc
	.uleb128 0x2
	.byte	0x91
	.sleb128 -9
	.uleb128 0x1a
	.4byte	.LASF1847
	.byte	0x1
	.2byte	0x1b8
	.byte	0xb
	.4byte	0x5bc
	.uleb128 0x2
	.byte	0x91
	.sleb128 -10
	.uleb128 0x1a
	.4byte	.LASF1621
	.byte	0x1
	.2byte	0x1b9
	.byte	0xb
	.4byte	0x5bc
	.uleb128 0x2
	.byte	0x91
	.sleb128 -13
	.uleb128 0x1a
	.4byte	.LASF1805
	.byte	0x1
	.2byte	0x1ba
	.byte	0xc
	.4byte	0x5de
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x1a
	.4byte	.LASF1848
	.byte	0x1
	.2byte	0x1bb
	.byte	0xc
	.4byte	0x5cd
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x1a
	.4byte	.LASF1768
	.byte	0x1
	.2byte	0x1bc
	.byte	0xb
	.4byte	0x5bc
	.uleb128 0x2
	.byte	0x91
	.sleb128 -14
	.uleb128 0x1b
	.ascii	"bw\000"
	.byte	0x1
	.2byte	0x1bd
	.byte	0xb
	.4byte	0x5bc
	.uleb128 0x2
	.byte	0x91
	.sleb128 -15
	.byte	0
	.uleb128 0x9
	.byte	0x4
	.4byte	0x8dd
	.uleb128 0x1e
	.4byte	.LASF1849
	.byte	0x1
	.2byte	0x19b
	.byte	0x6
	.4byte	.LFB10
	.4byte	.LFE10-.LFB10
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x200d
	.uleb128 0x19
	.4byte	.LASF1845
	.byte	0x1
	.2byte	0x19b
	.byte	0x28
	.4byte	0x200d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x9
	.byte	0x4
	.4byte	0x90d
	.uleb128 0x1d
	.4byte	.LASF1850
	.byte	0x1
	.2byte	0x188
	.byte	0x8
	.4byte	0x5de
	.4byte	.LFB9
	.4byte	.LFE9-.LFB9
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x1f
	.4byte	.LASF1851
	.byte	0x1
	.2byte	0x178
	.byte	0x8
	.4byte	0x5de
	.4byte	.LFB8
	.4byte	.LFE8-.LFB8
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x1f
	.4byte	.LASF1852
	.byte	0x1
	.2byte	0x166
	.byte	0x8
	.4byte	0x5de
	.4byte	.LFB7
	.4byte	.LFE7-.LFB7
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x1e
	.4byte	.LASF1853
	.byte	0x1
	.2byte	0x14d
	.byte	0x6
	.4byte	.LFB6
	.4byte	.LFE6-.LFB6
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x20b0
	.uleb128 0x19
	.4byte	.LASF1854
	.byte	0x1
	.2byte	0x14d
	.byte	0x1e
	.4byte	0x5de
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x19
	.4byte	.LASF1713
	.byte	0x1
	.2byte	0x14d
	.byte	0x2e
	.4byte	0x5de
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x1b
	.ascii	"buf\000"
	.byte	0x1
	.2byte	0x14f
	.byte	0xb
	.4byte	0x1bd3
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x1a
	.4byte	.LASF1855
	.byte	0x1
	.2byte	0x150
	.byte	0xc
	.4byte	0x5de
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x1e
	.4byte	.LASF1856
	.byte	0x1
	.2byte	0x134
	.byte	0x6
	.4byte	.LFB5
	.4byte	.LFE5-.LFB5
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x2108
	.uleb128 0x19
	.4byte	.LASF1854
	.byte	0x1
	.2byte	0x134
	.byte	0x22
	.4byte	0x5de
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x19
	.4byte	.LASF1857
	.byte	0x1
	.2byte	0x134
	.byte	0x32
	.4byte	0x5de
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x1b
	.ascii	"buf\000"
	.byte	0x1
	.2byte	0x136
	.byte	0xb
	.4byte	0x1bd3
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x1a
	.4byte	.LASF1855
	.byte	0x1
	.2byte	0x137
	.byte	0xc
	.4byte	0x5de
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x1e
	.4byte	.LASF1858
	.byte	0x1
	.2byte	0x118
	.byte	0x6
	.4byte	.LFB4
	.4byte	.LFE4-.LFB4
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x214f
	.uleb128 0x23
	.ascii	"lna\000"
	.byte	0x1
	.2byte	0x118
	.byte	0x1b
	.4byte	0x51
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x23
	.ascii	"pa\000"
	.byte	0x1
	.2byte	0x118
	.byte	0x24
	.4byte	0x51
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x1a
	.4byte	.LASF1859
	.byte	0x1
	.2byte	0x11a
	.byte	0xc
	.4byte	0x5de
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x24
	.4byte	.LASF1860
	.byte	0x1
	.byte	0xfb
	.byte	0x6
	.4byte	.LFB3
	.4byte	.LFE3-.LFB3
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x2175
	.uleb128 0x25
	.4byte	.LASF1721
	.byte	0x1
	.byte	0xfb
	.byte	0x20
	.4byte	0x51
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x26
	.4byte	.LASF1861
	.byte	0x1
	.byte	0xea
	.byte	0x7
	.4byte	0x5bc
	.4byte	.LFB2
	.4byte	.LFE2-.LFB2
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x27
	.4byte	.LASF1862
	.byte	0x1
	.byte	0x8e
	.byte	0x5
	.4byte	0x51
	.4byte	.LFB1
	.4byte	.LFE1-.LFB1
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x21ec
	.uleb128 0x25
	.4byte	.LASF1845
	.byte	0x1
	.byte	0x8e
	.byte	0x1b
	.4byte	0x5cd
	.uleb128 0x2
	.byte	0x91
	.sleb128 -26
	.uleb128 0x17
	.4byte	.LASF1863
	.byte	0x1
	.byte	0x90
	.byte	0xc
	.4byte	0x5cd
	.uleb128 0x2
	.byte	0x91
	.sleb128 -10
	.uleb128 0x17
	.4byte	.LASF1864
	.byte	0x1
	.byte	0x91
	.byte	0xc
	.4byte	0x5de
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x21
	.4byte	.LBB2
	.4byte	.LBE2-.LBB2
	.uleb128 0x17
	.4byte	.LASF1865
	.byte	0x1
	.byte	0xcc
	.byte	0x10
	.4byte	0x5cd
	.uleb128 0x2
	.byte	0x91
	.sleb128 -18
	.byte	0
	.byte	0
	.uleb128 0x28
	.4byte	.LASF1866
	.byte	0x1
	.byte	0x63
	.byte	0x5
	.4byte	0x51
	.4byte	.LFB0
	.4byte	.LFE0-.LFB0
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x25
	.4byte	.LASF1814
	.byte	0x1
	.byte	0x63
	.byte	0x26
	.4byte	0x8f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -4
	.byte	0
	.byte	0
	.section	.debug_abbrev,"",%progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1b
	.uleb128 0xe
	.uleb128 0x2134
	.uleb128 0x19
	.uleb128 0x55
	.uleb128 0x17
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x10
	.uleb128 0x17
	.uleb128 0x2119
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x15
	.byte	0x1
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x13
	.byte	0x1
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x21
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x13
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x15
	.uleb128 0x15
	.byte	0x1
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x16
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x17
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x18
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2116
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x19
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x1a
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x1b
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x1c
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1d
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2116
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x1e
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2116
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1f
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x20
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2116
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x21
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x22
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x23
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x24
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2116
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x25
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x26
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x27
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2116
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x28
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_pubnames,"",%progbits
	.4byte	0x8ac
	.2byte	0x2
	.4byte	.Ldebug_info0
	.4byte	0x2213
	.4byte	0xb3f
	.ascii	"dw1000local\000"
	.4byte	0xb51
	.ascii	"pdw1000local\000"
	.4byte	0xb3f
	.ascii	"dw1000local\000"
	.4byte	0xb69
	.ascii	"dwt_calcpgcount\000"
	.4byte	0xc13
	.ascii	"dwt_calcpowertempadj\000"
	.4byte	0xc8f
	.ascii	"_dwt_computetxpowersetting\000"
	.4byte	0xd49
	.ascii	"dwt_calcbandwidthtempadj\000"
	.4byte	0xe13
	.ascii	"dwt_readwakeupvbat\000"
	.4byte	0xe2a
	.ascii	"dwt_readwakeuptemp\000"
	.4byte	0xe41
	.ascii	"dwt_readtempvbat\000"
	.4byte	0xe9d
	.ascii	"dwt_configcontinuousframemode\000"
	.4byte	0xec5
	.ascii	"dwt_configcwmode\000"
	.4byte	0xeed
	.ascii	"dwt_getinitxtaltrim\000"
	.4byte	0xf04
	.ascii	"dwt_setxtaltrim\000"
	.4byte	0xf3c
	.ascii	"dwt_softreset\000"
	.4byte	0xf4f
	.ascii	"dwt_rxreset\000"
	.4byte	0xf62
	.ascii	"dwt_readeventcounters\000"
	.4byte	0xfa0
	.ascii	"dwt_configeventcounters\000"
	.4byte	0xfc8
	.ascii	"dwt_setinterrupt\000"
	.4byte	0x1020
	.ascii	"dwt_setpreambledetecttimeout\000"
	.4byte	0x1048
	.ascii	"dwt_setrxtimeout\000"
	.4byte	0x1080
	.ascii	"dwt_rxenable\000"
	.4byte	0x10cc
	.ascii	"dwt_setsnoozetime\000"
	.4byte	0x10f4
	.ascii	"dwt_setlowpowerlistening\000"
	.4byte	0x112c
	.ascii	"dwt_setsniffmode\000"
	.4byte	0x119e
	.ascii	"dwt_syncrxbufptrs\000"
	.4byte	0x11c6
	.ascii	"dwt_forcetrxoff\000"
	.4byte	0x11fe
	.ascii	"dwt_starttx\000"
	.4byte	0x125a
	.ascii	"dwt_setdelayedtrxtime\000"
	.4byte	0x1282
	.ascii	"_dwt_disablesequencing\000"
	.4byte	0x1295
	.ascii	"_dwt_enableclocks\000"
	.4byte	0x12cd
	.ascii	"dwt_setleds\000"
	.4byte	0x1305
	.ascii	"dwt_lowpowerlistenisr\000"
	.4byte	0x134d
	.ascii	"dwt_isr\000"
	.4byte	0x139f
	.ascii	"dwt_checkirq\000"
	.4byte	0x13b6
	.ascii	"dwt_setcallbacks\000"
	.4byte	0x140e
	.ascii	"dwt_setrxaftertxdelay\000"
	.4byte	0x1446
	.ascii	"dwt_setdblrxbuffmode\000"
	.4byte	0x146e
	.ascii	"dwt_enableautoack\000"
	.4byte	0x1496
	.ascii	"dwt_setsmarttxpower\000"
	.4byte	0x14be
	.ascii	"dwt_loadopsettabfromotp\000"
	.4byte	0x14f6
	.ascii	"_dwt_loaducodefromrom\000"
	.4byte	0x1509
	.ascii	"_dwt_configlde\000"
	.4byte	0x1531
	.ascii	"dwt_spicswakeup\000"
	.4byte	0x1573
	.ascii	"dwt_entersleepaftertx\000"
	.4byte	0x15ab
	.ascii	"dwt_configuresleep\000"
	.4byte	0x15e3
	.ascii	"dwt_calibratesleepcnt\000"
	.4byte	0x160f
	.ascii	"dwt_configuresleepcnt\000"
	.4byte	0x1637
	.ascii	"dwt_entersleep\000"
	.4byte	0x164a
	.ascii	"_dwt_aonarrayupload\000"
	.4byte	0x165d
	.ascii	"_dwt_aonconfigupload\000"
	.4byte	0x1670
	.ascii	"dwt_otpwriteandverify\000"
	.4byte	0x16cc
	.ascii	"_dwt_otpprogword32\000"
	.4byte	0x1758
	.ascii	"_dwt_otpsetmrregs\000"
	.4byte	0x17d3
	.ascii	"_dwt_otpread\000"
	.4byte	0x180f
	.ascii	"dwt_otpread\000"
	.4byte	0x186b
	.ascii	"dwt_geteui\000"
	.4byte	0x1893
	.ascii	"dwt_seteui\000"
	.4byte	0x18bb
	.ascii	"dwt_setaddress16\000"
	.4byte	0x18e3
	.ascii	"dwt_setpanid\000"
	.4byte	0x190b
	.ascii	"dwt_enableframefilter\000"
	.4byte	0x1943
	.ascii	"dwt_write32bitoffsetreg\000"
	.4byte	0x19a9
	.ascii	"dwt_write16bitoffsetreg\000"
	.4byte	0x1a01
	.ascii	"dwt_write8bitoffsetreg\000"
	.4byte	0x1a49
	.ascii	"dwt_read8bitoffsetreg\000"
	.4byte	0x1a95
	.ascii	"dwt_read16bitoffsetreg\000"
	.4byte	0x1af1
	.ascii	"dwt_read32bitoffsetreg\000"
	.4byte	0x1b5b
	.ascii	"dwt_readfromdevice\000"
	.4byte	0x1be3
	.ascii	"dwt_writetodevice\000"
	.4byte	0x1c61
	.ascii	"dwt_readsystime\000"
	.4byte	0x1c89
	.ascii	"dwt_readsystimestamphi32\000"
	.4byte	0x1ca0
	.ascii	"dwt_readrxtimestamplo32\000"
	.4byte	0x1cb7
	.ascii	"dwt_readrxtimestamphi32\000"
	.4byte	0x1cce
	.ascii	"dwt_readrxtimestamp\000"
	.4byte	0x1cf6
	.ascii	"dwt_readtxtimestamplo32\000"
	.4byte	0x1d0d
	.ascii	"dwt_readtxtimestamphi32\000"
	.4byte	0x1d24
	.ascii	"dwt_readtxtimestamp\000"
	.4byte	0x1d4c
	.ascii	"dwt_readdiagnostics\000"
	.4byte	0x1d7a
	.ascii	"dwt_readcarrierintegrator\000"
	.4byte	0x1dc4
	.ascii	"dwt_readaccdata\000"
	.4byte	0x1e0c
	.ascii	"dwt_readrxdata\000"
	.4byte	0x1e54
	.ascii	"dwt_writetxfctrl\000"
	.4byte	0x1eac
	.ascii	"dwt_writetxdata\000"
	.4byte	0x1ef8
	.ascii	"dwt_settxantennadelay\000"
	.4byte	0x1f20
	.ascii	"dwt_setrxantennadelay\000"
	.4byte	0x1f48
	.ascii	"dwt_configure\000"
	.4byte	0x1fe5
	.ascii	"dwt_configuretxrf\000"
	.4byte	0x2013
	.ascii	"dwt_readdevid\000"
	.4byte	0x202a
	.ascii	"dwt_getlotid\000"
	.4byte	0x2041
	.ascii	"dwt_getpartid\000"
	.4byte	0x2058
	.ascii	"dwt_setgpiovalue\000"
	.4byte	0x20b0
	.ascii	"dwt_setgpiodirection\000"
	.4byte	0x2108
	.ascii	"dwt_setlnapamode\000"
	.4byte	0x214f
	.ascii	"dwt_setfinegraintxseq\000"
	.4byte	0x2175
	.ascii	"dwt_otprevision\000"
	.4byte	0x218b
	.ascii	"dwt_initialise\000"
	.4byte	0x21ec
	.ascii	"dwt_setlocaldataptr\000"
	.4byte	0
	.section	.debug_pubtypes,"",%progbits
	.4byte	0x23f
	.2byte	0x2
	.4byte	.Ldebug_info0
	.4byte	0x2213
	.4byte	0x51
	.ascii	"int\000"
	.4byte	0x5d
	.ascii	"long int\000"
	.4byte	0x29
	.ascii	"__mbstate_s\000"
	.4byte	0x83
	.ascii	"char\000"
	.4byte	0x8f
	.ascii	"unsigned int\000"
	.4byte	0x270
	.ascii	"__RAL_locale_data_t\000"
	.4byte	0x281
	.ascii	"unsigned char\000"
	.4byte	0x369
	.ascii	"__RAL_locale_codeset_t\000"
	.4byte	0x3b7
	.ascii	"__RAL_locale_t\000"
	.4byte	0x3c8
	.ascii	"__locale_s\000"
	.4byte	0x53b
	.ascii	"short unsigned int\000"
	.4byte	0x542
	.ascii	"__RAL_error_decoder_fn_t\000"
	.4byte	0x564
	.ascii	"__RAL_error_decoder_s\000"
	.4byte	0x595
	.ascii	"__RAL_error_decoder_t\000"
	.4byte	0x5b5
	.ascii	"long long int\000"
	.4byte	0x5bc
	.ascii	"uint8\000"
	.4byte	0x5cd
	.ascii	"uint16\000"
	.4byte	0x5ef
	.ascii	"long unsigned int\000"
	.4byte	0x5de
	.ascii	"uint32\000"
	.4byte	0x5f6
	.ascii	"signed char\000"
	.4byte	0x5fd
	.ascii	"short int\000"
	.4byte	0x604
	.ascii	"int32\000"
	.4byte	0x644
	.ascii	"agc_cfg_struct\000"
	.4byte	0x796
	.ascii	"double\000"
	.4byte	0x81d
	.ascii	"dwt_cb_data_t\000"
	.4byte	0x82e
	.ascii	"dwt_cb_t\000"
	.4byte	0x8dd
	.ascii	"dwt_config_t\000"
	.4byte	0x90d
	.ascii	"dwt_txconfig_t\000"
	.4byte	0x98b
	.ascii	"dwt_rxdiag_t\000"
	.4byte	0xa3d
	.ascii	"dwt_deviceentcnts_t\000"
	.4byte	0xa49
	.ascii	"decaIrqStatus_t\000"
	.4byte	0xb23
	.ascii	"dwt_local_data_t\000"
	.4byte	0
	.section	.debug_aranges,"",%progbits
	.4byte	0x304
	.2byte	0x2
	.4byte	.Ldebug_info0
	.byte	0x4
	.byte	0
	.2byte	0
	.2byte	0
	.4byte	.LFB0
	.4byte	.LFE0-.LFB0
	.4byte	.LFB1
	.4byte	.LFE1-.LFB1
	.4byte	.LFB2
	.4byte	.LFE2-.LFB2
	.4byte	.LFB3
	.4byte	.LFE3-.LFB3
	.4byte	.LFB4
	.4byte	.LFE4-.LFB4
	.4byte	.LFB5
	.4byte	.LFE5-.LFB5
	.4byte	.LFB6
	.4byte	.LFE6-.LFB6
	.4byte	.LFB7
	.4byte	.LFE7-.LFB7
	.4byte	.LFB8
	.4byte	.LFE8-.LFB8
	.4byte	.LFB9
	.4byte	.LFE9-.LFB9
	.4byte	.LFB10
	.4byte	.LFE10-.LFB10
	.4byte	.LFB11
	.4byte	.LFE11-.LFB11
	.4byte	.LFB12
	.4byte	.LFE12-.LFB12
	.4byte	.LFB13
	.4byte	.LFE13-.LFB13
	.4byte	.LFB14
	.4byte	.LFE14-.LFB14
	.4byte	.LFB15
	.4byte	.LFE15-.LFB15
	.4byte	.LFB16
	.4byte	.LFE16-.LFB16
	.4byte	.LFB17
	.4byte	.LFE17-.LFB17
	.4byte	.LFB18
	.4byte	.LFE18-.LFB18
	.4byte	.LFB19
	.4byte	.LFE19-.LFB19
	.4byte	.LFB20
	.4byte	.LFE20-.LFB20
	.4byte	.LFB21
	.4byte	.LFE21-.LFB21
	.4byte	.LFB22
	.4byte	.LFE22-.LFB22
	.4byte	.LFB23
	.4byte	.LFE23-.LFB23
	.4byte	.LFB24
	.4byte	.LFE24-.LFB24
	.4byte	.LFB25
	.4byte	.LFE25-.LFB25
	.4byte	.LFB26
	.4byte	.LFE26-.LFB26
	.4byte	.LFB27
	.4byte	.LFE27-.LFB27
	.4byte	.LFB28
	.4byte	.LFE28-.LFB28
	.4byte	.LFB29
	.4byte	.LFE29-.LFB29
	.4byte	.LFB30
	.4byte	.LFE30-.LFB30
	.4byte	.LFB31
	.4byte	.LFE31-.LFB31
	.4byte	.LFB32
	.4byte	.LFE32-.LFB32
	.4byte	.LFB33
	.4byte	.LFE33-.LFB33
	.4byte	.LFB34
	.4byte	.LFE34-.LFB34
	.4byte	.LFB35
	.4byte	.LFE35-.LFB35
	.4byte	.LFB36
	.4byte	.LFE36-.LFB36
	.4byte	.LFB37
	.4byte	.LFE37-.LFB37
	.4byte	.LFB38
	.4byte	.LFE38-.LFB38
	.4byte	.LFB39
	.4byte	.LFE39-.LFB39
	.4byte	.LFB40
	.4byte	.LFE40-.LFB40
	.4byte	.LFB41
	.4byte	.LFE41-.LFB41
	.4byte	.LFB42
	.4byte	.LFE42-.LFB42
	.4byte	.LFB43
	.4byte	.LFE43-.LFB43
	.4byte	.LFB44
	.4byte	.LFE44-.LFB44
	.4byte	.LFB45
	.4byte	.LFE45-.LFB45
	.4byte	.LFB46
	.4byte	.LFE46-.LFB46
	.4byte	.LFB47
	.4byte	.LFE47-.LFB47
	.4byte	.LFB48
	.4byte	.LFE48-.LFB48
	.4byte	.LFB49
	.4byte	.LFE49-.LFB49
	.4byte	.LFB50
	.4byte	.LFE50-.LFB50
	.4byte	.LFB51
	.4byte	.LFE51-.LFB51
	.4byte	.LFB52
	.4byte	.LFE52-.LFB52
	.4byte	.LFB53
	.4byte	.LFE53-.LFB53
	.4byte	.LFB54
	.4byte	.LFE54-.LFB54
	.4byte	.LFB55
	.4byte	.LFE55-.LFB55
	.4byte	.LFB56
	.4byte	.LFE56-.LFB56
	.4byte	.LFB57
	.4byte	.LFE57-.LFB57
	.4byte	.LFB58
	.4byte	.LFE58-.LFB58
	.4byte	.LFB59
	.4byte	.LFE59-.LFB59
	.4byte	.LFB60
	.4byte	.LFE60-.LFB60
	.4byte	.LFB61
	.4byte	.LFE61-.LFB61
	.4byte	.LFB62
	.4byte	.LFE62-.LFB62
	.4byte	.LFB63
	.4byte	.LFE63-.LFB63
	.4byte	.LFB64
	.4byte	.LFE64-.LFB64
	.4byte	.LFB65
	.4byte	.LFE65-.LFB65
	.4byte	.LFB66
	.4byte	.LFE66-.LFB66
	.4byte	.LFB67
	.4byte	.LFE67-.LFB67
	.4byte	.LFB68
	.4byte	.LFE68-.LFB68
	.4byte	.LFB69
	.4byte	.LFE69-.LFB69
	.4byte	.LFB70
	.4byte	.LFE70-.LFB70
	.4byte	.LFB71
	.4byte	.LFE71-.LFB71
	.4byte	.LFB72
	.4byte	.LFE72-.LFB72
	.4byte	.LFB73
	.4byte	.LFE73-.LFB73
	.4byte	.LFB74
	.4byte	.LFE74-.LFB74
	.4byte	.LFB75
	.4byte	.LFE75-.LFB75
	.4byte	.LFB76
	.4byte	.LFE76-.LFB76
	.4byte	.LFB77
	.4byte	.LFE77-.LFB77
	.4byte	.LFB78
	.4byte	.LFE78-.LFB78
	.4byte	.LFB79
	.4byte	.LFE79-.LFB79
	.4byte	.LFB80
	.4byte	.LFE80-.LFB80
	.4byte	.LFB81
	.4byte	.LFE81-.LFB81
	.4byte	.LFB82
	.4byte	.LFE82-.LFB82
	.4byte	.LFB83
	.4byte	.LFE83-.LFB83
	.4byte	.LFB84
	.4byte	.LFE84-.LFB84
	.4byte	.LFB85
	.4byte	.LFE85-.LFB85
	.4byte	.LFB86
	.4byte	.LFE86-.LFB86
	.4byte	.LFB87
	.4byte	.LFE87-.LFB87
	.4byte	.LFB88
	.4byte	.LFE88-.LFB88
	.4byte	.LFB89
	.4byte	.LFE89-.LFB89
	.4byte	.LFB90
	.4byte	.LFE90-.LFB90
	.4byte	.LFB91
	.4byte	.LFE91-.LFB91
	.4byte	.LFB92
	.4byte	.LFE92-.LFB92
	.4byte	.LFB93
	.4byte	.LFE93-.LFB93
	.4byte	0
	.4byte	0
	.section	.debug_ranges,"",%progbits
.Ldebug_ranges0:
	.4byte	.LFB0
	.4byte	.LFE0
	.4byte	.LFB1
	.4byte	.LFE1
	.4byte	.LFB2
	.4byte	.LFE2
	.4byte	.LFB3
	.4byte	.LFE3
	.4byte	.LFB4
	.4byte	.LFE4
	.4byte	.LFB5
	.4byte	.LFE5
	.4byte	.LFB6
	.4byte	.LFE6
	.4byte	.LFB7
	.4byte	.LFE7
	.4byte	.LFB8
	.4byte	.LFE8
	.4byte	.LFB9
	.4byte	.LFE9
	.4byte	.LFB10
	.4byte	.LFE10
	.4byte	.LFB11
	.4byte	.LFE11
	.4byte	.LFB12
	.4byte	.LFE12
	.4byte	.LFB13
	.4byte	.LFE13
	.4byte	.LFB14
	.4byte	.LFE14
	.4byte	.LFB15
	.4byte	.LFE15
	.4byte	.LFB16
	.4byte	.LFE16
	.4byte	.LFB17
	.4byte	.LFE17
	.4byte	.LFB18
	.4byte	.LFE18
	.4byte	.LFB19
	.4byte	.LFE19
	.4byte	.LFB20
	.4byte	.LFE20
	.4byte	.LFB21
	.4byte	.LFE21
	.4byte	.LFB22
	.4byte	.LFE22
	.4byte	.LFB23
	.4byte	.LFE23
	.4byte	.LFB24
	.4byte	.LFE24
	.4byte	.LFB25
	.4byte	.LFE25
	.4byte	.LFB26
	.4byte	.LFE26
	.4byte	.LFB27
	.4byte	.LFE27
	.4byte	.LFB28
	.4byte	.LFE28
	.4byte	.LFB29
	.4byte	.LFE29
	.4byte	.LFB30
	.4byte	.LFE30
	.4byte	.LFB31
	.4byte	.LFE31
	.4byte	.LFB32
	.4byte	.LFE32
	.4byte	.LFB33
	.4byte	.LFE33
	.4byte	.LFB34
	.4byte	.LFE34
	.4byte	.LFB35
	.4byte	.LFE35
	.4byte	.LFB36
	.4byte	.LFE36
	.4byte	.LFB37
	.4byte	.LFE37
	.4byte	.LFB38
	.4byte	.LFE38
	.4byte	.LFB39
	.4byte	.LFE39
	.4byte	.LFB40
	.4byte	.LFE40
	.4byte	.LFB41
	.4byte	.LFE41
	.4byte	.LFB42
	.4byte	.LFE42
	.4byte	.LFB43
	.4byte	.LFE43
	.4byte	.LFB44
	.4byte	.LFE44
	.4byte	.LFB45
	.4byte	.LFE45
	.4byte	.LFB46
	.4byte	.LFE46
	.4byte	.LFB47
	.4byte	.LFE47
	.4byte	.LFB48
	.4byte	.LFE48
	.4byte	.LFB49
	.4byte	.LFE49
	.4byte	.LFB50
	.4byte	.LFE50
	.4byte	.LFB51
	.4byte	.LFE51
	.4byte	.LFB52
	.4byte	.LFE52
	.4byte	.LFB53
	.4byte	.LFE53
	.4byte	.LFB54
	.4byte	.LFE54
	.4byte	.LFB55
	.4byte	.LFE55
	.4byte	.LFB56
	.4byte	.LFE56
	.4byte	.LFB57
	.4byte	.LFE57
	.4byte	.LFB58
	.4byte	.LFE58
	.4byte	.LFB59
	.4byte	.LFE59
	.4byte	.LFB60
	.4byte	.LFE60
	.4byte	.LFB61
	.4byte	.LFE61
	.4byte	.LFB62
	.4byte	.LFE62
	.4byte	.LFB63
	.4byte	.LFE63
	.4byte	.LFB64
	.4byte	.LFE64
	.4byte	.LFB65
	.4byte	.LFE65
	.4byte	.LFB66
	.4byte	.LFE66
	.4byte	.LFB67
	.4byte	.LFE67
	.4byte	.LFB68
	.4byte	.LFE68
	.4byte	.LFB69
	.4byte	.LFE69
	.4byte	.LFB70
	.4byte	.LFE70
	.4byte	.LFB71
	.4byte	.LFE71
	.4byte	.LFB72
	.4byte	.LFE72
	.4byte	.LFB73
	.4byte	.LFE73
	.4byte	.LFB74
	.4byte	.LFE74
	.4byte	.LFB75
	.4byte	.LFE75
	.4byte	.LFB76
	.4byte	.LFE76
	.4byte	.LFB77
	.4byte	.LFE77
	.4byte	.LFB78
	.4byte	.LFE78
	.4byte	.LFB79
	.4byte	.LFE79
	.4byte	.LFB80
	.4byte	.LFE80
	.4byte	.LFB81
	.4byte	.LFE81
	.4byte	.LFB82
	.4byte	.LFE82
	.4byte	.LFB83
	.4byte	.LFE83
	.4byte	.LFB84
	.4byte	.LFE84
	.4byte	.LFB85
	.4byte	.LFE85
	.4byte	.LFB86
	.4byte	.LFE86
	.4byte	.LFB87
	.4byte	.LFE87
	.4byte	.LFB88
	.4byte	.LFE88
	.4byte	.LFB89
	.4byte	.LFE89
	.4byte	.LFB90
	.4byte	.LFE90
	.4byte	.LFB91
	.4byte	.LFE91
	.4byte	.LFB92
	.4byte	.LFE92
	.4byte	.LFB93
	.4byte	.LFE93
	.4byte	0
	.4byte	0
	.section	.debug_macro,"",%progbits
.Ldebug_macro0:
	.2byte	0x4
	.byte	0x2
	.4byte	.Ldebug_line0
	.byte	0x7
	.4byte	.Ldebug_macro2
	.byte	0x3
	.uleb128 0
	.uleb128 0x1
	.file 6 "C:/Program Files/SEGGER/SEGGER Embedded Studio for ARM 4.22/include/assert.h"
	.byte	0x3
	.uleb128 0xd
	.uleb128 0x6
	.byte	0x7
	.4byte	.Ldebug_macro3
	.byte	0x4
	.file 7 "C:/Program Files/SEGGER/SEGGER Embedded Studio for ARM 4.22/include/stdlib.h"
	.byte	0x3
	.uleb128 0xe
	.uleb128 0x7
	.byte	0x5
	.uleb128 0x2d
	.4byte	.LASF469
	.byte	0x3
	.uleb128 0x2f
	.uleb128 0x2
	.byte	0x7
	.4byte	.Ldebug_macro4
	.byte	0x4
	.byte	0x7
	.4byte	.Ldebug_macro5
	.byte	0x4
	.byte	0x3
	.uleb128 0x10
	.uleb128 0x3
	.byte	0x7
	.4byte	.Ldebug_macro6
	.byte	0x4
	.byte	0x3
	.uleb128 0x11
	.uleb128 0x4
	.byte	0x7
	.4byte	.Ldebug_macro7
	.byte	0x4
	.file 8 "C:\\Users\\vikra\\Desktop\\decawave-ble\\NRF_UWB_Combo\\deca_driver\\deca_regs.h"
	.byte	0x3
	.uleb128 0x12
	.uleb128 0x8
	.byte	0x5
	.uleb128 0xf
	.4byte	.LASF522
	.file 9 "C:\\Users\\vikra\\Desktop\\decawave-ble\\NRF_UWB_Combo\\deca_driver\\deca_version.h"
	.byte	0x3
	.uleb128 0x15
	.uleb128 0x9
	.byte	0x7
	.4byte	.Ldebug_macro8
	.byte	0x4
	.byte	0x7
	.4byte	.Ldebug_macro9
	.byte	0x4
	.byte	0x3
	.uleb128 0x13
	.uleb128 0x5
	.byte	0x7
	.4byte	.Ldebug_macro10
	.byte	0x4
	.byte	0x5
	.uleb128 0x16
	.4byte	.LASF1493
	.byte	0x5
	.uleb128 0x17
	.4byte	.LASF1494
	.byte	0x5
	.uleb128 0x18
	.4byte	.LASF1495
	.byte	0x5
	.uleb128 0x19
	.4byte	.LASF1496
	.byte	0x5
	.uleb128 0x1a
	.4byte	.LASF1497
	.byte	0x5
	.uleb128 0x1b
	.4byte	.LASF1498
	.byte	0x5
	.uleb128 0x1c
	.4byte	.LASF1499
	.byte	0x5
	.uleb128 0x1d
	.4byte	.LASF1500
	.byte	0x5
	.uleb128 0x1e
	.4byte	.LASF1501
	.byte	0x5
	.uleb128 0x21
	.4byte	.LASF1502
	.byte	0x5
	.uleb128 0x23
	.4byte	.LASF1503
	.byte	0x5
	.uleb128 0x87
	.4byte	.LASF1504
	.byte	0x5
	.uleb128 0x88
	.4byte	.LASF1505
	.byte	0x5
	.uleb128 0x89
	.4byte	.LASF1506
	.byte	0x5
	.uleb128 0x8a
	.4byte	.LASF1507
	.byte	0x5
	.uleb128 0x8b
	.4byte	.LASF1508
	.byte	0x5
	.uleb128 0x8c
	.4byte	.LASF1509
	.byte	0x5
	.uleb128 0x2dc
	.4byte	.LASF1510
	.byte	0x5
	.uleb128 0x2dd
	.4byte	.LASF1511
	.byte	0x4
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.0.8c7f5226b96e4e4664a35dae229f020d,comdat
.Ldebug_macro2:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0
	.4byte	.LASF0
	.byte	0x5
	.uleb128 0
	.4byte	.LASF1
	.byte	0x5
	.uleb128 0
	.4byte	.LASF2
	.byte	0x5
	.uleb128 0
	.4byte	.LASF3
	.byte	0x5
	.uleb128 0
	.4byte	.LASF4
	.byte	0x5
	.uleb128 0
	.4byte	.LASF5
	.byte	0x5
	.uleb128 0
	.4byte	.LASF6
	.byte	0x5
	.uleb128 0
	.4byte	.LASF7
	.byte	0x5
	.uleb128 0
	.4byte	.LASF8
	.byte	0x5
	.uleb128 0
	.4byte	.LASF9
	.byte	0x5
	.uleb128 0
	.4byte	.LASF10
	.byte	0x5
	.uleb128 0
	.4byte	.LASF11
	.byte	0x5
	.uleb128 0
	.4byte	.LASF12
	.byte	0x5
	.uleb128 0
	.4byte	.LASF13
	.byte	0x5
	.uleb128 0
	.4byte	.LASF14
	.byte	0x5
	.uleb128 0
	.4byte	.LASF15
	.byte	0x5
	.uleb128 0
	.4byte	.LASF16
	.byte	0x5
	.uleb128 0
	.4byte	.LASF17
	.byte	0x5
	.uleb128 0
	.4byte	.LASF18
	.byte	0x5
	.uleb128 0
	.4byte	.LASF19
	.byte	0x5
	.uleb128 0
	.4byte	.LASF20
	.byte	0x5
	.uleb128 0
	.4byte	.LASF21
	.byte	0x5
	.uleb128 0
	.4byte	.LASF22
	.byte	0x5
	.uleb128 0
	.4byte	.LASF23
	.byte	0x5
	.uleb128 0
	.4byte	.LASF24
	.byte	0x5
	.uleb128 0
	.4byte	.LASF25
	.byte	0x5
	.uleb128 0
	.4byte	.LASF26
	.byte	0x5
	.uleb128 0
	.4byte	.LASF27
	.byte	0x5
	.uleb128 0
	.4byte	.LASF28
	.byte	0x5
	.uleb128 0
	.4byte	.LASF29
	.byte	0x5
	.uleb128 0
	.4byte	.LASF30
	.byte	0x5
	.uleb128 0
	.4byte	.LASF31
	.byte	0x5
	.uleb128 0
	.4byte	.LASF32
	.byte	0x5
	.uleb128 0
	.4byte	.LASF33
	.byte	0x5
	.uleb128 0
	.4byte	.LASF34
	.byte	0x5
	.uleb128 0
	.4byte	.LASF35
	.byte	0x5
	.uleb128 0
	.4byte	.LASF36
	.byte	0x5
	.uleb128 0
	.4byte	.LASF37
	.byte	0x5
	.uleb128 0
	.4byte	.LASF38
	.byte	0x5
	.uleb128 0
	.4byte	.LASF39
	.byte	0x5
	.uleb128 0
	.4byte	.LASF40
	.byte	0x5
	.uleb128 0
	.4byte	.LASF41
	.byte	0x5
	.uleb128 0
	.4byte	.LASF42
	.byte	0x5
	.uleb128 0
	.4byte	.LASF43
	.byte	0x5
	.uleb128 0
	.4byte	.LASF44
	.byte	0x5
	.uleb128 0
	.4byte	.LASF45
	.byte	0x5
	.uleb128 0
	.4byte	.LASF46
	.byte	0x5
	.uleb128 0
	.4byte	.LASF47
	.byte	0x5
	.uleb128 0
	.4byte	.LASF48
	.byte	0x5
	.uleb128 0
	.4byte	.LASF49
	.byte	0x5
	.uleb128 0
	.4byte	.LASF50
	.byte	0x5
	.uleb128 0
	.4byte	.LASF51
	.byte	0x5
	.uleb128 0
	.4byte	.LASF52
	.byte	0x5
	.uleb128 0
	.4byte	.LASF53
	.byte	0x5
	.uleb128 0
	.4byte	.LASF54
	.byte	0x5
	.uleb128 0
	.4byte	.LASF55
	.byte	0x5
	.uleb128 0
	.4byte	.LASF56
	.byte	0x5
	.uleb128 0
	.4byte	.LASF57
	.byte	0x5
	.uleb128 0
	.4byte	.LASF58
	.byte	0x5
	.uleb128 0
	.4byte	.LASF59
	.byte	0x5
	.uleb128 0
	.4byte	.LASF60
	.byte	0x5
	.uleb128 0
	.4byte	.LASF61
	.byte	0x5
	.uleb128 0
	.4byte	.LASF62
	.byte	0x5
	.uleb128 0
	.4byte	.LASF63
	.byte	0x5
	.uleb128 0
	.4byte	.LASF64
	.byte	0x5
	.uleb128 0
	.4byte	.LASF65
	.byte	0x5
	.uleb128 0
	.4byte	.LASF66
	.byte	0x5
	.uleb128 0
	.4byte	.LASF67
	.byte	0x5
	.uleb128 0
	.4byte	.LASF68
	.byte	0x5
	.uleb128 0
	.4byte	.LASF69
	.byte	0x5
	.uleb128 0
	.4byte	.LASF70
	.byte	0x5
	.uleb128 0
	.4byte	.LASF71
	.byte	0x5
	.uleb128 0
	.4byte	.LASF72
	.byte	0x5
	.uleb128 0
	.4byte	.LASF73
	.byte	0x5
	.uleb128 0
	.4byte	.LASF74
	.byte	0x5
	.uleb128 0
	.4byte	.LASF75
	.byte	0x5
	.uleb128 0
	.4byte	.LASF76
	.byte	0x5
	.uleb128 0
	.4byte	.LASF77
	.byte	0x5
	.uleb128 0
	.4byte	.LASF78
	.byte	0x5
	.uleb128 0
	.4byte	.LASF79
	.byte	0x5
	.uleb128 0
	.4byte	.LASF80
	.byte	0x5
	.uleb128 0
	.4byte	.LASF81
	.byte	0x5
	.uleb128 0
	.4byte	.LASF82
	.byte	0x5
	.uleb128 0
	.4byte	.LASF83
	.byte	0x5
	.uleb128 0
	.4byte	.LASF84
	.byte	0x5
	.uleb128 0
	.4byte	.LASF85
	.byte	0x5
	.uleb128 0
	.4byte	.LASF86
	.byte	0x5
	.uleb128 0
	.4byte	.LASF87
	.byte	0x5
	.uleb128 0
	.4byte	.LASF88
	.byte	0x5
	.uleb128 0
	.4byte	.LASF89
	.byte	0x5
	.uleb128 0
	.4byte	.LASF90
	.byte	0x5
	.uleb128 0
	.4byte	.LASF91
	.byte	0x5
	.uleb128 0
	.4byte	.LASF92
	.byte	0x5
	.uleb128 0
	.4byte	.LASF93
	.byte	0x5
	.uleb128 0
	.4byte	.LASF94
	.byte	0x5
	.uleb128 0
	.4byte	.LASF95
	.byte	0x5
	.uleb128 0
	.4byte	.LASF96
	.byte	0x5
	.uleb128 0
	.4byte	.LASF97
	.byte	0x5
	.uleb128 0
	.4byte	.LASF98
	.byte	0x5
	.uleb128 0
	.4byte	.LASF99
	.byte	0x5
	.uleb128 0
	.4byte	.LASF100
	.byte	0x5
	.uleb128 0
	.4byte	.LASF101
	.byte	0x5
	.uleb128 0
	.4byte	.LASF102
	.byte	0x5
	.uleb128 0
	.4byte	.LASF103
	.byte	0x5
	.uleb128 0
	.4byte	.LASF104
	.byte	0x5
	.uleb128 0
	.4byte	.LASF105
	.byte	0x5
	.uleb128 0
	.4byte	.LASF106
	.byte	0x5
	.uleb128 0
	.4byte	.LASF107
	.byte	0x5
	.uleb128 0
	.4byte	.LASF108
	.byte	0x5
	.uleb128 0
	.4byte	.LASF109
	.byte	0x5
	.uleb128 0
	.4byte	.LASF110
	.byte	0x5
	.uleb128 0
	.4byte	.LASF111
	.byte	0x5
	.uleb128 0
	.4byte	.LASF112
	.byte	0x5
	.uleb128 0
	.4byte	.LASF113
	.byte	0x5
	.uleb128 0
	.4byte	.LASF114
	.byte	0x5
	.uleb128 0
	.4byte	.LASF115
	.byte	0x5
	.uleb128 0
	.4byte	.LASF116
	.byte	0x5
	.uleb128 0
	.4byte	.LASF117
	.byte	0x5
	.uleb128 0
	.4byte	.LASF118
	.byte	0x5
	.uleb128 0
	.4byte	.LASF119
	.byte	0x5
	.uleb128 0
	.4byte	.LASF120
	.byte	0x5
	.uleb128 0
	.4byte	.LASF121
	.byte	0x5
	.uleb128 0
	.4byte	.LASF122
	.byte	0x5
	.uleb128 0
	.4byte	.LASF123
	.byte	0x5
	.uleb128 0
	.4byte	.LASF124
	.byte	0x5
	.uleb128 0
	.4byte	.LASF125
	.byte	0x5
	.uleb128 0
	.4byte	.LASF126
	.byte	0x5
	.uleb128 0
	.4byte	.LASF127
	.byte	0x5
	.uleb128 0
	.4byte	.LASF128
	.byte	0x5
	.uleb128 0
	.4byte	.LASF129
	.byte	0x5
	.uleb128 0
	.4byte	.LASF130
	.byte	0x5
	.uleb128 0
	.4byte	.LASF131
	.byte	0x5
	.uleb128 0
	.4byte	.LASF132
	.byte	0x5
	.uleb128 0
	.4byte	.LASF133
	.byte	0x5
	.uleb128 0
	.4byte	.LASF134
	.byte	0x5
	.uleb128 0
	.4byte	.LASF135
	.byte	0x5
	.uleb128 0
	.4byte	.LASF136
	.byte	0x5
	.uleb128 0
	.4byte	.LASF137
	.byte	0x5
	.uleb128 0
	.4byte	.LASF138
	.byte	0x5
	.uleb128 0
	.4byte	.LASF139
	.byte	0x5
	.uleb128 0
	.4byte	.LASF140
	.byte	0x5
	.uleb128 0
	.4byte	.LASF141
	.byte	0x5
	.uleb128 0
	.4byte	.LASF142
	.byte	0x5
	.uleb128 0
	.4byte	.LASF143
	.byte	0x5
	.uleb128 0
	.4byte	.LASF144
	.byte	0x5
	.uleb128 0
	.4byte	.LASF145
	.byte	0x5
	.uleb128 0
	.4byte	.LASF146
	.byte	0x5
	.uleb128 0
	.4byte	.LASF147
	.byte	0x5
	.uleb128 0
	.4byte	.LASF148
	.byte	0x5
	.uleb128 0
	.4byte	.LASF149
	.byte	0x5
	.uleb128 0
	.4byte	.LASF150
	.byte	0x5
	.uleb128 0
	.4byte	.LASF151
	.byte	0x5
	.uleb128 0
	.4byte	.LASF152
	.byte	0x5
	.uleb128 0
	.4byte	.LASF153
	.byte	0x5
	.uleb128 0
	.4byte	.LASF154
	.byte	0x5
	.uleb128 0
	.4byte	.LASF155
	.byte	0x5
	.uleb128 0
	.4byte	.LASF156
	.byte	0x5
	.uleb128 0
	.4byte	.LASF157
	.byte	0x5
	.uleb128 0
	.4byte	.LASF158
	.byte	0x5
	.uleb128 0
	.4byte	.LASF159
	.byte	0x5
	.uleb128 0
	.4byte	.LASF160
	.byte	0x5
	.uleb128 0
	.4byte	.LASF161
	.byte	0x5
	.uleb128 0
	.4byte	.LASF162
	.byte	0x5
	.uleb128 0
	.4byte	.LASF163
	.byte	0x5
	.uleb128 0
	.4byte	.LASF164
	.byte	0x5
	.uleb128 0
	.4byte	.LASF165
	.byte	0x5
	.uleb128 0
	.4byte	.LASF166
	.byte	0x5
	.uleb128 0
	.4byte	.LASF167
	.byte	0x5
	.uleb128 0
	.4byte	.LASF168
	.byte	0x5
	.uleb128 0
	.4byte	.LASF169
	.byte	0x5
	.uleb128 0
	.4byte	.LASF170
	.byte	0x5
	.uleb128 0
	.4byte	.LASF171
	.byte	0x5
	.uleb128 0
	.4byte	.LASF172
	.byte	0x5
	.uleb128 0
	.4byte	.LASF173
	.byte	0x5
	.uleb128 0
	.4byte	.LASF174
	.byte	0x5
	.uleb128 0
	.4byte	.LASF175
	.byte	0x5
	.uleb128 0
	.4byte	.LASF176
	.byte	0x5
	.uleb128 0
	.4byte	.LASF177
	.byte	0x5
	.uleb128 0
	.4byte	.LASF178
	.byte	0x5
	.uleb128 0
	.4byte	.LASF179
	.byte	0x5
	.uleb128 0
	.4byte	.LASF180
	.byte	0x5
	.uleb128 0
	.4byte	.LASF181
	.byte	0x5
	.uleb128 0
	.4byte	.LASF182
	.byte	0x5
	.uleb128 0
	.4byte	.LASF183
	.byte	0x5
	.uleb128 0
	.4byte	.LASF184
	.byte	0x5
	.uleb128 0
	.4byte	.LASF185
	.byte	0x5
	.uleb128 0
	.4byte	.LASF186
	.byte	0x5
	.uleb128 0
	.4byte	.LASF187
	.byte	0x5
	.uleb128 0
	.4byte	.LASF188
	.byte	0x5
	.uleb128 0
	.4byte	.LASF189
	.byte	0x5
	.uleb128 0
	.4byte	.LASF190
	.byte	0x5
	.uleb128 0
	.4byte	.LASF191
	.byte	0x5
	.uleb128 0
	.4byte	.LASF192
	.byte	0x5
	.uleb128 0
	.4byte	.LASF193
	.byte	0x5
	.uleb128 0
	.4byte	.LASF194
	.byte	0x5
	.uleb128 0
	.4byte	.LASF195
	.byte	0x5
	.uleb128 0
	.4byte	.LASF196
	.byte	0x5
	.uleb128 0
	.4byte	.LASF197
	.byte	0x5
	.uleb128 0
	.4byte	.LASF198
	.byte	0x5
	.uleb128 0
	.4byte	.LASF199
	.byte	0x5
	.uleb128 0
	.4byte	.LASF200
	.byte	0x5
	.uleb128 0
	.4byte	.LASF201
	.byte	0x5
	.uleb128 0
	.4byte	.LASF202
	.byte	0x5
	.uleb128 0
	.4byte	.LASF203
	.byte	0x5
	.uleb128 0
	.4byte	.LASF204
	.byte	0x5
	.uleb128 0
	.4byte	.LASF205
	.byte	0x5
	.uleb128 0
	.4byte	.LASF206
	.byte	0x5
	.uleb128 0
	.4byte	.LASF207
	.byte	0x5
	.uleb128 0
	.4byte	.LASF208
	.byte	0x5
	.uleb128 0
	.4byte	.LASF209
	.byte	0x5
	.uleb128 0
	.4byte	.LASF210
	.byte	0x5
	.uleb128 0
	.4byte	.LASF211
	.byte	0x5
	.uleb128 0
	.4byte	.LASF212
	.byte	0x5
	.uleb128 0
	.4byte	.LASF213
	.byte	0x5
	.uleb128 0
	.4byte	.LASF214
	.byte	0x5
	.uleb128 0
	.4byte	.LASF215
	.byte	0x5
	.uleb128 0
	.4byte	.LASF216
	.byte	0x5
	.uleb128 0
	.4byte	.LASF217
	.byte	0x5
	.uleb128 0
	.4byte	.LASF218
	.byte	0x5
	.uleb128 0
	.4byte	.LASF219
	.byte	0x5
	.uleb128 0
	.4byte	.LASF220
	.byte	0x5
	.uleb128 0
	.4byte	.LASF221
	.byte	0x5
	.uleb128 0
	.4byte	.LASF222
	.byte	0x5
	.uleb128 0
	.4byte	.LASF223
	.byte	0x5
	.uleb128 0
	.4byte	.LASF224
	.byte	0x5
	.uleb128 0
	.4byte	.LASF225
	.byte	0x5
	.uleb128 0
	.4byte	.LASF226
	.byte	0x5
	.uleb128 0
	.4byte	.LASF227
	.byte	0x5
	.uleb128 0
	.4byte	.LASF228
	.byte	0x5
	.uleb128 0
	.4byte	.LASF229
	.byte	0x5
	.uleb128 0
	.4byte	.LASF230
	.byte	0x5
	.uleb128 0
	.4byte	.LASF231
	.byte	0x5
	.uleb128 0
	.4byte	.LASF232
	.byte	0x5
	.uleb128 0
	.4byte	.LASF233
	.byte	0x5
	.uleb128 0
	.4byte	.LASF234
	.byte	0x5
	.uleb128 0
	.4byte	.LASF235
	.byte	0x5
	.uleb128 0
	.4byte	.LASF236
	.byte	0x5
	.uleb128 0
	.4byte	.LASF237
	.byte	0x5
	.uleb128 0
	.4byte	.LASF238
	.byte	0x5
	.uleb128 0
	.4byte	.LASF239
	.byte	0x5
	.uleb128 0
	.4byte	.LASF240
	.byte	0x5
	.uleb128 0
	.4byte	.LASF241
	.byte	0x5
	.uleb128 0
	.4byte	.LASF242
	.byte	0x5
	.uleb128 0
	.4byte	.LASF243
	.byte	0x5
	.uleb128 0
	.4byte	.LASF244
	.byte	0x5
	.uleb128 0
	.4byte	.LASF245
	.byte	0x5
	.uleb128 0
	.4byte	.LASF246
	.byte	0x5
	.uleb128 0
	.4byte	.LASF247
	.byte	0x5
	.uleb128 0
	.4byte	.LASF248
	.byte	0x5
	.uleb128 0
	.4byte	.LASF249
	.byte	0x5
	.uleb128 0
	.4byte	.LASF250
	.byte	0x5
	.uleb128 0
	.4byte	.LASF251
	.byte	0x5
	.uleb128 0
	.4byte	.LASF252
	.byte	0x5
	.uleb128 0
	.4byte	.LASF253
	.byte	0x5
	.uleb128 0
	.4byte	.LASF254
	.byte	0x5
	.uleb128 0
	.4byte	.LASF255
	.byte	0x5
	.uleb128 0
	.4byte	.LASF256
	.byte	0x5
	.uleb128 0
	.4byte	.LASF257
	.byte	0x5
	.uleb128 0
	.4byte	.LASF258
	.byte	0x5
	.uleb128 0
	.4byte	.LASF259
	.byte	0x5
	.uleb128 0
	.4byte	.LASF260
	.byte	0x5
	.uleb128 0
	.4byte	.LASF261
	.byte	0x5
	.uleb128 0
	.4byte	.LASF262
	.byte	0x5
	.uleb128 0
	.4byte	.LASF263
	.byte	0x5
	.uleb128 0
	.4byte	.LASF264
	.byte	0x5
	.uleb128 0
	.4byte	.LASF265
	.byte	0x5
	.uleb128 0
	.4byte	.LASF266
	.byte	0x5
	.uleb128 0
	.4byte	.LASF267
	.byte	0x5
	.uleb128 0
	.4byte	.LASF268
	.byte	0x5
	.uleb128 0
	.4byte	.LASF269
	.byte	0x5
	.uleb128 0
	.4byte	.LASF270
	.byte	0x5
	.uleb128 0
	.4byte	.LASF271
	.byte	0x5
	.uleb128 0
	.4byte	.LASF272
	.byte	0x5
	.uleb128 0
	.4byte	.LASF273
	.byte	0x5
	.uleb128 0
	.4byte	.LASF274
	.byte	0x5
	.uleb128 0
	.4byte	.LASF275
	.byte	0x5
	.uleb128 0
	.4byte	.LASF276
	.byte	0x5
	.uleb128 0
	.4byte	.LASF277
	.byte	0x5
	.uleb128 0
	.4byte	.LASF278
	.byte	0x5
	.uleb128 0
	.4byte	.LASF279
	.byte	0x5
	.uleb128 0
	.4byte	.LASF280
	.byte	0x5
	.uleb128 0
	.4byte	.LASF281
	.byte	0x5
	.uleb128 0
	.4byte	.LASF282
	.byte	0x5
	.uleb128 0
	.4byte	.LASF283
	.byte	0x5
	.uleb128 0
	.4byte	.LASF284
	.byte	0x5
	.uleb128 0
	.4byte	.LASF285
	.byte	0x5
	.uleb128 0
	.4byte	.LASF286
	.byte	0x5
	.uleb128 0
	.4byte	.LASF287
	.byte	0x5
	.uleb128 0
	.4byte	.LASF288
	.byte	0x5
	.uleb128 0
	.4byte	.LASF289
	.byte	0x5
	.uleb128 0
	.4byte	.LASF290
	.byte	0x5
	.uleb128 0
	.4byte	.LASF291
	.byte	0x5
	.uleb128 0
	.4byte	.LASF292
	.byte	0x5
	.uleb128 0
	.4byte	.LASF293
	.byte	0x5
	.uleb128 0
	.4byte	.LASF294
	.byte	0x5
	.uleb128 0
	.4byte	.LASF295
	.byte	0x5
	.uleb128 0
	.4byte	.LASF296
	.byte	0x5
	.uleb128 0
	.4byte	.LASF297
	.byte	0x5
	.uleb128 0
	.4byte	.LASF298
	.byte	0x5
	.uleb128 0
	.4byte	.LASF299
	.byte	0x5
	.uleb128 0
	.4byte	.LASF300
	.byte	0x5
	.uleb128 0
	.4byte	.LASF301
	.byte	0x5
	.uleb128 0
	.4byte	.LASF302
	.byte	0x5
	.uleb128 0
	.4byte	.LASF303
	.byte	0x5
	.uleb128 0
	.4byte	.LASF304
	.byte	0x5
	.uleb128 0
	.4byte	.LASF305
	.byte	0x5
	.uleb128 0
	.4byte	.LASF306
	.byte	0x5
	.uleb128 0
	.4byte	.LASF307
	.byte	0x5
	.uleb128 0
	.4byte	.LASF308
	.byte	0x5
	.uleb128 0
	.4byte	.LASF309
	.byte	0x5
	.uleb128 0
	.4byte	.LASF310
	.byte	0x5
	.uleb128 0
	.4byte	.LASF311
	.byte	0x5
	.uleb128 0
	.4byte	.LASF312
	.byte	0x5
	.uleb128 0
	.4byte	.LASF313
	.byte	0x5
	.uleb128 0
	.4byte	.LASF314
	.byte	0x5
	.uleb128 0
	.4byte	.LASF315
	.byte	0x5
	.uleb128 0
	.4byte	.LASF316
	.byte	0x5
	.uleb128 0
	.4byte	.LASF317
	.byte	0x5
	.uleb128 0
	.4byte	.LASF318
	.byte	0x5
	.uleb128 0
	.4byte	.LASF319
	.byte	0x5
	.uleb128 0
	.4byte	.LASF320
	.byte	0x5
	.uleb128 0
	.4byte	.LASF321
	.byte	0x5
	.uleb128 0
	.4byte	.LASF322
	.byte	0x5
	.uleb128 0
	.4byte	.LASF323
	.byte	0x5
	.uleb128 0
	.4byte	.LASF324
	.byte	0x5
	.uleb128 0
	.4byte	.LASF325
	.byte	0x5
	.uleb128 0
	.4byte	.LASF326
	.byte	0x5
	.uleb128 0
	.4byte	.LASF327
	.byte	0x5
	.uleb128 0
	.4byte	.LASF328
	.byte	0x5
	.uleb128 0
	.4byte	.LASF329
	.byte	0x5
	.uleb128 0
	.4byte	.LASF330
	.byte	0x5
	.uleb128 0
	.4byte	.LASF331
	.byte	0x5
	.uleb128 0
	.4byte	.LASF332
	.byte	0x5
	.uleb128 0
	.4byte	.LASF333
	.byte	0x5
	.uleb128 0
	.4byte	.LASF334
	.byte	0x5
	.uleb128 0
	.4byte	.LASF335
	.byte	0x5
	.uleb128 0
	.4byte	.LASF336
	.byte	0x5
	.uleb128 0
	.4byte	.LASF337
	.byte	0x5
	.uleb128 0
	.4byte	.LASF338
	.byte	0x5
	.uleb128 0
	.4byte	.LASF339
	.byte	0x5
	.uleb128 0
	.4byte	.LASF340
	.byte	0x5
	.uleb128 0
	.4byte	.LASF341
	.byte	0x5
	.uleb128 0
	.4byte	.LASF342
	.byte	0x5
	.uleb128 0
	.4byte	.LASF343
	.byte	0x5
	.uleb128 0
	.4byte	.LASF344
	.byte	0x5
	.uleb128 0
	.4byte	.LASF345
	.byte	0x5
	.uleb128 0
	.4byte	.LASF346
	.byte	0x5
	.uleb128 0
	.4byte	.LASF347
	.byte	0x5
	.uleb128 0
	.4byte	.LASF348
	.byte	0x5
	.uleb128 0
	.4byte	.LASF349
	.byte	0x5
	.uleb128 0
	.4byte	.LASF350
	.byte	0x5
	.uleb128 0
	.4byte	.LASF351
	.byte	0x5
	.uleb128 0
	.4byte	.LASF352
	.byte	0x5
	.uleb128 0
	.4byte	.LASF353
	.byte	0x5
	.uleb128 0
	.4byte	.LASF354
	.byte	0x5
	.uleb128 0
	.4byte	.LASF355
	.byte	0x5
	.uleb128 0
	.4byte	.LASF356
	.byte	0x5
	.uleb128 0
	.4byte	.LASF357
	.byte	0x5
	.uleb128 0
	.4byte	.LASF358
	.byte	0x5
	.uleb128 0
	.4byte	.LASF359
	.byte	0x5
	.uleb128 0
	.4byte	.LASF360
	.byte	0x5
	.uleb128 0
	.4byte	.LASF361
	.byte	0x5
	.uleb128 0
	.4byte	.LASF362
	.byte	0x5
	.uleb128 0
	.4byte	.LASF363
	.byte	0x5
	.uleb128 0
	.4byte	.LASF364
	.byte	0x5
	.uleb128 0
	.4byte	.LASF365
	.byte	0x5
	.uleb128 0
	.4byte	.LASF366
	.byte	0x5
	.uleb128 0
	.4byte	.LASF367
	.byte	0x5
	.uleb128 0
	.4byte	.LASF368
	.byte	0x5
	.uleb128 0
	.4byte	.LASF369
	.byte	0x5
	.uleb128 0
	.4byte	.LASF370
	.byte	0x5
	.uleb128 0
	.4byte	.LASF371
	.byte	0x5
	.uleb128 0
	.4byte	.LASF372
	.byte	0x5
	.uleb128 0
	.4byte	.LASF373
	.byte	0x5
	.uleb128 0
	.4byte	.LASF374
	.byte	0x5
	.uleb128 0
	.4byte	.LASF375
	.byte	0x5
	.uleb128 0
	.4byte	.LASF376
	.byte	0x5
	.uleb128 0
	.4byte	.LASF377
	.byte	0x5
	.uleb128 0
	.4byte	.LASF378
	.byte	0x5
	.uleb128 0
	.4byte	.LASF379
	.byte	0x5
	.uleb128 0
	.4byte	.LASF380
	.byte	0x5
	.uleb128 0
	.4byte	.LASF381
	.byte	0x5
	.uleb128 0
	.4byte	.LASF382
	.byte	0x5
	.uleb128 0
	.4byte	.LASF383
	.byte	0x5
	.uleb128 0
	.4byte	.LASF384
	.byte	0x5
	.uleb128 0
	.4byte	.LASF385
	.byte	0x5
	.uleb128 0
	.4byte	.LASF386
	.byte	0x5
	.uleb128 0
	.4byte	.LASF387
	.byte	0x5
	.uleb128 0
	.4byte	.LASF388
	.byte	0x5
	.uleb128 0
	.4byte	.LASF389
	.byte	0x5
	.uleb128 0
	.4byte	.LASF390
	.byte	0x5
	.uleb128 0
	.4byte	.LASF391
	.byte	0x5
	.uleb128 0
	.4byte	.LASF392
	.byte	0x5
	.uleb128 0
	.4byte	.LASF393
	.byte	0x5
	.uleb128 0
	.4byte	.LASF394
	.byte	0x5
	.uleb128 0
	.4byte	.LASF395
	.byte	0x5
	.uleb128 0
	.4byte	.LASF396
	.byte	0x6
	.uleb128 0
	.4byte	.LASF397
	.byte	0x5
	.uleb128 0
	.4byte	.LASF398
	.byte	0x6
	.uleb128 0
	.4byte	.LASF399
	.byte	0x6
	.uleb128 0
	.4byte	.LASF400
	.byte	0x6
	.uleb128 0
	.4byte	.LASF401
	.byte	0x5
	.uleb128 0
	.4byte	.LASF402
	.byte	0x6
	.uleb128 0
	.4byte	.LASF403
	.byte	0x6
	.uleb128 0
	.4byte	.LASF404
	.byte	0x5
	.uleb128 0
	.4byte	.LASF405
	.byte	0x5
	.uleb128 0
	.4byte	.LASF406
	.byte	0x6
	.uleb128 0
	.4byte	.LASF407
	.byte	0x5
	.uleb128 0
	.4byte	.LASF408
	.byte	0x5
	.uleb128 0
	.4byte	.LASF409
	.byte	0x5
	.uleb128 0
	.4byte	.LASF410
	.byte	0x6
	.uleb128 0
	.4byte	.LASF411
	.byte	0x5
	.uleb128 0
	.4byte	.LASF412
	.byte	0x5
	.uleb128 0
	.4byte	.LASF413
	.byte	0x6
	.uleb128 0
	.4byte	.LASF414
	.byte	0x5
	.uleb128 0
	.4byte	.LASF415
	.byte	0x5
	.uleb128 0
	.4byte	.LASF416
	.byte	0x5
	.uleb128 0
	.4byte	.LASF417
	.byte	0x5
	.uleb128 0
	.4byte	.LASF418
	.byte	0x5
	.uleb128 0
	.4byte	.LASF419
	.byte	0x6
	.uleb128 0
	.4byte	.LASF420
	.byte	0x5
	.uleb128 0
	.4byte	.LASF421
	.byte	0x5
	.uleb128 0
	.4byte	.LASF422
	.byte	0x5
	.uleb128 0
	.4byte	.LASF423
	.byte	0x6
	.uleb128 0
	.4byte	.LASF424
	.byte	0x5
	.uleb128 0
	.4byte	.LASF425
	.byte	0x6
	.uleb128 0
	.4byte	.LASF426
	.byte	0x6
	.uleb128 0
	.4byte	.LASF427
	.byte	0x6
	.uleb128 0
	.4byte	.LASF428
	.byte	0x6
	.uleb128 0
	.4byte	.LASF429
	.byte	0x6
	.uleb128 0
	.4byte	.LASF430
	.byte	0x6
	.uleb128 0
	.4byte	.LASF431
	.byte	0x5
	.uleb128 0
	.4byte	.LASF432
	.byte	0x6
	.uleb128 0
	.4byte	.LASF433
	.byte	0x6
	.uleb128 0
	.4byte	.LASF434
	.byte	0x6
	.uleb128 0
	.4byte	.LASF435
	.byte	0x5
	.uleb128 0
	.4byte	.LASF436
	.byte	0x5
	.uleb128 0
	.4byte	.LASF437
	.byte	0x5
	.uleb128 0
	.4byte	.LASF438
	.byte	0x5
	.uleb128 0
	.4byte	.LASF439
	.byte	0x5
	.uleb128 0
	.4byte	.LASF440
	.byte	0x5
	.uleb128 0
	.4byte	.LASF441
	.byte	0x5
	.uleb128 0
	.4byte	.LASF442
	.byte	0x6
	.uleb128 0
	.4byte	.LASF443
	.byte	0x5
	.uleb128 0
	.4byte	.LASF444
	.byte	0x5
	.uleb128 0
	.4byte	.LASF445
	.byte	0x5
	.uleb128 0
	.4byte	.LASF446
	.byte	0x5
	.uleb128 0
	.4byte	.LASF447
	.byte	0x5
	.uleb128 0
	.4byte	.LASF437
	.byte	0x5
	.uleb128 0
	.4byte	.LASF448
	.byte	0x5
	.uleb128 0
	.4byte	.LASF449
	.byte	0x5
	.uleb128 0
	.4byte	.LASF450
	.byte	0x5
	.uleb128 0
	.4byte	.LASF451
	.byte	0x5
	.uleb128 0
	.4byte	.LASF452
	.byte	0x5
	.uleb128 0
	.4byte	.LASF453
	.byte	0x5
	.uleb128 0
	.4byte	.LASF454
	.byte	0x5
	.uleb128 0
	.4byte	.LASF455
	.byte	0x5
	.uleb128 0
	.4byte	.LASF456
	.byte	0x5
	.uleb128 0
	.4byte	.LASF457
	.byte	0x5
	.uleb128 0
	.4byte	.LASF458
	.byte	0x5
	.uleb128 0
	.4byte	.LASF459
	.byte	0x5
	.uleb128 0
	.4byte	.LASF460
	.byte	0x5
	.uleb128 0
	.4byte	.LASF461
	.byte	0x5
	.uleb128 0
	.4byte	.LASF462
	.byte	0x5
	.uleb128 0
	.4byte	.LASF463
	.byte	0x5
	.uleb128 0
	.4byte	.LASF464
	.byte	0x5
	.uleb128 0
	.4byte	.LASF465
	.byte	0x5
	.uleb128 0
	.4byte	.LASF466
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.assert.h.45.d019fe2468b7b17465d3027651017f7d,comdat
.Ldebug_macro3:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x2d
	.4byte	.LASF467
	.byte	0x5
	.uleb128 0x48
	.4byte	.LASF468
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.__crossworks.h.45.c15bb6e0a60630589d552427ceaabe49,comdat
.Ldebug_macro4:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x2d
	.4byte	.LASF470
	.byte	0x5
	.uleb128 0x41
	.4byte	.LASF471
	.byte	0x6
	.uleb128 0x43
	.4byte	.LASF472
	.byte	0x5
	.uleb128 0x45
	.4byte	.LASF473
	.byte	0x5
	.uleb128 0x49
	.4byte	.LASF474
	.byte	0x5
	.uleb128 0x4b
	.4byte	.LASF475
	.byte	0x5
	.uleb128 0x5c
	.4byte	.LASF476
	.byte	0x5
	.uleb128 0x63
	.4byte	.LASF471
	.byte	0x5
	.uleb128 0x69
	.4byte	.LASF477
	.byte	0x5
	.uleb128 0x6a
	.4byte	.LASF478
	.byte	0x5
	.uleb128 0x6b
	.4byte	.LASF479
	.byte	0x5
	.uleb128 0x6c
	.4byte	.LASF480
	.byte	0x5
	.uleb128 0x6d
	.4byte	.LASF481
	.byte	0x5
	.uleb128 0x6e
	.4byte	.LASF482
	.byte	0x5
	.uleb128 0x6f
	.4byte	.LASF483
	.byte	0x5
	.uleb128 0x70
	.4byte	.LASF484
	.byte	0x5
	.uleb128 0x73
	.4byte	.LASF485
	.byte	0x5
	.uleb128 0x74
	.4byte	.LASF486
	.byte	0x5
	.uleb128 0x75
	.4byte	.LASF487
	.byte	0x5
	.uleb128 0x76
	.4byte	.LASF488
	.byte	0x5
	.uleb128 0x7b
	.4byte	.LASF489
	.byte	0x5
	.uleb128 0xda
	.4byte	.LASF490
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.stdlib.h.54.34e6c3eb1c7772d5405254538c14b58d,comdat
.Ldebug_macro5:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x36
	.4byte	.LASF491
	.byte	0x5
	.uleb128 0x3c
	.4byte	.LASF492
	.byte	0x5
	.uleb128 0x42
	.4byte	.LASF493
	.byte	0x5
	.uleb128 0x4a
	.4byte	.LASF494
	.byte	0x5
	.uleb128 0x51
	.4byte	.LASF495
	.byte	0x5
	.uleb128 0x59
	.4byte	.LASF496
	.byte	0x5
	.uleb128 0x63
	.4byte	.LASF497
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.deca_types.h.14.6a92ca4fca691e93f02f7fb3f074b7c2,comdat
.Ldebug_macro6:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0xe
	.4byte	.LASF498
	.byte	0x5
	.uleb128 0x16
	.4byte	.LASF499
	.byte	0x5
	.uleb128 0x1d
	.4byte	.LASF500
	.byte	0x5
	.uleb128 0x24
	.4byte	.LASF501
	.byte	0x5
	.uleb128 0x2b
	.4byte	.LASF502
	.byte	0x5
	.uleb128 0x32
	.4byte	.LASF503
	.byte	0x5
	.uleb128 0x39
	.4byte	.LASF504
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.deca_param_types.h.13.4021bfe1d83d669cab5546bfac4b21b6,comdat
.Ldebug_macro7:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0xd
	.4byte	.LASF505
	.byte	0x5
	.uleb128 0x14
	.4byte	.LASF506
	.byte	0x5
	.uleb128 0x15
	.4byte	.LASF507
	.byte	0x5
	.uleb128 0x16
	.4byte	.LASF508
	.byte	0x5
	.uleb128 0x17
	.4byte	.LASF509
	.byte	0x5
	.uleb128 0x18
	.4byte	.LASF510
	.byte	0x5
	.uleb128 0x19
	.4byte	.LASF511
	.byte	0x5
	.uleb128 0x1a
	.4byte	.LASF512
	.byte	0x5
	.uleb128 0x1b
	.4byte	.LASF513
	.byte	0x5
	.uleb128 0x2a
	.4byte	.LASF514
	.byte	0x5
	.uleb128 0x35
	.4byte	.LASF515
	.byte	0x5
	.uleb128 0x36
	.4byte	.LASF516
	.byte	0x5
	.uleb128 0x37
	.4byte	.LASF517
	.byte	0x5
	.uleb128 0x39
	.4byte	.LASF518
	.byte	0x5
	.uleb128 0x3a
	.4byte	.LASF519
	.byte	0x5
	.uleb128 0x3c
	.4byte	.LASF520
	.byte	0x5
	.uleb128 0x3d
	.4byte	.LASF521
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.deca_version.h.14.ee10344d5ef0ddde46a0e36cedaa3d70,comdat
.Ldebug_macro8:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0xe
	.4byte	.LASF523
	.byte	0x5
	.uleb128 0x1d
	.4byte	.LASF524
	.byte	0x5
	.uleb128 0x1e
	.4byte	.LASF525
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.deca_regs.h.27.42a97b62ef1d1221b424915f8e055445,comdat
.Ldebug_macro9:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x1b
	.4byte	.LASF526
	.byte	0x5
	.uleb128 0x1c
	.4byte	.LASF527
	.byte	0x5
	.uleb128 0x1e
	.4byte	.LASF528
	.byte	0x5
	.uleb128 0x1f
	.4byte	.LASF529
	.byte	0x5
	.uleb128 0x20
	.4byte	.LASF530
	.byte	0x5
	.uleb128 0x21
	.4byte	.LASF531
	.byte	0x5
	.uleb128 0x26
	.4byte	.LASF532
	.byte	0x5
	.uleb128 0x27
	.4byte	.LASF533
	.byte	0x5
	.uleb128 0x28
	.4byte	.LASF534
	.byte	0x5
	.uleb128 0x2d
	.4byte	.LASF535
	.byte	0x5
	.uleb128 0x2e
	.4byte	.LASF536
	.byte	0x5
	.uleb128 0x30
	.4byte	.LASF537
	.byte	0x5
	.uleb128 0x31
	.4byte	.LASF538
	.byte	0x5
	.uleb128 0x32
	.4byte	.LASF539
	.byte	0x5
	.uleb128 0x33
	.4byte	.LASF540
	.byte	0x5
	.uleb128 0x38
	.4byte	.LASF541
	.byte	0x5
	.uleb128 0x3d
	.4byte	.LASF542
	.byte	0x5
	.uleb128 0x3e
	.4byte	.LASF543
	.byte	0x5
	.uleb128 0x40
	.4byte	.LASF544
	.byte	0x5
	.uleb128 0x41
	.4byte	.LASF545
	.byte	0x5
	.uleb128 0x43
	.4byte	.LASF546
	.byte	0x5
	.uleb128 0x44
	.4byte	.LASF547
	.byte	0x5
	.uleb128 0x45
	.4byte	.LASF548
	.byte	0x5
	.uleb128 0x46
	.4byte	.LASF549
	.byte	0x5
	.uleb128 0x47
	.4byte	.LASF550
	.byte	0x5
	.uleb128 0x48
	.4byte	.LASF551
	.byte	0x5
	.uleb128 0x49
	.4byte	.LASF552
	.byte	0x5
	.uleb128 0x4a
	.4byte	.LASF553
	.byte	0x5
	.uleb128 0x4c
	.4byte	.LASF554
	.byte	0x5
	.uleb128 0x4d
	.4byte	.LASF555
	.byte	0x5
	.uleb128 0x4e
	.4byte	.LASF556
	.byte	0x5
	.uleb128 0x4f
	.4byte	.LASF557
	.byte	0x5
	.uleb128 0x50
	.4byte	.LASF558
	.byte	0x5
	.uleb128 0x51
	.4byte	.LASF559
	.byte	0x5
	.uleb128 0x52
	.4byte	.LASF560
	.byte	0x5
	.uleb128 0x53
	.4byte	.LASF561
	.byte	0x5
	.uleb128 0x55
	.4byte	.LASF562
	.byte	0x5
	.uleb128 0x56
	.4byte	.LASF563
	.byte	0x5
	.uleb128 0x57
	.4byte	.LASF564
	.byte	0x5
	.uleb128 0x58
	.4byte	.LASF565
	.byte	0x5
	.uleb128 0x59
	.4byte	.LASF566
	.byte	0x5
	.uleb128 0x5b
	.4byte	.LASF567
	.byte	0x5
	.uleb128 0x5c
	.4byte	.LASF568
	.byte	0x5
	.uleb128 0x5d
	.4byte	.LASF569
	.byte	0x5
	.uleb128 0x5e
	.4byte	.LASF570
	.byte	0x5
	.uleb128 0x64
	.4byte	.LASF571
	.byte	0x5
	.uleb128 0x65
	.4byte	.LASF572
	.byte	0x5
	.uleb128 0x66
	.4byte	.LASF573
	.byte	0x5
	.uleb128 0x6c
	.4byte	.LASF574
	.byte	0x5
	.uleb128 0x71
	.4byte	.LASF575
	.byte	0x5
	.uleb128 0x72
	.4byte	.LASF576
	.byte	0x5
	.uleb128 0x74
	.4byte	.LASF577
	.byte	0x5
	.uleb128 0x75
	.4byte	.LASF578
	.byte	0x5
	.uleb128 0x76
	.4byte	.LASF579
	.byte	0x5
	.uleb128 0x77
	.4byte	.LASF580
	.byte	0x5
	.uleb128 0x78
	.4byte	.LASF581
	.byte	0x5
	.uleb128 0x79
	.4byte	.LASF582
	.byte	0x5
	.uleb128 0x7a
	.4byte	.LASF583
	.byte	0x5
	.uleb128 0x7b
	.4byte	.LASF584
	.byte	0x5
	.uleb128 0x7c
	.4byte	.LASF585
	.byte	0x5
	.uleb128 0x7f
	.4byte	.LASF586
	.byte	0x5
	.uleb128 0x80
	.4byte	.LASF587
	.byte	0x5
	.uleb128 0x81
	.4byte	.LASF588
	.byte	0x5
	.uleb128 0x82
	.4byte	.LASF589
	.byte	0x5
	.uleb128 0x83
	.4byte	.LASF590
	.byte	0x5
	.uleb128 0x84
	.4byte	.LASF591
	.byte	0x5
	.uleb128 0x86
	.4byte	.LASF592
	.byte	0x5
	.uleb128 0x87
	.4byte	.LASF593
	.byte	0x5
	.uleb128 0x88
	.4byte	.LASF594
	.byte	0x5
	.uleb128 0x89
	.4byte	.LASF595
	.byte	0x5
	.uleb128 0x8a
	.4byte	.LASF596
	.byte	0x5
	.uleb128 0x8b
	.4byte	.LASF597
	.byte	0x5
	.uleb128 0x8c
	.4byte	.LASF598
	.byte	0x5
	.uleb128 0x8d
	.4byte	.LASF599
	.byte	0x5
	.uleb128 0x8e
	.4byte	.LASF600
	.byte	0x5
	.uleb128 0x8f
	.4byte	.LASF601
	.byte	0x5
	.uleb128 0x90
	.4byte	.LASF602
	.byte	0x5
	.uleb128 0x91
	.4byte	.LASF603
	.byte	0x5
	.uleb128 0x92
	.4byte	.LASF604
	.byte	0x5
	.uleb128 0x93
	.4byte	.LASF605
	.byte	0x5
	.uleb128 0x94
	.4byte	.LASF606
	.byte	0x5
	.uleb128 0x96
	.4byte	.LASF607
	.byte	0x5
	.uleb128 0x97
	.4byte	.LASF608
	.byte	0x5
	.uleb128 0x99
	.4byte	.LASF609
	.byte	0x5
	.uleb128 0x9e
	.4byte	.LASF610
	.byte	0x5
	.uleb128 0x9f
	.4byte	.LASF611
	.byte	0x5
	.uleb128 0xa4
	.4byte	.LASF612
	.byte	0x5
	.uleb128 0xa5
	.4byte	.LASF613
	.byte	0x5
	.uleb128 0xaa
	.4byte	.LASF614
	.byte	0x5
	.uleb128 0xaf
	.4byte	.LASF615
	.byte	0x5
	.uleb128 0xb0
	.4byte	.LASF616
	.byte	0x5
	.uleb128 0xb1
	.4byte	.LASF617
	.byte	0x5
	.uleb128 0xb3
	.4byte	.LASF618
	.byte	0x5
	.uleb128 0xb8
	.4byte	.LASF619
	.byte	0x5
	.uleb128 0xb9
	.4byte	.LASF620
	.byte	0x5
	.uleb128 0xba
	.4byte	.LASF621
	.byte	0x5
	.uleb128 0xbc
	.4byte	.LASF622
	.byte	0x5
	.uleb128 0xbe
	.4byte	.LASF623
	.byte	0x5
	.uleb128 0xbf
	.4byte	.LASF624
	.byte	0x5
	.uleb128 0xc0
	.4byte	.LASF625
	.byte	0x5
	.uleb128 0xc1
	.4byte	.LASF626
	.byte	0x5
	.uleb128 0xc2
	.4byte	.LASF627
	.byte	0x5
	.uleb128 0xc3
	.4byte	.LASF628
	.byte	0x5
	.uleb128 0xc5
	.4byte	.LASF629
	.byte	0x5
	.uleb128 0xc6
	.4byte	.LASF630
	.byte	0x5
	.uleb128 0xc9
	.4byte	.LASF631
	.byte	0x5
	.uleb128 0xca
	.4byte	.LASF632
	.byte	0x5
	.uleb128 0xcb
	.4byte	.LASF633
	.byte	0x5
	.uleb128 0xd0
	.4byte	.LASF634
	.byte	0x5
	.uleb128 0xd1
	.4byte	.LASF635
	.byte	0x5
	.uleb128 0xd3
	.4byte	.LASF636
	.byte	0x5
	.uleb128 0xd5
	.4byte	.LASF637
	.byte	0x5
	.uleb128 0xd6
	.4byte	.LASF638
	.byte	0x5
	.uleb128 0xd7
	.4byte	.LASF639
	.byte	0x5
	.uleb128 0xd8
	.4byte	.LASF640
	.byte	0x5
	.uleb128 0xd9
	.4byte	.LASF641
	.byte	0x5
	.uleb128 0xda
	.4byte	.LASF642
	.byte	0x5
	.uleb128 0xdb
	.4byte	.LASF643
	.byte	0x5
	.uleb128 0xdd
	.4byte	.LASF644
	.byte	0x5
	.uleb128 0xde
	.4byte	.LASF645
	.byte	0x5
	.uleb128 0xdf
	.4byte	.LASF646
	.byte	0x5
	.uleb128 0xe0
	.4byte	.LASF647
	.byte	0x5
	.uleb128 0xe1
	.4byte	.LASF648
	.byte	0x5
	.uleb128 0xe2
	.4byte	.LASF649
	.byte	0x5
	.uleb128 0xe3
	.4byte	.LASF650
	.byte	0x5
	.uleb128 0xe4
	.4byte	.LASF651
	.byte	0x5
	.uleb128 0xe6
	.4byte	.LASF652
	.byte	0x5
	.uleb128 0xe7
	.4byte	.LASF653
	.byte	0x5
	.uleb128 0xe8
	.4byte	.LASF654
	.byte	0x5
	.uleb128 0xe9
	.4byte	.LASF655
	.byte	0x5
	.uleb128 0xea
	.4byte	.LASF656
	.byte	0x5
	.uleb128 0xeb
	.4byte	.LASF657
	.byte	0x5
	.uleb128 0xec
	.4byte	.LASF658
	.byte	0x5
	.uleb128 0xee
	.4byte	.LASF659
	.byte	0x5
	.uleb128 0xef
	.4byte	.LASF660
	.byte	0x5
	.uleb128 0xf0
	.4byte	.LASF661
	.byte	0x5
	.uleb128 0xf1
	.4byte	.LASF662
	.byte	0x5
	.uleb128 0xf2
	.4byte	.LASF663
	.byte	0x5
	.uleb128 0xf3
	.4byte	.LASF664
	.byte	0x5
	.uleb128 0xf8
	.4byte	.LASF665
	.byte	0x5
	.uleb128 0xf9
	.4byte	.LASF666
	.byte	0x5
	.uleb128 0xfa
	.4byte	.LASF667
	.byte	0x5
	.uleb128 0xfc
	.4byte	.LASF668
	.byte	0x5
	.uleb128 0xfe
	.4byte	.LASF669
	.byte	0x5
	.uleb128 0xff
	.4byte	.LASF670
	.byte	0x5
	.uleb128 0x100
	.4byte	.LASF671
	.byte	0x5
	.uleb128 0x101
	.4byte	.LASF672
	.byte	0x5
	.uleb128 0x102
	.4byte	.LASF673
	.byte	0x5
	.uleb128 0x103
	.4byte	.LASF674
	.byte	0x5
	.uleb128 0x104
	.4byte	.LASF675
	.byte	0x5
	.uleb128 0x105
	.4byte	.LASF676
	.byte	0x5
	.uleb128 0x107
	.4byte	.LASF677
	.byte	0x5
	.uleb128 0x108
	.4byte	.LASF678
	.byte	0x5
	.uleb128 0x109
	.4byte	.LASF679
	.byte	0x5
	.uleb128 0x10a
	.4byte	.LASF680
	.byte	0x5
	.uleb128 0x10b
	.4byte	.LASF681
	.byte	0x5
	.uleb128 0x10c
	.4byte	.LASF682
	.byte	0x5
	.uleb128 0x10d
	.4byte	.LASF683
	.byte	0x5
	.uleb128 0x10e
	.4byte	.LASF684
	.byte	0x5
	.uleb128 0x110
	.4byte	.LASF685
	.byte	0x5
	.uleb128 0x111
	.4byte	.LASF686
	.byte	0x5
	.uleb128 0x113
	.4byte	.LASF687
	.byte	0x5
	.uleb128 0x114
	.4byte	.LASF688
	.byte	0x5
	.uleb128 0x115
	.4byte	.LASF689
	.byte	0x5
	.uleb128 0x116
	.4byte	.LASF690
	.byte	0x5
	.uleb128 0x117
	.4byte	.LASF691
	.byte	0x5
	.uleb128 0x118
	.4byte	.LASF692
	.byte	0x5
	.uleb128 0x11a
	.4byte	.LASF693
	.byte	0x5
	.uleb128 0x11b
	.4byte	.LASF694
	.byte	0x5
	.uleb128 0x11c
	.4byte	.LASF695
	.byte	0x5
	.uleb128 0x11d
	.4byte	.LASF696
	.byte	0x5
	.uleb128 0x11e
	.4byte	.LASF697
	.byte	0x5
	.uleb128 0x11f
	.4byte	.LASF698
	.byte	0x5
	.uleb128 0x120
	.4byte	.LASF699
	.byte	0x5
	.uleb128 0x121
	.4byte	.LASF700
	.byte	0x5
	.uleb128 0x123
	.4byte	.LASF701
	.byte	0x5
	.uleb128 0x124
	.4byte	.LASF702
	.byte	0x5
	.uleb128 0x125
	.4byte	.LASF703
	.byte	0x5
	.uleb128 0x127
	.4byte	.LASF704
	.byte	0x5
	.uleb128 0x12a
	.4byte	.LASF705
	.byte	0x5
	.uleb128 0x12e
	.4byte	.LASF706
	.byte	0x5
	.uleb128 0x131
	.4byte	.LASF707
	.byte	0x5
	.uleb128 0x135
	.4byte	.LASF708
	.byte	0x5
	.uleb128 0x138
	.4byte	.LASF709
	.byte	0x5
	.uleb128 0x13f
	.4byte	.LASF710
	.byte	0x5
	.uleb128 0x140
	.4byte	.LASF711
	.byte	0x5
	.uleb128 0x141
	.4byte	.LASF712
	.byte	0x5
	.uleb128 0x143
	.4byte	.LASF713
	.byte	0x5
	.uleb128 0x144
	.4byte	.LASF714
	.byte	0x5
	.uleb128 0x145
	.4byte	.LASF715
	.byte	0x5
	.uleb128 0x146
	.4byte	.LASF716
	.byte	0x5
	.uleb128 0x148
	.4byte	.LASF717
	.byte	0x5
	.uleb128 0x149
	.4byte	.LASF718
	.byte	0x5
	.uleb128 0x14b
	.4byte	.LASF719
	.byte	0x5
	.uleb128 0x14c
	.4byte	.LASF720
	.byte	0x5
	.uleb128 0x14d
	.4byte	.LASF721
	.byte	0x5
	.uleb128 0x14e
	.4byte	.LASF722
	.byte	0x5
	.uleb128 0x14f
	.4byte	.LASF723
	.byte	0x5
	.uleb128 0x150
	.4byte	.LASF724
	.byte	0x5
	.uleb128 0x151
	.4byte	.LASF725
	.byte	0x5
	.uleb128 0x152
	.4byte	.LASF726
	.byte	0x5
	.uleb128 0x153
	.4byte	.LASF727
	.byte	0x5
	.uleb128 0x155
	.4byte	.LASF728
	.byte	0x5
	.uleb128 0x156
	.4byte	.LASF729
	.byte	0x5
	.uleb128 0x157
	.4byte	.LASF730
	.byte	0x5
	.uleb128 0x158
	.4byte	.LASF731
	.byte	0x5
	.uleb128 0x159
	.4byte	.LASF732
	.byte	0x5
	.uleb128 0x15b
	.4byte	.LASF733
	.byte	0x5
	.uleb128 0x15c
	.4byte	.LASF734
	.byte	0x5
	.uleb128 0x15e
	.4byte	.LASF735
	.byte	0x5
	.uleb128 0x15f
	.4byte	.LASF736
	.byte	0x5
	.uleb128 0x160
	.4byte	.LASF737
	.byte	0x5
	.uleb128 0x161
	.4byte	.LASF738
	.byte	0x5
	.uleb128 0x163
	.4byte	.LASF739
	.byte	0x5
	.uleb128 0x164
	.4byte	.LASF740
	.byte	0x5
	.uleb128 0x16a
	.4byte	.LASF741
	.byte	0x5
	.uleb128 0x16b
	.4byte	.LASF742
	.byte	0x5
	.uleb128 0x171
	.4byte	.LASF743
	.byte	0x5
	.uleb128 0x172
	.4byte	.LASF744
	.byte	0x5
	.uleb128 0x176
	.4byte	.LASF745
	.byte	0x5
	.uleb128 0x177
	.4byte	.LASF746
	.byte	0x5
	.uleb128 0x178
	.4byte	.LASF747
	.byte	0x5
	.uleb128 0x179
	.4byte	.LASF748
	.byte	0x5
	.uleb128 0x17c
	.4byte	.LASF749
	.byte	0x5
	.uleb128 0x17d
	.4byte	.LASF750
	.byte	0x5
	.uleb128 0x17e
	.4byte	.LASF751
	.byte	0x5
	.uleb128 0x17f
	.4byte	.LASF752
	.byte	0x5
	.uleb128 0x182
	.4byte	.LASF753
	.byte	0x5
	.uleb128 0x183
	.4byte	.LASF754
	.byte	0x5
	.uleb128 0x184
	.4byte	.LASF755
	.byte	0x5
	.uleb128 0x185
	.4byte	.LASF756
	.byte	0x5
	.uleb128 0x188
	.4byte	.LASF757
	.byte	0x5
	.uleb128 0x189
	.4byte	.LASF758
	.byte	0x5
	.uleb128 0x18a
	.4byte	.LASF759
	.byte	0x5
	.uleb128 0x18b
	.4byte	.LASF760
	.byte	0x5
	.uleb128 0x197
	.4byte	.LASF761
	.byte	0x5
	.uleb128 0x198
	.4byte	.LASF762
	.byte	0x5
	.uleb128 0x19d
	.4byte	.LASF763
	.byte	0x5
	.uleb128 0x19e
	.4byte	.LASF764
	.byte	0x5
	.uleb128 0x1a0
	.4byte	.LASF765
	.byte	0x5
	.uleb128 0x1a2
	.4byte	.LASF766
	.byte	0x5
	.uleb128 0x1a4
	.4byte	.LASF767
	.byte	0x5
	.uleb128 0x1a6
	.4byte	.LASF768
	.byte	0x5
	.uleb128 0x1ac
	.4byte	.LASF769
	.byte	0x5
	.uleb128 0x1ad
	.4byte	.LASF770
	.byte	0x5
	.uleb128 0x1ae
	.4byte	.LASF771
	.byte	0x5
	.uleb128 0x1af
	.4byte	.LASF772
	.byte	0x5
	.uleb128 0x1b1
	.4byte	.LASF773
	.byte	0x5
	.uleb128 0x1b2
	.4byte	.LASF774
	.byte	0x5
	.uleb128 0x1b3
	.4byte	.LASF775
	.byte	0x5
	.uleb128 0x1b4
	.4byte	.LASF776
	.byte	0x5
	.uleb128 0x1ba
	.4byte	.LASF777
	.byte	0x5
	.uleb128 0x1c0
	.4byte	.LASF778
	.byte	0x5
	.uleb128 0x1c1
	.4byte	.LASF779
	.byte	0x5
	.uleb128 0x1c2
	.4byte	.LASF780
	.byte	0x5
	.uleb128 0x1c3
	.4byte	.LASF781
	.byte	0x5
	.uleb128 0x1c5
	.4byte	.LASF782
	.byte	0x5
	.uleb128 0x1c6
	.4byte	.LASF783
	.byte	0x5
	.uleb128 0x1ce
	.4byte	.LASF784
	.byte	0x5
	.uleb128 0x1cf
	.4byte	.LASF785
	.byte	0x5
	.uleb128 0x1d0
	.4byte	.LASF786
	.byte	0x5
	.uleb128 0x1da
	.4byte	.LASF787
	.byte	0x5
	.uleb128 0x1db
	.4byte	.LASF788
	.byte	0x5
	.uleb128 0x1e1
	.4byte	.LASF789
	.byte	0x5
	.uleb128 0x1e2
	.4byte	.LASF790
	.byte	0x5
	.uleb128 0x1e4
	.4byte	.LASF791
	.byte	0x5
	.uleb128 0x1e5
	.4byte	.LASF792
	.byte	0x5
	.uleb128 0x1e6
	.4byte	.LASF793
	.byte	0x5
	.uleb128 0x1e7
	.4byte	.LASF794
	.byte	0x5
	.uleb128 0x1e8
	.4byte	.LASF795
	.byte	0x5
	.uleb128 0x1e9
	.4byte	.LASF796
	.byte	0x5
	.uleb128 0x1ea
	.4byte	.LASF797
	.byte	0x5
	.uleb128 0x1f1
	.4byte	.LASF798
	.byte	0x5
	.uleb128 0x1f2
	.4byte	.LASF799
	.byte	0x5
	.uleb128 0x1f8
	.4byte	.LASF800
	.byte	0x5
	.uleb128 0x1f9
	.4byte	.LASF801
	.byte	0x5
	.uleb128 0x1fa
	.4byte	.LASF802
	.byte	0x5
	.uleb128 0x1fc
	.4byte	.LASF803
	.byte	0x5
	.uleb128 0x1fd
	.4byte	.LASF804
	.byte	0x5
	.uleb128 0x1fe
	.4byte	.LASF805
	.byte	0x5
	.uleb128 0x1ff
	.4byte	.LASF806
	.byte	0x5
	.uleb128 0x200
	.4byte	.LASF807
	.byte	0x5
	.uleb128 0x207
	.4byte	.LASF808
	.byte	0x5
	.uleb128 0x208
	.4byte	.LASF809
	.byte	0x5
	.uleb128 0x20a
	.4byte	.LASF810
	.byte	0x5
	.uleb128 0x20b
	.4byte	.LASF811
	.byte	0x5
	.uleb128 0x20c
	.4byte	.LASF812
	.byte	0x5
	.uleb128 0x20d
	.4byte	.LASF813
	.byte	0x5
	.uleb128 0x20e
	.4byte	.LASF814
	.byte	0x5
	.uleb128 0x20f
	.4byte	.LASF815
	.byte	0x5
	.uleb128 0x210
	.4byte	.LASF816
	.byte	0x5
	.uleb128 0x211
	.4byte	.LASF817
	.byte	0x5
	.uleb128 0x212
	.4byte	.LASF818
	.byte	0x5
	.uleb128 0x213
	.4byte	.LASF819
	.byte	0x5
	.uleb128 0x214
	.4byte	.LASF820
	.byte	0x5
	.uleb128 0x215
	.4byte	.LASF821
	.byte	0x5
	.uleb128 0x217
	.4byte	.LASF822
	.byte	0x5
	.uleb128 0x218
	.4byte	.LASF823
	.byte	0x5
	.uleb128 0x219
	.4byte	.LASF824
	.byte	0x5
	.uleb128 0x21f
	.4byte	.LASF825
	.byte	0x5
	.uleb128 0x220
	.4byte	.LASF826
	.byte	0x5
	.uleb128 0x222
	.4byte	.LASF827
	.byte	0x5
	.uleb128 0x223
	.4byte	.LASF828
	.byte	0x5
	.uleb128 0x224
	.4byte	.LASF829
	.byte	0x5
	.uleb128 0x226
	.4byte	.LASF830
	.byte	0x5
	.uleb128 0x227
	.4byte	.LASF831
	.byte	0x5
	.uleb128 0x229
	.4byte	.LASF832
	.byte	0x5
	.uleb128 0x22a
	.4byte	.LASF833
	.byte	0x5
	.uleb128 0x22c
	.4byte	.LASF834
	.byte	0x5
	.uleb128 0x22d
	.4byte	.LASF835
	.byte	0x5
	.uleb128 0x22e
	.4byte	.LASF836
	.byte	0x5
	.uleb128 0x22f
	.4byte	.LASF837
	.byte	0x5
	.uleb128 0x230
	.4byte	.LASF838
	.byte	0x5
	.uleb128 0x231
	.4byte	.LASF839
	.byte	0x5
	.uleb128 0x232
	.4byte	.LASF840
	.byte	0x5
	.uleb128 0x234
	.4byte	.LASF841
	.byte	0x5
	.uleb128 0x235
	.4byte	.LASF842
	.byte	0x5
	.uleb128 0x236
	.4byte	.LASF843
	.byte	0x5
	.uleb128 0x237
	.4byte	.LASF844
	.byte	0x5
	.uleb128 0x238
	.4byte	.LASF845
	.byte	0x5
	.uleb128 0x239
	.4byte	.LASF846
	.byte	0x5
	.uleb128 0x241
	.4byte	.LASF847
	.byte	0x5
	.uleb128 0x247
	.4byte	.LASF848
	.byte	0x5
	.uleb128 0x248
	.4byte	.LASF849
	.byte	0x5
	.uleb128 0x249
	.4byte	.LASF850
	.byte	0x5
	.uleb128 0x24a
	.4byte	.LASF851
	.byte	0x5
	.uleb128 0x24b
	.4byte	.LASF852
	.byte	0x5
	.uleb128 0x251
	.4byte	.LASF853
	.byte	0x5
	.uleb128 0x257
	.4byte	.LASF854
	.byte	0x5
	.uleb128 0x258
	.4byte	.LASF855
	.byte	0x5
	.uleb128 0x259
	.4byte	.LASF856
	.byte	0x5
	.uleb128 0x25b
	.4byte	.LASF857
	.byte	0x5
	.uleb128 0x25c
	.4byte	.LASF858
	.byte	0x5
	.uleb128 0x25d
	.4byte	.LASF859
	.byte	0x5
	.uleb128 0x25e
	.4byte	.LASF860
	.byte	0x5
	.uleb128 0x261
	.4byte	.LASF861
	.byte	0x5
	.uleb128 0x262
	.4byte	.LASF862
	.byte	0x5
	.uleb128 0x263
	.4byte	.LASF863
	.byte	0x5
	.uleb128 0x264
	.4byte	.LASF864
	.byte	0x5
	.uleb128 0x265
	.4byte	.LASF865
	.byte	0x5
	.uleb128 0x268
	.4byte	.LASF866
	.byte	0x5
	.uleb128 0x269
	.4byte	.LASF867
	.byte	0x5
	.uleb128 0x26a
	.4byte	.LASF868
	.byte	0x5
	.uleb128 0x26b
	.4byte	.LASF869
	.byte	0x5
	.uleb128 0x26e
	.4byte	.LASF870
	.byte	0x5
	.uleb128 0x26f
	.4byte	.LASF871
	.byte	0x5
	.uleb128 0x270
	.4byte	.LASF872
	.byte	0x5
	.uleb128 0x271
	.4byte	.LASF873
	.byte	0x5
	.uleb128 0x273
	.4byte	.LASF874
	.byte	0x5
	.uleb128 0x274
	.4byte	.LASF875
	.byte	0x5
	.uleb128 0x275
	.4byte	.LASF876
	.byte	0x5
	.uleb128 0x276
	.4byte	.LASF877
	.byte	0x5
	.uleb128 0x277
	.4byte	.LASF878
	.byte	0x5
	.uleb128 0x27c
	.4byte	.LASF879
	.byte	0x5
	.uleb128 0x27d
	.4byte	.LASF880
	.byte	0x5
	.uleb128 0x27f
	.4byte	.LASF881
	.byte	0x5
	.uleb128 0x280
	.4byte	.LASF882
	.byte	0x5
	.uleb128 0x281
	.4byte	.LASF883
	.byte	0x5
	.uleb128 0x282
	.4byte	.LASF884
	.byte	0x5
	.uleb128 0x283
	.4byte	.LASF885
	.byte	0x5
	.uleb128 0x284
	.4byte	.LASF886
	.byte	0x5
	.uleb128 0x285
	.4byte	.LASF887
	.byte	0x5
	.uleb128 0x286
	.4byte	.LASF888
	.byte	0x5
	.uleb128 0x288
	.4byte	.LASF889
	.byte	0x5
	.uleb128 0x289
	.4byte	.LASF890
	.byte	0x5
	.uleb128 0x28a
	.4byte	.LASF891
	.byte	0x5
	.uleb128 0x28c
	.4byte	.LASF892
	.byte	0x5
	.uleb128 0x28d
	.4byte	.LASF893
	.byte	0x5
	.uleb128 0x28e
	.4byte	.LASF894
	.byte	0x5
	.uleb128 0x28f
	.4byte	.LASF895
	.byte	0x5
	.uleb128 0x295
	.4byte	.LASF896
	.byte	0x5
	.uleb128 0x296
	.4byte	.LASF897
	.byte	0x5
	.uleb128 0x29c
	.4byte	.LASF898
	.byte	0x5
	.uleb128 0x29d
	.4byte	.LASF899
	.byte	0x5
	.uleb128 0x2a0
	.4byte	.LASF900
	.byte	0x5
	.uleb128 0x2a1
	.4byte	.LASF901
	.byte	0x5
	.uleb128 0x2a2
	.4byte	.LASF902
	.byte	0x5
	.uleb128 0x2a4
	.4byte	.LASF903
	.byte	0x5
	.uleb128 0x2a5
	.4byte	.LASF904
	.byte	0x5
	.uleb128 0x2a6
	.4byte	.LASF905
	.byte	0x5
	.uleb128 0x2a7
	.4byte	.LASF906
	.byte	0x5
	.uleb128 0x2a8
	.4byte	.LASF907
	.byte	0x5
	.uleb128 0x2a9
	.4byte	.LASF908
	.byte	0x5
	.uleb128 0x2aa
	.4byte	.LASF909
	.byte	0x5
	.uleb128 0x2ab
	.4byte	.LASF910
	.byte	0x5
	.uleb128 0x2ac
	.4byte	.LASF911
	.byte	0x5
	.uleb128 0x2ae
	.4byte	.LASF912
	.byte	0x5
	.uleb128 0x2af
	.4byte	.LASF913
	.byte	0x5
	.uleb128 0x2b0
	.4byte	.LASF914
	.byte	0x5
	.uleb128 0x2b1
	.4byte	.LASF915
	.byte	0x5
	.uleb128 0x2b2
	.4byte	.LASF916
	.byte	0x5
	.uleb128 0x2b5
	.4byte	.LASF917
	.byte	0x5
	.uleb128 0x2b6
	.4byte	.LASF918
	.byte	0x5
	.uleb128 0x2b7
	.4byte	.LASF919
	.byte	0x5
	.uleb128 0x2b9
	.4byte	.LASF920
	.byte	0x5
	.uleb128 0x2ba
	.4byte	.LASF921
	.byte	0x5
	.uleb128 0x2bb
	.4byte	.LASF922
	.byte	0x5
	.uleb128 0x2bc
	.4byte	.LASF923
	.byte	0x5
	.uleb128 0x2bd
	.4byte	.LASF924
	.byte	0x5
	.uleb128 0x2be
	.4byte	.LASF925
	.byte	0x5
	.uleb128 0x2bf
	.4byte	.LASF926
	.byte	0x5
	.uleb128 0x2c0
	.4byte	.LASF927
	.byte	0x5
	.uleb128 0x2c1
	.4byte	.LASF928
	.byte	0x5
	.uleb128 0x2c3
	.4byte	.LASF929
	.byte	0x5
	.uleb128 0x2c4
	.4byte	.LASF930
	.byte	0x5
	.uleb128 0x2c5
	.4byte	.LASF931
	.byte	0x5
	.uleb128 0x2c6
	.4byte	.LASF932
	.byte	0x5
	.uleb128 0x2c7
	.4byte	.LASF933
	.byte	0x5
	.uleb128 0x2c8
	.4byte	.LASF934
	.byte	0x5
	.uleb128 0x2c9
	.4byte	.LASF935
	.byte	0x5
	.uleb128 0x2ca
	.4byte	.LASF936
	.byte	0x5
	.uleb128 0x2cb
	.4byte	.LASF937
	.byte	0x5
	.uleb128 0x2cd
	.4byte	.LASF938
	.byte	0x5
	.uleb128 0x2ce
	.4byte	.LASF939
	.byte	0x5
	.uleb128 0x2cf
	.4byte	.LASF940
	.byte	0x5
	.uleb128 0x2d0
	.4byte	.LASF941
	.byte	0x5
	.uleb128 0x2d1
	.4byte	.LASF942
	.byte	0x5
	.uleb128 0x2d2
	.4byte	.LASF943
	.byte	0x5
	.uleb128 0x2d3
	.4byte	.LASF944
	.byte	0x5
	.uleb128 0x2d4
	.4byte	.LASF945
	.byte	0x5
	.uleb128 0x2d5
	.4byte	.LASF946
	.byte	0x5
	.uleb128 0x2d7
	.4byte	.LASF947
	.byte	0x5
	.uleb128 0x2d8
	.4byte	.LASF948
	.byte	0x5
	.uleb128 0x2d9
	.4byte	.LASF949
	.byte	0x5
	.uleb128 0x2da
	.4byte	.LASF950
	.byte	0x5
	.uleb128 0x2db
	.4byte	.LASF951
	.byte	0x5
	.uleb128 0x2dc
	.4byte	.LASF952
	.byte	0x5
	.uleb128 0x2dd
	.4byte	.LASF953
	.byte	0x5
	.uleb128 0x2de
	.4byte	.LASF954
	.byte	0x5
	.uleb128 0x2df
	.4byte	.LASF955
	.byte	0x5
	.uleb128 0x2e2
	.4byte	.LASF956
	.byte	0x5
	.uleb128 0x2e3
	.4byte	.LASF957
	.byte	0x5
	.uleb128 0x2e4
	.4byte	.LASF958
	.byte	0x5
	.uleb128 0x2e7
	.4byte	.LASF959
	.byte	0x5
	.uleb128 0x2e8
	.4byte	.LASF960
	.byte	0x5
	.uleb128 0x2e9
	.4byte	.LASF961
	.byte	0x5
	.uleb128 0x2ea
	.4byte	.LASF962
	.byte	0x5
	.uleb128 0x2eb
	.4byte	.LASF963
	.byte	0x5
	.uleb128 0x2ec
	.4byte	.LASF964
	.byte	0x5
	.uleb128 0x2ed
	.4byte	.LASF965
	.byte	0x5
	.uleb128 0x2ee
	.4byte	.LASF966
	.byte	0x5
	.uleb128 0x2ef
	.4byte	.LASF967
	.byte	0x5
	.uleb128 0x2f0
	.4byte	.LASF968
	.byte	0x5
	.uleb128 0x2f1
	.4byte	.LASF969
	.byte	0x5
	.uleb128 0x2f2
	.4byte	.LASF970
	.byte	0x5
	.uleb128 0x2f3
	.4byte	.LASF971
	.byte	0x5
	.uleb128 0x2f4
	.4byte	.LASF972
	.byte	0x5
	.uleb128 0x2f5
	.4byte	.LASF973
	.byte	0x5
	.uleb128 0x2f6
	.4byte	.LASF974
	.byte	0x5
	.uleb128 0x2f7
	.4byte	.LASF975
	.byte	0x5
	.uleb128 0x2f8
	.4byte	.LASF976
	.byte	0x5
	.uleb128 0x2f9
	.4byte	.LASF977
	.byte	0x5
	.uleb128 0x2fa
	.4byte	.LASF978
	.byte	0x5
	.uleb128 0x2fb
	.4byte	.LASF979
	.byte	0x5
	.uleb128 0x2fe
	.4byte	.LASF980
	.byte	0x5
	.uleb128 0x2ff
	.4byte	.LASF981
	.byte	0x5
	.uleb128 0x300
	.4byte	.LASF982
	.byte	0x5
	.uleb128 0x301
	.4byte	.LASF983
	.byte	0x5
	.uleb128 0x302
	.4byte	.LASF984
	.byte	0x5
	.uleb128 0x303
	.4byte	.LASF985
	.byte	0x5
	.uleb128 0x304
	.4byte	.LASF986
	.byte	0x5
	.uleb128 0x305
	.4byte	.LASF987
	.byte	0x5
	.uleb128 0x306
	.4byte	.LASF988
	.byte	0x5
	.uleb128 0x307
	.4byte	.LASF989
	.byte	0x5
	.uleb128 0x308
	.4byte	.LASF990
	.byte	0x5
	.uleb128 0x309
	.4byte	.LASF991
	.byte	0x5
	.uleb128 0x30c
	.4byte	.LASF992
	.byte	0x5
	.uleb128 0x30d
	.4byte	.LASF993
	.byte	0x5
	.uleb128 0x30e
	.4byte	.LASF994
	.byte	0x5
	.uleb128 0x30f
	.4byte	.LASF995
	.byte	0x5
	.uleb128 0x310
	.4byte	.LASF996
	.byte	0x5
	.uleb128 0x311
	.4byte	.LASF997
	.byte	0x5
	.uleb128 0x312
	.4byte	.LASF998
	.byte	0x5
	.uleb128 0x313
	.4byte	.LASF999
	.byte	0x5
	.uleb128 0x314
	.4byte	.LASF1000
	.byte	0x5
	.uleb128 0x315
	.4byte	.LASF1001
	.byte	0x5
	.uleb128 0x316
	.4byte	.LASF1002
	.byte	0x5
	.uleb128 0x317
	.4byte	.LASF1003
	.byte	0x5
	.uleb128 0x31a
	.4byte	.LASF1004
	.byte	0x5
	.uleb128 0x31b
	.4byte	.LASF1005
	.byte	0x5
	.uleb128 0x31c
	.4byte	.LASF1006
	.byte	0x5
	.uleb128 0x31d
	.4byte	.LASF1007
	.byte	0x5
	.uleb128 0x31e
	.4byte	.LASF1008
	.byte	0x5
	.uleb128 0x31f
	.4byte	.LASF1009
	.byte	0x5
	.uleb128 0x320
	.4byte	.LASF1010
	.byte	0x5
	.uleb128 0x321
	.4byte	.LASF1011
	.byte	0x5
	.uleb128 0x322
	.4byte	.LASF1012
	.byte	0x5
	.uleb128 0x323
	.4byte	.LASF1013
	.byte	0x5
	.uleb128 0x324
	.4byte	.LASF1014
	.byte	0x5
	.uleb128 0x325
	.4byte	.LASF1015
	.byte	0x5
	.uleb128 0x328
	.4byte	.LASF1016
	.byte	0x5
	.uleb128 0x329
	.4byte	.LASF1017
	.byte	0x5
	.uleb128 0x32a
	.4byte	.LASF1018
	.byte	0x5
	.uleb128 0x32b
	.4byte	.LASF1019
	.byte	0x5
	.uleb128 0x32c
	.4byte	.LASF1020
	.byte	0x5
	.uleb128 0x32d
	.4byte	.LASF1021
	.byte	0x5
	.uleb128 0x32e
	.4byte	.LASF1022
	.byte	0x5
	.uleb128 0x32f
	.4byte	.LASF1023
	.byte	0x5
	.uleb128 0x330
	.4byte	.LASF1024
	.byte	0x5
	.uleb128 0x331
	.4byte	.LASF1025
	.byte	0x5
	.uleb128 0x332
	.4byte	.LASF1026
	.byte	0x5
	.uleb128 0x333
	.4byte	.LASF1027
	.byte	0x5
	.uleb128 0x336
	.4byte	.LASF1028
	.byte	0x5
	.uleb128 0x337
	.4byte	.LASF1029
	.byte	0x5
	.uleb128 0x338
	.4byte	.LASF1030
	.byte	0x5
	.uleb128 0x339
	.4byte	.LASF1031
	.byte	0x5
	.uleb128 0x33a
	.4byte	.LASF1032
	.byte	0x5
	.uleb128 0x33b
	.4byte	.LASF1033
	.byte	0x5
	.uleb128 0x33c
	.4byte	.LASF1034
	.byte	0x5
	.uleb128 0x33d
	.4byte	.LASF1035
	.byte	0x5
	.uleb128 0x33e
	.4byte	.LASF1036
	.byte	0x5
	.uleb128 0x33f
	.4byte	.LASF1037
	.byte	0x5
	.uleb128 0x340
	.4byte	.LASF1038
	.byte	0x5
	.uleb128 0x341
	.4byte	.LASF1039
	.byte	0x5
	.uleb128 0x344
	.4byte	.LASF1040
	.byte	0x5
	.uleb128 0x345
	.4byte	.LASF1041
	.byte	0x5
	.uleb128 0x346
	.4byte	.LASF1042
	.byte	0x5
	.uleb128 0x347
	.4byte	.LASF1043
	.byte	0x5
	.uleb128 0x348
	.4byte	.LASF1044
	.byte	0x5
	.uleb128 0x349
	.4byte	.LASF1045
	.byte	0x5
	.uleb128 0x34a
	.4byte	.LASF1046
	.byte	0x5
	.uleb128 0x34b
	.4byte	.LASF1047
	.byte	0x5
	.uleb128 0x34c
	.4byte	.LASF1048
	.byte	0x5
	.uleb128 0x34d
	.4byte	.LASF1049
	.byte	0x5
	.uleb128 0x34e
	.4byte	.LASF1050
	.byte	0x5
	.uleb128 0x34f
	.4byte	.LASF1051
	.byte	0x5
	.uleb128 0x355
	.4byte	.LASF1052
	.byte	0x5
	.uleb128 0x356
	.4byte	.LASF1053
	.byte	0x5
	.uleb128 0x358
	.4byte	.LASF1054
	.byte	0x5
	.uleb128 0x359
	.4byte	.LASF1055
	.byte	0x5
	.uleb128 0x35a
	.4byte	.LASF1056
	.byte	0x5
	.uleb128 0x35b
	.4byte	.LASF1057
	.byte	0x5
	.uleb128 0x35c
	.4byte	.LASF1058
	.byte	0x5
	.uleb128 0x35d
	.4byte	.LASF1059
	.byte	0x5
	.uleb128 0x35e
	.4byte	.LASF1060
	.byte	0x5
	.uleb128 0x35f
	.4byte	.LASF1061
	.byte	0x5
	.uleb128 0x360
	.4byte	.LASF1062
	.byte	0x5
	.uleb128 0x363
	.4byte	.LASF1063
	.byte	0x5
	.uleb128 0x364
	.4byte	.LASF1064
	.byte	0x5
	.uleb128 0x365
	.4byte	.LASF1065
	.byte	0x5
	.uleb128 0x366
	.4byte	.LASF1066
	.byte	0x5
	.uleb128 0x367
	.4byte	.LASF1067
	.byte	0x5
	.uleb128 0x36a
	.4byte	.LASF1068
	.byte	0x5
	.uleb128 0x36b
	.4byte	.LASF1069
	.byte	0x5
	.uleb128 0x36c
	.4byte	.LASF1070
	.byte	0x5
	.uleb128 0x36d
	.4byte	.LASF1071
	.byte	0x5
	.uleb128 0x36e
	.4byte	.LASF1072
	.byte	0x5
	.uleb128 0x36f
	.4byte	.LASF1073
	.byte	0x5
	.uleb128 0x372
	.4byte	.LASF1074
	.byte	0x5
	.uleb128 0x373
	.4byte	.LASF1075
	.byte	0x5
	.uleb128 0x374
	.4byte	.LASF1076
	.byte	0x5
	.uleb128 0x375
	.4byte	.LASF1077
	.byte	0x5
	.uleb128 0x376
	.4byte	.LASF1078
	.byte	0x5
	.uleb128 0x377
	.4byte	.LASF1079
	.byte	0x5
	.uleb128 0x378
	.4byte	.LASF1080
	.byte	0x5
	.uleb128 0x379
	.4byte	.LASF1081
	.byte	0x5
	.uleb128 0x37a
	.4byte	.LASF1082
	.byte	0x5
	.uleb128 0x37b
	.4byte	.LASF1083
	.byte	0x5
	.uleb128 0x37c
	.4byte	.LASF1084
	.byte	0x5
	.uleb128 0x382
	.4byte	.LASF1085
	.byte	0x5
	.uleb128 0x383
	.4byte	.LASF1086
	.byte	0x5
	.uleb128 0x384
	.4byte	.LASF1087
	.byte	0x5
	.uleb128 0x387
	.4byte	.LASF1088
	.byte	0x5
	.uleb128 0x388
	.4byte	.LASF1089
	.byte	0x5
	.uleb128 0x389
	.4byte	.LASF1090
	.byte	0x5
	.uleb128 0x38c
	.4byte	.LASF1091
	.byte	0x5
	.uleb128 0x38d
	.4byte	.LASF1092
	.byte	0x5
	.uleb128 0x38e
	.4byte	.LASF1093
	.byte	0x5
	.uleb128 0x38f
	.4byte	.LASF1094
	.byte	0x5
	.uleb128 0x390
	.4byte	.LASF1095
	.byte	0x5
	.uleb128 0x393
	.4byte	.LASF1096
	.byte	0x5
	.uleb128 0x394
	.4byte	.LASF1097
	.byte	0x5
	.uleb128 0x395
	.4byte	.LASF1098
	.byte	0x5
	.uleb128 0x39d
	.4byte	.LASF1099
	.byte	0x5
	.uleb128 0x39e
	.4byte	.LASF1100
	.byte	0x5
	.uleb128 0x39f
	.4byte	.LASF1101
	.byte	0x5
	.uleb128 0x3a0
	.4byte	.LASF1102
	.byte	0x5
	.uleb128 0x3a1
	.4byte	.LASF1103
	.byte	0x5
	.uleb128 0x3a2
	.4byte	.LASF1104
	.byte	0x5
	.uleb128 0x3a3
	.4byte	.LASF1105
	.byte	0x5
	.uleb128 0x3a4
	.4byte	.LASF1106
	.byte	0x5
	.uleb128 0x3a5
	.4byte	.LASF1107
	.byte	0x5
	.uleb128 0x3a6
	.4byte	.LASF1108
	.byte	0x5
	.uleb128 0x3a8
	.4byte	.LASF1109
	.byte	0x5
	.uleb128 0x3a9
	.4byte	.LASF1110
	.byte	0x5
	.uleb128 0x3aa
	.4byte	.LASF1111
	.byte	0x5
	.uleb128 0x3ab
	.4byte	.LASF1112
	.byte	0x5
	.uleb128 0x3ad
	.4byte	.LASF1113
	.byte	0x5
	.uleb128 0x3ae
	.4byte	.LASF1114
	.byte	0x5
	.uleb128 0x3af
	.4byte	.LASF1115
	.byte	0x5
	.uleb128 0x3b0
	.4byte	.LASF1116
	.byte	0x5
	.uleb128 0x3b1
	.4byte	.LASF1117
	.byte	0x5
	.uleb128 0x3b2
	.4byte	.LASF1118
	.byte	0x5
	.uleb128 0x3b3
	.4byte	.LASF1119
	.byte	0x5
	.uleb128 0x3b4
	.4byte	.LASF1120
	.byte	0x5
	.uleb128 0x3b5
	.4byte	.LASF1121
	.byte	0x5
	.uleb128 0x3b6
	.4byte	.LASF1122
	.byte	0x5
	.uleb128 0x3b9
	.4byte	.LASF1123
	.byte	0x5
	.uleb128 0x3be
	.4byte	.LASF1124
	.byte	0x5
	.uleb128 0x3c4
	.4byte	.LASF1125
	.byte	0x5
	.uleb128 0x3c5
	.4byte	.LASF1126
	.byte	0x5
	.uleb128 0x3c7
	.4byte	.LASF1127
	.byte	0x5
	.uleb128 0x3c8
	.4byte	.LASF1128
	.byte	0x5
	.uleb128 0x3c9
	.4byte	.LASF1129
	.byte	0x5
	.uleb128 0x3ca
	.4byte	.LASF1130
	.byte	0x5
	.uleb128 0x3cb
	.4byte	.LASF1131
	.byte	0x5
	.uleb128 0x3cd
	.4byte	.LASF1132
	.byte	0x5
	.uleb128 0x3ce
	.4byte	.LASF1133
	.byte	0x5
	.uleb128 0x3cf
	.4byte	.LASF1134
	.byte	0x5
	.uleb128 0x3d0
	.4byte	.LASF1135
	.byte	0x5
	.uleb128 0x3d1
	.4byte	.LASF1136
	.byte	0x5
	.uleb128 0x3d2
	.4byte	.LASF1137
	.byte	0x5
	.uleb128 0x3d3
	.4byte	.LASF1138
	.byte	0x5
	.uleb128 0x3d5
	.4byte	.LASF1139
	.byte	0x5
	.uleb128 0x3d6
	.4byte	.LASF1140
	.byte	0x5
	.uleb128 0x3d7
	.4byte	.LASF1141
	.byte	0x5
	.uleb128 0x3da
	.4byte	.LASF1142
	.byte	0x5
	.uleb128 0x3db
	.4byte	.LASF1143
	.byte	0x5
	.uleb128 0x3dc
	.4byte	.LASF1144
	.byte	0x5
	.uleb128 0x3dd
	.4byte	.LASF1145
	.byte	0x5
	.uleb128 0x3de
	.4byte	.LASF1146
	.byte	0x5
	.uleb128 0x3df
	.4byte	.LASF1147
	.byte	0x5
	.uleb128 0x3e0
	.4byte	.LASF1148
	.byte	0x5
	.uleb128 0x3e1
	.4byte	.LASF1149
	.byte	0x5
	.uleb128 0x3e3
	.4byte	.LASF1150
	.byte	0x5
	.uleb128 0x3e4
	.4byte	.LASF1151
	.byte	0x5
	.uleb128 0x3e5
	.4byte	.LASF1152
	.byte	0x5
	.uleb128 0x3e6
	.4byte	.LASF1153
	.byte	0x5
	.uleb128 0x3ec
	.4byte	.LASF1154
	.byte	0x5
	.uleb128 0x3ed
	.4byte	.LASF1155
	.byte	0x5
	.uleb128 0x3ef
	.4byte	.LASF1156
	.byte	0x5
	.uleb128 0x3f0
	.4byte	.LASF1157
	.byte	0x5
	.uleb128 0x3f2
	.4byte	.LASF1158
	.byte	0x5
	.uleb128 0x3f3
	.4byte	.LASF1159
	.byte	0x5
	.uleb128 0x3f4
	.4byte	.LASF1160
	.byte	0x5
	.uleb128 0x3f5
	.4byte	.LASF1161
	.byte	0x5
	.uleb128 0x3f6
	.4byte	.LASF1162
	.byte	0x5
	.uleb128 0x3f7
	.4byte	.LASF1163
	.byte	0x5
	.uleb128 0x3f8
	.4byte	.LASF1164
	.byte	0x5
	.uleb128 0x3f9
	.4byte	.LASF1165
	.byte	0x5
	.uleb128 0x3fb
	.4byte	.LASF1166
	.byte	0x5
	.uleb128 0x3fc
	.4byte	.LASF1167
	.byte	0x5
	.uleb128 0x3fd
	.4byte	.LASF1168
	.byte	0x5
	.uleb128 0x3fe
	.4byte	.LASF1169
	.byte	0x5
	.uleb128 0x3ff
	.4byte	.LASF1170
	.byte	0x5
	.uleb128 0x400
	.4byte	.LASF1171
	.byte	0x5
	.uleb128 0x401
	.4byte	.LASF1172
	.byte	0x5
	.uleb128 0x402
	.4byte	.LASF1173
	.byte	0x5
	.uleb128 0x404
	.4byte	.LASF1174
	.byte	0x5
	.uleb128 0x405
	.4byte	.LASF1175
	.byte	0x5
	.uleb128 0x407
	.4byte	.LASF1176
	.byte	0x5
	.uleb128 0x408
	.4byte	.LASF1177
	.byte	0x5
	.uleb128 0x409
	.4byte	.LASF1178
	.byte	0x5
	.uleb128 0x40a
	.4byte	.LASF1179
	.byte	0x5
	.uleb128 0x40c
	.4byte	.LASF1180
	.byte	0x5
	.uleb128 0x40d
	.4byte	.LASF1181
	.byte	0x5
	.uleb128 0x412
	.4byte	.LASF1182
	.byte	0x5
	.uleb128 0x413
	.4byte	.LASF1183
	.byte	0x5
	.uleb128 0x415
	.4byte	.LASF1184
	.byte	0x5
	.uleb128 0x416
	.4byte	.LASF1185
	.byte	0x5
	.uleb128 0x417
	.4byte	.LASF1186
	.byte	0x5
	.uleb128 0x418
	.4byte	.LASF1187
	.byte	0x5
	.uleb128 0x419
	.4byte	.LASF1188
	.byte	0x5
	.uleb128 0x41a
	.4byte	.LASF1189
	.byte	0x5
	.uleb128 0x41b
	.4byte	.LASF1190
	.byte	0x5
	.uleb128 0x41c
	.4byte	.LASF1191
	.byte	0x5
	.uleb128 0x41d
	.4byte	.LASF1192
	.byte	0x5
	.uleb128 0x41e
	.4byte	.LASF1193
	.byte	0x5
	.uleb128 0x41f
	.4byte	.LASF1194
	.byte	0x5
	.uleb128 0x421
	.4byte	.LASF1195
	.byte	0x5
	.uleb128 0x422
	.4byte	.LASF1196
	.byte	0x5
	.uleb128 0x423
	.4byte	.LASF1197
	.byte	0x5
	.uleb128 0x424
	.4byte	.LASF1198
	.byte	0x5
	.uleb128 0x425
	.4byte	.LASF1199
	.byte	0x5
	.uleb128 0x426
	.4byte	.LASF1200
	.byte	0x5
	.uleb128 0x427
	.4byte	.LASF1201
	.byte	0x5
	.uleb128 0x428
	.4byte	.LASF1202
	.byte	0x5
	.uleb128 0x42a
	.4byte	.LASF1203
	.byte	0x5
	.uleb128 0x42b
	.4byte	.LASF1204
	.byte	0x5
	.uleb128 0x42d
	.4byte	.LASF1205
	.byte	0x5
	.uleb128 0x42e
	.4byte	.LASF1206
	.byte	0x5
	.uleb128 0x42f
	.4byte	.LASF1207
	.byte	0x5
	.uleb128 0x430
	.4byte	.LASF1208
	.byte	0x5
	.uleb128 0x433
	.4byte	.LASF1209
	.byte	0x5
	.uleb128 0x434
	.4byte	.LASF1210
	.byte	0x5
	.uleb128 0x435
	.4byte	.LASF1211
	.byte	0x5
	.uleb128 0x436
	.4byte	.LASF1212
	.byte	0x5
	.uleb128 0x437
	.4byte	.LASF1213
	.byte	0x5
	.uleb128 0x438
	.4byte	.LASF1214
	.byte	0x5
	.uleb128 0x439
	.4byte	.LASF1215
	.byte	0x5
	.uleb128 0x43a
	.4byte	.LASF1216
	.byte	0x5
	.uleb128 0x43b
	.4byte	.LASF1217
	.byte	0x5
	.uleb128 0x43c
	.4byte	.LASF1218
	.byte	0x5
	.uleb128 0x43d
	.4byte	.LASF1219
	.byte	0x5
	.uleb128 0x43e
	.4byte	.LASF1220
	.byte	0x5
	.uleb128 0x440
	.4byte	.LASF1221
	.byte	0x5
	.uleb128 0x441
	.4byte	.LASF1222
	.byte	0x5
	.uleb128 0x442
	.4byte	.LASF1223
	.byte	0x5
	.uleb128 0x443
	.4byte	.LASF1224
	.byte	0x5
	.uleb128 0x444
	.4byte	.LASF1225
	.byte	0x5
	.uleb128 0x445
	.4byte	.LASF1226
	.byte	0x5
	.uleb128 0x44b
	.4byte	.LASF1227
	.byte	0x5
	.uleb128 0x44c
	.4byte	.LASF1228
	.byte	0x5
	.uleb128 0x44e
	.4byte	.LASF1229
	.byte	0x5
	.uleb128 0x44f
	.4byte	.LASF1230
	.byte	0x5
	.uleb128 0x451
	.4byte	.LASF1231
	.byte	0x5
	.uleb128 0x452
	.4byte	.LASF1232
	.byte	0x5
	.uleb128 0x453
	.4byte	.LASF1233
	.byte	0x5
	.uleb128 0x455
	.4byte	.LASF1234
	.byte	0x5
	.uleb128 0x456
	.4byte	.LASF1235
	.byte	0x5
	.uleb128 0x457
	.4byte	.LASF1236
	.byte	0x5
	.uleb128 0x458
	.4byte	.LASF1237
	.byte	0x5
	.uleb128 0x459
	.4byte	.LASF1238
	.byte	0x5
	.uleb128 0x45a
	.4byte	.LASF1239
	.byte	0x5
	.uleb128 0x45b
	.4byte	.LASF1240
	.byte	0x5
	.uleb128 0x45d
	.4byte	.LASF1241
	.byte	0x5
	.uleb128 0x45e
	.4byte	.LASF1242
	.byte	0x5
	.uleb128 0x45f
	.4byte	.LASF1243
	.byte	0x5
	.uleb128 0x460
	.4byte	.LASF1244
	.byte	0x5
	.uleb128 0x461
	.4byte	.LASF1245
	.byte	0x5
	.uleb128 0x463
	.4byte	.LASF1246
	.byte	0x5
	.uleb128 0x464
	.4byte	.LASF1247
	.byte	0x5
	.uleb128 0x466
	.4byte	.LASF1248
	.byte	0x5
	.uleb128 0x467
	.4byte	.LASF1249
	.byte	0x5
	.uleb128 0x469
	.4byte	.LASF1250
	.byte	0x5
	.uleb128 0x46a
	.4byte	.LASF1251
	.byte	0x5
	.uleb128 0x46b
	.4byte	.LASF1252
	.byte	0x5
	.uleb128 0x46c
	.4byte	.LASF1253
	.byte	0x5
	.uleb128 0x46d
	.4byte	.LASF1254
	.byte	0x5
	.uleb128 0x46e
	.4byte	.LASF1255
	.byte	0x5
	.uleb128 0x46f
	.4byte	.LASF1256
	.byte	0x5
	.uleb128 0x470
	.4byte	.LASF1257
	.byte	0x5
	.uleb128 0x471
	.4byte	.LASF1258
	.byte	0x5
	.uleb128 0x47a
	.4byte	.LASF1259
	.byte	0x5
	.uleb128 0x47b
	.4byte	.LASF1260
	.byte	0x5
	.uleb128 0x47d
	.4byte	.LASF1261
	.byte	0x5
	.uleb128 0x47e
	.4byte	.LASF1262
	.byte	0x5
	.uleb128 0x480
	.4byte	.LASF1263
	.byte	0x5
	.uleb128 0x481
	.4byte	.LASF1264
	.byte	0x5
	.uleb128 0x482
	.4byte	.LASF1265
	.byte	0x5
	.uleb128 0x483
	.4byte	.LASF1266
	.byte	0x5
	.uleb128 0x485
	.4byte	.LASF1267
	.byte	0x5
	.uleb128 0x486
	.4byte	.LASF1268
	.byte	0x5
	.uleb128 0x488
	.4byte	.LASF1269
	.byte	0x5
	.uleb128 0x489
	.4byte	.LASF1270
	.byte	0x5
	.uleb128 0x48b
	.4byte	.LASF1271
	.byte	0x5
	.uleb128 0x48c
	.4byte	.LASF1272
	.byte	0x5
	.uleb128 0x48e
	.4byte	.LASF1273
	.byte	0x5
	.uleb128 0x48f
	.4byte	.LASF1274
	.byte	0x5
	.uleb128 0x491
	.4byte	.LASF1275
	.byte	0x5
	.uleb128 0x492
	.4byte	.LASF1276
	.byte	0x5
	.uleb128 0x493
	.4byte	.LASF1277
	.byte	0x5
	.uleb128 0x494
	.4byte	.LASF1278
	.byte	0x5
	.uleb128 0x495
	.4byte	.LASF1279
	.byte	0x5
	.uleb128 0x496
	.4byte	.LASF1280
	.byte	0x5
	.uleb128 0x497
	.4byte	.LASF1281
	.byte	0x5
	.uleb128 0x498
	.4byte	.LASF1282
	.byte	0x5
	.uleb128 0x499
	.4byte	.LASF1283
	.byte	0x5
	.uleb128 0x49a
	.4byte	.LASF1284
	.byte	0x5
	.uleb128 0x49b
	.4byte	.LASF1285
	.byte	0x5
	.uleb128 0x49c
	.4byte	.LASF1286
	.byte	0x5
	.uleb128 0x49d
	.4byte	.LASF1287
	.byte	0x5
	.uleb128 0x49e
	.4byte	.LASF1288
	.byte	0x5
	.uleb128 0x49f
	.4byte	.LASF1289
	.byte	0x5
	.uleb128 0x4a0
	.4byte	.LASF1290
	.byte	0x5
	.uleb128 0x4a1
	.4byte	.LASF1291
	.byte	0x5
	.uleb128 0x4a2
	.4byte	.LASF1292
	.byte	0x5
	.uleb128 0x4a3
	.4byte	.LASF1293
	.byte	0x5
	.uleb128 0x4a4
	.4byte	.LASF1294
	.byte	0x5
	.uleb128 0x4a5
	.4byte	.LASF1295
	.byte	0x5
	.uleb128 0x4a6
	.4byte	.LASF1296
	.byte	0x5
	.uleb128 0x4a7
	.4byte	.LASF1297
	.byte	0x5
	.uleb128 0x4a8
	.4byte	.LASF1298
	.byte	0x5
	.uleb128 0x4a9
	.4byte	.LASF1299
	.byte	0x5
	.uleb128 0x4aa
	.4byte	.LASF1300
	.byte	0x5
	.uleb128 0x4b1
	.4byte	.LASF1301
	.byte	0x5
	.uleb128 0x4b2
	.4byte	.LASF1302
	.byte	0x5
	.uleb128 0x4b5
	.4byte	.LASF1303
	.byte	0x5
	.uleb128 0x4b6
	.4byte	.LASF1304
	.byte	0x5
	.uleb128 0x4b7
	.4byte	.LASF1305
	.byte	0x5
	.uleb128 0x4b8
	.4byte	.LASF1306
	.byte	0x5
	.uleb128 0x4b9
	.4byte	.LASF1307
	.byte	0x5
	.uleb128 0x4bc
	.4byte	.LASF1308
	.byte	0x5
	.uleb128 0x4bd
	.4byte	.LASF1309
	.byte	0x5
	.uleb128 0x4be
	.4byte	.LASF1310
	.byte	0x5
	.uleb128 0x4c0
	.4byte	.LASF1311
	.byte	0x5
	.uleb128 0x4c1
	.4byte	.LASF1312
	.byte	0x5
	.uleb128 0x4c2
	.4byte	.LASF1313
	.byte	0x5
	.uleb128 0x4c5
	.4byte	.LASF1314
	.byte	0x5
	.uleb128 0x4c6
	.4byte	.LASF1315
	.byte	0x5
	.uleb128 0x4c7
	.4byte	.LASF1316
	.byte	0x5
	.uleb128 0x4c9
	.4byte	.LASF1317
	.byte	0x5
	.uleb128 0x4ca
	.4byte	.LASF1318
	.byte	0x5
	.uleb128 0x4cb
	.4byte	.LASF1319
	.byte	0x5
	.uleb128 0x4ce
	.4byte	.LASF1320
	.byte	0x5
	.uleb128 0x4cf
	.4byte	.LASF1321
	.byte	0x5
	.uleb128 0x4d0
	.4byte	.LASF1322
	.byte	0x5
	.uleb128 0x4d2
	.4byte	.LASF1323
	.byte	0x5
	.uleb128 0x4d3
	.4byte	.LASF1324
	.byte	0x5
	.uleb128 0x4d4
	.4byte	.LASF1325
	.byte	0x5
	.uleb128 0x4d7
	.4byte	.LASF1326
	.byte	0x5
	.uleb128 0x4d8
	.4byte	.LASF1324
	.byte	0x5
	.uleb128 0x4d9
	.4byte	.LASF1325
	.byte	0x5
	.uleb128 0x4db
	.4byte	.LASF1327
	.byte	0x5
	.uleb128 0x4dc
	.4byte	.LASF1328
	.byte	0x5
	.uleb128 0x4dd
	.4byte	.LASF1329
	.byte	0x5
	.uleb128 0x4e0
	.4byte	.LASF1330
	.byte	0x5
	.uleb128 0x4e1
	.4byte	.LASF1331
	.byte	0x5
	.uleb128 0x4e2
	.4byte	.LASF1332
	.byte	0x5
	.uleb128 0x4e4
	.4byte	.LASF1333
	.byte	0x5
	.uleb128 0x4e5
	.4byte	.LASF1334
	.byte	0x5
	.uleb128 0x4e6
	.4byte	.LASF1335
	.byte	0x5
	.uleb128 0x4e9
	.4byte	.LASF1336
	.byte	0x5
	.uleb128 0x4ea
	.4byte	.LASF1337
	.byte	0x5
	.uleb128 0x4eb
	.4byte	.LASF1338
	.byte	0x5
	.uleb128 0x4ed
	.4byte	.LASF1339
	.byte	0x5
	.uleb128 0x4ee
	.4byte	.LASF1340
	.byte	0x5
	.uleb128 0x4ef
	.4byte	.LASF1341
	.byte	0x5
	.uleb128 0x4f2
	.4byte	.LASF1342
	.byte	0x5
	.uleb128 0x4f5
	.4byte	.LASF1343
	.byte	0x5
	.uleb128 0x4f6
	.4byte	.LASF1344
	.byte	0x5
	.uleb128 0x4f7
	.4byte	.LASF1345
	.byte	0x5
	.uleb128 0x4f8
	.4byte	.LASF1346
	.byte	0x5
	.uleb128 0x4ff
	.4byte	.LASF1347
	.byte	0x5
	.uleb128 0x500
	.4byte	.LASF1348
	.byte	0x5
	.uleb128 0x501
	.4byte	.LASF1349
	.byte	0x5
	.uleb128 0x502
	.4byte	.LASF1350
	.byte	0x5
	.uleb128 0x503
	.4byte	.LASF1351
	.byte	0x5
	.uleb128 0x504
	.4byte	.LASF1352
	.byte	0x5
	.uleb128 0x509
	.4byte	.LASF1353
	.byte	0x5
	.uleb128 0x50a
	.4byte	.LASF1354
	.byte	0x5
	.uleb128 0x50c
	.4byte	.LASF1355
	.byte	0x5
	.uleb128 0x50d
	.4byte	.LASF1356
	.byte	0x5
	.uleb128 0x50e
	.4byte	.LASF1357
	.byte	0x5
	.uleb128 0x50f
	.4byte	.LASF1358
	.byte	0x5
	.uleb128 0x510
	.4byte	.LASF1359
	.byte	0x5
	.uleb128 0x511
	.4byte	.LASF1360
	.byte	0x5
	.uleb128 0x512
	.4byte	.LASF1361
	.byte	0x5
	.uleb128 0x513
	.4byte	.LASF1362
	.byte	0x5
	.uleb128 0x514
	.4byte	.LASF1363
	.byte	0x5
	.uleb128 0x515
	.4byte	.LASF1364
	.byte	0x5
	.uleb128 0x516
	.4byte	.LASF1365
	.byte	0x5
	.uleb128 0x517
	.4byte	.LASF1366
	.byte	0x5
	.uleb128 0x518
	.4byte	.LASF1367
	.byte	0x5
	.uleb128 0x519
	.4byte	.LASF1368
	.byte	0x5
	.uleb128 0x51a
	.4byte	.LASF1369
	.byte	0x5
	.uleb128 0x51b
	.4byte	.LASF1370
	.byte	0x5
	.uleb128 0x51c
	.4byte	.LASF1371
	.byte	0x5
	.uleb128 0x51d
	.4byte	.LASF1372
	.byte	0x5
	.uleb128 0x51e
	.4byte	.LASF1373
	.byte	0x5
	.uleb128 0x51f
	.4byte	.LASF1374
	.byte	0x5
	.uleb128 0x520
	.4byte	.LASF1375
	.byte	0x5
	.uleb128 0x521
	.4byte	.LASF1376
	.byte	0x5
	.uleb128 0x523
	.4byte	.LASF1377
	.byte	0x5
	.uleb128 0x524
	.4byte	.LASF1378
	.byte	0x5
	.uleb128 0x525
	.4byte	.LASF1379
	.byte	0x5
	.uleb128 0x526
	.4byte	.LASF1380
	.byte	0x5
	.uleb128 0x527
	.4byte	.LASF1381
	.byte	0x5
	.uleb128 0x528
	.4byte	.LASF1382
	.byte	0x5
	.uleb128 0x529
	.4byte	.LASF1383
	.byte	0x5
	.uleb128 0x52a
	.4byte	.LASF1384
	.byte	0x5
	.uleb128 0x52b
	.4byte	.LASF1385
	.byte	0x5
	.uleb128 0x52c
	.4byte	.LASF1386
	.byte	0x5
	.uleb128 0x52d
	.4byte	.LASF1387
	.byte	0x5
	.uleb128 0x52e
	.4byte	.LASF1388
	.byte	0x5
	.uleb128 0x52f
	.4byte	.LASF1389
	.byte	0x5
	.uleb128 0x531
	.4byte	.LASF1390
	.byte	0x5
	.uleb128 0x533
	.4byte	.LASF1391
	.byte	0x5
	.uleb128 0x534
	.4byte	.LASF1392
	.byte	0x5
	.uleb128 0x536
	.4byte	.LASF1393
	.byte	0x5
	.uleb128 0x538
	.4byte	.LASF1394
	.byte	0x5
	.uleb128 0x53a
	.4byte	.LASF1395
	.byte	0x5
	.uleb128 0x53b
	.4byte	.LASF1396
	.byte	0x5
	.uleb128 0x53c
	.4byte	.LASF1397
	.byte	0x5
	.uleb128 0x53e
	.4byte	.LASF1398
	.byte	0x5
	.uleb128 0x53f
	.4byte	.LASF1399
	.byte	0x5
	.uleb128 0x540
	.4byte	.LASF1400
	.byte	0x5
	.uleb128 0x541
	.4byte	.LASF1401
	.byte	0x5
	.uleb128 0x542
	.4byte	.LASF1402
	.byte	0x5
	.uleb128 0x544
	.4byte	.LASF1403
	.byte	0x5
	.uleb128 0x546
	.4byte	.LASF1404
	.byte	0x5
	.uleb128 0x54c
	.4byte	.LASF1405
	.byte	0x5
	.uleb128 0x54d
	.4byte	.LASF1406
	.byte	0x5
	.uleb128 0x54e
	.4byte	.LASF1407
	.byte	0x5
	.uleb128 0x54f
	.4byte	.LASF1408
	.byte	0x5
	.uleb128 0x550
	.4byte	.LASF1409
	.byte	0x5
	.uleb128 0x551
	.4byte	.LASF1410
	.byte	0x5
	.uleb128 0x552
	.4byte	.LASF1411
	.byte	0x5
	.uleb128 0x553
	.4byte	.LASF1412
	.byte	0x5
	.uleb128 0x554
	.4byte	.LASF1413
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.deca_device_api.h.14.a3ca2b52d70d5005e8adfb5c52f9dbf9,comdat
.Ldebug_macro10:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0xe
	.4byte	.LASF1414
	.byte	0x5
	.uleb128 0x40
	.4byte	.LASF1415
	.byte	0x5
	.uleb128 0x43
	.4byte	.LASF1416
	.byte	0x5
	.uleb128 0x44
	.4byte	.LASF1417
	.byte	0x5
	.uleb128 0x46
	.4byte	.LASF1418
	.byte	0x5
	.uleb128 0x48
	.4byte	.LASF1419
	.byte	0x5
	.uleb128 0x4c
	.4byte	.LASF1420
	.byte	0x5
	.uleb128 0x4d
	.4byte	.LASF1421
	.byte	0x5
	.uleb128 0x4e
	.4byte	.LASF1422
	.byte	0x5
	.uleb128 0x52
	.4byte	.LASF1423
	.byte	0x5
	.uleb128 0x53
	.4byte	.LASF1424
	.byte	0x5
	.uleb128 0x56
	.4byte	.LASF1425
	.byte	0x5
	.uleb128 0x57
	.4byte	.LASF1426
	.byte	0x5
	.uleb128 0x58
	.4byte	.LASF1427
	.byte	0x5
	.uleb128 0x59
	.4byte	.LASF1428
	.byte	0x5
	.uleb128 0x5e
	.4byte	.LASF1429
	.byte	0x5
	.uleb128 0x5f
	.4byte	.LASF1430
	.byte	0x5
	.uleb128 0x60
	.4byte	.LASF1431
	.byte	0x5
	.uleb128 0x61
	.4byte	.LASF1432
	.byte	0x5
	.uleb128 0x62
	.4byte	.LASF1433
	.byte	0x5
	.uleb128 0x63
	.4byte	.LASF1434
	.byte	0x5
	.uleb128 0x64
	.4byte	.LASF1435
	.byte	0x5
	.uleb128 0x65
	.4byte	.LASF1436
	.byte	0x5
	.uleb128 0x67
	.4byte	.LASF1437
	.byte	0x5
	.uleb128 0x69
	.4byte	.LASF1438
	.byte	0x5
	.uleb128 0x6a
	.4byte	.LASF1439
	.byte	0x5
	.uleb128 0x6d
	.4byte	.LASF1440
	.byte	0x5
	.uleb128 0x6e
	.4byte	.LASF1441
	.byte	0x5
	.uleb128 0x6f
	.4byte	.LASF1442
	.byte	0x5
	.uleb128 0x71
	.4byte	.LASF1443
	.byte	0x5
	.uleb128 0x72
	.4byte	.LASF1444
	.byte	0x5
	.uleb128 0x73
	.4byte	.LASF1445
	.byte	0x5
	.uleb128 0x75
	.4byte	.LASF1446
	.byte	0x5
	.uleb128 0x79
	.4byte	.LASF1447
	.byte	0x5
	.uleb128 0x7a
	.4byte	.LASF1448
	.byte	0x5
	.uleb128 0x7b
	.4byte	.LASF1449
	.byte	0x5
	.uleb128 0x7e
	.4byte	.LASF1450
	.byte	0x5
	.uleb128 0x7f
	.4byte	.LASF1451
	.byte	0x5
	.uleb128 0x80
	.4byte	.LASF1452
	.byte	0x5
	.uleb128 0x81
	.4byte	.LASF1453
	.byte	0x5
	.uleb128 0x82
	.4byte	.LASF1454
	.byte	0x5
	.uleb128 0x83
	.4byte	.LASF1455
	.byte	0x5
	.uleb128 0x84
	.4byte	.LASF1456
	.byte	0x5
	.uleb128 0x87
	.4byte	.LASF1457
	.byte	0x5
	.uleb128 0x88
	.4byte	.LASF1458
	.byte	0x5
	.uleb128 0x89
	.4byte	.LASF1459
	.byte	0x5
	.uleb128 0x8a
	.4byte	.LASF1460
	.byte	0x5
	.uleb128 0x8b
	.4byte	.LASF1461
	.byte	0x5
	.uleb128 0x8c
	.4byte	.LASF1462
	.byte	0x5
	.uleb128 0x8d
	.4byte	.LASF1463
	.byte	0x5
	.uleb128 0x8e
	.4byte	.LASF1464
	.byte	0x5
	.uleb128 0x8f
	.4byte	.LASF1465
	.byte	0x5
	.uleb128 0x90
	.4byte	.LASF1466
	.byte	0x5
	.uleb128 0x91
	.4byte	.LASF1467
	.byte	0x5
	.uleb128 0x95
	.4byte	.LASF1468
	.byte	0x5
	.uleb128 0x96
	.4byte	.LASF1469
	.byte	0x5
	.uleb128 0x97
	.4byte	.LASF1470
	.byte	0x5
	.uleb128 0x98
	.4byte	.LASF1471
	.byte	0x5
	.uleb128 0x99
	.4byte	.LASF1472
	.byte	0x5
	.uleb128 0x9a
	.4byte	.LASF1473
	.byte	0x5
	.uleb128 0x9c
	.4byte	.LASF1474
	.byte	0x5
	.uleb128 0x9d
	.4byte	.LASF1475
	.byte	0x5
	.uleb128 0x9e
	.4byte	.LASF1476
	.byte	0x5
	.uleb128 0x9f
	.4byte	.LASF1477
	.byte	0x5
	.uleb128 0xa0
	.4byte	.LASF1478
	.byte	0x5
	.uleb128 0xa3
	.4byte	.LASF1479
	.byte	0x5
	.uleb128 0xa4
	.4byte	.LASF1480
	.byte	0x5
	.uleb128 0xa7
	.4byte	.LASF1481
	.byte	0x5
	.uleb128 0xa8
	.4byte	.LASF1482
	.byte	0x5
	.uleb128 0xa9
	.4byte	.LASF1483
	.byte	0x5
	.uleb128 0xac
	.4byte	.LASF1484
	.byte	0x5
	.uleb128 0x508
	.4byte	.LASF1485
	.byte	0x5
	.uleb128 0x509
	.4byte	.LASF1486
	.byte	0x5
	.uleb128 0x50e
	.4byte	.LASF1487
	.byte	0x5
	.uleb128 0x50f
	.4byte	.LASF1488
	.byte	0x5
	.uleb128 0x510
	.4byte	.LASF1489
	.byte	0x5
	.uleb128 0x511
	.4byte	.LASF1490
	.byte	0x5
	.uleb128 0x66c
	.4byte	.LASF1491
	.byte	0x5
	.uleb128 0x66d
	.4byte	.LASF1492
	.byte	0
	.section	.debug_line,"",%progbits
.Ldebug_line0:
	.section	.debug_str,"MS",%progbits,1
.LASF1185:
	.ascii	"AON_WCFG_LEN (2)\000"
.LASF319:
	.ascii	"__LACCUM_EPSILON__ 0x1P-31LK\000"
.LASF417:
	.ascii	"__thumb__ 1\000"
.LASF1303:
	.ascii	"EVC_CTRL_OFFSET 0x00\000"
.LASF1730:
	.ascii	"dwt_rxenable\000"
.LASF1853:
	.ascii	"dwt_setgpiovalue\000"
.LASF983:
	.ascii	"GISEN0 GIRQx0\000"
.LASF416:
	.ascii	"__APCS_32__ 1\000"
.LASF1780:
	.ascii	"_dwt_aonconfigupload\000"
.LASF279:
	.ascii	"__LFRACT_EPSILON__ 0x1P-31LR\000"
.LASF30:
	.ascii	"__FLOAT_WORD_ORDER__ __ORDER_LITTLE_ENDIAN__\000"
.LASF1516:
	.ascii	"unsigned int\000"
.LASF957:
	.ascii	"GPIO_DOUT_LEN (3)\000"
.LASF951:
	.ascii	"GDM4 GxM4\000"
.LASF1412:
	.ascii	"REG_3E_ID_RESERVED 0x3E\000"
.LASF302:
	.ascii	"__USACCUM_MIN__ 0.0UHK\000"
.LASF1352:
	.ascii	"REG_35_ID_RESERVED 0x35\000"
.LASF1198:
	.ascii	"AON_CTRL_RESTORE 0x01\000"
.LASF936:
	.ascii	"GxM7 0x00008000UL\000"
.LASF1630:
	.ascii	"dwt_config_t\000"
.LASF322:
	.ascii	"__ULACCUM_MIN__ 0.0ULK\000"
.LASF1666:
	.ascii	"dw1000local\000"
.LASF311:
	.ascii	"__UACCUM_IBIT__ 16\000"
.LASF1485:
	.ascii	"FREQ_OFFSET_MULTIPLIER (998.4e6/2.0/1024.0/131072.0"
	.ascii	")\000"
.LASF974:
	.ascii	"GIRQE3 GIRQx3\000"
.LASF763:
	.ascii	"RX_TTCKO_ID 0x14\000"
.LASF713:
	.ascii	"RX_FINFO_MASK_32 0xFFFFFBFFUL\000"
.LASF1325:
	.ascii	"EVC_OVR_MASK 0x0FFF\000"
.LASF128:
	.ascii	"__INT_FAST16_MAX__ 0x7fffffff\000"
.LASF172:
	.ascii	"__DBL_DENORM_MIN__ ((double)1.1)\000"
.LASF1310:
	.ascii	"EVC_PHE_MASK 0x0FFF\000"
.LASF870:
	.ascii	"AGC_TUNE3_OFFSET (0x12)\000"
.LASF152:
	.ascii	"__FLT_MAX_10_EXP__ 38\000"
.LASF532:
	.ascii	"EUI_64_ID 0x01\000"
.LASF597:
	.ascii	"TX_FCTRL_PE_SHFT (20)\000"
.LASF1403:
	.ascii	"PMSC_LEDC_BLINK_TIME_DEF 0x10\000"
.LASF1787:
	.ascii	"otp_done\000"
.LASF1772:
	.ascii	"dwt_configuresleep\000"
.LASF1166:
	.ascii	"FS_PLLTUNE_OFFSET 0x0B\000"
.LASF1330:
	.ascii	"EVC_FWTO_OFFSET 0x14\000"
.LASF932:
	.ascii	"GxM3 0x00000080UL\000"
.LASF1681:
	.ascii	"ref_temp\000"
.LASF438:
	.ascii	"__ARM_PCS_VFP 1\000"
.LASF1558:
	.ascii	"__RAL_locale_data_t\000"
.LASF203:
	.ascii	"__FLT32_HAS_INFINITY__ 1\000"
.LASF1018:
	.ascii	"GPIO_ICLR_MASK GPIO_IRQE_MASK\000"
.LASF644:
	.ascii	"SYS_MASK_MRXPRD 0x00000100UL\000"
.LASF350:
	.ascii	"__USQ_IBIT__ 0\000"
.LASF939:
	.ascii	"GDP1 GxP1\000"
.LASF79:
	.ascii	"__PTRDIFF_MAX__ 0x7fffffff\000"
.LASF1250:
	.ascii	"OTP_SF 0x12\000"
.LASF984:
	.ascii	"GISEN1 GIRQx1\000"
.LASF488:
	.ascii	"__CTYPE_PRINT (__CTYPE_BLANK | __CTYPE_PUNCT | __CT"
	.ascii	"YPE_UPPER | __CTYPE_LOWER | __CTYPE_DIGIT)\000"
.LASF209:
	.ascii	"__FLT64_MIN_10_EXP__ (-307)\000"
.LASF1604:
	.ascii	"dtune1\000"
.LASF594:
	.ascii	"TX_FCTRL_TXPRF_16M 0x00010000UL\000"
.LASF657:
	.ascii	"SYS_MASK_MGPIOIRQ 0x00400000UL\000"
.LASF662:
	.ascii	"SYS_MASK_MHPDWARN 0x08000000UL\000"
.LASF675:
	.ascii	"SYS_STATUS_TXPHS 0x00000040UL\000"
.LASF1466:
	.ascii	"DWT_INT_SFDT 0x04000000\000"
.LASF849:
	.ascii	"USR_SFD_LEN (41)\000"
.LASF0:
	.ascii	"__STDC__ 1\000"
.LASF1433:
	.ascii	"DWT_PLEN_512 0x34\000"
.LASF1160:
	.ascii	"FS_PLLCFG_CH1 0x09000407UL\000"
.LASF1364:
	.ascii	"PMSC_CTRL0_RXCLKS_OFF 0x0000000CUL\000"
.LASF1579:
	.ascii	"__RAL_data_utf8_plus\000"
.LASF840:
	.ascii	"CHAN_CTRL_RX_PCOD_SHIFT (27)\000"
.LASF291:
	.ascii	"__ULLFRACT_IBIT__ 0\000"
.LASF580:
	.ascii	"TX_FCTRL_TXBR_MASK 0x00006000UL\000"
.LASF29:
	.ascii	"__BYTE_ORDER__ __ORDER_LITTLE_ENDIAN__\000"
.LASF195:
	.ascii	"__FLT32_MAX_EXP__ 128\000"
.LASF357:
	.ascii	"__SA_FBIT__ 15\000"
.LASF249:
	.ascii	"__DEC128_MIN_EXP__ (-6142)\000"
.LASF328:
	.ascii	"__LLACCUM_MAX__ 0X7FFFFFFFFFFFFFFFP-31LLK\000"
.LASF367:
	.ascii	"__UDA_FBIT__ 32\000"
.LASF1664:
	.ascii	"cbRxErr\000"
.LASF48:
	.ascii	"__UINT64_TYPE__ long long unsigned int\000"
.LASF167:
	.ascii	"__DBL_MAX_10_EXP__ 308\000"
.LASF1734:
	.ascii	"snooze_time\000"
.LASF886:
	.ascii	"EC_CTRL_PLLLCK 0x04\000"
.LASF624:
	.ascii	"SYS_CTRL_TXSTRT 0x00000002UL\000"
.LASF499:
	.ascii	"_DECA_UINT8_ \000"
.LASF750:
	.ascii	"RX_EQUAL_FP_AMPL2_SHIFT (16)\000"
.LASF869:
	.ascii	"AGC_TUNE2_VAL 0X2502A907UL\000"
.LASF34:
	.ascii	"__WCHAR_TYPE__ unsigned int\000"
.LASF529:
	.ascii	"DEV_ID_VER_MASK 0x000000F0UL\000"
.LASF358:
	.ascii	"__SA_IBIT__ 16\000"
.LASF1785:
	.ascii	"_dwt_otpprogword32\000"
.LASF543:
	.ascii	"SYS_CFG_LEN (4)\000"
.LASF446:
	.ascii	"__ELF__ 1\000"
.LASF1020:
	.ascii	"GICLR1 GIRQx1\000"
.LASF958:
	.ascii	"GPIO_DOUT_MASK GPIO_DIR_MASK\000"
.LASF17:
	.ascii	"__SIZEOF_LONG__ 4\000"
.LASF1714:
	.ascii	"reg_val\000"
.LASF1444:
	.ascii	"DWT_START_RX_DELAYED 1\000"
.LASF1728:
	.ascii	"dwt_setrxtimeout\000"
.LASF1838:
	.ascii	"dwt_writetxdata\000"
.LASF625:
	.ascii	"SYS_CTRL_TXDLYS 0x00000004UL\000"
.LASF905:
	.ascii	"GPIO_MSGP2_MASK 0x00000C00UL\000"
.LASF985:
	.ascii	"GISEN2 GIRQx2\000"
.LASF706:
	.ascii	"SYS_STATUS_ALL_DBLBUFF (SYS_STATUS_RXDFR | SYS_STAT"
	.ascii	"US_RXFCG)\000"
.LASF748:
	.ascii	"STD_NOISE_SHIFT RX_EQUAL_STD_NOISE_SHIFT\000"
.LASF1176:
	.ascii	"FS_XTALT_OFFSET 0x0E\000"
.LASF56:
	.ascii	"__UINT_LEAST64_TYPE__ long long unsigned int\000"
.LASF1350:
	.ascii	"REG_33_ID_RESERVED 0x33\000"
.LASF1554:
	.ascii	"__towupper\000"
.LASF525:
	.ascii	"DW1000_DEVICE_DRIVER_VER_STRING \"DW1000 Device Dri"
	.ascii	"ver Version 04.00.06\"\000"
.LASF721:
	.ascii	"RX_FINFO_RXPEL_128 0x00040800UL\000"
.LASF82:
	.ascii	"__SHRT_WIDTH__ 16\000"
.LASF762:
	.ascii	"RX_TTCKI_LEN (4)\000"
.LASF628:
	.ascii	"SYS_CTRL_WAIT4RESP 0x00000080UL\000"
.LASF992:
	.ascii	"GPIO_IMODE_OFFSET 0x18\000"
.LASF1333:
	.ascii	"EVC_TXFS_OFFSET 0x16\000"
.LASF1076:
	.ascii	"DRX_TUNE2_MASK 0xFFFFFFFFUL\000"
.LASF65:
	.ascii	"__INTPTR_TYPE__ int\000"
.LASF1411:
	.ascii	"REG_3D_ID_RESERVED 0x3D\000"
.LASF1720:
	.ascii	"dwt_configeventcounters\000"
.LASF1825:
	.ascii	"dwt_readtxtimestamp\000"
.LASF314:
	.ascii	"__UACCUM_EPSILON__ 0x1P-16UK\000"
.LASF129:
	.ascii	"__INT_FAST16_WIDTH__ 32\000"
.LASF1641:
	.ascii	"firstPath\000"
.LASF1143:
	.ascii	"TC_PGDELAY_LEN (1)\000"
.LASF1577:
	.ascii	"__RAL_data_utf8_comma\000"
.LASF551:
	.ascii	"SYS_CFG_FFAM 0x00000020UL\000"
.LASF916:
	.ascii	"GPIO_PIN6_EXTRXE 0x00040000UL\000"
.LASF1319:
	.ascii	"EVC_FCE_MASK 0x0FFF\000"
.LASF1031:
	.ascii	"GIDBE0 GIRQx0\000"
.LASF242:
	.ascii	"__DEC64_MIN_EXP__ (-382)\000"
.LASF199:
	.ascii	"__FLT32_MIN__ 1.1\000"
.LASF1821:
	.ascii	"dwt_readrxtimestamphi32\000"
.LASF1021:
	.ascii	"GICLR2 GIRQx2\000"
.LASF1489:
	.ascii	"HERTZ_TO_PPM_MULTIPLIER_CHAN_3 (-1.0e6/4492.8e6)\000"
.LASF1473:
	.ascii	"DWT_TANDV 0x0001\000"
.LASF1842:
	.ascii	"dwt_setrxantennadelay\000"
.LASF1695:
	.ascii	"bit_field\000"
.LASF1588:
	.ascii	"next\000"
.LASF1107:
	.ascii	"RF_CONF_TXPLLPOWEN_MASK (RF_CONF_PLLEN_MASK | RF_CO"
	.ascii	"NF_TXPOW_MASK)\000"
.LASF986:
	.ascii	"GISEN3 GIRQx3\000"
.LASF1689:
	.ascii	"current_mixer_gain\000"
.LASF1770:
	.ascii	"length\000"
.LASF1367:
	.ascii	"PMSC_CTRL0_TXCLKS_125M 0x00000020UL\000"
.LASF205:
	.ascii	"__FP_FAST_FMAF32 1\000"
.LASF1395:
	.ascii	"PMSC_TXFINESEQ_OFFSET 0x26\000"
.LASF1690:
	.ascii	"new_da_attn\000"
.LASF1750:
	.ascii	"_dwt_enableclocks\000"
.LASF695:
	.ascii	"SYS_STATUS_RXSFDTO 0x04000000UL\000"
.LASF553:
	.ascii	"SYS_CFG_FFA4 0x00000080UL\000"
.LASF361:
	.ascii	"__TA_FBIT__ 63\000"
.LASF1608:
	.ascii	"tx_config\000"
.LASF1757:
	.ascii	"dwt_setcallbacks\000"
.LASF1092:
	.ascii	"DRX_TUNE4H_LEN (2)\000"
.LASF1224:
	.ascii	"AON_CFG1_SLEEP_CEN 0x0001\000"
.LASF1475:
	.ascii	"DWT_WAKE_SLPCNT 0x8\000"
.LASF1500:
	.ascii	"FORCE_TX_PLL 13\000"
.LASF111:
	.ascii	"__INT_LEAST16_WIDTH__ 16\000"
.LASF262:
	.ascii	"__USFRACT_MIN__ 0.0UHR\000"
.LASF545:
	.ascii	"SYS_CFG_FF_ALL_EN 0x000001FEUL\000"
.LASF1587:
	.ascii	"decode\000"
.LASF956:
	.ascii	"GPIO_DOUT_OFFSET 0x0C\000"
.LASF51:
	.ascii	"__INT_LEAST32_TYPE__ long int\000"
.LASF174:
	.ascii	"__DBL_HAS_INFINITY__ 1\000"
.LASF708:
	.ascii	"SYS_STATUS_ALL_RX_TO (SYS_STATUS_RXRFTO | SYS_STATU"
	.ascii	"S_RXPTO)\000"
.LASF719:
	.ascii	"RX_FINFO_RXPEL_MASK 0x000C1800UL\000"
.LASF1269:
	.ascii	"LDE_PPAMPL_OFFSET 0x1002\000"
.LASF1110:
	.ascii	"RF_RXCTRLH_LEN (1)\000"
.LASF619:
	.ascii	"SYS_CTRL_ID 0x0D\000"
.LASF71:
	.ascii	"__SHRT_MAX__ 0x7fff\000"
.LASF1313:
	.ascii	"EVC_RSE_MASK 0x0FFF\000"
.LASF184:
	.ascii	"__LDBL_MAX__ 1.1\000"
.LASF1519:
	.ascii	"grouping\000"
.LASF758:
	.ascii	"RX_EQUAL_CIR_MXG_SHIFT (48)\000"
.LASF764:
	.ascii	"RX_TTCKO_LEN (5)\000"
.LASF512:
	.ascii	"NUM_CH_SUPPORTED 8\000"
.LASF1022:
	.ascii	"GICLR3 GIRQx3\000"
.LASF1677:
	.ascii	"pgdly\000"
.LASF1258:
	.ascii	"OTP_SF_OPS_SEL_TIGHT 0x20\000"
.LASF484:
	.ascii	"__CTYPE_XDIGIT 0x80\000"
.LASF843:
	.ascii	"CHAN_CTRL_TNSSFD 0x00100000UL\000"
.LASF1391:
	.ascii	"PMSC_SNOZT_OFFSET 0x0C\000"
.LASF1624:
	.ascii	"txCode\000"
.LASF633:
	.ascii	"SYS_CTRL_HRBT_OFFSET (3)\000"
.LASF1237:
	.ascii	"OTP_CTRL_OTPRDEN 0x0001\000"
.LASF1869:
	.ascii	"C:\\Users\\vikra\\Desktop\\decawave-ble\\NRF_UWB_Co"
	.ascii	"mbo\\examples\\ble_central_and_peripheral\\experime"
	.ascii	"ntal\\ble_app_hrs_rscs_relay\\pca10040\\s132\\ses\000"
.LASF1063:
	.ascii	"DRX_TUNE1a_OFFSET 0x04\000"
.LASF819:
	.ascii	"TX_POWER_BOOSTP125_MASK 0x00000000UL\000"
.LASF1759:
	.ascii	"rxDelayTime\000"
.LASF1232:
	.ascii	"OTP_ADDR_LEN (2)\000"
.LASF813:
	.ascii	"TX_POWER_BOOSTP500_MASK 0x00000000UL\000"
.LASF227:
	.ascii	"__FLT32X_MAX__ 1.1\000"
.LASF7:
	.ascii	"__GNUC_PATCHLEVEL__ 1\000"
.LASF1243:
	.ascii	"OTP_STAT_MASK 0x0003\000"
.LASF132:
	.ascii	"__INT_FAST64_MAX__ 0x7fffffffffffffffLL\000"
.LASF736:
	.ascii	"RX_FINFO_RXPRF_16M 0x00010000UL\000"
.LASF327:
	.ascii	"__LLACCUM_MIN__ (-0X1P31LLK-0X1P31LLK)\000"
.LASF1464:
	.ascii	"DWT_INT_RXOVRR 0x00100000\000"
.LASF380:
	.ascii	"__GCC_ATOMIC_CHAR_LOCK_FREE 2\000"
.LASF62:
	.ascii	"__UINT_FAST16_TYPE__ unsigned int\000"
.LASF1161:
	.ascii	"FS_PLLCFG_CH2 0x08400508UL\000"
.LASF1756:
	.ascii	"dwt_checkirq\000"
.LASF105:
	.ascii	"__UINT64_MAX__ 0xffffffffffffffffULL\000"
.LASF1344:
	.ascii	"DIAG_TMC_LEN (2)\000"
.LASF530:
	.ascii	"DEV_ID_MODEL_MASK 0x0000FF00UL\000"
.LASF1372:
	.ascii	"PMSC_CTRL0_PLL2_SEQ_EN 0x01000000UL\000"
.LASF16:
	.ascii	"__SIZEOF_INT__ 4\000"
.LASF422:
	.ascii	"__ARMEL__ 1\000"
.LASF1084:
	.ascii	"DRX_TUNE2_PRF64_PAC64 0x373B0296UL\000"
.LASF248:
	.ascii	"__DEC128_MANT_DIG__ 34\000"
.LASF225:
	.ascii	"__FLT32X_MAX_10_EXP__ 308\000"
.LASF1702:
	.ascii	"dwt_readwakeuptemp\000"
.LASF1455:
	.ascii	"DWT_FF_MAC_EN 0x020\000"
.LASF490:
	.ascii	"__MAX_CATEGORY 5\000"
.LASF821:
	.ascii	"TX_POWER_BOOSTP125_SHIFT (24)\000"
.LASF965:
	.ascii	"GIRQx3 0x00000008UL\000"
.LASF40:
	.ascii	"__SIG_ATOMIC_TYPE__ int\000"
.LASF1766:
	.ascii	"_dwt_loaducodefromrom\000"
.LASF1142:
	.ascii	"TC_PGDELAY_OFFSET 0x0B\000"
.LASF994:
	.ascii	"GPIO_IMODE_MASK GPIO_IRQE_MASK\000"
.LASF1190:
	.ascii	"AON_WCFG_ONW_LDC 0x0040\000"
.LASF1492:
	.ascii	"dwt_read32bitreg(x) dwt_read32bitoffsetreg(x,0)\000"
.LASF1033:
	.ascii	"GIDBE2 GIRQx2\000"
.LASF820:
	.ascii	"BOOSTP125_MASK TX_POWER_BOOSTP125_MASK\000"
.LASF955:
	.ascii	"GDM8 GxM8\000"
.LASF1366:
	.ascii	"PMSC_CTRL0_TXCLKS_19M 0x00000010UL\000"
.LASF1023:
	.ascii	"GICLR4 GIRQx4\000"
.LASF386:
	.ascii	"__GCC_ATOMIC_LONG_LOCK_FREE 2\000"
.LASF1771:
	.ascii	"dwt_entersleepaftertx\000"
.LASF966:
	.ascii	"GIRQx4 0x00000010UL\000"
.LASF52:
	.ascii	"__INT_LEAST64_TYPE__ long long int\000"
.LASF1290:
	.ascii	"LDE_REPC_PCODE_14 0x35C2\000"
.LASF1256:
	.ascii	"OTP_SF_OPS_SEL_MASK 0x60\000"
.LASF647:
	.ascii	"SYS_MASK_MRXPHD 0x00000800UL\000"
.LASF496:
	.ascii	"RAND_MAX 32767\000"
.LASF1725:
	.ascii	"mask\000"
.LASF1850:
	.ascii	"dwt_readdevid\000"
.LASF465:
	.ascii	"SOFTDEVICE_PRESENT 1\000"
.LASF1496:
	.ascii	"READ_ACC_ON 7\000"
.LASF1058:
	.ascii	"DRX_TUNE0b_110K_NSTD 0x0016\000"
.LASF1693:
	.ascii	"dwt_calcbandwidthtempadj\000"
.LASF288:
	.ascii	"__LLFRACT_MAX__ 0X7FFFFFFFFFFFFFFFP-63LLR\000"
.LASF1035:
	.ascii	"GIDBE4 GIRQx4\000"
.LASF1041:
	.ascii	"GPIO_RAW_LEN (4)\000"
.LASF749:
	.ascii	"RX_EQUAL_FP_AMPL2_MASK 0xFFFF0000ULL\000"
.LASF1095:
	.ascii	"DRX_TUNE4H_PRE128PLUS 0x0028\000"
.LASF850:
	.ascii	"DW_NS_SFD_LEN_110K 64\000"
.LASF335:
	.ascii	"__QQ_FBIT__ 7\000"
.LASF183:
	.ascii	"__LDBL_DECIMAL_DIG__ 17\000"
.LASF555:
	.ascii	"SYS_CFG_HIRQ_POL 0x00000200UL\000"
.LASF1371:
	.ascii	"PMSC_CTRL0_KHZCLEN 0x00800000UL\000"
.LASF1189:
	.ascii	"AON_WCFG_ONW_LEUI 0x0008\000"
.LASF676:
	.ascii	"SYS_STATUS_TXFRS 0x00000080UL\000"
.LASF1563:
	.ascii	"__RAL_locale_t\000"
.LASF1265:
	.ascii	"LDE_CFG1_NSTDEV_MASK 0x1F\000"
.LASF1718:
	.ascii	"counters\000"
.LASF25:
	.ascii	"__BIGGEST_ALIGNMENT__ 8\000"
.LASF650:
	.ascii	"SYS_MASK_MRXFCG 0x00004000UL\000"
.LASF414:
	.ascii	"__ARM_ARCH\000"
.LASF45:
	.ascii	"__UINT8_TYPE__ unsigned char\000"
.LASF1174:
	.ascii	"FS_RES2_OFFSET 0x0C\000"
.LASF1700:
	.ascii	"delta_lowest\000"
.LASF1431:
	.ascii	"DWT_PLEN_1536 0x18\000"
.LASF194:
	.ascii	"__FLT32_MIN_10_EXP__ (-37)\000"
.LASF832:
	.ascii	"CHAN_CTRL_RXFPRF_MASK 0x000C0000UL\000"
.LASF1034:
	.ascii	"GIDBE3 GIRQx3\000"
.LASF333:
	.ascii	"__ULLACCUM_MAX__ 0XFFFFFFFFFFFFFFFFP-32ULLK\000"
.LASF1024:
	.ascii	"GICLR5 GIRQx5\000"
.LASF1866:
	.ascii	"dwt_setlocaldataptr\000"
.LASF3:
	.ascii	"__STDC_UTF_32__ 1\000"
.LASF109:
	.ascii	"__INT_LEAST16_MAX__ 0x7fff\000"
.LASF659:
	.ascii	"SYS_MASK_MRFPLLLL 0x01000000UL\000"
.LASF1867:
	.ascii	"GNU C99 8.3.1 20190703 (release) [gcc-8-branch revi"
	.ascii	"sion 273027] -fmessage-length=0 -mcpu=cortex-m4 -ml"
	.ascii	"ittle-endian -mfloat-abi=hard -mfpu=fpv4-sp-d16 -mt"
	.ascii	"humb -mtp=soft -munaligned-access -std=gnu99 -g3 -g"
	.ascii	"pubnames -fomit-frame-pointer -fno-dwarf2-cfi-asm -"
	.ascii	"fno-builtin -ffunction-sections -fdata-sections -fs"
	.ascii	"hort-enums -fno-common\000"
.LASF1493:
	.ascii	"FORCE_SYS_XTI 0\000"
.LASF1592:
	.ascii	"uint8\000"
.LASF921:
	.ascii	"GxP1 0x00000002UL\000"
.LASF1298:
	.ascii	"LDE_REPC_PCODE_22 0x3850\000"
.LASF1442:
	.ascii	"DWT_RESPONSE_EXPECTED 2\000"
.LASF1128:
	.ascii	"TC_SARL_SAR_LVBAT_OFFSET (3)\000"
.LASF903:
	.ascii	"GPIO_MSGP0_MASK 0x000000C0UL\000"
.LASF296:
	.ascii	"__SACCUM_IBIT__ 8\000"
.LASF971:
	.ascii	"GIRQE0 GIRQx0\000"
.LASF46:
	.ascii	"__UINT16_TYPE__ short unsigned int\000"
.LASF752:
	.ascii	"FP_AMPL2_SHIFT RX_EQUAL_FP_AMPL2_SHIFT\000"
.LASF740:
	.ascii	"RX_FINFO_RXPACC_SHIFT (20)\000"
.LASF759:
	.ascii	"CIR_MXG_MASK RX_EQUAL_CIR_MXG_MASK\000"
.LASF228:
	.ascii	"__FLT32X_MIN__ 1.1\000"
.LASF1628:
	.ascii	"phrMode\000"
.LASF1193:
	.ascii	"AON_WCFG_ONW_LLDE 0x0800\000"
.LASF1761:
	.ascii	"dwt_enableautoack\000"
.LASF381:
	.ascii	"__GCC_ATOMIC_CHAR16_T_LOCK_FREE 2\000"
.LASF232:
	.ascii	"__FLT32X_HAS_INFINITY__ 1\000"
.LASF1610:
	.ascii	"digital_bb_config\000"
.LASF1260:
	.ascii	"LDE_IF_LEN (0)\000"
.LASF1307:
	.ascii	"EVC_CLR 0x00000002UL\000"
.LASF156:
	.ascii	"__FLT_EPSILON__ 1.1\000"
.LASF1865:
	.ascii	"rega\000"
.LASF591:
	.ascii	"TX_FCTRL_TR_SHFT (15)\000"
.LASF968:
	.ascii	"GIRQx6 0x00000040UL\000"
.LASF439:
	.ascii	"__ARM_EABI__ 1\000"
.LASF1797:
	.ascii	"shortAddress\000"
.LASF1025:
	.ascii	"GICLR6 GIRQx6\000"
.LASF879:
	.ascii	"EXT_SYNC_ID 0x24\000"
.LASF125:
	.ascii	"__UINT64_C(c) c ## ULL\000"
.LASF1814:
	.ascii	"index\000"
.LASF747:
	.ascii	"STD_NOISE_MASK RX_EQUAL_STD_NOISE_MASK\000"
.LASF1201:
	.ascii	"AON_CTRL_DCA_READ 0x08\000"
.LASF418:
	.ascii	"__thumb2__ 1\000"
.LASF631:
	.ascii	"SYS_CTRL_HSRBTOGGLE 0x01000000UL\000"
.LASF151:
	.ascii	"__FLT_MAX_EXP__ 128\000"
.LASF915:
	.ascii	"GPIO_PIN5_EXTTXE 0x00010000UL\000"
.LASF10:
	.ascii	"__ATOMIC_SEQ_CST 5\000"
.LASF1182:
	.ascii	"AON_ID 0x2C\000"
.LASF674:
	.ascii	"SYS_STATUS_TXPRS 0x00000020UL\000"
.LASF1059:
	.ascii	"DRX_TUNE0b_850K_STD 0x0001\000"
.LASF1343:
	.ascii	"DIAG_TMC_OFFSET 0x24\000"
.LASF491:
	.ascii	"__RAL_SIZE_T_DEFINED \000"
.LASF1476:
	.ascii	"DWT_WAKE_CS 0x4\000"
.LASF469:
	.ascii	"__stdlib_H \000"
.LASF860:
	.ascii	"AGC_CTRL1_DIS_AM 0x0001\000"
.LASF224:
	.ascii	"__FLT32X_MAX_EXP__ 1024\000"
.LASF191:
	.ascii	"__FLT32_MANT_DIG__ 24\000"
.LASF61:
	.ascii	"__UINT_FAST8_TYPE__ unsigned int\000"
.LASF1528:
	.ascii	"frac_digits\000"
.LASF161:
	.ascii	"__FP_FAST_FMAF 1\000"
.LASF558:
	.ascii	"SYS_CFG_DIS_DRXB 0x00001000UL\000"
.LASF369:
	.ascii	"__UTA_FBIT__ 64\000"
.LASF163:
	.ascii	"__DBL_DIG__ 15\000"
.LASF1192:
	.ascii	"AON_WCFG_PRES_SLEEP 0x0100\000"
.LASF1070:
	.ascii	"DRX_TUNE1b_MASK 0xFFFF\000"
.LASF1390:
	.ascii	"PMSC_RES1_OFFSET 0x08\000"
.LASF182:
	.ascii	"__DECIMAL_DIG__ 17\000"
.LASF993:
	.ascii	"GPIO_IMODE_LEN (4)\000"
.LASF1824:
	.ascii	"dwt_readtxtimestamphi32\000"
.LASF1768:
	.ascii	"prfIndex\000"
.LASF1147:
	.ascii	"TC_PGDELAY_CH4 0x95\000"
.LASF1527:
	.ascii	"int_frac_digits\000"
.LASF1822:
	.ascii	"dwt_readrxtimestamp\000"
.LASF867:
	.ascii	"AGC_TUNE2_LEN (4)\000"
.LASF1861:
	.ascii	"dwt_otprevision\000"
.LASF1334:
	.ascii	"EVC_TXFS_LEN (2)\000"
.LASF370:
	.ascii	"__UTA_IBIT__ 64\000"
.LASF142:
	.ascii	"__GCC_IEC_559_COMPLEX 0\000"
.LASF1178:
	.ascii	"FS_XTALT_MASK 0x1F\000"
.LASF1302:
	.ascii	"DIG_DIAG_LEN (41)\000"
.LASF1036:
	.ascii	"GIDBE5 GIRQx5\000"
.LASF447:
	.ascii	"__SIZEOF_WCHAR_T 4\000"
.LASF1241:
	.ascii	"OTP_STAT 0x08\000"
.LASF1518:
	.ascii	"thousands_sep\000"
.LASF1172:
	.ascii	"FS_PLLTUNE_CH5 0xBE\000"
.LASF1026:
	.ascii	"GICLR7 GIRQx7\000"
.LASF276:
	.ascii	"__LFRACT_IBIT__ 0\000"
.LASF769:
	.ascii	"RX_TIME_ID 0x15\000"
.LASF1851:
	.ascii	"dwt_getlotid\000"
.LASF372:
	.ascii	"__USER_LABEL_PREFIX__ \000"
.LASF611:
	.ascii	"TX_BUFFER_LEN (1024)\000"
.LASF1548:
	.ascii	"date_time_format\000"
.LASF1762:
	.ascii	"responseDelayTime\000"
.LASF686:
	.ascii	"SYS_STATUS_RXRFTO 0x00020000UL\000"
.LASF1326:
	.ascii	"EVC_STO_OFFSET 0x10\000"
.LASF827:
	.ascii	"CHAN_CTRL_MASK 0xFFFF00FFUL\000"
.LASF741:
	.ascii	"RX_BUFFER_ID 0x11\000"
.LASF1778:
	.ascii	"dwt_entersleep\000"
.LASF929:
	.ascii	"GxM0 0x00000010UL\000"
.LASF1747:
	.ascii	"dwt_setdelayedtrxtime\000"
.LASF1399:
	.ascii	"PMSC_LEDC_LEN (4)\000"
.LASF630:
	.ascii	"SYS_CTRL_RXDLYE 0x00000200UL\000"
.LASF848:
	.ascii	"USR_SFD_ID 0x21\000"
.LASF779:
	.ascii	"TX_TIME_LLEN (10)\000"
.LASF1365:
	.ascii	"PMSC_CTRL0_TXCLKS_AUTO 0x00000000UL\000"
.LASF1122:
	.ascii	"RF_TXCTRL_CH7 0x001E7DE0UL\000"
.LASF126:
	.ascii	"__INT_FAST8_MAX__ 0x7fffffff\000"
.LASF99:
	.ascii	"__INT16_MAX__ 0x7fff\000"
.LASF1336:
	.ascii	"EVC_HPW_OFFSET 0x18\000"
.LASF127:
	.ascii	"__INT_FAST8_WIDTH__ 32\000"
.LASF1446:
	.ascii	"DWT_NO_SYNC_PTRS 4\000"
.LASF523:
	.ascii	"_DECA_VERSION_H_ \000"
.LASF1510:
	.ascii	"B20_SIGN_EXTEND_TEST (0x00100000UL)\000"
.LASF1616:
	.ascii	"datalength\000"
.LASF1320:
	.ascii	"EVC_FFR_OFFSET 0x0C\000"
.LASF428:
	.ascii	"__ARM_FP16_ARGS\000"
.LASF1037:
	.ascii	"GIDBE6 GIRQx6\000"
.LASF193:
	.ascii	"__FLT32_MIN_EXP__ (-125)\000"
.LASF449:
	.ascii	"__ARM_ARCH_FPV4_SP_D16__ 1\000"
.LASF287:
	.ascii	"__LLFRACT_MIN__ (-0.5LLR-0.5LLR)\000"
.LASF1614:
	.ascii	"lde_replicaCoeff\000"
.LASF1027:
	.ascii	"GICLR8 GIRQx8\000"
.LASF123:
	.ascii	"__UINT32_C(c) c ## UL\000"
.LASF178:
	.ascii	"__LDBL_MIN_EXP__ (-1021)\000"
.LASF165:
	.ascii	"__DBL_MIN_10_EXP__ (-307)\000"
.LASF272:
	.ascii	"__UFRACT_MIN__ 0.0UR\000"
.LASF734:
	.ascii	"RX_FINFO_RNG_SHIFT (15)\000"
.LASF1416:
	.ascii	"DWT_SUCCESS (0)\000"
.LASF815:
	.ascii	"TX_POWER_BOOSTP500_SHIFT (8)\000"
.LASF767:
	.ascii	"RX_TTCKO_RSMPDEL_MASK 0xFF000000UL\000"
.LASF892:
	.ascii	"EC_GOLP (0x08)\000"
.LASF844:
	.ascii	"CHAN_CTRL_TNSSFD_SHIFT (20)\000"
.LASF1578:
	.ascii	"__RAL_data_utf8_space\000"
.LASF1586:
	.ascii	"__RAL_error_decoder_s\000"
.LASF1589:
	.ascii	"__RAL_error_decoder_t\000"
.LASF1248:
	.ascii	"OTP_SRDAT 0x0E\000"
.LASF352:
	.ascii	"__UDQ_IBIT__ 0\000"
.LASF1054:
	.ascii	"DRX_TUNE0b_OFFSET (0x02)\000"
.LASF162:
	.ascii	"__DBL_MANT_DIG__ 53\000"
.LASF297:
	.ascii	"__SACCUM_MIN__ (-0X1P7HK-0X1P7HK)\000"
.LASF502:
	.ascii	"_DECA_INT8_ \000"
.LASF88:
	.ascii	"__PTRDIFF_WIDTH__ 32\000"
.LASF1159:
	.ascii	"FS_PLLCFG_LEN (5)\000"
.LASF1760:
	.ascii	"dwt_setdblrxbuffmode\000"
.LASF1794:
	.ascii	"eui64\000"
.LASF732:
	.ascii	"RX_FINFO_RXBR_SHIFT (13)\000"
.LASF723:
	.ascii	"RX_FINFO_RXPEL_512 0x00041800UL\000"
.LASF332:
	.ascii	"__ULLACCUM_MIN__ 0.0ULLK\000"
.LASF1188:
	.ascii	"AON_WCFG_ONW_RX 0x0002\000"
.LASF687:
	.ascii	"SYS_STATUS_LDEERR 0x00040000UL\000"
.LASF239:
	.ascii	"__DEC32_EPSILON__ 1E-6DF\000"
.LASF967:
	.ascii	"GIRQx5 0x00000020UL\000"
.LASF623:
	.ascii	"SYS_CTRL_SFCST 0x00000001UL\000"
.LASF1435:
	.ascii	"DWT_PLEN_128 0x14\000"
.LASF1572:
	.ascii	"__RAL_c_locale_day_names\000"
.LASF1017:
	.ascii	"GPIO_ICLR_LEN (4)\000"
.LASF1719:
	.ascii	"temp\000"
.LASF483:
	.ascii	"__CTYPE_BLANK 0x40\000"
.LASF1521:
	.ascii	"currency_symbol\000"
.LASF1430:
	.ascii	"DWT_PLEN_2048 0x28\000"
.LASF1468:
	.ascii	"DWT_PRESRV_SLEEP 0x0100\000"
.LASF77:
	.ascii	"__WINT_MAX__ 0xffffffffU\000"
.LASF20:
	.ascii	"__SIZEOF_FLOAT__ 4\000"
.LASF427:
	.ascii	"__ARM_FP16_FORMAT_ALTERNATIVE\000"
.LASF1731:
	.ascii	"mode\000"
.LASF792:
	.ascii	"ACK_RESP_T_W4R_TIM_OFFSET 0\000"
.LASF1177:
	.ascii	"FS_XTALT_LEN (1)\000"
.LASF1840:
	.ascii	"dwt_settxantennadelay\000"
.LASF835:
	.ascii	"CHAN_CTRL_RXFPRF_16 0x00040000UL\000"
.LASF300:
	.ascii	"__USACCUM_FBIT__ 8\000"
.LASF784:
	.ascii	"TX_ANTD_ID 0x18\000"
.LASF1315:
	.ascii	"EVC_FCG_LEN (2)\000"
.LASF1640:
	.ascii	"rxPreamCount\000"
.LASF1467:
	.ascii	"DWT_INT_ARFE 0x20000000\000"
.LASF388:
	.ascii	"__GCC_ATOMIC_TEST_AND_SET_TRUEVAL 1\000"
.LASF47:
	.ascii	"__UINT32_TYPE__ long unsigned int\000"
.LASF269:
	.ascii	"__FRACT_EPSILON__ 0x1P-15R\000"
.LASF874:
	.ascii	"AGC_STAT1_OFFSET (0x1E)\000"
.LASF366:
	.ascii	"__USA_IBIT__ 16\000"
.LASF1349:
	.ascii	"REG_32_ID_RESERVED 0x32\000"
.LASF1505:
	.ascii	"PARTID_ADDRESS (0x06)\000"
.LASF882:
	.ascii	"EC_CTRL_LEN (4)\000"
.LASF504:
	.ascii	"_DECA_INT32_ \000"
.LASF119:
	.ascii	"__UINT8_C(c) c\000"
.LASF1721:
	.ascii	"enable\000"
.LASF565:
	.ascii	"SYS_CFG_DIS_STXP 0x00040000UL\000"
.LASF598:
	.ascii	"TX_FCTRL_TXPSR_PE_16 0x00000000UL\000"
.LASF407:
	.ascii	"__ARM_FEATURE_NUMERIC_MAXMIN\000"
.LASF1410:
	.ascii	"REG_3C_ID_RESERVED 0x3C\000"
.LASF1206:
	.ascii	"AON_ADDR_LEN (1)\000"
.LASF828:
	.ascii	"CHAN_CTRL_TX_CHAN_MASK 0x0000000FUL\000"
.LASF283:
	.ascii	"__ULFRACT_MAX__ 0XFFFFFFFFP-32ULR\000"
.LASF937:
	.ascii	"GxM8 0x00100000UL\000"
.LASF1328:
	.ascii	"EVC_PTO_LEN (2)\000"
.LASF561:
	.ascii	"SYS_CFG_FCS_INIT2F 0x00008000UL\000"
.LASF785:
	.ascii	"TX_ANTD_OFFSET 0x00\000"
.LASF292:
	.ascii	"__ULLFRACT_MIN__ 0.0ULLR\000"
.LASF1057:
	.ascii	"DRX_TUNE0b_110K_STD 0x000A\000"
.LASF1857:
	.ascii	"direction\000"
.LASF1504:
	.ascii	"LDOTUNE_ADDRESS (0x04)\000"
.LASF1549:
	.ascii	"unsigned char\000"
.LASF861:
	.ascii	"AGC_TUNE1_OFFSET (0x04)\000"
.LASF399:
	.ascii	"__ARM_FEATURE_QRDMX\000"
.LASF1217:
	.ascii	"AON_CFG0_LPCLKDIVA_SHIFT (5)\000"
.LASF470:
	.ascii	"__crossworks_H \000"
.LASF814:
	.ascii	"BOOSTP500_MASK TX_POWER_BOOSTP500_MASK\000"
.LASF256:
	.ascii	"__SFRACT_IBIT__ 0\000"
.LASF1773:
	.ascii	"wake\000"
.LASF609:
	.ascii	"TX_FCTRL_IFSDELAY_MASK 0xFF00000000ULL\000"
.LASF685:
	.ascii	"SYS_STATUS_RXRFSL 0x00010000UL\000"
.LASF1327:
	.ascii	"EVC_PTO_OFFSET 0x12\000"
.LASF1136:
	.ascii	"TC_PGCCTRL_TMEAS_MASK 0x3C\000"
.LASF720:
	.ascii	"RX_FINFO_RXPEL_64 0x00040000UL\000"
.LASF1658:
	.ascii	"sleep_mode\000"
.LASF1318:
	.ascii	"EVC_FCE_LEN (2)\000"
.LASF468:
	.ascii	"assert(e) ((e) ? (void)0 : __assert(#e, __FILE__, _"
	.ascii	"_LINE__))\000"
.LASF795:
	.ascii	"ACK_RESP_T_ACK_TIM_OFFSET 3\000"
.LASF1619:
	.ascii	"dwt_cb_data_t\000"
.LASF148:
	.ascii	"__FLT_DIG__ 6\000"
.LASF1649:
	.ascii	"decaIrqStatus_t\000"
.LASF1293:
	.ascii	"LDE_REPC_PCODE_17 0x3332\000"
.LASF1602:
	.ascii	"agc_config\000"
.LASF1733:
	.ascii	"dwt_setsnoozetime\000"
.LASF926:
	.ascii	"GxP6 0x00000400UL\000"
.LASF1032:
	.ascii	"GIDBE1 GIRQx1\000"
.LASF1655:
	.ascii	"init_xtrim\000"
.LASF166:
	.ascii	"__DBL_MAX_EXP__ 1024\000"
.LASF461:
	.ascii	"NRF52832_XXAA 1\000"
.LASF506:
	.ascii	"NUM_BR 3\000"
.LASF1732:
	.ascii	"temp1\000"
.LASF286:
	.ascii	"__LLFRACT_IBIT__ 0\000"
.LASF120:
	.ascii	"__UINT_LEAST16_MAX__ 0xffff\000"
.LASF89:
	.ascii	"__SIZE_WIDTH__ 32\000"
.LASF431:
	.ascii	"__ARM_FEATURE_FP16_FML\000"
.LASF1030:
	.ascii	"GPIO_IDBE_MASK GPIO_IRQE_MASK\000"
.LASF839:
	.ascii	"CHAN_CTRL_RX_PCOD_MASK 0xF8000000UL\000"
.LASF917:
	.ascii	"GPIO_DIR_OFFSET 0x08\000"
.LASF668:
	.ascii	"SYS_STATUS_MASK_32 0xFFF7FFFFUL\000"
.LASF23:
	.ascii	"__SIZEOF_SIZE_T__ 4\000"
.LASF681:
	.ascii	"SYS_STATUS_RXPHE 0x00001000UL\000"
.LASF498:
	.ascii	"_DECA_TYPES_H_ \000"
.LASF1222:
	.ascii	"AON_CFG1_LEN (2)\000"
.LASF1663:
	.ascii	"cbRxTo\000"
.LASF252:
	.ascii	"__DEC128_MAX__ 9.999999999999999999999999999999999E"
	.ascii	"6144DL\000"
.LASF1245:
	.ascii	"OTP_STAT_OTPVPOK 0x0002\000"
.LASF689:
	.ascii	"SYS_STATUS_RXOVRR 0x00100000UL\000"
.LASF1670:
	.ascii	"average_count\000"
.LASF853:
	.ascii	"REG_22_ID_RESERVED 0x22\000"
.LASF665:
	.ascii	"SYS_STATUS_ID 0x0F\000"
.LASF656:
	.ascii	"SYS_MASK_MRXPTO 0x00200000UL\000"
.LASF1450:
	.ascii	"DWT_FF_NOTYPE_EN 0x000\000"
.LASF1221:
	.ascii	"AON_CFG1_OFFSET 0x0A\000"
.LASF1600:
	.ascii	"target\000"
.LASF789:
	.ascii	"ACK_RESP_T_ID 0x1A\000"
.LASF124:
	.ascii	"__UINT_LEAST64_MAX__ 0xffffffffffffffffULL\000"
.LASF1301:
	.ascii	"DIG_DIAG_ID 0x2F\000"
.LASF818:
	.ascii	"TX_POWER_BOOSTP250_SHIFT (16)\000"
.LASF1567:
	.ascii	"__RAL_global_locale\000"
.LASF1443:
	.ascii	"DWT_START_RX_IMMEDIATE 0\000"
.LASF1299:
	.ascii	"LDE_REPC_PCODE_23 0x30A2\000"
.LASF214:
	.ascii	"__FLT64_MIN__ 1.1\000"
.LASF255:
	.ascii	"__SFRACT_FBIT__ 7\000"
.LASF526:
	.ascii	"DEV_ID_ID 0x00\000"
.LASF1477:
	.ascii	"DWT_WAKE_WK 0x2\000"
.LASF329:
	.ascii	"__LLACCUM_EPSILON__ 0x1P-31LLK\000"
.LASF1727:
	.ascii	"timeout\000"
.LASF865:
	.ascii	"AGC_TUNE1_64M 0x889B\000"
.LASF1123:
	.ascii	"RF_STATUS_OFFSET 0x2C\000"
.LASF1832:
	.ascii	"rxBufferOffset\000"
.LASF168:
	.ascii	"__DBL_DECIMAL_DIG__ 17\000"
.LASF18:
	.ascii	"__SIZEOF_LONG_LONG__ 8\000"
.LASF684:
	.ascii	"SYS_STATUS_RXFCE 0x00008000UL\000"
.LASF1830:
	.ascii	"accOffset\000"
.LASF724:
	.ascii	"RX_FINFO_RXPEL_1024 0x00080000UL\000"
.LASF83:
	.ascii	"__INT_WIDTH__ 32\000"
.LASF1170:
	.ascii	"FS_PLLTUNE_CH3 0x56\000"
.LASF478:
	.ascii	"__CTYPE_LOWER 0x02\000"
.LASF672:
	.ascii	"SYS_STATUS_AAT 0x00000008UL\000"
.LASF197:
	.ascii	"__FLT32_DECIMAL_DIG__ 9\000"
.LASF1348:
	.ascii	"REG_31_ID_RESERVED 0x31\000"
.LASF854:
	.ascii	"AGC_CTRL_ID 0x23\000"
.LASF816:
	.ascii	"TX_POWER_BOOSTP250_MASK 0x00000000UL\000"
.LASF1659:
	.ascii	"wait4resp\000"
.LASF1557:
	.ascii	"__mbtowc\000"
.LASF1368:
	.ascii	"PMSC_CTRL0_TXCLKS_OFF 0x00000030UL\000"
.LASF972:
	.ascii	"GIRQE1 GIRQx1\000"
.LASF773:
	.ascii	"RX_TIME_RX_STAMP_OFFSET (0)\000"
.LASF1409:
	.ascii	"REG_3B_ID_RESERVED 0x3B\000"
.LASF1480:
	.ascii	"DWT_LOADNONE 0x0\000"
.LASF35:
	.ascii	"__WINT_TYPE__ unsigned int\000"
.LASF727:
	.ascii	"RX_FINFO_RXPEL_4096 0x000C0000UL\000"
.LASF1751:
	.ascii	"clocks\000"
.LASF1151:
	.ascii	"TC_PGTEST_LEN (1)\000"
.LASF614:
	.ascii	"REG_0B_ID_RESERVED 0x0B\000"
.LASF1854:
	.ascii	"gpioNum\000"
.LASF1053:
	.ascii	"DRX_CONF_LEN (44)\000"
.LASF324:
	.ascii	"__ULACCUM_EPSILON__ 0x1P-32ULK\000"
.LASF147:
	.ascii	"__FLT_MANT_DIG__ 24\000"
.LASF755:
	.ascii	"FP_AMPL3_MASK RX_EQUAL_FP_AMPL3_MASK\000"
.LASF640:
	.ascii	"SYS_MASK_MTXFRB 0x00000010UL\000"
.LASF1386:
	.ascii	"PMSC_CTRL1_LDERUNE 0x00020000UL\000"
.LASF847:
	.ascii	"REG_20_ID_RESERVED 0x20\000"
.LASF778:
	.ascii	"TX_TIME_ID 0x17\000"
.LASF1511:
	.ascii	"B20_SIGN_EXTEND_MASK (0xFFF00000UL)\000"
.LASF219:
	.ascii	"__FLT64_HAS_QUIET_NAN__ 1\000"
.LASF1674:
	.ascii	"old_rf_conf_txpow_mask\000"
.LASF1238:
	.ascii	"OTP_CTRL_OTPREAD 0x0002\000"
.LASF538:
	.ascii	"PANADR_SHORT_ADDR_MASK 0x0000FFFFUL\000"
.LASF206:
	.ascii	"__FLT64_MANT_DIG__ 53\000"
.LASF1635:
	.ascii	"firstPathAmp1\000"
.LASF412:
	.ascii	"__ARM_ARCH_PROFILE 77\000"
.LASF1638:
	.ascii	"firstPathAmp3\000"
.LASF1047:
	.ascii	"GRAWP4 GIRQx4\000"
.LASF1167:
	.ascii	"FS_PLLTUNE_LEN (1)\000"
.LASF634:
	.ascii	"SYS_MASK_ID 0x0E\000"
.LASF321:
	.ascii	"__ULACCUM_IBIT__ 32\000"
.LASF606:
	.ascii	"TX_FCTRL_TXPSR_PE_4096 0x000C0000UL\000"
.LASF1225:
	.ascii	"AON_CFG1_SMXX 0x0002\000"
.LASF444:
	.ascii	"__ARM_FEATURE_COPROC 15\000"
.LASF1755:
	.ascii	"dwt_isr\000"
.LASF973:
	.ascii	"GIRQE2 GIRQx2\000"
.LASF1351:
	.ascii	"REG_34_ID_RESERVED 0x34\000"
.LASF481:
	.ascii	"__CTYPE_PUNCT 0x10\000"
.LASF374:
	.ascii	"__NO_INLINE__ 1\000"
.LASF106:
	.ascii	"__INT_LEAST8_MAX__ 0x7f\000"
.LASF345:
	.ascii	"__UQQ_FBIT__ 8\000"
.LASF149:
	.ascii	"__FLT_MIN_EXP__ (-125)\000"
.LASF1280:
	.ascii	"LDE_REPC_PCODE_4 0x428E\000"
.LASF1426:
	.ascii	"DWT_PAC16 1\000"
.LASF508:
	.ascii	"NUM_PACS 4\000"
.LASF1526:
	.ascii	"negative_sign\000"
.LASF1187:
	.ascii	"AON_WCFG_ONW_RADC 0x0001\000"
.LASF1562:
	.ascii	"codeset\000"
.LASF524:
	.ascii	"DW1000_DRIVER_VERSION 0x040006\000"
.LASF266:
	.ascii	"__FRACT_IBIT__ 0\000"
.LASF146:
	.ascii	"__FLT_RADIX__ 2\000"
.LASF365:
	.ascii	"__USA_FBIT__ 16\000"
.LASF221:
	.ascii	"__FLT32X_DIG__ 15\000"
.LASF540:
	.ascii	"PANADR_PAN_ID_MASK 0xFFFF00F0UL\000"
.LASF1722:
	.ascii	"dwt_setinterrupt\000"
.LASF1088:
	.ascii	"DRX_PRETOC_OFFSET 0x24\000"
.LASF914:
	.ascii	"GPIO_PIN4_EXTPA 0x00004000UL\000"
.LASF808:
	.ascii	"TX_POWER_ID 0x1E\000"
.LASF144:
	.ascii	"__FLT_EVAL_METHOD_TS_18661_3__ 0\000"
.LASF884:
	.ascii	"EC_CTRL_OSTSM 0x00000001UL\000"
.LASF339:
	.ascii	"__SQ_FBIT__ 31\000"
.LASF92:
	.ascii	"__UINTMAX_MAX__ 0xffffffffffffffffULL\000"
.LASF1550:
	.ascii	"__isctype\000"
.LASF1470:
	.ascii	"DWT_CONFIG 0x0040\000"
.LASF863:
	.ascii	"AGC_TUNE1_MASK 0xFFFF\000"
.LASF1094:
	.ascii	"DRX_TUNE4H_PRE64 0x0010\000"
.LASF309:
	.ascii	"__ACCUM_EPSILON__ 0x1P-15K\000"
.LASF1148:
	.ascii	"TC_PGDELAY_CH5 0xC0\000"
.LASF1007:
	.ascii	"GIBES0 GIRQx0\000"
.LASF790:
	.ascii	"ACK_RESP_T_LEN (4)\000"
.LASF697:
	.ascii	"SYS_STATUS_TXBERR 0x10000000UL\000"
.LASF318:
	.ascii	"__LACCUM_MAX__ 0X7FFFFFFFFFFFFFFFP-31LK\000"
.LASF1520:
	.ascii	"int_curr_symbol\000"
.LASF866:
	.ascii	"AGC_TUNE2_OFFSET (0x0C)\000"
.LASF1281:
	.ascii	"LDE_REPC_PCODE_5 0x451E\000"
.LASF1317:
	.ascii	"EVC_FCE_OFFSET 0x0A\000"
.LASF997:
	.ascii	"GIMOD2 GIRQx2\000"
.LASF1071:
	.ascii	"DRX_TUNE1b_110K 0x0064\000"
.LASF240:
	.ascii	"__DEC32_SUBNORMAL_MIN__ 0.000001E-95DF\000"
.LASF1339:
	.ascii	"EVC_TPW_OFFSET 0x1A\000"
.LASF1277:
	.ascii	"LDE_REPC_PCODE_1 0x5998\000"
.LASF1112:
	.ascii	"RF_RXCTRLH_WBW 0xBC\000"
.LASF842:
	.ascii	"CHAN_CTRL_DWSFD_SHIFT (17)\000"
.LASF925:
	.ascii	"GxP5 0x00000200UL\000"
.LASF1287:
	.ascii	"LDE_REPC_PCODE_11 0x3AE0\000"
.LASF220:
	.ascii	"__FLT32X_MANT_DIG__ 53\000"
.LASF1657:
	.ascii	"sysCFGreg\000"
.LASF1297:
	.ascii	"LDE_REPC_PCODE_21 0x3AE0\000"
.LASF601:
	.ascii	"TX_FCTRL_TXPSR_PE_256 0x00240000UL\000"
.LASF1793:
	.ascii	"dwt_geteui\000"
.LASF872:
	.ascii	"AGC_TUNE3_MASK 0xFFFF\000"
.LASF1373:
	.ascii	"PMSC_CTRL0_SOFTRESET_OFFSET 3\000"
.LASF509:
	.ascii	"NUM_BW 2\000"
.LASF1856:
	.ascii	"dwt_setgpiodirection\000"
.LASF1308:
	.ascii	"EVC_PHE_OFFSET 0x04\000"
.LASF934:
	.ascii	"GxM5 0x00002000UL\000"
.LASF1717:
	.ascii	"dwt_readeventcounters\000"
.LASF1796:
	.ascii	"dwt_setaddress16\000"
.LASF207:
	.ascii	"__FLT64_DIG__ 15\000"
.LASF434:
	.ascii	"__ARM_NEON\000"
.LASF1671:
	.ascii	"count\000"
.LASF437:
	.ascii	"__ARM_ARCH_7EM__ 1\000"
.LASF1331:
	.ascii	"EVC_FWTO_LEN (2)\000"
.LASF780:
	.ascii	"TX_TIME_TX_STAMP_LEN (5)\000"
.LASF1633:
	.ascii	"dwt_txconfig_t\000"
.LASF621:
	.ascii	"SYS_CTRL_LEN (4)\000"
.LASF1474:
	.ascii	"DWT_XTAL_EN 0x10\000"
.LASF999:
	.ascii	"GIMOD4 GIRQx4\000"
.LASF226:
	.ascii	"__FLT32X_DECIMAL_DIG__ 17\000"
.LASF864:
	.ascii	"AGC_TUNE1_16M 0x8870\000"
.LASF1008:
	.ascii	"GIBES1 GIRQx1\000"
.LASF1807:
	.ascii	"dwt_write16bitoffsetreg\000"
.LASF1375:
	.ascii	"PMSC_CTRL0_RESET_RX 0xE0\000"
.LASF1289:
	.ascii	"LDE_REPC_PCODE_13 0x3AE0\000"
.LASF1694:
	.ascii	"target_count\000"
.LASF1810:
	.ascii	"dwt_read16bitoffsetreg\000"
.LASF1863:
	.ascii	"otp_addr\000"
.LASF733:
	.ascii	"RX_FINFO_RNG 0x00008000UL\000"
.LASF267:
	.ascii	"__FRACT_MIN__ (-0.5R-0.5R)\000"
.LASF280:
	.ascii	"__ULFRACT_FBIT__ 32\000"
.LASF585:
	.ascii	"TX_FCTRL_SAFE_MASK_32 0xFFFFE3FFUL\000"
.LASF651:
	.ascii	"SYS_MASK_MRXFCE 0x00008000UL\000"
.LASF527:
	.ascii	"DEV_ID_LEN (4)\000"
.LASF1275:
	.ascii	"LDE_REPC_OFFSET 0x2804\000"
.LASF1360:
	.ascii	"PMSC_CTRL0_SYSCLKS_125M 0x00000002UL\000"
.LASF1146:
	.ascii	"TC_PGDELAY_CH3 0xC5\000"
.LASF975:
	.ascii	"GIRQE4 GIRQx4\000"
.LASF834:
	.ascii	"CHAN_CTRL_RXFPRF_4 0x00000000UL\000"
.LASF1692:
	.ascii	"new_regval\000"
.LASF1495:
	.ascii	"FORCE_SYS_PLL 2\000"
.LASF445:
	.ascii	"__GXX_TYPEINFO_EQUALITY_INLINE 0\000"
.LASF474:
	.ascii	"__RAL_SIZE_MAX 4294967295UL\000"
.LASF347:
	.ascii	"__UHQ_FBIT__ 16\000"
.LASF78:
	.ascii	"__WINT_MIN__ 0U\000"
.LASF1180:
	.ascii	"FS_RES3_OFFSET 0x0F\000"
.LASF1304:
	.ascii	"EVC_CTRL_LEN (4)\000"
.LASF1449:
	.ascii	"DWT_LEDS_INIT_BLINK 0x02\000"
.LASF1108:
	.ascii	"RF_CONF_TXALLEN_MASK (RF_CONF_TXEN_MASK | RF_CONF_T"
	.ascii	"XPOW_MASK | RF_CONF_PLLEN_MASK | RF_CONF_TXBLOCKSEN"
	.ascii	"_MASK)\000"
.LASF881:
	.ascii	"EC_CTRL_OFFSET (0x00)\000"
.LASF846:
	.ascii	"CHAN_CTRL_RNSSFD_SHIFT (21)\000"
.LASF1141:
	.ascii	"TC_PGCAL_STATUS_DELAY_MASK 0xFFF\000"
.LASF1211:
	.ascii	"AON_CFG0_SLEEP_EN 0x00000001UL\000"
.LASF1261:
	.ascii	"LDE_THRESH_OFFSET 0x0000\000"
.LASF250:
	.ascii	"__DEC128_MAX_EXP__ 6145\000"
.LASF1044:
	.ascii	"GRAWP1 GIRQx1\000"
.LASF1513:
	.ascii	"__wchar\000"
.LASF1843:
	.ascii	"rxDelay\000"
.LASF72:
	.ascii	"__INT_MAX__ 0x7fffffff\000"
.LASF1506:
	.ascii	"LOTID_ADDRESS (0x07)\000"
.LASF852:
	.ascii	"DW_NS_SFD_LEN_6M8 8\000"
.LASF877:
	.ascii	"AGC_STAT1_EDG1_MASK 0x0007C0\000"
.LASF961:
	.ascii	"GPIO_IRQE_MASK 0x000001FFUL\000"
.LASF76:
	.ascii	"__WCHAR_MIN__ 0U\000"
.LASF1809:
	.ascii	"dwt_read8bitoffsetreg\000"
.LASF1000:
	.ascii	"GIMOD5 GIRQx5\000"
.LASF604:
	.ascii	"TX_FCTRL_TXPSR_PE_1536 0x00180000UL\000"
.LASF751:
	.ascii	"FP_AMPL2_MASK RX_EQUAL_FP_AMPL2_MASK\000"
.LASF774:
	.ascii	"RX_TIME_FP_INDEX_OFFSET (5)\000"
.LASF756:
	.ascii	"FP_AMPL3_SHIFT RX_EQUAL_FP_AMPL3_SHIFT\000"
.LASF1009:
	.ascii	"GIBES2 GIRQx2\000"
.LASF798:
	.ascii	"REG_1B_ID_RESERVED 0x1B\000"
.LASF791:
	.ascii	"ACK_RESP_T_MASK 0xFF0FFFFFUL\000"
.LASF963:
	.ascii	"GIRQx1 0x00000002UL\000"
.LASF900:
	.ascii	"GPIO_MODE_OFFSET 0x00\000"
.LASF320:
	.ascii	"__ULACCUM_FBIT__ 32\000"
.LASF1254:
	.ascii	"OTP_SF_LDO_KICK 0x02\000"
.LASF812:
	.ascii	"TX_POWER_BOOSTNORM_SHIFT (0)\000"
.LASF1380:
	.ascii	"PMSC_CTRL1_ARX2INIT 0x00000002UL\000"
.LASF1620:
	.ascii	"dwt_cb_t\000"
.LASF622:
	.ascii	"SYS_CTRL_MASK_32 0x010003CFUL\000"
.LASF809:
	.ascii	"TX_POWER_LEN (4)\000"
.LASF450:
	.ascii	"__HEAP_SIZE__ 512\000"
.LASF797:
	.ascii	"ACK_TIM_MASK ACK_RESP_T_ACK_TIM_MASK\000"
.LASF112:
	.ascii	"__INT_LEAST32_MAX__ 0x7fffffffL\000"
.LASF976:
	.ascii	"GIRQE5 GIRQx5\000"
.LASF1402:
	.ascii	"PMSC_LEDC_BLNKEN 0x00000100UL\000"
.LASF133:
	.ascii	"__INT_FAST64_WIDTH__ 64\000"
.LASF265:
	.ascii	"__FRACT_FBIT__ 15\000"
.LASF1181:
	.ascii	"FS_RES3_LEN (6)\000"
.LASF717:
	.ascii	"RX_FINFO_RXNSPL_MASK 0x00001800UL\000"
.LASF13:
	.ascii	"__ATOMIC_ACQ_REL 4\000"
.LASF100:
	.ascii	"__INT32_MAX__ 0x7fffffffL\000"
.LASF375:
	.ascii	"__CHAR_UNSIGNED__ 1\000"
.LASF658:
	.ascii	"SYS_MASK_MSLP2INIT 0x00800000UL\000"
.LASF1523:
	.ascii	"mon_thousands_sep\000"
.LASF1045:
	.ascii	"GRAWP2 GIRQx2\000"
.LASF70:
	.ascii	"__SCHAR_MAX__ 0x7f\000"
.LASF1605:
	.ascii	"fs_pll_cfg\000"
.LASF1218:
	.ascii	"AON_CFG0_SLEEP_TIM 0xFFFF0000UL\000"
.LASF336:
	.ascii	"__QQ_IBIT__ 0\000"
.LASF1105:
	.ascii	"RF_CONF_PGMIXBIASEN_MASK 0x0000A700UL\000"
.LASF299:
	.ascii	"__SACCUM_EPSILON__ 0x1P-7HK\000"
.LASF1131:
	.ascii	"TC_SARW_SAR_WVBAT_OFFSET 0x07\000"
.LASF522:
	.ascii	"_DECA_REGS_H_ \000"
.LASF661:
	.ascii	"SYS_MASK_MRXSFDTO 0x04000000UL\000"
.LASF1827:
	.ascii	"diagnostics\000"
.LASF519:
	.ascii	"LDE_PARAM3_64 (0x0607)\000"
.LASF1001:
	.ascii	"GIMOD6 GIRQx6\000"
.LASF677:
	.ascii	"SYS_STATUS_RXPRD 0x00000100UL\000"
.LASF293:
	.ascii	"__ULLFRACT_MAX__ 0XFFFFFFFFFFFFFFFFP-64ULLR\000"
.LASF1010:
	.ascii	"GIBES3 GIRQx3\000"
.LASF1855:
	.ascii	"command\000"
.LASF944:
	.ascii	"GDP6 GxP6\000"
.LASF760:
	.ascii	"CIR_MXG_SHIFT RX_EQUAL_CIR_MXG_SHIFT\000"
.LASF739:
	.ascii	"RX_FINFO_RXPACC_MASK 0xFFF00000UL\000"
.LASF355:
	.ascii	"__HA_FBIT__ 7\000"
.LASF312:
	.ascii	"__UACCUM_MIN__ 0.0UK\000"
.LASF913:
	.ascii	"GPIO_PIN3_TXLED 0x00001000UL\000"
.LASF67:
	.ascii	"__has_include(STR) __has_include__(STR)\000"
.LASF608:
	.ascii	"TX_FCTRL_TXBOFFS_MASK 0xFFC00000UL\000"
.LASF251:
	.ascii	"__DEC128_MIN__ 1E-6143DL\000"
.LASF1338:
	.ascii	"EVC_HPW_MASK 0x0FFF\000"
.LASF725:
	.ascii	"RX_FINFO_RXPEL_1536 0x00080800UL\000"
.LASF442:
	.ascii	"__ARM_ASM_SYNTAX_UNIFIED__ 1\000"
.LASF1387:
	.ascii	"PMSC_CTRL1_KHZCLKDIV_MASK 0xFC000000UL\000"
.LASF977:
	.ascii	"GIRQE6 GIRQx6\000"
.LASF1716:
	.ascii	"dwt_rxreset\000"
.LASF824:
	.ascii	"TX_POWER_TXPOWSD_MASK 0x00FF0000UL\000"
.LASF241:
	.ascii	"__DEC64_MANT_DIG__ 16\000"
.LASF463:
	.ascii	"NRF_SD_BLE_API_VERSION 5\000"
.LASF160:
	.ascii	"__FLT_HAS_QUIET_NAN__ 1\000"
.LASF544:
	.ascii	"SYS_CFG_MASK 0xF047FFFFUL\000"
.LASF1419:
	.ascii	"DWT_DEVICE_ID (0xDECA0130)\000"
.LASF1537:
	.ascii	"int_p_sep_by_space\000"
.LASF1741:
	.ascii	"dwt_syncrxbufptrs\000"
.LASF547:
	.ascii	"SYS_CFG_FFBC 0x00000002UL\000"
.LASF1266:
	.ascii	"LDE_CFG1_PMULT_MASK 0xE0\000"
.LASF1828:
	.ascii	"dwt_readcarrierintegrator\000"
.LASF1688:
	.ascii	"current_da_attn\000"
.LASF1408:
	.ascii	"REG_3A_ID_RESERVED 0x3A\000"
.LASF1627:
	.ascii	"dataRate\000"
.LASF943:
	.ascii	"GDP5 GxP5\000"
.LASF775:
	.ascii	"RX_TIME_FP_AMPL1_OFFSET (7)\000"
.LASF1230:
	.ascii	"OTP_WDAT_LEN (4)\000"
.LASF539:
	.ascii	"PANADR_PAN_ID_OFFSET 2\000"
.LASF531:
	.ascii	"DEV_ID_RIDTAG_MASK 0xFFFF0000UL\000"
.LASF715:
	.ascii	"RX_FINFO_RXFLE_MASK 0x00000380UL\000"
.LASF891:
	.ascii	"EC_RXTC_MASK 0xFFFFFFFFUL\000"
.LASF81:
	.ascii	"__SCHAR_WIDTH__ 8\000"
.LASF1240:
	.ascii	"OTP_CTRL_OTPPROG 0x0040\000"
.LASF28:
	.ascii	"__ORDER_PDP_ENDIAN__ 3412\000"
.LASF11:
	.ascii	"__ATOMIC_ACQUIRE 2\000"
.LASF1118:
	.ascii	"RF_TXCTRL_CH2 0x00045CA0UL\000"
.LASF670:
	.ascii	"SYS_STATUS_CPLOCK 0x00000002UL\000"
.LASF1002:
	.ascii	"GIMOD7 GIRQx7\000"
.LASF185:
	.ascii	"__LDBL_MIN__ 1.1\000"
.LASF811:
	.ascii	"BOOSTNORM_MASK TX_POWER_BOOSTNORM_MASK\000"
.LASF1011:
	.ascii	"GIBES4 GIRQx4\000"
.LASF60:
	.ascii	"__INT_FAST64_TYPE__ long long int\000"
.LASF305:
	.ascii	"__ACCUM_FBIT__ 15\000"
.LASF1708:
	.ascii	"framerepetitionrate\000"
.LASF115:
	.ascii	"__INT_LEAST64_MAX__ 0x7fffffffffffffffLL\000"
.LASF1646:
	.ascii	"OVER\000"
.LASF1396:
	.ascii	"PMSC_TXFINESEQ_DISABLE 0x0\000"
.LASF395:
	.ascii	"__ARM_FEATURE_QBIT 1\000"
.LASF714:
	.ascii	"RX_FINFO_RXFLEN_MASK 0x0000007FUL\000"
.LASF87:
	.ascii	"__WINT_WIDTH__ 32\000"
.LASF550:
	.ascii	"SYS_CFG_FFAA 0x00000010UL\000"
.LASF398:
	.ascii	"__ARM_FEATURE_UNALIGNED 1\000"
.LASF1111:
	.ascii	"RF_RXCTRLH_NBW 0xD8\000"
.LASF942:
	.ascii	"GDP4 GxP4\000"
.LASF534:
	.ascii	"EUI_64_LEN (8)\000"
.LASF1420:
	.ascii	"DWT_BR_110K 0\000"
.LASF514:
	.ascii	"XMLPARAMS_VERSION (1.17f)\000"
.LASF517:
	.ascii	"LDE_PARAM1 (PEAK_MULTPLIER | N_STD_FACTOR)\000"
.LASF1046:
	.ascii	"GRAWP3 GIRQx3\000"
.LASF964:
	.ascii	"GIRQx2 0x00000004UL\000"
.LASF472:
	.ascii	"__RAL_SIZE_T\000"
.LASF643:
	.ascii	"SYS_MASK_MTXFRS 0x00000080UL\000"
.LASF1818:
	.ascii	"timestamp\000"
.LASF653:
	.ascii	"SYS_MASK_MRXRFTO 0x00020000UL\000"
.LASF94:
	.ascii	"__INTMAX_WIDTH__ 64\000"
.LASF1859:
	.ascii	"gpio_mode\000"
.LASF1487:
	.ascii	"HERTZ_TO_PPM_MULTIPLIER_CHAN_1 (-1.0e6/3494.4e6)\000"
.LASF405:
	.ascii	"__ARM_FEATURE_LDREX 7\000"
.LASF117:
	.ascii	"__INT_LEAST64_WIDTH__ 64\000"
.LASF1150:
	.ascii	"TC_PGTEST_OFFSET 0x0C\000"
.LASF1713:
	.ascii	"value\000"
.LASF1788:
	.ascii	"_dwt_otpsetmrregs\000"
.LASF1555:
	.ascii	"__towlower\000"
.LASF1839:
	.ascii	"txFrameBytes\000"
.LASF709:
	.ascii	"SYS_STATUS_ALL_TX (SYS_STATUS_AAT | SYS_STATUS_TXFR"
	.ascii	"B | SYS_STATUS_TXPRS | SYS_STATUS_TXPHS | SYS_STATU"
	.ascii	"S_TXFRS )\000"
.LASF1382:
	.ascii	"PMSC_CTRL1_ARXSLP 0x00001000UL\000"
.LASF1272:
	.ascii	"LDE_RXANTD_LEN (2)\000"
.LASF632:
	.ascii	"SYS_CTRL_HRBT (SYS_CTRL_HSRBTOGGLE)\000"
.LASF1204:
	.ascii	"AON_RDAT_LEN (1)\000"
.LASF587:
	.ascii	"TX_FCTRL_TXBR_850k 0x00002000UL\000"
.LASF515:
	.ascii	"PEAK_MULTPLIER (0x60)\000"
.LASF1077:
	.ascii	"DRX_TUNE2_PRF16_PAC8 0x311A002DUL\000"
.LASF642:
	.ascii	"SYS_MASK_MTXPHS 0x00000040UL\000"
.LASF1829:
	.ascii	"dwt_readaccdata\000"
.LASF1012:
	.ascii	"GIBES5 GIRQx5\000"
.LASF1370:
	.ascii	"PMSC_CTRL0_GPDCE 0x00040000UL\000"
.LASF935:
	.ascii	"GxM6 0x00004000UL\000"
.LASF1278:
	.ascii	"LDE_REPC_PCODE_2 0x5998\000"
.LASF436:
	.ascii	"__THUMB_INTERWORK__ 1\000"
.LASF1654:
	.ascii	"txFCTRL\000"
.LASF616:
	.ascii	"RX_FWTO_OFFSET 0x00\000"
.LASF1601:
	.ascii	"agc_cfg_struct\000"
.LASF435:
	.ascii	"__ARM_NEON_FP\000"
.LASF1782:
	.ascii	"address\000"
.LASF169:
	.ascii	"__DBL_MAX__ ((double)1.1)\000"
.LASF1316:
	.ascii	"EVC_FCG_MASK 0x0FFF\000"
.LASF268:
	.ascii	"__FRACT_MAX__ 0X7FFFP-15R\000"
.LASF793:
	.ascii	"ACK_RESP_T_W4R_TIM_MASK 0x000FFFFFUL\000"
.LASF1483:
	.ascii	"DWT_OPSET_DEFLT 0x2\000"
.LASF830:
	.ascii	"CHAN_CTRL_RX_CHAN_MASK 0x000000F0UL\000"
.LASF1205:
	.ascii	"AON_ADDR_OFFSET 0x04\000"
.LASF349:
	.ascii	"__USQ_FBIT__ 32\000"
.LASF200:
	.ascii	"__FLT32_EPSILON__ 1.1\000"
.LASF1061:
	.ascii	"DRX_TUNE0b_6M8_STD 0x0001\000"
.LASF141:
	.ascii	"__GCC_IEC_559 0\000"
.LASF549:
	.ascii	"SYS_CFG_FFAD 0x00000008UL\000"
.LASF271:
	.ascii	"__UFRACT_IBIT__ 0\000"
.LASF933:
	.ascii	"GxM4 0x00001000UL\000"
.LASF1576:
	.ascii	"__RAL_data_utf8_period\000"
.LASF1460:
	.ascii	"DWT_INT_RPHE 0x00001000\000"
.LASF298:
	.ascii	"__SACCUM_MAX__ 0X7FFFP-7HK\000"
.LASF1267:
	.ascii	"LDE_PPINDX_OFFSET 0x1000\000"
.LASF1004:
	.ascii	"GPIO_IBES_OFFSET 0x1C\000"
.LASF570:
	.ascii	"SYS_CFG_AACKPEND 0x80000000UL\000"
.LASF1644:
	.ascii	"CRCB\000"
.LASF1636:
	.ascii	"stdNoise\000"
.LASF1678:
	.ascii	"channel\000"
.LASF1413:
	.ascii	"REG_3F_ID_RESERVED 0x3F\000"
.LASF1116:
	.ascii	"RF_TXCTRL_TXTXMQ_MASK 0x00000E00UL\000"
.LASF466:
	.ascii	"SWI_DISABLE0 1\000"
.LASF887:
	.ascii	"EC_CTRL_OSTRM 0x00000800UL\000"
.LASF753:
	.ascii	"RX_EQUAL_FP_AMPL3_MASK 0x0000FFFF00000000ULL\000"
.LASF1246:
	.ascii	"OTP_RDAT 0x0A\000"
.LASF1622:
	.ascii	"txPreambLength\000"
.LASF1028:
	.ascii	"GPIO_IDBE_OFFSET 0x24\000"
.LASF841:
	.ascii	"CHAN_CTRL_DWSFD 0x00020000UL\000"
.LASF1868:
	.ascii	"C:\\Users\\vikra\\Desktop\\decawave-ble\\NRF_UWB_Co"
	.ascii	"mbo\\deca_driver\\deca_device.c\000"
.LASF1013:
	.ascii	"GIBES6 GIRQx6\000"
.LASF552:
	.ascii	"SYS_CFG_FFAR 0x00000040UL\000"
.LASF910:
	.ascii	"GPIO_MSGP7_MASK 0x00300000UL\000"
.LASF108:
	.ascii	"__INT_LEAST8_WIDTH__ 8\000"
.LASF960:
	.ascii	"GPIO_IRQE_LEN (4)\000"
.LASF1479:
	.ascii	"DWT_LOADUCODE 0x1\000"
.LASF1404:
	.ascii	"PMSC_LEDC_BLINK_NOW_ALL 0x000F0000UL\000"
.LASF443:
	.ascii	"__ARM_FEATURE_COPROC\000"
.LASF215:
	.ascii	"__FLT64_EPSILON__ 1.1\000"
.LASF548:
	.ascii	"SYS_CFG_FFAB 0x00000004UL\000"
.LASF58:
	.ascii	"__INT_FAST16_TYPE__ int\000"
.LASF617:
	.ascii	"RX_FWTO_LEN (2)\000"
.LASF613:
	.ascii	"DX_TIME_LEN (5)\000"
.LASF1270:
	.ascii	"LDE_PPAMPL_LEN (2)\000"
.LASF114:
	.ascii	"__INT_LEAST32_WIDTH__ 32\000"
.LASF883:
	.ascii	"EC_CTRL_MASK 0x00000FFBUL\000"
.LASF871:
	.ascii	"AGC_TUNE3_LEN (2)\000"
.LASF354:
	.ascii	"__UTQ_IBIT__ 0\000"
.LASF476:
	.ascii	"__CODE \000"
.LASF460:
	.ascii	"NRF52 1\000"
.LASF1482:
	.ascii	"DWT_OPSET_TIGHT 0x1\000"
.LASF701:
	.ascii	"SYS_STATUS_RXRSCS 0x0100000000ULL\000"
.LASF1113:
	.ascii	"RF_TXCTRL_OFFSET 0x0C\000"
.LASF1191:
	.ascii	"AON_WCFG_ONW_L64P 0x0080\000"
.LASF703:
	.ascii	"SYS_STATUS_TXPUTE 0x0400000000ULL\000"
.LASF1079:
	.ascii	"DRX_TUNE2_PRF16_PAC32 0x351A009AUL\000"
.LASF1795:
	.ascii	"dwt_seteui\000"
.LASF441:
	.ascii	"__ARM_FEATURE_IDIV 1\000"
.LASF1235:
	.ascii	"OTP_CTRL_LEN (2)\000"
.LASF396:
	.ascii	"__ARM_FEATURE_SAT 1\000"
.LASF1743:
	.ascii	"dwt_forcetrxoff\000"
.LASF1606:
	.ascii	"fs_pll_tune\000"
.LASF885:
	.ascii	"EC_CTRL_OSRSM 0x00000002UL\000"
.LASF546:
	.ascii	"SYS_CFG_FFE 0x00000001UL\000"
.LASF1040:
	.ascii	"GPIO_RAW_OFFSET 0x28\000"
.LASF1858:
	.ascii	"dwt_setlnapamode\000"
.LASF69:
	.ascii	"__GXX_ABI_VERSION 1013\000"
.LASF49:
	.ascii	"__INT_LEAST8_TYPE__ signed char\000"
.LASF639:
	.ascii	"SYS_MASK_MAAT 0x00000008UL\000"
.LASF1102:
	.ascii	"RF_CONF_RXEN_MASK 0x00200000UL\000"
.LASF1353:
	.ascii	"PMSC_ID 0x36\000"
.LASF275:
	.ascii	"__LFRACT_FBIT__ 31\000"
.LASF420:
	.ascii	"__ARM_ARCH_ISA_THUMB\000"
.LASF501:
	.ascii	"_DECA_UINT32_ \000"
.LASF391:
	.ascii	"__SIZEOF_WCHAR_T__ 4\000"
.LASF652:
	.ascii	"SYS_MASK_MRXRFSL 0x00010000UL\000"
.LASF303:
	.ascii	"__USACCUM_MAX__ 0XFFFFP-8UHK\000"
.LASF98:
	.ascii	"__INT8_MAX__ 0x7f\000"
.LASF1199:
	.ascii	"AON_CTRL_SAVE 0x02\000"
.LASF451:
	.ascii	"__SES_VERSION 42200\000"
.LASF878:
	.ascii	"AGC_STAT1_EDG2_MASK 0x0FF800\000"
.LASF1573:
	.ascii	"__RAL_c_locale_abbrev_day_names\000"
.LASF8:
	.ascii	"__VERSION__ \"8.3.1 20190703 (release) [gcc-8-branc"
	.ascii	"h revision 273027]\"\000"
.LASF1662:
	.ascii	"cbRxOk\000"
.LASF107:
	.ascii	"__INT8_C(c) c\000"
.LASF592:
	.ascii	"TX_FCTRL_TXPRF_SHFT (16)\000"
.LASF682:
	.ascii	"SYS_STATUS_RXDFR 0x00002000UL\000"
.LASF1129:
	.ascii	"TC_SARL_SAR_LTEMP_OFFSET (4)\000"
.LASF304:
	.ascii	"__USACCUM_EPSILON__ 0x1P-8UHK\000"
.LASF1639:
	.ascii	"maxGrowthCIR\000"
.LASF1581:
	.ascii	"__RAL_data_empty_string\000"
.LASF1207:
	.ascii	"AON_ADDR_LPOSC_CAL_0 117\000"
.LASF1583:
	.ascii	"__user_get_time_of_day\000"
.LASF264:
	.ascii	"__USFRACT_EPSILON__ 0x1P-8UHR\000"
.LASF91:
	.ascii	"__INTMAX_C(c) c ## LL\000"
.LASF317:
	.ascii	"__LACCUM_MIN__ (-0X1P31LK-0X1P31LK)\000"
.LASF135:
	.ascii	"__UINT_FAST16_MAX__ 0xffffffffU\000"
.LASF440:
	.ascii	"__ARM_ARCH_EXT_IDIV__ 1\000"
.LASF64:
	.ascii	"__UINT_FAST64_TYPE__ long long unsigned int\000"
.LASF1559:
	.ascii	"__RAL_locale_codeset_t\000"
.LASF1425:
	.ascii	"DWT_PAC8 0\000"
.LASF1337:
	.ascii	"EVC_HPW_LEN (2)\000"
.LASF1811:
	.ascii	"dwt_read32bitoffsetreg\000"
.LASF1848:
	.ascii	"reg16\000"
.LASF1775:
	.ascii	"result\000"
.LASF1844:
	.ascii	"dwt_configure\000"
.LASF274:
	.ascii	"__UFRACT_EPSILON__ 0x1P-16UR\000"
.LASF678:
	.ascii	"SYS_STATUS_RXSFDD 0x00000200UL\000"
.LASF1153:
	.ascii	"TC_PGTEST_CW 0x13\000"
.LASF1560:
	.ascii	"name\000"
.LASF1532:
	.ascii	"n_sep_by_space\000"
.LASF80:
	.ascii	"__SIZE_MAX__ 0xffffffffU\000"
.LASF1259:
	.ascii	"LDE_IF_ID 0x2E\000"
.LASF528:
	.ascii	"DEV_ID_REV_MASK 0x0000000FUL\000"
.LASF731:
	.ascii	"RX_FINFO_RXBR_6M 0x00004000UL\000"
.LASF730:
	.ascii	"RX_FINFO_RXBR_850k 0x00002000UL\000"
.LASF772:
	.ascii	"RX_STAMP_LEN RX_TIME_RX_STAMP_LEN\000"
.LASF1104:
	.ascii	"RF_CONF_PLLEN_MASK 0x0000E000UL\000"
.LASF1675:
	.ascii	"dwt_calcpgcount\000"
.LASF754:
	.ascii	"RX_EQUAL_FP_AMPL3_SHIFT (32)\000"
.LASF134:
	.ascii	"__UINT_FAST8_MAX__ 0xffffffffU\000"
.LASF1538:
	.ascii	"int_n_sep_by_space\000"
.LASF1529:
	.ascii	"p_cs_precedes\000"
.LASF340:
	.ascii	"__SQ_IBIT__ 0\000"
.LASF1571:
	.ascii	"__RAL_ascii_ctype_map\000"
.LASF1119:
	.ascii	"RF_TXCTRL_CH3 0x00086CC0UL\000"
.LASF408:
	.ascii	"__ARM_FEATURE_SIMD32 1\000"
.LASF348:
	.ascii	"__UHQ_IBIT__ 0\000"
.LASF781:
	.ascii	"TX_STAMP_LEN TX_TIME_TX_STAMP_LEN\000"
.LASF1744:
	.ascii	"dwt_starttx\000"
.LASF602:
	.ascii	"TX_FCTRL_TXPSR_PE_512 0x00340000UL\000"
.LASF771:
	.ascii	"RX_TIME_RX_STAMP_LEN (5)\000"
.LASF899:
	.ascii	"GPIO_CTRL_LEN (44)\000"
.LASF1711:
	.ascii	"dwt_getinitxtaltrim\000"
.LASF257:
	.ascii	"__SFRACT_MIN__ (-0.5HR-0.5HR)\000"
.LASF1524:
	.ascii	"mon_grouping\000"
.LASF376:
	.ascii	"__GCC_HAVE_SYNC_COMPARE_AND_SWAP_1 1\000"
.LASF1816:
	.ascii	"dwt_writetodevice\000"
.LASF315:
	.ascii	"__LACCUM_FBIT__ 31\000"
.LASF1542:
	.ascii	"abbrev_day_names\000"
.LASF620:
	.ascii	"SYS_CTRL_OFFSET 0x00\000"
.LASF804:
	.ascii	"RX_SNIFF_SNIFF_ONT_MASK 0x0000000FUL\000"
.LASF1005:
	.ascii	"GPIO_IBES_LEN (4)\000"
.LASF680:
	.ascii	"SYS_STATUS_RXPHD 0x00000800UL\000"
.LASF1130:
	.ascii	"TC_SARW_SAR_WTEMP_OFFSET 0x06\000"
.LASF480:
	.ascii	"__CTYPE_SPACE 0x08\000"
.LASF1164:
	.ascii	"FS_PLLCFG_CH5 0x0800041DUL\000"
.LASF1157:
	.ascii	"FS_RES1_LEN (7)\000"
.LASF1754:
	.ascii	"finfo16\000"
.LASF579:
	.ascii	"TX_FCTRL_FLE_MASK 0x000003FFUL\000"
.LASF73:
	.ascii	"__LONG_MAX__ 0x7fffffffL\000"
.LASF1685:
	.ascii	"power_adj\000"
.LASF1234:
	.ascii	"OTP_CTRL 0x06\000"
.LASF113:
	.ascii	"__INT32_C(c) c ## L\000"
.LASF1428:
	.ascii	"DWT_PAC64 3\000"
.LASF1648:
	.ascii	"dwt_deviceentcnts_t\000"
.LASF1233:
	.ascii	"OTP_ADDR_MASK 0x07FF\000"
.LASF669:
	.ascii	"SYS_STATUS_IRQS 0x00000001UL\000"
.LASF1837:
	.ascii	"reg32\000"
.LASF1369:
	.ascii	"PMSC_CTRL0_FACE 0x00000040UL\000"
.LASF702:
	.ascii	"SYS_STATUS_RXPREJ 0x0200000000ULL\000"
.LASF705:
	.ascii	"SYS_STATUS_ALL_RX_GOOD (SYS_STATUS_RXDFR | SYS_STAT"
	.ascii	"US_RXFCG | SYS_STATUS_RXPRD | SYS_STATUS_RXSFDD | S"
	.ascii	"YS_STATUS_RXPHD | SYS_STATUS_LDEDONE)\000"
.LASF1356:
	.ascii	"PMSC_CTRL0_LEN (4)\000"
.LASF1197:
	.ascii	"AON_CTRL_MASK 0x8F\000"
.LASF655:
	.ascii	"SYS_MASK_MRXOVRR 0x00100000UL\000"
.LASF873:
	.ascii	"AGC_TUNE3_VAL 0X0035\000"
.LASF557:
	.ascii	"SYS_CFG_DIS_FCE 0x00000800UL\000"
.LASF236:
	.ascii	"__DEC32_MAX_EXP__ 97\000"
.LASF1580:
	.ascii	"__RAL_data_utf8_minus\000"
.LASF1742:
	.ascii	"buff\000"
.LASF836:
	.ascii	"CHAN_CTRL_RXFPRF_64 0x00080000UL\000"
.LASF513:
	.ascii	"PCODES 25\000"
.LASF1808:
	.ascii	"dwt_write8bitoffsetreg\000"
.LASF503:
	.ascii	"_DECA_INT16_ \000"
.LASF626:
	.ascii	"SYS_CTRL_CANSFCS 0x00000008UL\000"
.LASF1707:
	.ascii	"temp_raw\000"
.LASF1704:
	.ascii	"fastSPI\000"
.LASF1584:
	.ascii	"short unsigned int\000"
.LASF1388:
	.ascii	"PMSC_CTRL1_PKTSEQ_DISABLE 0x00\000"
.LASF940:
	.ascii	"GDP2 GxP2\000"
.LASF1596:
	.ascii	"signed char\000"
.LASF949:
	.ascii	"GDM2 GxM2\000"
.LASF728:
	.ascii	"RX_FINFO_RXBR_MASK 0x00006000UL\000"
.LASF533:
	.ascii	"EUI_64_OFFSET 0x00\000"
.LASF1570:
	.ascii	"__RAL_codeset_utf8\000"
.LASF1200:
	.ascii	"AON_CTRL_UPL_CFG 0x04\000"
.LASF1340:
	.ascii	"EVC_TPW_LEN (2)\000"
.LASF1081:
	.ascii	"DRX_TUNE2_PRF64_PAC8 0x313B006BUL\000"
.LASF1282:
	.ascii	"LDE_REPC_PCODE_6 0x2E14\000"
.LASF1347:
	.ascii	"REG_30_ID_RESERVED 0x30\000"
.LASF711:
	.ascii	"RX_FINFO_OFFSET 0x00\000"
.LASF1158:
	.ascii	"FS_PLLCFG_OFFSET 0x07\000"
.LASF1783:
	.ascii	"prog_ok\000"
.LASF1341:
	.ascii	"EVC_TPW_MASK 0x0FFF\000"
.LASF24:
	.ascii	"__CHAR_BIT__ 8\000"
.LASF722:
	.ascii	"RX_FINFO_RXPEL_256 0x00041000UL\000"
.LASF36:
	.ascii	"__INTMAX_TYPE__ long long int\000"
.LASF1454:
	.ascii	"DWT_FF_ACK_EN 0x010\000"
.LASF906:
	.ascii	"GPIO_MSGP3_MASK 0x00003000UL\000"
.LASF574:
	.ascii	"REG_07_ID_RESERVED 0x07\000"
.LASF683:
	.ascii	"SYS_STATUS_RXFCG 0x00004000UL\000"
.LASF1125:
	.ascii	"TX_CAL_ID 0x2A\000"
.LASF1615:
	.ascii	"status\000"
.LASF1056:
	.ascii	"DRX_TUNE0b_MASK 0xFFFF\000"
.LASF1247:
	.ascii	"OTP_RDAT_LEN (4)\000"
.LASF1686:
	.ascii	"da_attn_change\000"
.LASF1043:
	.ascii	"GRAWP0 GIRQx0\000"
.LASF988:
	.ascii	"GISEN5 GIRQx5\000"
.LASF401:
	.ascii	"__ARM_FEATURE_DOTPROD\000"
.LASF229:
	.ascii	"__FLT32X_EPSILON__ 1.1\000"
.LASF757:
	.ascii	"RX_EQUAL_CIR_MXG_MASK 0xFFFF000000000000ULL\000"
.LASF518:
	.ascii	"LDE_PARAM3_16 (0x1607)\000"
.LASF577:
	.ascii	"TX_FCTRL_TFLEN_MASK 0x0000007FUL\000"
.LASF1812:
	.ascii	"dwt_readfromdevice\000"
.LASF875:
	.ascii	"AGC_STAT1_LEN (3)\000"
.LASF68:
	.ascii	"__has_include_next(STR) __has_include_next__(STR)\000"
.LASF663:
	.ascii	"SYS_MASK_MTXBERR 0x10000000UL\000"
.LASF1668:
	.ascii	"NUM_SAMPLES\000"
.LASF649:
	.ascii	"SYS_MASK_MRXDFR 0x00002000UL\000"
.LASF138:
	.ascii	"__INTPTR_MAX__ 0x7fffffff\000"
.LASF777:
	.ascii	"REG_16_ID_RESERVED 0x16\000"
.LASF1100:
	.ascii	"RF_CONF_LEN (58)\000"
.LASF1114:
	.ascii	"RF_TXCTRL_LEN (4)\000"
.LASF907:
	.ascii	"GPIO_MSGP4_MASK 0x0000C000UL\000"
.LASF485:
	.ascii	"__CTYPE_ALPHA (__CTYPE_UPPER | __CTYPE_LOWER)\000"
.LASF856:
	.ascii	"AGC_CFG_STS_ID AGC_CTRL_ID\000"
.LASF562:
	.ascii	"SYS_CFG_PHR_MODE_SHFT 16\000"
.LASF1507:
	.ascii	"VBAT_ADDRESS (0x08)\000"
.LASF1291:
	.ascii	"LDE_REPC_PCODE_15 0x2B84\000"
.LASF1149:
	.ascii	"TC_PGDELAY_CH7 0x93\000"
.LASF1472:
	.ascii	"DWT_RX_EN 0x0002\000"
.LASF196:
	.ascii	"__FLT32_MAX_10_EXP__ 38\000"
.LASF26:
	.ascii	"__ORDER_LITTLE_ENDIAN__ 1234\000"
.LASF1656:
	.ascii	"dblbuffon\000"
.LASF457:
	.ascii	"FLOAT_ABI_HARD 1\000"
.LASF360:
	.ascii	"__DA_IBIT__ 32\000"
.LASF1093:
	.ascii	"DRX_TUNE4H_MASK 0xFFFF\000"
.LASF243:
	.ascii	"__DEC64_MAX_EXP__ 385\000"
.LASF876:
	.ascii	"AGC_STAT1_MASK 0x0FFFFF\000"
.LASF1090:
	.ascii	"DRX_PRETOC_MASK 0xFFFF\000"
.LASF390:
	.ascii	"__PRAGMA_REDEFINE_EXTNAME 1\000"
.LASF520:
	.ascii	"MIXER_GAIN_STEP (0.5)\000"
.LASF382:
	.ascii	"__GCC_ATOMIC_CHAR32_T_LOCK_FREE 2\000"
.LASF1494:
	.ascii	"ENABLE_ALL_SEQ 1\000"
.LASF535:
	.ascii	"PANADR_ID 0x03\000"
.LASF1820:
	.ascii	"dwt_readrxtimestamplo32\000"
.LASF188:
	.ascii	"__LDBL_HAS_DENORM__ 1\000"
.LASF475:
	.ascii	"__RAL_PTRDIFF_T int\000"
.LASF1488:
	.ascii	"HERTZ_TO_PPM_MULTIPLIER_CHAN_2 (-1.0e6/3993.6e6)\000"
.LASF989:
	.ascii	"GISEN6 GIRQx6\000"
.LASF829:
	.ascii	"CHAN_CTRL_TX_CHAN_SHIFT (0)\000"
.LASF1799:
	.ascii	"panID\000"
.LASF426:
	.ascii	"__ARM_FP16_FORMAT_IEEE\000"
.LASF198:
	.ascii	"__FLT32_MAX__ 1.1\000"
.LASF738:
	.ascii	"RX_FINFO_RXPRF_SHIFT (16)\000"
.LASF1534:
	.ascii	"n_sign_posn\000"
.LASF537:
	.ascii	"PANADR_SHORT_ADDR_OFFSET 0\000"
.LASF1453:
	.ascii	"DWT_FF_DATA_EN 0x008\000"
.LASF1629:
	.ascii	"sfdTO\000"
.LASF1438:
	.ascii	"DWT_PHRMODE_STD 0x0\000"
.LASF718:
	.ascii	"RX_FINFO_RXPSR_MASK 0x000C0000UL\000"
.LASF563:
	.ascii	"SYS_CFG_PHR_MODE_00 0x00000000UL\000"
.LASF385:
	.ascii	"__GCC_ATOMIC_INT_LOCK_FREE 2\000"
.LASF210:
	.ascii	"__FLT64_MAX_EXP__ 1024\000"
.LASF1618:
	.ascii	"rx_flags\000"
.LASF1087:
	.ascii	"DRX_SFDTOC_MASK 0xFFFF\000"
.LASF1019:
	.ascii	"GICLR0 GIRQx0\000"
.LASF371:
	.ascii	"__REGISTER_PREFIX__ \000"
.LASF1226:
	.ascii	"AON_CFG1_LPOSC_CAL 0x0004\000"
.LASF516:
	.ascii	"N_STD_FACTOR (13)\000"
.LASF1074:
	.ascii	"DRX_TUNE2_OFFSET 0x08\000"
.LASF263:
	.ascii	"__USFRACT_MAX__ 0XFFP-8UHR\000"
.LASF566:
	.ascii	"SYS_CFG_RXM110K 0x00400000UL\000"
.LASF1152:
	.ascii	"TC_PGTEST_NORMAL 0x00\000"
.LASF895:
	.ascii	"EC_GOLP_OFFSET_EXT_MASK 0x0000003FUL\000"
.LASF855:
	.ascii	"AGC_CTRL_LEN (32)\000"
.LASF888:
	.ascii	"EC_CTRL_WAIT_MASK 0x000007F8UL\000"
.LASF1647:
	.ascii	"SFDTO\000"
.LASF1746:
	.ascii	"checkTxOK\000"
.LASF1300:
	.ascii	"LDE_REPC_PCODE_24 0x3850\000"
.LASF1709:
	.ascii	"dwt_configcontinuousframemode\000"
.LASF1791:
	.ascii	"dwt_otpread\000"
.LASF425:
	.ascii	"__ARM_FP 4\000"
.LASF807:
	.ascii	"SNIFF_OFFT_MASK RX_SNIFF_SNIFF_OFFT_MASK\000"
.LASF1705:
	.ascii	"wr_buf\000"
.LASF1478:
	.ascii	"DWT_SLP_EN 0x1\000"
.LASF1082:
	.ascii	"DRX_TUNE2_PRF64_PAC16 0x333B00BEUL\000"
.LASF1502:
	.ascii	"FCTRL_ACK_REQ_MASK 0x20\000"
.LASF716:
	.ascii	"RX_FINFO_RXFL_MASK_1023 0x000003FFUL\000"
.LASF1737:
	.ascii	"dwt_setsniffmode\000"
.LASF646:
	.ascii	"SYS_MASK_MLDEDONE 0x00000400UL\000"
.LASF571:
	.ascii	"SYS_TIME_ID 0x06\000"
.LASF57:
	.ascii	"__INT_FAST8_TYPE__ int\000"
.LASF1556:
	.ascii	"__wctomb\000"
.LASF938:
	.ascii	"GDP0 GxP0\000"
.LASF1140:
	.ascii	"TC_PGCAL_STATUS_LEN (1)\000"
.LASF1137:
	.ascii	"TC_PGCCTRL_ON_TX 0x40\000"
.LASF1103:
	.ascii	"RF_CONF_TXPOW_MASK 0x001F0000UL\000"
.LASF1273:
	.ascii	"LDE_CFG2_OFFSET 0x1806\000"
.LASF1214:
	.ascii	"AON_CFG0_WAKE_CNT 0x00000008UL\000"
.LASF1461:
	.ascii	"DWT_INT_RFCE 0x00008000\000"
.LASF1833:
	.ascii	"dwt_writetxfctrl\000"
.LASF1064:
	.ascii	"DRX_TUNE1a_LEN (2)\000"
.LASF1729:
	.ascii	"time\000"
.LASF4:
	.ascii	"__STDC_HOSTED__ 1\000"
.LASF707:
	.ascii	"SYS_STATUS_ALL_RX_ERR (SYS_STATUS_RXPHE | SYS_STATU"
	.ascii	"S_RXFCE | SYS_STATUS_RXRFSL | SYS_STATUS_RXSFDTO | "
	.ascii	"SYS_STATUS_AFFREJ | SYS_STATUS_LDEERR)\000"
.LASF93:
	.ascii	"__UINTMAX_C(c) c ## ULL\000"
.LASF247:
	.ascii	"__DEC64_SUBNORMAL_MIN__ 0.000000000000001E-383DD\000"
.LASF610:
	.ascii	"TX_BUFFER_ID 0x09\000"
.LASF726:
	.ascii	"RX_FINFO_RXPEL_2048 0x00081000UL\000"
.LASF1069:
	.ascii	"DRX_TUNE1b_LEN (2)\000"
.LASF1763:
	.ascii	"dwt_setsmarttxpower\000"
.LASF776:
	.ascii	"RX_TIME_FP_RAWST_OFFSET (9)\000"
.LASF313:
	.ascii	"__UACCUM_MAX__ 0XFFFFFFFFP-16UK\000"
.LASF765:
	.ascii	"RX_TTCKO_MASK_32 0xFF07FFFFUL\000"
.LASF1415:
	.ascii	"DWT_NUM_DW_DEV (1)\000"
.LASF1514:
	.ascii	"long int\000"
.LASF1650:
	.ascii	"partID\000"
.LASF101:
	.ascii	"__INT64_MAX__ 0x7fffffffffffffffLL\000"
.LASF173:
	.ascii	"__DBL_HAS_DENORM__ 1\000"
.LASF1083:
	.ascii	"DRX_TUNE2_PRF64_PAC32 0x353B015EUL\000"
.LASF998:
	.ascii	"GIMOD3 GIRQx3\000"
.LASF377:
	.ascii	"__GCC_HAVE_SYNC_COMPARE_AND_SWAP_2 1\000"
.LASF211:
	.ascii	"__FLT64_MAX_10_EXP__ 308\000"
.LASF1643:
	.ascii	"CRCG\000"
.LASF638:
	.ascii	"SYS_MASK_MESYNCR 0x00000004UL\000"
.LASF800:
	.ascii	"RX_SNIFF_ID 0x1D\000"
.LASF1553:
	.ascii	"__iswctype\000"
.LASF1645:
	.ascii	"ARFE\000"
.LASF231:
	.ascii	"__FLT32X_HAS_DENORM__ 1\000"
.LASF1215:
	.ascii	"AON_CFG0_LPDIV_EN 0x00000010UL\000"
.LASF1539:
	.ascii	"int_p_sign_posn\000"
.LASF373:
	.ascii	"__GNUC_STDC_INLINE__ 1\000"
.LASF859:
	.ascii	"AGC_CTRL1_MASK 0x0001\000"
.LASF1385:
	.ascii	"PMSC_CTRL1_PLLSYN 0x00008000UL\000"
.LASF991:
	.ascii	"GISEN8 GIRQx8\000"
.LASF424:
	.ascii	"__ARM_FP\000"
.LASF1219:
	.ascii	"AON_CFG0_SLEEP_SHIFT (16)\000"
.LASF1870:
	.ascii	"timeval\000"
.LASF1377:
	.ascii	"PMSC_CTRL1_OFFSET 0x04\000"
.LASF1625:
	.ascii	"rxCode\000"
.LASF1805:
	.ascii	"regval\000"
.LASF831:
	.ascii	"CHAN_CTRL_RX_CHAN_SHIFT (4)\000"
.LASF86:
	.ascii	"__WCHAR_WIDTH__ 32\000"
.LASF353:
	.ascii	"__UTQ_FBIT__ 128\000"
.LASF664:
	.ascii	"SYS_MASK_MAFFREJ 0x20000000UL\000"
.LASF1357:
	.ascii	"PMSC_CTRL0_MASK 0xF18F847FUL\000"
.LASF690:
	.ascii	"SYS_STATUS_RXPTO 0x00200000UL\000"
.LASF1736:
	.ascii	"pmsc_reg\000"
.LASF494:
	.ascii	"EXIT_SUCCESS 0\000"
.LASF394:
	.ascii	"__ARM_FEATURE_DSP 1\000"
.LASF922:
	.ascii	"GxP2 0x00000004UL\000"
.LASF397:
	.ascii	"__ARM_FEATURE_CRYPTO\000"
.LASF799:
	.ascii	"REG_1C_ID_RESERVED 0x1C\000"
.LASF1186:
	.ascii	"AON_WCFG_MASK 0x09CB\000"
.LASF1631:
	.ascii	"PGdly\000"
.LASF1457:
	.ascii	"DWT_INT_TFRS 0x00000080\000"
.LASF1134:
	.ascii	"TC_PGCCTRL_CALSTART 0x01\000"
.LASF202:
	.ascii	"__FLT32_HAS_DENORM__ 1\000"
.LASF693:
	.ascii	"SYS_STATUS_RFPLL_LL 0x01000000UL\000"
.LASF486:
	.ascii	"__CTYPE_ALNUM (__CTYPE_UPPER | __CTYPE_LOWER | __CT"
	.ascii	"YPE_DIGIT)\000"
.LASF1564:
	.ascii	"__mbstate_s\000"
.LASF429:
	.ascii	"__ARM_FEATURE_FP16_SCALAR_ARITHMETIC\000"
.LASF295:
	.ascii	"__SACCUM_FBIT__ 7\000"
.LASF337:
	.ascii	"__HQ_FBIT__ 15\000"
.LASF1522:
	.ascii	"mon_decimal_point\000"
.LASF981:
	.ascii	"GPIO_ISEN_LEN (4)\000"
.LASF1162:
	.ascii	"FS_PLLCFG_CH3 0x08401009UL\000"
.LASF326:
	.ascii	"__LLACCUM_IBIT__ 32\000"
.LASF306:
	.ascii	"__ACCUM_IBIT__ 16\000"
.LASF766:
	.ascii	"RX_TTCKO_RXTOFS_MASK 0x0007FFFFUL\000"
.LASF1603:
	.ascii	"sftsh\000"
.LASF285:
	.ascii	"__LLFRACT_FBIT__ 63\000"
.LASF1676:
	.ascii	"dwt_calcpowertempadj\000"
.LASF177:
	.ascii	"__LDBL_DIG__ 15\000"
.LASF880:
	.ascii	"EXT_SYNC_LEN (12)\000"
.LASF39:
	.ascii	"__CHAR32_TYPE__ long unsigned int\000"
.LASF1358:
	.ascii	"PMSC_CTRL0_SYSCLKS_AUTO 0x00000000UL\000"
.LASF1749:
	.ascii	"_dwt_disablesequencing\000"
.LASF384:
	.ascii	"__GCC_ATOMIC_SHORT_LOCK_FREE 2\000"
.LASF159:
	.ascii	"__FLT_HAS_INFINITY__ 1\000"
.LASF1860:
	.ascii	"dwt_setfinegraintxseq\000"
.LASF637:
	.ascii	"SYS_MASK_MCPLOCK 0x00000002UL\000"
.LASF590:
	.ascii	"TX_FCTRL_TR 0x00008000UL\000"
.LASF31:
	.ascii	"__SIZEOF_POINTER__ 4\000"
.LASF1042:
	.ascii	"GPIO_RAW_MASK GPIO_IRQE_MASK\000"
.LASF536:
	.ascii	"PANADR_LEN (4)\000"
.LASF187:
	.ascii	"__LDBL_DENORM_MIN__ 1.1\000"
.LASF37:
	.ascii	"__UINTMAX_TYPE__ long long unsigned int\000"
.LASF636:
	.ascii	"SYS_MASK_MASK_32 0x3FF7FFFEUL\000"
.LASF1231:
	.ascii	"OTP_ADDR 0x04\000"
.LASF1262:
	.ascii	"LDE_THRESH_LEN (2)\000"
.LASF794:
	.ascii	"W4R_TIM_MASK ACK_RESP_T_W4R_TIM_MASK\000"
.LASF139:
	.ascii	"__INTPTR_WIDTH__ 32\000"
.LASF1593:
	.ascii	"uint16\000"
.LASF1286:
	.ascii	"LDE_REPC_PCODE_10 0x3332\000"
.LASF1651:
	.ascii	"lotID\000"
.LASF1306:
	.ascii	"EVC_EN 0x00000001UL\000"
.LASF1679:
	.ascii	"ref_powerreg\000"
.LASF1239:
	.ascii	"OTP_CTRL_LDELOAD 0x8000\000"
.LASF1804:
	.ascii	"regOffset\000"
.LASF1216:
	.ascii	"AON_CFG0_LPCLKDIVA_MASK 0x0000FFE0UL\000"
.LASF1530:
	.ascii	"p_sep_by_space\000"
.LASF9:
	.ascii	"__ATOMIC_RELAXED 0\000"
.LASF746:
	.ascii	"RX_EQUAL_STD_NOISE_SHIFT (0)\000"
.LASF1038:
	.ascii	"GIDBE7 GIRQx7\000"
.LASF218:
	.ascii	"__FLT64_HAS_INFINITY__ 1\000"
.LASF673:
	.ascii	"SYS_STATUS_TXFRB 0x00000010UL\000"
.LASF1195:
	.ascii	"AON_CTRL_OFFSET 0x02\000"
.LASF489:
	.ascii	"__RAL_WCHAR_T unsigned\000"
.LASF1075:
	.ascii	"DRX_TUNE2_LEN (4)\000"
.LASF74:
	.ascii	"__LONG_LONG_MAX__ 0x7fffffffffffffffLL\000"
.LASF742:
	.ascii	"RX_BUFFER_LEN (1024)\000"
.LASF334:
	.ascii	"__ULLACCUM_EPSILON__ 0x1P-32ULLK\000"
.LASF1723:
	.ascii	"bitmask\000"
.LASF1120:
	.ascii	"RF_TXCTRL_CH4 0x00045C80UL\000"
.LASF1:
	.ascii	"__STDC_VERSION__ 199901L\000"
.LASF277:
	.ascii	"__LFRACT_MIN__ (-0.5LR-0.5LR)\000"
.LASF121:
	.ascii	"__UINT16_C(c) c\000"
.LASF576:
	.ascii	"TX_FCTRL_LEN (5)\000"
.LASF1632:
	.ascii	"power\000"
.LASF1264:
	.ascii	"LDE_CFG1_LEN (1)\000"
.LASF743:
	.ascii	"RX_FQUAL_ID 0x12\000"
.LASF1127:
	.ascii	"TC_SARL_SAR_C (0)\000"
.LASF1062:
	.ascii	"DRX_TUNE0b_6M8_NSTD 0x0002\000"
.LASF1617:
	.ascii	"fctrl\000"
.LASF387:
	.ascii	"__GCC_ATOMIC_LLONG_LOCK_FREE 1\000"
.LASF567:
	.ascii	"SYS_CFG_RXWTOE 0x10000000UL\000"
.LASF802:
	.ascii	"RX_SNIFF_LEN (4)\000"
.LASF487:
	.ascii	"__CTYPE_GRAPH (__CTYPE_PUNCT | __CTYPE_UPPER | __CT"
	.ascii	"YPE_LOWER | __CTYPE_DIGIT)\000"
.LASF1699:
	.ascii	"raw_count\000"
.LASF521:
	.ascii	"DA_ATTN_STEP (2.5)\000"
.LASF284:
	.ascii	"__ULFRACT_EPSILON__ 0x1P-32ULR\000"
.LASF201:
	.ascii	"__FLT32_DENORM_MIN__ 1.1\000"
.LASF1249:
	.ascii	"OTP_SRDAT_LEN (4)\000"
.LASF1599:
	.ascii	"lo32\000"
.LASF85:
	.ascii	"__LONG_LONG_WIDTH__ 64\000"
.LASF459:
	.ascii	"NO_VTOR_CONFIG 1\000"
.LASF464:
	.ascii	"S132 1\000"
.LASF584:
	.ascii	"TX_FCTRL_TXPSR_PE_MASK 0x003C0000UL\000"
.LASF1621:
	.ascii	"chan\000"
.LASF1803:
	.ascii	"regFileID\000"
.LASF1515:
	.ascii	"char\000"
.LASF1406:
	.ascii	"REG_38_ID_RESERVED 0x38\000"
.LASF1691:
	.ascii	"new_mixer_gain\000"
.LASF823:
	.ascii	"TX_POWER_TXPOWPHR_MASK 0x0000FF00UL\000"
.LASF1491:
	.ascii	"dwt_write32bitreg(x,y) dwt_write32bitoffsetreg(x,0,"
	.ascii	"y)\000"
.LASF1609:
	.ascii	"dwnsSFDlen\000"
.LASF1220:
	.ascii	"AON_CFG0_SLEEP_TIM_OFFSET 2\000"
.LASF568:
	.ascii	"SYS_CFG_RXAUTR 0x20000000UL\000"
.LASF1823:
	.ascii	"dwt_readtxtimestamplo32\000"
.LASF1332:
	.ascii	"EVC_FWTO_MASK 0x0FFF\000"
.LASF605:
	.ascii	"TX_FCTRL_TXPSR_PE_2048 0x00280000UL\000"
.LASF1039:
	.ascii	"GIDBE8 GIRQx8\000"
.LASF1086:
	.ascii	"DRX_SFDTOC_LEN (2)\000"
.LASF330:
	.ascii	"__ULLACCUM_FBIT__ 32\000"
.LASF1509:
	.ascii	"XTRIM_ADDRESS (0x1E)\000"
.LASF1594:
	.ascii	"uint32\000"
.LASF190:
	.ascii	"__LDBL_HAS_QUIET_NAN__ 1\000"
.LASF954:
	.ascii	"GDM7 GxM7\000"
.LASF42:
	.ascii	"__INT16_TYPE__ short int\000"
.LASF75:
	.ascii	"__WCHAR_MAX__ 0xffffffffU\000"
.LASF573:
	.ascii	"SYS_TIME_LEN (5)\000"
.LASF1384:
	.ascii	"PMSC_CTRL1_SNOZR 0x00004000UL\000"
.LASF1776:
	.ascii	"dwt_configuresleepcnt\000"
.LASF1436:
	.ascii	"DWT_PLEN_64 0x04\000"
.LASF801:
	.ascii	"RX_SNIFF_OFFSET 0x00\000"
.LASF331:
	.ascii	"__ULLACCUM_IBIT__ 32\000"
.LASF1575:
	.ascii	"__RAL_c_locale_abbrev_month_names\000"
.LASF1508:
	.ascii	"VTEMP_ADDRESS (0x09)\000"
.LASF1274:
	.ascii	"LDE_CFG2_LEN (2)\000"
.LASF176:
	.ascii	"__LDBL_MANT_DIG__ 53\000"
.LASF290:
	.ascii	"__ULLFRACT_FBIT__ 64\000"
.LASF1582:
	.ascii	"__user_set_time_of_day\000"
.LASF342:
	.ascii	"__DQ_IBIT__ 0\000"
.LASF970:
	.ascii	"GIRQx8 0x00000100UL\000"
.LASF1184:
	.ascii	"AON_WCFG_OFFSET 0x00\000"
.LASF1667:
	.ascii	"pdw1000local\000"
.LASF982:
	.ascii	"GPIO_ISEN_MASK GPIO_IRQE_MASK\000"
.LASF1623:
	.ascii	"rxPAC\000"
.LASF175:
	.ascii	"__DBL_HAS_QUIET_NAN__ 1\000"
.LASF1292:
	.ascii	"LDE_REPC_PCODE_16 0x35C2\000"
.LASF1073:
	.ascii	"DRX_TUNE1b_6M8_PRE64 0x0010\000"
.LASF346:
	.ascii	"__UQQ_IBIT__ 0\000"
.LASF1284:
	.ascii	"LDE_REPC_PCODE_8 0x51EA\000"
.LASF97:
	.ascii	"__SIG_ATOMIC_WIDTH__ 32\000"
.LASF1355:
	.ascii	"PMSC_CTRL0_OFFSET 0x00\000"
.LASF735:
	.ascii	"RX_FINFO_RXPRF_MASK 0x00030000UL\000"
.LASF1171:
	.ascii	"FS_PLLTUNE_CH4 FS_PLLTUNE_CH2\000"
.LASF1378:
	.ascii	"PMSC_CTRL1_LEN (4)\000"
.LASF1363:
	.ascii	"PMSC_CTRL0_RXCLKS_125M 0x00000008UL\000"
.LASF822:
	.ascii	"TX_POWER_MAN_DEFAULT 0x0E080222UL\000"
.LASF1183:
	.ascii	"AON_LEN (12)\000"
.LASF1321:
	.ascii	"EVC_FFR_LEN (2)\000"
.LASF170:
	.ascii	"__DBL_MIN__ ((double)1.1)\000"
.LASF1155:
	.ascii	"FS_CTRL_LEN (21)\000"
.LASF1354:
	.ascii	"PMSC_LEN (48)\000"
.LASF482:
	.ascii	"__CTYPE_CNTRL 0x20\000"
.LASF404:
	.ascii	"__ARM_FEATURE_LDREX\000"
.LASF341:
	.ascii	"__DQ_FBIT__ 63\000"
.LASF1546:
	.ascii	"date_format\000"
.LASF122:
	.ascii	"__UINT_LEAST32_MAX__ 0xffffffffUL\000"
.LASF1849:
	.ascii	"dwt_configuretxrf\000"
.LASF307:
	.ascii	"__ACCUM_MIN__ (-0X1P15K-0X1P15K)\000"
.LASF691:
	.ascii	"SYS_STATUS_GPIOIRQ 0x00400000UL\000"
.LASF667:
	.ascii	"SYS_STATUS_LEN (5)\000"
.LASF696:
	.ascii	"SYS_STATUS_HPDWARN 0x08000000UL\000"
.LASF1312:
	.ascii	"EVC_RSE_LEN (2)\000"
.LASF952:
	.ascii	"GDM5 GxM5\000"
.LASF27:
	.ascii	"__ORDER_BIG_ENDIAN__ 4321\000"
.LASF403:
	.ascii	"__ARM_FEATURE_CMSE\000"
.LASF1806:
	.ascii	"buffer\000"
.LASF273:
	.ascii	"__UFRACT_MAX__ 0XFFFFP-16UR\000"
.LASF1016:
	.ascii	"GPIO_ICLR_OFFSET 0x20\000"
.LASF1417:
	.ascii	"DWT_ERROR (-1)\000"
.LASF1383:
	.ascii	"PMSC_CTRL1_SNOZE 0x00002000UL\000"
.LASF63:
	.ascii	"__UINT_FAST32_TYPE__ unsigned int\000"
.LASF1133:
	.ascii	"TC_PGCCTRL_LEN (1)\000"
.LASF96:
	.ascii	"__SIG_ATOMIC_MIN__ (-__SIG_ATOMIC_MAX__ - 1)\000"
.LASF493:
	.ascii	"NULL 0\000"
.LASF454:
	.ascii	"DEBUG_NRF 1\000"
.LASF898:
	.ascii	"GPIO_CTRL_ID 0x26\000"
.LASF1503:
	.ascii	"FCTRL_LEN_MAX 2\000"
.LASF618:
	.ascii	"RX_FWTO_MASK 0xFFFF\000"
.LASF1294:
	.ascii	"LDE_REPC_PCODE_18 0x35C2\000"
.LASF1634:
	.ascii	"maxNoise\000"
.LASF153:
	.ascii	"__FLT_DECIMAL_DIG__ 9\000"
.LASF1078:
	.ascii	"DRX_TUNE2_PRF16_PAC16 0x331A0052UL\000"
.LASF43:
	.ascii	"__INT32_TYPE__ long int\000"
.LASF1398:
	.ascii	"PMSC_LEDC_OFFSET 0x28\000"
.LASF1706:
	.ascii	"vbat_raw\000"
.LASF301:
	.ascii	"__USACCUM_IBIT__ 8\000"
.LASF1498:
	.ascii	"FORCE_OTP_ON 11\000"
.LASF595:
	.ascii	"TX_FCTRL_TXPRF_64M 0x00020000UL\000"
.LASF282:
	.ascii	"__ULFRACT_MIN__ 0.0ULR\000"
.LASF356:
	.ascii	"__HA_IBIT__ 8\000"
.LASF1165:
	.ascii	"FS_PLLCFG_CH7 FS_PLLCFG_CH5\000"
.LASF1540:
	.ascii	"int_n_sign_posn\000"
.LASF645:
	.ascii	"SYS_MASK_MRXSFDD 0x00000200UL\000"
.LASF919:
	.ascii	"GPIO_DIR_MASK 0x0011FFFFUL\000"
.LASF589:
	.ascii	"TX_FCTRL_TXBR_SHFT (13)\000"
.LASF1862:
	.ascii	"dwt_initialise\000"
.LASF1683:
	.ascii	"delta_power\000"
.LASF131:
	.ascii	"__INT_FAST32_WIDTH__ 32\000"
.LASF796:
	.ascii	"ACK_RESP_T_ACK_TIM_MASK 0xFF000000UL\000"
.LASF596:
	.ascii	"TX_FCTRL_TXPSR_SHFT (18)\000"
.LASF1764:
	.ascii	"dwt_loadopsettabfromotp\000"
.LASF505:
	.ascii	"_DECA_PARAM_TYPES_H_ \000"
.LASF66:
	.ascii	"__UINTPTR_TYPE__ unsigned int\000"
.LASF666:
	.ascii	"SYS_STATUS_OFFSET 0x00\000"
.LASF15:
	.ascii	"__FINITE_MATH_ONLY__ 0\000"
.LASF1285:
	.ascii	"LDE_REPC_PCODE_9 0x28F4\000"
.LASF810:
	.ascii	"TX_POWER_BOOSTNORM_MASK 0x00000000UL\000"
.LASF351:
	.ascii	"__UDQ_FBIT__ 64\000"
.LASF692:
	.ascii	"SYS_STATUS_SLP2INIT 0x00800000UL\000"
.LASF744:
	.ascii	"RX_FQUAL_LEN (8)\000"
.LASF1845:
	.ascii	"config\000"
.LASF1451:
	.ascii	"DWT_FF_COORD_EN 0x002\000"
.LASF1499:
	.ascii	"FORCE_OTP_OFF 12\000"
.LASF1565:
	.ascii	"__locale_s\000"
.LASF1800:
	.ascii	"dwt_enableframefilter\000"
.LASF1052:
	.ascii	"DRX_CONF_ID 0x27\000"
.LASF1753:
	.ascii	"dwt_lowpowerlistenisr\000"
.LASF1279:
	.ascii	"LDE_REPC_PCODE_3 0x51EA\000"
.LASF1566:
	.ascii	"__category\000"
.LASF1568:
	.ascii	"__RAL_c_locale\000"
.LASF911:
	.ascii	"GPIO_MSGP8_MASK 0x00C00000UL\000"
.LASF409:
	.ascii	"__ARM_SIZEOF_MINIMAL_ENUM 1\000"
.LASF1322:
	.ascii	"EVC_FFR_MASK 0x0FFF\000"
.LASF116:
	.ascii	"__INT64_C(c) c ## LL\000"
.LASF559:
	.ascii	"SYS_CFG_DIS_PHE 0x00002000UL\000"
.LASF310:
	.ascii	"__UACCUM_FBIT__ 16\000"
.LASF862:
	.ascii	"AGC_TUNE1_LEN (2)\000"
.LASF359:
	.ascii	"__DA_FBIT__ 31\000"
.LASF1758:
	.ascii	"dwt_setrxaftertxdelay\000"
.LASF1748:
	.ascii	"starttime\000"
.LASF1080:
	.ascii	"DRX_TUNE2_PRF16_PAC64 0x371A011DUL\000"
.LASF1552:
	.ascii	"__tolower\000"
.LASF1179:
	.ascii	"FS_XTALT_MIDRANGE 0x10\000"
.LASF379:
	.ascii	"__GCC_ATOMIC_BOOL_LOCK_FREE 2\000"
.LASF1097:
	.ascii	"DRX_CARRIER_INT_LEN (3)\000"
.LASF245:
	.ascii	"__DEC64_MAX__ 9.999999999999999E384DD\000"
.LASF1613:
	.ascii	"txpwr_compensation\000"
.LASF130:
	.ascii	"__INT_FAST32_MAX__ 0x7fffffff\000"
.LASF1777:
	.ascii	"sleepcnt\000"
.LASF1296:
	.ascii	"LDE_REPC_PCODE_20 0x47AE\000"
.LASF154:
	.ascii	"__FLT_MAX__ 1.1\000"
.LASF1790:
	.ascii	"ret_data\000"
.LASF1085:
	.ascii	"DRX_SFDTOC_OFFSET 0x20\000"
.LASF467:
	.ascii	"__assert_h \000"
.LASF786:
	.ascii	"TX_ANTD_LEN (2)\000"
.LASF343:
	.ascii	"__TQ_FBIT__ 127\000"
.LASF423:
	.ascii	"__VFP_FP__ 1\000"
.LASF1551:
	.ascii	"__toupper\000"
.LASF458:
	.ascii	"INITIALIZE_USER_SECTIONS 1\000"
.LASF1585:
	.ascii	"__RAL_error_decoder_fn_t\000"
.LASF556:
	.ascii	"SYS_CFG_SPI_EDGE 0x00000400UL\000"
.LASF704:
	.ascii	"SYS_STATUS_TXERR (0x0408)\000"
.LASF1712:
	.ascii	"dwt_setxtaltrim\000"
.LASF150:
	.ascii	"__FLT_MIN_10_EXP__ (-37)\000"
.LASF1612:
	.ascii	"double\000"
.LASF511:
	.ascii	"NUM_CH 6\000"
.LASF1400:
	.ascii	"PMSC_LEDC_MASK 0x000001FFUL\000"
.LASF1696:
	.ascii	"curr_bw\000"
.LASF1441:
	.ascii	"DWT_START_TX_DELAYED 1\000"
.LASF281:
	.ascii	"__ULFRACT_IBIT__ 0\000"
.LASF1089:
	.ascii	"DRX_PRETOC_LEN (2)\000"
.LASF1098:
	.ascii	"DRX_CARRIER_INT_MASK 0x001FFFFF\000"
.LASF600:
	.ascii	"TX_FCTRL_TXPSR_PE_128 0x00140000UL\000"
.LASF950:
	.ascii	"GDM3 GxM3\000"
.LASF1029:
	.ascii	"GPIO_IDBE_LEN (4)\000"
.LASF95:
	.ascii	"__SIG_ATOMIC_MAX__ 0x7fffffff\000"
.LASF410:
	.ascii	"__ARM_SIZEOF_WCHAR_T 4\000"
.LASF1423:
	.ascii	"DWT_PRF_16M 1\000"
.LASF1276:
	.ascii	"LDE_REPC_LEN (2)\000"
.LASF21:
	.ascii	"__SIZEOF_DOUBLE__ 8\000"
.LASF136:
	.ascii	"__UINT_FAST32_MAX__ 0xffffffffU\000"
.LASF180:
	.ascii	"__LDBL_MAX_EXP__ 1024\000"
.LASF768:
	.ascii	"RX_TTCKO_RCPHASE_MASK 0x7F0000000000ULL\000"
.LASF1394:
	.ascii	"PMSC_RES3_OFFSET 0x24\000"
.LASF1569:
	.ascii	"__RAL_codeset_ascii\000"
.LASF1463:
	.ascii	"DWT_INT_RFTO 0x00020000\000"
.LASF890:
	.ascii	"EC_RXTC_LEN (4)\000"
.LASF1324:
	.ascii	"EVC_OVR_LEN (2)\000"
.LASF1682:
	.ascii	"delta_temp\000"
.LASF430:
	.ascii	"__ARM_FEATURE_FP16_VECTOR_ARITHMETIC\000"
.LASF1429:
	.ascii	"DWT_PLEN_4096 0x0C\000"
.LASF157:
	.ascii	"__FLT_DENORM_MIN__ 1.1\000"
.LASF402:
	.ascii	"__ARM_32BIT_STATE 1\000"
.LASF541:
	.ascii	"REG_05_ID_RESERVED 0x05\000"
.LASF1361:
	.ascii	"PMSC_CTRL0_RXCLKS_AUTO 0x00000000UL\000"
.LASF1374:
	.ascii	"PMSC_CTRL0_RESET_ALL 0x00\000"
.LASF1437:
	.ascii	"DWT_SFDTOC_DEF 0x1041\000"
.LASF1490:
	.ascii	"HERTZ_TO_PPM_MULTIPLIER_CHAN_5 (-1.0e6/6489.6e6)\000"
.LASF1767:
	.ascii	"_dwt_configlde\000"
.LASF213:
	.ascii	"__FLT64_MAX__ 1.1\000"
.LASF1841:
	.ascii	"txDelay\000"
.LASF90:
	.ascii	"__INTMAX_MAX__ 0x7fffffffffffffffLL\000"
.LASF787:
	.ascii	"SYS_STATE_ID 0x19\000"
.LASF1701:
	.ascii	"dwt_readwakeupvbat\000"
.LASF1561:
	.ascii	"data\000"
.LASF564:
	.ascii	"SYS_CFG_PHR_MODE_11 0x00030000UL\000"
.LASF84:
	.ascii	"__LONG_WIDTH__ 32\000"
.LASF510:
	.ascii	"NUM_SFD 2\000"
.LASF1484:
	.ascii	"DWT_CB_DATA_RX_FLAG_RNG 0x1\000"
.LASF368:
	.ascii	"__UDA_IBIT__ 32\000"
.LASF1163:
	.ascii	"FS_PLLCFG_CH4 FS_PLLCFG_CH2\000"
.LASF1263:
	.ascii	"LDE_CFG1_OFFSET 0x0806\000"
.LASF837:
	.ascii	"CHAN_CTRL_TX_PCOD_MASK 0x07C00000UL\000"
.LASF745:
	.ascii	"RX_EQUAL_STD_NOISE_MASK 0x0000FFFFULL\000"
.LASF825:
	.ascii	"CHAN_CTRL_ID 0x1F\000"
.LASF1801:
	.ascii	"sysconfig\000"
.LASF931:
	.ascii	"GxM2 0x00000040UL\000"
.LASF1175:
	.ascii	"FS_RES2_LEN (2)\000"
.LASF1139:
	.ascii	"TC_PGCAL_STATUS_OFFSET 0x09\000"
.LASF413:
	.ascii	"__arm__ 1\000"
.LASF1323:
	.ascii	"EVC_OVR_OFFSET 0x0E\000"
.LASF1253:
	.ascii	"OTP_SF_OPS_KICK 0x01\000"
.LASF641:
	.ascii	"SYS_MASK_MTXPRS 0x00000020UL\000"
.LASF700:
	.ascii	"SYS_STATUS_ICRBP 0x80000000UL\000"
.LASF946:
	.ascii	"GDP8 GxP8\000"
.LASF1407:
	.ascii	"REG_39_ID_RESERVED 0x39\000"
.LASF1501:
	.ascii	"FORCE_LDE 14\000"
.LASF1271:
	.ascii	"LDE_RXANTD_OFFSET 0x1804\000"
.LASF1769:
	.ascii	"dwt_spicswakeup\000"
.LASF927:
	.ascii	"GxP7 0x00000800UL\000"
.LASF1452:
	.ascii	"DWT_FF_BEACON_EN 0x004\000"
.LASF1738:
	.ascii	"timeOn\000"
.LASF987:
	.ascii	"GISEN4 GIRQx4\000"
.LASF588:
	.ascii	"TX_FCTRL_TXBR_6M 0x00004000UL\000"
.LASF41:
	.ascii	"__INT8_TYPE__ signed char\000"
.LASF575:
	.ascii	"TX_FCTRL_ID 0x08\000"
.LASF928:
	.ascii	"GxP8 0x00010000UL\000"
.LASF378:
	.ascii	"__GCC_HAVE_SYNC_COMPARE_AND_SWAP_4 1\000"
.LASF560:
	.ascii	"SYS_CFG_DIS_RSDE 0x00004000UL\000"
.LASF1072:
	.ascii	"DRX_TUNE1b_850K_6M8 0x0020\000"
.LASF1798:
	.ascii	"dwt_setpanid\000"
.LASF1359:
	.ascii	"PMSC_CTRL0_SYSCLKS_19M 0x00000001UL\000"
.LASF1525:
	.ascii	"positive_sign\000"
.LASF308:
	.ascii	"__ACCUM_MAX__ 0X7FFFFFFFP-15K\000"
.LASF155:
	.ascii	"__FLT_MIN__ 1.1\000"
.LASF945:
	.ascii	"GDP7 GxP7\000"
.LASF208:
	.ascii	"__FLT64_MIN_EXP__ (-1021)\000"
.LASF59:
	.ascii	"__INT_FAST32_TYPE__ int\000"
.LASF462:
	.ascii	"NRF52_PAN_74 1\000"
.LASF995:
	.ascii	"GIMOD0 GIRQx0\000"
.LASF1544:
	.ascii	"abbrev_month_names\000"
.LASF868:
	.ascii	"AGC_TUNE2_MASK 0xFFFFFFFFUL\000"
.LASF323:
	.ascii	"__ULACCUM_MAX__ 0XFFFFFFFFFFFFFFFFP-32ULK\000"
.LASF1379:
	.ascii	"PMSC_CTRL1_MASK 0xFC02F802UL\000"
.LASF671:
	.ascii	"SYS_STATUS_ESYNCR 0x00000004UL\000"
.LASF433:
	.ascii	"__ARM_NEON__\000"
.LASF909:
	.ascii	"GPIO_MSGP6_MASK 0x000C0000UL\000"
.LASF1381:
	.ascii	"PMSC_CTRL1_ATXSLP 0x00000800UL\000"
.LASF920:
	.ascii	"GxP0 0x00000001UL\000"
.LASF1096:
	.ascii	"DRX_CARRIER_INT_OFFSET 0x28\000"
.LASF216:
	.ascii	"__FLT64_DENORM_MIN__ 1.1\000"
.LASF1414:
	.ascii	"_DECA_DEVICE_API_H_ \000"
.LASF1448:
	.ascii	"DWT_LEDS_ENABLE 0x01\000"
.LASF1680:
	.ascii	"curr_temp\000"
.LASF857:
	.ascii	"AGC_CTRL1_OFFSET (0x02)\000"
.LASF990:
	.ascii	"GISEN7 GIRQx7\000"
.LASF805:
	.ascii	"SNIFF_ONT_MASK RX_SNIFF_SNIFF_ONT_MASK\000"
.LASF1456:
	.ascii	"DWT_FF_RSVD_EN 0x040\000"
.LASF1138:
	.ascii	"TC_PGCCTRL_DIR_CONV 0x80\000"
.LASF1672:
	.ascii	"old_pmsc_ctrl0\000"
.LASF1673:
	.ascii	"old_pmsc_ctrl1\000"
.LASF1813:
	.ascii	"recordNumber\000"
.LASF770:
	.ascii	"RX_TIME_LLEN (14)\000"
.LASF222:
	.ascii	"__FLT32X_MIN_EXP__ (-1021)\000"
.LASF1817:
	.ascii	"dwt_readsystime\000"
.LASF554:
	.ascii	"SYS_CFG_FFA5 0x00000100UL\000"
.LASF1342:
	.ascii	"EVC_RES1_OFFSET 0x1C\000"
.LASF698:
	.ascii	"SYS_STATUS_AFFREJ 0x20000000UL\000"
.LASF1109:
	.ascii	"RF_RXCTRLH_OFFSET 0x0B\000"
.LASF497:
	.ascii	"MB_CUR_MAX __RAL_mb_max(&__RAL_global_locale)\000"
.LASF411:
	.ascii	"__ARM_ARCH_PROFILE\000"
.LASF1418:
	.ascii	"DWT_TIME_UNITS (1.0/499.2e6/128.0)\000"
.LASF316:
	.ascii	"__LACCUM_IBIT__ 32\000"
.LASF1481:
	.ascii	"DWT_OPSET_64LEN 0x0\000"
.LASF1660:
	.ascii	"cbData\000"
.LASF507:
	.ascii	"NUM_PRF 2\000"
.LASF244:
	.ascii	"__DEC64_MIN__ 1E-383DD\000"
.LASF1541:
	.ascii	"day_names\000"
.LASF110:
	.ascii	"__INT16_C(c) c\000"
.LASF1784:
	.ascii	"retry\000"
.LASF456:
	.ascii	"CONFIG_GPIO_AS_PINRESET 1\000"
.LASF1715:
	.ascii	"dwt_softreset\000"
.LASF806:
	.ascii	"RX_SNIFF_SNIFF_OFFT_MASK 0x0000FF00UL\000"
.LASF1335:
	.ascii	"EVC_TXFS_MASK 0x0FFF\000"
.LASF918:
	.ascii	"GPIO_DIR_LEN (3)\000"
.LASF1486:
	.ascii	"FREQ_OFFSET_MULTIPLIER_110KB (998.4e6/2.0/8192.0/13"
	.ascii	"1072.0)\000"
.LASF1173:
	.ascii	"FS_PLLTUNE_CH7 FS_PLLTUNE_CH5\000"
.LASF996:
	.ascii	"GIMOD1 GIRQx1\000"
.LASF737:
	.ascii	"RX_FINFO_RXPRF_64M 0x00020000UL\000"
.LASF19:
	.ascii	"__SIZEOF_SHORT__ 2\000"
.LASF1684:
	.ascii	"_dwt_computetxpowersetting\000"
.LASF473:
	.ascii	"__RAL_SIZE_T unsigned\000"
.LASF582:
	.ascii	"TX_FCTRL_TXPSR_MASK 0x000C0000UL\000"
.LASF603:
	.ascii	"TX_FCTRL_TXPSR_PE_1024 0x00080000UL\000"
.LASF1697:
	.ascii	"delta_count\000"
.LASF583:
	.ascii	"TX_FCTRL_PE_MASK 0x00300000UL\000"
.LASF1345:
	.ascii	"DIAG_TMC_MASK 0x0010\000"
.LASF102:
	.ascii	"__UINT8_MAX__ 0xff\000"
.LASF1203:
	.ascii	"AON_RDAT_OFFSET 0x03\000"
.LASF1465:
	.ascii	"DWT_INT_RXPTO 0x00200000\000"
.LASF1786:
	.ascii	"rd_buf\000"
.LASF1121:
	.ascii	"RF_TXCTRL_CH5 0x001E3FE0UL\000"
.LASF1497:
	.ascii	"READ_ACC_OFF 8\000"
.LASF1311:
	.ascii	"EVC_RSE_OFFSET 0x06\000"
.LASF679:
	.ascii	"SYS_STATUS_LDEDONE 0x00000400UL\000"
.LASF1852:
	.ascii	"dwt_getpartid\000"
.LASF1459:
	.ascii	"DWT_INT_RFCG 0x00004000\000"
.LASF826:
	.ascii	"CHAN_CTRL_LEN (4)\000"
.LASF479:
	.ascii	"__CTYPE_DIGIT 0x04\000"
.LASF710:
	.ascii	"RX_FINFO_ID 0x10\000"
.LASF1309:
	.ascii	"EVC_PHE_LEN (2)\000"
.LASF392:
	.ascii	"__SIZEOF_WINT_T__ 4\000"
.LASF237:
	.ascii	"__DEC32_MIN__ 1E-95DF\000"
.LASF212:
	.ascii	"__FLT64_DECIMAL_DIG__ 17\000"
.LASF140:
	.ascii	"__UINTPTR_MAX__ 0xffffffffU\000"
.LASF1424:
	.ascii	"DWT_PRF_64M 2\000"
.LASF171:
	.ascii	"__DBL_EPSILON__ ((double)1.1)\000"
.LASF1251:
	.ascii	"OTP_SF_LEN (1)\000"
.LASF978:
	.ascii	"GIRQE7 GIRQx7\000"
.LASF845:
	.ascii	"CHAN_CTRL_RNSSFD 0x00200000UL\000"
.LASF259:
	.ascii	"__SFRACT_EPSILON__ 0x1P-7HR\000"
.LASF14:
	.ascii	"__ATOMIC_CONSUME 1\000"
.LASF50:
	.ascii	"__INT_LEAST16_TYPE__ short int\000"
.LASF1401:
	.ascii	"PMSC_LEDC_BLINK_TIM_MASK 0x000000FFUL\000"
.LASF615:
	.ascii	"RX_FWTO_ID 0x0C\000"
.LASF612:
	.ascii	"DX_TIME_ID 0x0A\000"
.LASF260:
	.ascii	"__USFRACT_FBIT__ 8\000"
.LASF593:
	.ascii	"TX_FCTRL_TXPRF_4M 0x00000000UL\000"
.LASF1735:
	.ascii	"dwt_setlowpowerlistening\000"
.LASF1055:
	.ascii	"DRX_TUNE0b_LEN (2)\000"
.LASF788:
	.ascii	"SYS_STATE_LEN (5)\000"
.LASF1135:
	.ascii	"TC_PGCCTRL_AUTOCAL 0x02\000"
.LASF383:
	.ascii	"__GCC_ATOMIC_WCHAR_T_LOCK_FREE 2\000"
.LASF1397:
	.ascii	"PMSC_TXFINESEQ_ENABLE 0x0B74\000"
.LASF1169:
	.ascii	"FS_PLLTUNE_CH2 0x26\000"
.LASF1447:
	.ascii	"DWT_LEDS_DISABLE 0x00\000"
.LASF393:
	.ascii	"__SIZEOF_PTRDIFF_T__ 4\000"
.LASF1168:
	.ascii	"FS_PLLTUNE_CH1 0x1E\000"
.LASF688:
	.ascii	"SYS_STATUS_reserved 0x00080000UL\000"
.LASF1124:
	.ascii	"REG_29_ID_RESERVED 0x29\000"
.LASF1669:
	.ascii	"sum_count\000"
.LASF192:
	.ascii	"__FLT32_DIG__ 6\000"
.LASF1607:
	.ascii	"rx_config\000"
.LASF1598:
	.ascii	"int32\000"
.LASF1792:
	.ascii	"array\000"
.LASF452:
	.ascii	"__GNU_LINKER 1\000"
.LASF477:
	.ascii	"__CTYPE_UPPER 0x01\000"
.LASF1835:
	.ascii	"txBufferOffset\000"
.LASF896:
	.ascii	"ACC_MEM_ID 0x25\000"
.LASF233:
	.ascii	"__FLT32X_HAS_QUIET_NAN__ 1\000"
.LASF1826:
	.ascii	"dwt_readdiagnostics\000"
.LASF889:
	.ascii	"EC_RXTC_OFFSET (0x04)\000"
.LASF1213:
	.ascii	"AON_CFG0_WAKE_SPI 0x00000004UL\000"
.LASF33:
	.ascii	"__PTRDIFF_TYPE__ int\000"
.LASF1305:
	.ascii	"EVC_CTRL_MASK 0x00000003UL\000"
.LASF893:
	.ascii	"EC_GOLP_LEN (4)\000"
.LASF164:
	.ascii	"__DBL_MIN_EXP__ (-1021)\000"
.LASF1223:
	.ascii	"AON_CFG1_MASK 0x0007\000"
.LASF782:
	.ascii	"TX_TIME_TX_STAMP_OFFSET (0)\000"
.LASF923:
	.ascii	"GxP3 0x00000008UL\000"
.LASF979:
	.ascii	"GIRQE8 GIRQx8\000"
.LASF1698:
	.ascii	"best_bw\000"
.LASF1006:
	.ascii	"GPIO_IBES_MASK GPIO_IRQE_MASK\000"
.LASF389:
	.ascii	"__GCC_ATOMIC_POINTER_LOCK_FREE 2\000"
.LASF1068:
	.ascii	"DRX_TUNE1b_OFFSET 0x06\000"
.LASF495:
	.ascii	"EXIT_FAILURE 1\000"
.LASF1665:
	.ascii	"dwt_local_data_t\000"
.LASF1212:
	.ascii	"AON_CFG0_WAKE_PIN 0x00000002UL\000"
.LASF1268:
	.ascii	"LDE_PPINDX_LEN (2)\000"
.LASF181:
	.ascii	"__LDBL_MAX_10_EXP__ 308\000"
.LASF803:
	.ascii	"RX_SNIFF_MASK 0x0000FF0FUL\000"
.LASF629:
	.ascii	"SYS_CTRL_RXENAB 0x00000100UL\000"
.LASF1427:
	.ascii	"DWT_PAC32 2\000"
.LASF1314:
	.ascii	"EVC_FCG_OFFSET 0x08\000"
.LASF980:
	.ascii	"GPIO_ISEN_OFFSET 0x14\000"
.LASF1779:
	.ascii	"_dwt_aonarrayupload\000"
.LASF1752:
	.ascii	"dwt_setleds\000"
.LASF1048:
	.ascii	"GRAWP5 GIRQx5\000"
.LASF1590:
	.ascii	"__RAL_error_decoder_head\000"
.LASF44:
	.ascii	"__INT64_TYPE__ long long int\000"
.LASF400:
	.ascii	"__ARM_FEATURE_CRC32\000"
.LASF1815:
	.ascii	"header\000"
.LASF238:
	.ascii	"__DEC32_MAX__ 9.999999E96DF\000"
.LASF1834:
	.ascii	"txFrameLength\000"
.LASF1283:
	.ascii	"LDE_REPC_PCODE_7 0x8000\000"
.LASF660:
	.ascii	"SYS_MASK_MCPLLLL 0x02000000UL\000"
.LASF1060:
	.ascii	"DRX_TUNE0b_850K_NSTD 0x0006\000"
.LASF901:
	.ascii	"GPIO_MODE_LEN (4)\000"
.LASF894:
	.ascii	"EC_GOLP_MASK 0x0000003FUL\000"
.LASF55:
	.ascii	"__UINT_LEAST32_TYPE__ long unsigned int\000"
.LASF648:
	.ascii	"SYS_MASK_MRXPHE 0x00001000UL\000"
.LASF1745:
	.ascii	"retval\000"
.LASF1471:
	.ascii	"DWT_LOADEUI 0x0008\000"
.LASF1611:
	.ascii	"chan_idx\000"
.LASF1703:
	.ascii	"dwt_readtempvbat\000"
.LASF1545:
	.ascii	"am_pm_indicator\000"
.LASF1389:
	.ascii	"PMSC_CTRL1_PKTSEQ_ENABLE 0xE7\000"
.LASF362:
	.ascii	"__TA_IBIT__ 64\000"
.LASF1106:
	.ascii	"RF_CONF_TXBLOCKSEN_MASK 0x00001F00UL\000"
.LASF694:
	.ascii	"SYS_STATUS_CLKPLL_LL 0x02000000UL\000"
.LASF1244:
	.ascii	"OTP_STAT_OTPPRGD 0x0001\000"
.LASF948:
	.ascii	"GDM1 GxM1\000"
.LASF1533:
	.ascii	"p_sign_posn\000"
.LASF204:
	.ascii	"__FLT32_HAS_QUIET_NAN__ 1\000"
.LASF12:
	.ascii	"__ATOMIC_RELEASE 3\000"
.LASF1228:
	.ascii	"OTP_IF_LEN (18)\000"
.LASF338:
	.ascii	"__HQ_IBIT__ 0\000"
.LASF1462:
	.ascii	"DWT_INT_RFSL 0x00010000\000"
.LASF1591:
	.ascii	"long long int\000"
.LASF500:
	.ascii	"_DECA_UINT16_ \000"
.LASF143:
	.ascii	"__FLT_EVAL_METHOD__ 0\000"
.LASF1209:
	.ascii	"AON_CFG0_OFFSET 0x06\000"
.LASF607:
	.ascii	"TX_FCTRL_TXBOFFS_SHFT (22)\000"
.LASF1831:
	.ascii	"dwt_readrxdata\000"
.LASF363:
	.ascii	"__UHA_FBIT__ 8\000"
.LASF1393:
	.ascii	"PMSC_RES2_OFFSET 0x10\000"
.LASF294:
	.ascii	"__ULLFRACT_EPSILON__ 0x1P-64ULLR\000"
.LASF1329:
	.ascii	"EVC_PTO_MASK 0x0FFF\000"
.LASF959:
	.ascii	"GPIO_IRQE_OFFSET 0x10\000"
.LASF254:
	.ascii	"__DEC128_SUBNORMAL_MIN__ 0.000000000000000000000000"
	.ascii	"000000001E-6143DL\000"
.LASF406:
	.ascii	"__ARM_FEATURE_CLZ 1\000"
.LASF1687:
	.ascii	"mixer_gain_change\000"
.LASF1049:
	.ascii	"GRAWP6 GIRQx6\000"
.LASF586:
	.ascii	"TX_FCTRL_TXBR_110k 0x00000000UL\000"
.LASF1422:
	.ascii	"DWT_BR_6M8 2\000"
.LASF712:
	.ascii	"RX_FINFO_LEN (4)\000"
.LASF851:
	.ascii	"DW_NS_SFD_LEN_850K 16\000"
.LASF908:
	.ascii	"GPIO_MSGP5_MASK 0x00030000UL\000"
.LASF432:
	.ascii	"__ARM_FEATURE_FMA 1\000"
.LASF947:
	.ascii	"GDM0 GxM0\000"
.LASF1802:
	.ascii	"dwt_write32bitoffsetreg\000"
.LASF783:
	.ascii	"TX_TIME_TX_RAWST_OFFSET (5)\000"
.LASF1252:
	.ascii	"OTP_SF_MASK 0x63\000"
.LASF235:
	.ascii	"__DEC32_MIN_EXP__ (-94)\000"
.LASF1781:
	.ascii	"dwt_otpwriteandverify\000"
.LASF838:
	.ascii	"CHAN_CTRL_TX_PCOD_SHIFT (22)\000"
.LASF103:
	.ascii	"__UINT16_MAX__ 0xffff\000"
.LASF1014:
	.ascii	"GIBES7 GIRQx7\000"
.LASF1432:
	.ascii	"DWT_PLEN_1024 0x08\000"
.LASF415:
	.ascii	"__ARM_ARCH 7\000"
.LASF455:
	.ascii	"BOARD_DW1001_DEV 1\000"
.LASF1115:
	.ascii	"RF_TXCTRL_TXMTUNE_MASK 0x000001E0UL\000"
.LASF1440:
	.ascii	"DWT_START_TX_IMMEDIATE 0\000"
.LASF1208:
	.ascii	"AON_ADDR_LPOSC_CAL_1 118\000"
.LASF1392:
	.ascii	"PMSC_SNOZT_LEN (1)\000"
.LASF1661:
	.ascii	"cbTxDone\000"
.LASF186:
	.ascii	"__LDBL_EPSILON__ 1.1\000"
.LASF1517:
	.ascii	"decimal_point\000"
.LASF179:
	.ascii	"__LDBL_MIN_10_EXP__ (-307)\000"
.LASF234:
	.ascii	"__DEC32_MANT_DIG__ 7\000"
.LASF230:
	.ascii	"__FLT32X_DENORM_MIN__ 1.1\000"
.LASF1154:
	.ascii	"FS_CTRL_ID 0x2B\000"
.LASF1434:
	.ascii	"DWT_PLEN_256 0x24\000"
.LASF1765:
	.ascii	"ops_sel\000"
.LASF261:
	.ascii	"__USFRACT_IBIT__ 0\000"
.LASF1145:
	.ascii	"TC_PGDELAY_CH2 0xC2\000"
.LASF223:
	.ascii	"__FLT32X_MIN_10_EXP__ (-307)\000"
.LASF448:
	.ascii	"__SES_ARM 1\000"
.LASF145:
	.ascii	"__DEC_EVAL_METHOD__ 2\000"
.LASF189:
	.ascii	"__LDBL_HAS_INFINITY__ 1\000"
.LASF1739:
	.ascii	"timeOff\000"
.LASF1595:
	.ascii	"long unsigned int\000"
.LASF1531:
	.ascii	"n_cs_precedes\000"
.LASF1050:
	.ascii	"GRAWP7 GIRQx7\000"
.LASF912:
	.ascii	"GPIO_PIN2_RXLED 0x00000400UL\000"
.LASF258:
	.ascii	"__SFRACT_MAX__ 0X7FP-7HR\000"
.LASF1846:
	.ascii	"nsSfd_result\000"
.LASF1255:
	.ascii	"OTP_SF_OPS_SEL_SHFT 5\000"
.LASF1512:
	.ascii	"__state\000"
.LASF1067:
	.ascii	"DRX_TUNE1a_PRF64 0x008D\000"
.LASF635:
	.ascii	"SYS_MASK_LEN (4)\000"
.LASF1202:
	.ascii	"AON_CTRL_DCA_ENAB 0x80\000"
.LASF471:
	.ascii	"__THREAD __thread\000"
.LASF1015:
	.ascii	"GIBES8 GIRQx8\000"
.LASF1642:
	.ascii	"dwt_rxdiag_t\000"
.LASF22:
	.ascii	"__SIZEOF_LONG_DOUBLE__ 8\000"
.LASF924:
	.ascii	"GxP4 0x00000100UL\000"
.LASF1726:
	.ascii	"dwt_setpreambledetecttimeout\000"
.LASF1774:
	.ascii	"dwt_calibratesleepcnt\000"
.LASF289:
	.ascii	"__LLFRACT_EPSILON__ 0x1P-63LLR\000"
.LASF699:
	.ascii	"SYS_STATUS_HSRBP 0x40000000UL\000"
.LASF217:
	.ascii	"__FLT64_HAS_DENORM__ 1\000"
.LASF1099:
	.ascii	"RF_CONF_ID 0x28\000"
.LASF1144:
	.ascii	"TC_PGDELAY_CH1 0xC9\000"
.LASF158:
	.ascii	"__FLT_HAS_DENORM__ 1\000"
.LASF325:
	.ascii	"__LLACCUM_FBIT__ 31\000"
.LASF1091:
	.ascii	"DRX_TUNE4H_OFFSET 0x26\000"
.LASF1065:
	.ascii	"DRX_TUNE1a_MASK 0xFFFF\000"
.LASF969:
	.ascii	"GIRQx7 0x00000080UL\000"
.LASF419:
	.ascii	"__THUMBEL__ 1\000"
.LASF1003:
	.ascii	"GIMOD8 GIRQx8\000"
.LASF1362:
	.ascii	"PMSC_CTRL0_RXCLKS_19M 0x00000004UL\000"
.LASF569:
	.ascii	"SYS_CFG_AUTOACK 0x40000000UL\000"
.LASF1288:
	.ascii	"LDE_REPC_PCODE_12 0x3D70\000"
.LASF1376:
	.ascii	"PMSC_CTRL0_RESET_CLEAR 0xF0\000"
.LASF1547:
	.ascii	"time_format\000"
.LASF1653:
	.ascii	"otprev\000"
.LASF344:
	.ascii	"__TQ_IBIT__ 0\000"
.LASF1227:
	.ascii	"OTP_IF_ID 0x2D\000"
.LASF1458:
	.ascii	"DWT_INT_LDED 0x00000400\000"
.LASF1637:
	.ascii	"firstPathAmp2\000"
.LASF578:
	.ascii	"TX_FCTRL_TFLE_MASK 0x00000380UL\000"
.LASF1710:
	.ascii	"dwt_configcwmode\000"
.LASF253:
	.ascii	"__DEC128_EPSILON__ 1E-33DL\000"
.LASF1194:
	.ascii	"AON_WCFG_ONW_LLDO 0x1000\000"
.LASF32:
	.ascii	"__SIZE_TYPE__ unsigned int\000"
.LASF1051:
	.ascii	"GRAWP8 GIRQx8\000"
.LASF1196:
	.ascii	"AON_CTRL_LEN (1)\000"
.LASF53:
	.ascii	"__UINT_LEAST8_TYPE__ unsigned char\000"
.LASF1101:
	.ascii	"RF_CONF_TXEN_MASK 0x00400000UL\000"
.LASF1789:
	.ascii	"_dwt_otpread\000"
.LASF1445:
	.ascii	"DWT_IDLE_ON_DLY_ERR 2\000"
.LASF38:
	.ascii	"__CHAR16_TYPE__ short unsigned int\000"
.LASF1242:
	.ascii	"OTP_STAT_LEN (2)\000"
.LASF270:
	.ascii	"__UFRACT_FBIT__ 16\000"
.LASF1229:
	.ascii	"OTP_WDAT 0x00\000"
.LASF1536:
	.ascii	"int_n_cs_precedes\000"
.LASF581:
	.ascii	"TX_FCTRL_TXPRF_MASK 0x00030000UL\000"
.LASF1469:
	.ascii	"DWT_LOADOPSET 0x0080\000"
.LASF1066:
	.ascii	"DRX_TUNE1a_PRF16 0x0087\000"
.LASF542:
	.ascii	"SYS_CFG_ID 0x04\000"
.LASF833:
	.ascii	"CHAN_CTRL_RXFPRF_SHIFT (18)\000"
.LASF1126:
	.ascii	"TX_CAL_LEN (52)\000"
.LASF930:
	.ascii	"GxM1 0x00000020UL\000"
.LASF1847:
	.ascii	"useDWnsSFD\000"
.LASF1210:
	.ascii	"AON_CFG0_LEN (4)\000"
.LASF1626:
	.ascii	"nsSFD\000"
.LASF817:
	.ascii	"BOOSTP250_MASK TX_POWER_BOOSTP250_MASK\000"
.LASF962:
	.ascii	"GIRQx0 0x00000001UL\000"
.LASF1652:
	.ascii	"longFrames\000"
.LASF627:
	.ascii	"SYS_CTRL_TRXOFF 0x00000040UL\000"
.LASF1543:
	.ascii	"month_names\000"
.LASF1257:
	.ascii	"OTP_SF_OPS_SEL_L64 0x00\000"
.LASF1405:
	.ascii	"REG_37_ID_RESERVED 0x37\000"
.LASF599:
	.ascii	"TX_FCTRL_TXPSR_PE_64 0x00040000UL\000"
.LASF1156:
	.ascii	"FS_RES1_OFFSET 0x00\000"
.LASF904:
	.ascii	"GPIO_MSGP1_MASK 0x00000300UL\000"
.LASF1597:
	.ascii	"short int\000"
.LASF1740:
	.ascii	"sniff_reg\000"
.LASF1132:
	.ascii	"TC_PGCCTRL_OFFSET 0x08\000"
.LASF1535:
	.ascii	"int_p_cs_precedes\000"
.LASF6:
	.ascii	"__GNUC_MINOR__ 3\000"
.LASF1864:
	.ascii	"ldo_tune\000"
.LASF2:
	.ascii	"__STDC_UTF_16__ 1\000"
.LASF729:
	.ascii	"RX_FINFO_RXBR_110k 0x00000000UL\000"
.LASF1574:
	.ascii	"__RAL_c_locale_month_names\000"
.LASF54:
	.ascii	"__UINT_LEAST16_TYPE__ short unsigned int\000"
.LASF246:
	.ascii	"__DEC64_EPSILON__ 1E-15DD\000"
.LASF137:
	.ascii	"__UINT_FAST64_MAX__ 0xffffffffffffffffULL\000"
.LASF1421:
	.ascii	"DWT_BR_850K 1\000"
.LASF1836:
	.ascii	"ranging\000"
.LASF572:
	.ascii	"SYS_TIME_OFFSET 0x00\000"
.LASF1295:
	.ascii	"LDE_REPC_PCODE_19 0x35C2\000"
.LASF492:
	.ascii	"__RAL_WCHAR_T_DEFINED \000"
.LASF453:
	.ascii	"DEBUG 1\000"
.LASF5:
	.ascii	"__GNUC__ 8\000"
.LASF897:
	.ascii	"ACC_MEM_LEN (4064)\000"
.LASF902:
	.ascii	"GPIO_MODE_MASK 0x00FFFFC0UL\000"
.LASF1439:
	.ascii	"DWT_PHRMODE_EXT 0x3\000"
.LASF1819:
	.ascii	"dwt_readsystimestamphi32\000"
.LASF1117:
	.ascii	"RF_TXCTRL_CH1 0x00005C40UL\000"
.LASF654:
	.ascii	"SYS_MASK_MLDEERR 0x00040000UL\000"
.LASF953:
	.ascii	"GDM6 GxM6\000"
.LASF118:
	.ascii	"__UINT_LEAST8_MAX__ 0xff\000"
.LASF1724:
	.ascii	"stat\000"
.LASF1346:
	.ascii	"DIAG_TMC_TX_PSTM 0x0010\000"
.LASF421:
	.ascii	"__ARM_ARCH_ISA_THUMB 2\000"
.LASF104:
	.ascii	"__UINT32_MAX__ 0xffffffffUL\000"
.LASF941:
	.ascii	"GDP3 GxP3\000"
.LASF761:
	.ascii	"RX_TTCKI_ID 0x13\000"
.LASF364:
	.ascii	"__UHA_IBIT__ 8\000"
.LASF1236:
	.ascii	"OTP_CTRL_MASK 0x8002\000"
.LASF278:
	.ascii	"__LFRACT_MAX__ 0X7FFFFFFFP-31LR\000"
.LASF858:
	.ascii	"AGC_CTRL1_LEN (2)\000"
	.ident	"GCC: (GNU) 8.3.1 20190703 (release) [gcc-8-branch revision 273027]"
