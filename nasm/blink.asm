; BLINKDOT.ASM
; A simple TSR for MS-DOS that toggles a dot at the top-right corner
; of the text screen every ~1 second, using the BIOS timer hook (INT 1Ch).
;
; Assemble with:
;   nasm -f bin BLINKDOT.ASM -o BLINKDOT.COM

org 100h
bits 16

; --------------------------------------------------
; Program entry point
; --------------------------------------------------
start:
    ; Temporarily disable interrupts while we modify the IVT
    cli

    ; ES = 0000h so we can access the Interrupt Vector Table (IVT)
    xor ax, ax
    mov es, ax              ; ES = 0000h

    ; Address of INT 1Ch vector = 1Ch * 4 bytes
    mov bx, 1Ch * 4         ; BX = offset in IVT

    ; Save old INT 1Ch handler (offset + segment) into our data area
    mov ax, [es:bx]         ; old offset
    mov [old_1c_ptr], ax
    mov ax, [es:bx+2]       ; old segment
    mov [old_1c_ptr+2], ax

    ; Install our new INT 1Ch handler
    mov ax, cs
    mov [es:bx+2], ax       ; new segment = current CS
    mov word [es:bx], new_1c_handler ; new offset

    ; Re-enable interrupts
    sti

    ; --------------------------------------------------
    ; Terminate and Stay Resident (INT 21h / AH=31h)
    ; DX = number of paragraphs (16-byte blocks) to keep
    ; from the beginning of the PSP segment.
    ;
    ; In a .COM program with ORG 100h, label values
    ; are offsets relative to the PSP, so:
    ;
    ;   paragraphs = (end_program + 15) / 16
    ; --------------------------------------------------
    mov ax, end_program     ; AX = offset of the end of our program
    add ax, 15              ; round up to next 16-byte boundary
    shr ax, 4               ; divide by 16 → paragraphs
    mov dx, ax              ; DX = paragraphs to keep resident

    mov ax, 3100h           ; AH=31h (TSR), AL=00h (return code)
    int 21h                 ; does not return


; --------------------------------------------------
; New INT 1Ch handler
; Called by BIOS about 18.2 times per second.
; We count ticks, and every ~18 ticks (≈1 second)
; we toggle a dot at the top-right of the screen.
; --------------------------------------------------
new_1c_handler:
    ; Preserve registers we will touch
    push ax
    push bx
    push cx
    push dx
    push ds
    push es

    ; Use DS = CS to access our data area
    mov ax, cs
    mov ds, ax

    ; Increment tick counter
    inc word [tick_count]
    cmp word [tick_count], 18      ; 18 ticks ≈ 1 second
    jb short .chain_only           ; less than 1 second → just chain to old handler

    ; 1 second passed → reset counter and update the dot
    mov word [tick_count], 0

    ; Video memory segment for color text mode (usually 80x25): B800h
    mov ax, 0B800h
    mov es, ax

    ; Top-right cell of an 80x25 text screen:
    ; index 79 in the first row → offset = 79 * 2 (char + attribute)
    mov bx, 79 * 2

    ; If dot_state == 0 → draw '.' and set dot_state to 1
    ; If dot_state == 1 → clear to ' ' and set dot_state to 0
    cmp byte [dot_state], 0
    jne short .clear_dot

    ; Turn the dot ON
    mov byte [dot_state], 1
    mov byte [es:bx], '.'       ; character
    mov byte [es:bx+1], 0x0F    ; attribute: white on black
    jmp short .after_draw

.clear_dot:
    ; Turn the dot OFF (space)
    mov byte [dot_state], 0
    mov byte [es:bx], ' '
    mov byte [es:bx+1], 0x0F

.after_draw:
    ; Fall through to chaining the old handler

.chain_only:
    ; Always chain to the previous INT 1Ch handler
    pushf                       ; preserve flags for the call
    call far [old_1c_ptr]       ; call old handler (far pointer)

    ; Restore registers
    pop es
    pop ds
    pop dx
    pop cx
    pop bx
    pop ax

    iret                        ; return from interrupt


; --------------------------------------------------
; Data area
; --------------------------------------------------
old_1c_ptr   dd 0      ; Previous INT 1Ch handler (far pointer: offset + segment)
tick_count   dw 0      ; Tick counter for ~1-second timing
dot_state    db 0      ; 0 = OFF (space), 1 = ON ('.')

end_program:
