JSR init
JSR loop
JSR end

init:
LDX #$00
RTS

loop:
INX
CPX #$05
BNE loop
RTS

end:
BRK
