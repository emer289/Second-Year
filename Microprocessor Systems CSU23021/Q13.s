__main
SECOND	EQU 0x5f5e100
INCREMENT EQU 0x18c5bf
	

	ldr r6,=INCREMENT
	ldr r10,=SECOND
	ldr r5,=SECOND			; inti to 100000000, 100000000micro secs = 1sec    0x3e8
		
	
fin b fin

; the interupt

	ldr r0,=counter 		; load counter from memory	
	ldr r1,[r0]				; load the counter value
	add r1,r2				; add 16 ms to the counter
 	subs r6,r1,r3			; check is counter value - r5 >= 0(counter value mod 1000 == 0)
	blt l1
	ldr r7,=seconds
	ldr r8,[r7]
	add r8,r8,#1			; seconds++
	str r8,[r7]
	mov r1,#0				; prevent overflow
	
l1
	str r1,[r0]				; store counter back to memory
	ldmfd	sp!,{r0-r1,pc}^	; return from interrupt, restoring pc from lr
				; and also restoring the CPSR