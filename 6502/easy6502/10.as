LDA #$08
LDX #$00
STA $0200,X
INX
ADC #$01
STA $0200,X
BRK
