;Easy 6502 color fill example
;You can run this code at http://skilldrick.github.io/easy6502/
    LDX #$00
Fill:
    LDA #$02
    STA $0200, X
    LDA #$01
    STA $0300, X
    LDA #$05
    STA $0400, X
    LDA #$06
    STA $0500, X
    INX
    CPX #$00
    BNE Fill