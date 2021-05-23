is_b_pressed
	stmfd sp!,{r1,r2,lr}
	ldrb r1,=0xfe808018		; r1 point to interface 
poll
	ldr r2,[r1]				; load value of buttons
	cmp r2,#0xc0			; check if pressed
	beq	poll				; keep polling if no button is pressed
	cmp r2,#0x80 			; check if bit 7 is pressed 
	bne check6
	mov r0,#7				; 7 is pressed
	b exit
return6
	mov r0,#6				; 6 is pressed
exit
	ldmfd	sp!,{r1,r2,pc}


	A switch suffering from bounce means that it temporarily flickers
	between closed and open whilse the internal parts of the system 
	come into contact to implement the swich being closed. This means 
	that there could be a time when you poll the switch and it appears 
	to be off however it actually isn't. To account for this you could 
	implement a timer and poll the switch before and after the timer 
	to ensur the correct result. 



is_b_pressed
	stmfd sp!,{r1-r3,lr}
	ldrb r1,=0xfe808018		; r1 point to interface 
poll
	mov r3,#0				; counter = 0
timer
	add r3,#1				; counter++
	cmp r3,#1667			; 5000 microseconds in 5 milliseconds
							; each instruction takes 1 microsecond to 
							; execute 
							; there are 3 instructions in the loop 
	beq timer
							; after 5 milliseconds it polls 
	ldr r2,[r1]				; load value of buttons
	cmp r2,#0xc0			; check if pressed
	beq	poll				; keep polling if no button is pressed
	cmp r2,#0x80 			; check if bit 7 is pressed 
	bne check6
	mov r0,#7				; 7 is pressed
	b exit
return6
	mov r0,#6				; 6 is pressed
exit
	ldmfd	sp!,{r1-r3,pc}