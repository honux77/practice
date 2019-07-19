# DAY 4 - MAKING AND LOADING A PALETTE

## WHAT A PALETTE IS

- A palette is basically a bunch of colors to pick from
- NES palette is 32 colors /bytes (1 color = 1 byte) long
- 16 colors for the sprite palette, 16 colors for the BG palette
- Even though you can pick from 16 you can only use 4 per sprite or 4 per 16x16 piece of BG!

## How We Load The Pallete

To load the palette, we write to 2 memory registers

- $2006 twice to give it the full address ($3F00)
- then we just keep giving $2007 byte after byte of our palette until we've given it all of the palette.
- However, before we load the palette, we need to learn a few other things.

## Indexed Addressing

```assembly
ldx #$06
ldy #$09
lda $2002, x    ; loads A with value at memory location ($2002+6)
lda $2000, y    ; loads A with value at memory location ($2000+9)
```

## The Other Thing

```asm
somelabel: .incbin "our.pal" ; include a pal file and label it's location.
lda somelabel, x  ; load A with value from location (somelabel's address+X register's)
```

## Loading The Pallete

```asm
lda #$3F ; these 4 lines tell $2006 that we
sta $2006 ; want the stuff we load $2007 with
lda #$00 ; to start at memory location $3F00
sta $2006 ; . Note that since we can only store a byte at a time we store twice
; to get the whole address in there.

ldx #$00   ; load X with 0.
loadpal:    ; note that labels are followed by a ':' and aren't tabbed in.
lda ourpal, x   ; load A with palette value at location ourpal + x.
sta $2007       ; store the next palette value into $2007 which will put it in
; the right place for us.
inx    ; you've never seen this instruction before but it stands for INcrement X.
; it adds 1 to X.
cpx #32   ; ComPare X with 32 which is how many palette values we need to load.
bne loadpal  ; bne stands for Branch on Not Equal, so this will branch to loadpal
; if X wasn't equal to 32. If X is 32, then the loop will stop and were done
; loading the palette.

ourpal: .incbin "our.pal" ; label our palette for use in the loading code.
```

## final code without commetn

```asm
lda #$3F
sta $2006
lda #$00
sta $2006

ldx #$00 loadpal:
lda ourpal, x
sta $2007
inx
cpx #32
bne loadpal
```

## new 6502 asm

```asm
INX         ;X++
CPX #$10    ;if x == 0x10
BNE         ;branch not equal
BEQ         ;branch equal
```
