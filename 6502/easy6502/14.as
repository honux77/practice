LDX #$00
LDY #$00
firstloop:
TXA
STA $0200, X
PHA
INX
CPX #$10
BNE firstloop ;loop until X is $10
secondloop:
PLA
STA $0200,X
INX
CPX #$20      ;loop until X is $20
BNE secondloop
