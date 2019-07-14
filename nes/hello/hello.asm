.segment "HEADER"
    .byte "NES"
    .byte $1a
    .byte $02
    .byte $01
    .byte %00000000
    .byte $00
    .byte $00
    .byte $00
    .byte $00
    .byte $00,$00,$00,$00,$00

.segment "STARTUP"
.segment "ZEROPAGE"
flag: .res 1
counter: .res 1
.segment "CODE"

WAITVBLANK:
:
    BIT $2002
    BPL :-
    RTS

RESET:
  LDA #$01	; square 1
  STA $4015
  LDA #$08	; period low
  STA $4002
  LDA #$02	; period high
  STA $4003
  LDA #$bf	; volume
  STA $4000

FOREVER:
  JMP FOREVER

VBLANK:
  INC counter
  LDA counter
  CMP #$3C
  BNE SkipColorChange
  LDA flag
  EOR #%10000000
  STA flag
  STA $2001
  LDA #$00
  STA counter
 SkipColorChange:
  RTI

.segment "VECTORS"
    .word VBLANK
    .word RESET
    .word 0

.segment "CHARS"  