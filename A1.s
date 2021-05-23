; Sample program makes the 4 LEDs P1.16, P1.17, P1.18, P1.19 go on and off in sequence
; (c) Mike Brady, 2020.

	area	tcd,code,readonly
	export	__main

__main
		ldr r4,=nums		; r7 -> nums
		ldr r6,=res1		; r6 -> resl
		mov r5,#4 			; i = 4, loops 4 times
for1	ldr r0,[r4],#4 		; r0 = n
		bl	fact
		STMIA   r6!,{r1,r0}
		subs r5,#1			; i-1
		bne for1			; 
		
		; 5! = 0x78
		; 14! = 0x144c3b2800
		; 20! = 0x21c3677c 82b40000
		; 30! = 0x0
fin b fin

fact						
						
	subs r0,#0		 ; base case, if(n==0)
	beq L3			
	mov r3,r0
	sub r0,r0,#1	 ; n-1
	stmfd sp!,{lr,r3}
	
	bl fact

	ldmfd sp!,{r3,lr}
	umull r7,r8,r3,r0	; n*MS bits, answer in r7
	subs r8,#0			; error check, this sets the carry flag
	bne L4
	umull r1,r0,r3,r1	; n*LS bits
	adds r0,r0,r7		; MS bits in r0
	bcs L4
	; clears the carry
	mrs	r10,cpsr
	ldr	r9,=0xDFFFFFFF
	and	r10,r9		;  turn off the equivalent of the C bit 
	msr cpsr_f,r10 	;  put it into the C bit

	b L5

L3
	mov r1,#1
	mov r0,#0
	B L5

L4	; return 0 if there's an error
	mov r1,#0
	mov r0,#0
	ldr sp,=0x40000418 
	ldr lr,[sp,#4]		; address to main
	

L5
	bx lr	;one exit point

	area	tcdrodata,data,readonly
nums 	dcd	5
		dcd	14
		dcd	20
		dcd	30

	area 	tcdram,data,readwrite	
res1 	space	32
	end
		
		