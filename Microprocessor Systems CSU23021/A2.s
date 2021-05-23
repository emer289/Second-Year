

	area	tcd,code,readonly
	export	__main
__main
IO1DIR	EQU	0xE0028018
IO1PIN	EQU	0xE0028010		; guess
	
	ldr r4,=IO1PIN	
	ldr r0,=IO1DIR
	mov	r1,#0x00FF0000		; outputs on pins 16 to 23
	str	r1,[r0]				; set the outputs
	ldr r1,[r4]
	bic	r1,#0x00FF0000		; D=0
	str r1,[r4]	
poll_1					
	ldr	r0,[r4]				; load pins
	and	r0,#0x0F000000		; inputs on pins 24 to 27	
	cmp	r0,#0x0f000000		; if(b_pressed)
	beq	poll_1				; else poll
poll_2					
	ldr	r2,[r4]				; load pins
	and	r2,#0x0F000000		; outputs on pins 16 to 23
	cmp	r2,#0x0F000000		; if(b_released)
	bne	poll_2				; else poll
	ldr r1,[r4]
	and r1,#0x00FF0000		; r1=D
	bl	update_D	
	ldr	r2,[r4]		
	bic	r2,#0X00FF0000		
	orr	r1,r2				; update output
	str	r1,[r4]				; output to the display
	b	poll_1		
	
finish  b	finish

update_D
	stmfd 	sp!,{lr}	
	cmp 	r0,#0xE000000	; b_24 pressed?
	bne		b_25				
	add		r1,#0x10000		; D++
	b		exit
b_25				
	cmp	r0,#0xD000000		; b_25 pressed?
	bne 	b_26		
	sub r1,#0x10000		; D--
	b	exit
b_26			
	cmp	r0,#0xB000000		; b_26 pressed?
	bne	b_27		
	lsl	r1,#1				; D << 1
	b	exit
b_27			
	subs r0,#0x7000000		; b_27 pressed?
	bne	 exit	
	lsr	 r1,#1				; D >> 1	
exit						; one exit point
	and	r1,#0x00FF0000 		; output on pins 23 to 16
	ldmfd sp!,{lr}	
	bx	lr			
	

	end