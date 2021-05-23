

	area	tcd,code,readonly
	export	__main
__main
INTER	EQU	0xE0F05204		; interface address 

	
	ldr r4,=INTER
	mov r5,#0 				;cnt = 0			

poll_1					
	ldrb r1,[r4]			; interface bytes			 	
	cmp	r1,#0Xff	    	; if(b_pressed)
	beq	poll_1				; else poll				

loop
	and r2,r1,#1         ;isolate the LS bit 
	cmp r2,#1            ;if(ls bit != 1)
	bne set1         
	lsr r1,r1,#1         ; onto next bit
	add r5,r5,#1		 ; cnt++
	b 	loop			 ; check next bit

set1
	cmp r2,#4				; if(cnt<4)
	bge	set2				
	sub r6,#4,r5			; check how much to shift to get 
							; to second part of the code
	mov r3,r5				; first part of code 
	mov r5,#4				; cnt = 4 for the second part
	b loop					; to get second part of code

set2
	get_ascii				; code in r3 and r5

finish  b	finish

get_ascii
	stmfd sp!,{lr}	
	cmp r3,#0			; if first part of code is 0
	bne	b_1				
	
	cmp r5,#4			; if second part of code is 4
	bne	b_05	
	mov r0,0x44			; return ASCII code for D
	b		exit
b_05
	cmp r5,#5			; if second part of code is 5
	bne	b_06	
	mov r0,0x33			; return ASCII code for 3
	b		exit

b_06
	cmp r5,#6			; if second part of code is 6
	bne	b_07	
	mov r0,0x32			; return ASCII code for 2
	b		exit
b_07
	cmp r5,#7			; if second part of code is 5
	bne	error			; not valid code 	
	mov r0,0x31			; return ASCII code for 1
	b		exit

b_1
	cmp r3,#1			; if first part of code is 1
	bne	b_2	
	cmp r5,#4			; if second part of code is 4
	bne	b_2	
	mov r0,0x43			; return ASCII code for C
	b		exit
b_15
	cmp r5,#5			; if second part of code is 5
	bne	b_16	
	mov r0,0x36			; return ASCII code for 6
	b		exit

b_16
	cmp r5,#6			; if second part of code is 6
	bne	b_17	
	mov r0,0x35			; return ASCII code for 5
	b		exit
b_17
	cmp r5,#7			; if second part of code is 5
	bne	error			; not valid code 	
	mov r0,0x34			; return ASCII code for 4
	b		exit

b_2
	cmp r3,#2			; if first part of code is 2
	bne	b_3	
	cmp r5,#4			; if second part of code is 4
	bne	b_25	
	mov r0,0x42			; return ASCII code for B
	b		exit
b_25
	cmp r5,#5			; if second part of code is 5
	bne	b_26	
	mov r0,0x39			; return ASCII code for 9
	b		exit

b_26
	cmp r5,#6			; if second part of code is 6
	bne	b_27	
	mov r0,0x38			; return ASCII code for 8
	b		exit
b_27
	cmp r5,#7			; if second part of code is 5
	bne	error			; not valid code 	
	mov r0,0x37			; return ASCII code for 7
	b		exit
b_3
	cmp r3,#3			; if first part of code is 3
	bne	error			; invalid code	
	cmp r5,#4			; if second part of code is 4
	bne	b_35	
	mov r0,0x41			; return ASCII code for A
	b		exit
b_35
	cmp r5,#5			; if second part of code is 5
	bne	b_36	
	mov r0,0x23			; return ASCII code for #
	b		exit

b_36
	cmp r5,#6			; if second part of code is 6
	bne	b_37	
	mov r0,0x30			; return ASCII code for 0
	b		exit
b_37
	cmp r5,#7			; if second part of code is 5
	bne	error			; not valid code 	
	mov r0,0x2A			; return ASCII code for *
	b		exit
error
	move r0,#-1			; invalid code return -1
exit						; one exit point

	ldmfd sp!,{pc}				
	

	end