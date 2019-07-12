reset:
  lda #$01	; square 1
  sta $4015
  lda #$08	; period low
  sta $4002
  lda #$02	; period high
  sta $4003
  lda #$bf	; volume
  sta $4000
forever:
  jmp forever
