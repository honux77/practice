LDX #$08
decrement:
DEX
STX $0200
CPX #$03
BNE decrement
STX $0201
BRK
