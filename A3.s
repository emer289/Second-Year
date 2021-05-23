; Interrupt Handling Sample
; (c) Mike Brady, 2021.

	area	tcd,code,readonly
	export	__main
__main

; Definitions  -- references to 'UM' are to the User Manual.

; Timer Stuff -- UM, Table 173

T0	equ	0xE0004000		; Timer 0 Base Address
T1	equ	0xE0008000

IR	equ	0			; Add this to a timer's base address to get actual register address
TCR	equ	4
MCR	equ	0x14
MR0	equ	0x18

TimerCommandReset	equ	2
TimerCommandRun	equ	1
TimerModeResetAndInterrupt	equ	3
TimerResetTimer0Interrupt	equ	1
TimerResetAllInterrupts	equ	0xFF

; VIC Stuff -- UM, Table 41
VIC	equ	0xFFFFF000		; VIC Base Address
IntEnable	equ	0x10
VectAddr	equ	0x30
VectAddr0	equ	0x100
VectCtrl0	equ	0x200

Timer0ChannelNumber	equ	4	; UM, Table 63
Timer0Mask	equ	1<<Timer0ChannelNumber	; UM, Table 63
IRQslot_en	equ	5		; UM, Table 58

; initialisation code
	mov r0,#0
	ldr r1,=counter
	str r0,[r1]		; initialise the counter

; Initialise the VIC
	ldr	r0,=VIC			; looking at you, VIC!

	ldr	r1,=irqhan
	str	r1,[r0,#VectAddr0] 	; associate our interrupt handler with Vectored Interrupt 0

	mov	r1,#Timer0ChannelNumber+(1<<IRQslot_en)
	str	r1,[r0,#VectCtrl0] 	; make Timer 0 interrupts the source of Vectored Interrupt 0

	mov	r1,#Timer0Mask
	str	r1,[r0,#IntEnable]	; enable Timer 0 interrupts to be recognised by the VIC

	mov	r1,#0
	str	r1,[r0,#VectAddr]   	; remove any pending interrupt (may not be needed)

; Initialise Timer 0
	ldr	r0,=T0			; looking at you, Timer 0!

	mov	r1,#TimerCommandReset
	str	r1,[r0,#TCR]

	mov	r1,#TimerResetAllInterrupts
	str	r1,[r0,#IR]

	ldr	r1,=(14745600/100)-1	 ; 10 ms = 1/100 second
	str	r1,[r0,#MR0]

	mov	r1,#TimerModeResetAndInterrupt
	str	r1,[r0,#MCR]

	mov	r1,#TimerCommandRun
	str	r1,[r0,#TCR]

;from here, initialisation is finished, so it should be the main body of the main program
IO1DIR	EQU	0xE0028018
IO1PIN	EQU	0xE0028010		
	
	ldr r9,=IO1PIN	
	ldr r0,=IO1DIR
	mov	r7,#0xFFFFFFFF		; set all the pins to outputs 
	str	r7,[r0]				; set the outputs
	ldr r7,[r9]
	ldr r1,=0xf00f00		; using 1111 instead of :
	orr r7,r1,r7	
	str r7,[r9]				; set the spacer pins to 1111
	
	ldr r2,=counter 
	ldr r3,=result
	mov r5,#0x3e8			; inti to 1000, 1000ms = 1sec
	
w1	ldr r1,[r2]				; get the counter value
 	subs r4,r1,r5			; check is counter value - r5 == 0(counter value mod 1000 == 0)
	bne w1					; loop until equal
   
	bl display
	add	r5,r5,#0x3e8		; +1000 to check for the next 1sec
	b w1					; loop back to check for the next second
	
fin b fin

	AREA	InterruptStuff, CODE, READONLY
irqhan	sub	lr,lr,#4
	stmfd	sp!,{r0-r1,lr}	; the lr will be restored to the pc

;this is the body of the interrupt handler

;here you'd put the unique part of your interrupt handler
;all the other stuff is "housekeeping" to save registers and acknowledge interrupts

;this is where we stop the timer from making the interrupt request to the VIC
;i.e. we 'acknowledge' the interrupt
	ldr	r0,=T0
	mov	r1,#TimerResetTimer0Interrupt
	str	r1,[r0,#IR]	   	; remove MR0 interrupt request from timer

;here we stop the VIC from making the interrupt request to the CPU:
	ldr	r0,=VIC
	mov	r1,#0
	str	r1,[r0,#VectAddr]	; reset VIC

	ldr r0,=counter 		; load counter from memory	
	ldr r1,[r0]				; load the counter value
	add r1,#10				; add 10 ms to the counter
	str r1,[r0]				; store counter back to memory
	ldmfd	sp!,{r0-r1,pc}^	; return from interrupt, restoring pc from lr
				; and also restoring the CPSR
display
	stmfd	sp!,{r0,r2,lr}
	ldr r8,[r9]				; load value in GPIO
	
	add r8,r8,#1				; seconds++
	; check seconds
	and r2,r8,#0xF				; isolate the seconds
	subs r2,r2,#10				; if the number of seconds is <10  
	bne exit					; the ones < 10 so exit 
								; else 
	bic r8,r8,#0xF				; seconds = 0
	add r8,r8,#0x10 			; the second's tens++
	; check second's 10s
	and r2,r8,#0xF0				; isolate the 10s
	subs r2,r2,#0x60			; if the number of 10s is <6
	bne exit					; the 10s < 6, exit
								; else
	bic r8,r8,#0xF0 			; 10s = 0
	add r8,r8,#0x1000 			; minutes++
	; check minutes
	and r2,r8,#0xF000			; isolate the mins
	subs r2,r2,#0xA000			; if the number of mins is <10
	bne exit					; the mins < 10, exit
								; else
	bic r8,r8,#0xF000 			; mins = 0
	add r8,r8,#0x10000 			; minute's 10s ++
	; check minute's tens
	and r2,r8,#0xF0000			; isolate the 10's
	subs r2,r2,#0x60000			; if the number of 10s is <6
	bne exit					; the 10s < 6, exit 
	bic r8,r8,#0xF0000 			; 10s = 0
	add r8,r8,#0x1000000 			; hours++
	; check hours
	and r2,r8,#0xF000000		; isolate the hour's
	subs r2,r2,#0xA000000		; if the number of hours is <10
	bne exit					; hours < 10, exit
	bic r8,r8,#0xF000000 		; hours = 0
	add r8,r8,#0x10000000 		; hours's 10s ++
	
exit	
	str r8,[r9] ; display output
	ldmfd	sp!,{r0,r2,pc}
	
	AREA  InterruptData, DATA, READWRITE
counter space 4		; this will be our counter 
result space 4 		; and this is where we will put the result
                END
