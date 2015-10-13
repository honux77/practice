LDA #$01
CMP #$02
BNE notequal
STA $0200
notequal:
BRK
STA $0201
