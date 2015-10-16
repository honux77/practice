;  ___           _        __ ___  __ ___
; / __|_ _  __ _| |_____ / /| __|/  \_  )
; \__ \ ' \/ _` | / / -_) _ \__ \ () / /
; |___/_||_\__,_|_\_\___\___/___/\__/___|

; Change direction: W A S D

define appleL         $00 ; screen location of apple, low byte
define appleH         $01 ; screen location of apple, high byte
define snakeHeadL     $10 ; screen location of snake head, low byte
define snakeHeadH     $11 ; screen location of snake head, high byte
define snakeBodyStart $12 ; start of snake body byte pairs
define snakeDirection $02 ; direction (possible values are below)
define snakeLength    $03 ; snake length, in bytes

; Directions (each using a separate bit)
define movingUp      $01
define movingRight   $02
define movingDown    $04
define movingLeft    $08

; ASCII values of keys controlling the snake
define ASCII_w      $77
define ASCII_a      $61
define ASCII_s      $73
define ASCII_d      $64

; System variables
define sysRandom    $fe
define sysKey       $ff

  jsr init
  jsr loop
  brk

init:
  jsr initSnake
  jsr generateApplePosition
  rts

initSnake:
  lda #movingRight  ;start direction
  sta snakeDirection

  lda #$04  ;start length (2 segments)
  sta snakeLength

  lda #$11
  sta snakeHeadL

  lda #$10
  sta snakeBodyStart

  lda #$0f
  sta $14 ; body segment 1

  lda #$04
  sta snakeHeadH
  sta $13 ; body segment 1
  sta $15 ; body segment 2
  rts

generateApplePosition:
  ;load a new random byte into $00
  lda sysRandom
  sta appleL

  ;load a new random number from 2 to 5 into $01
  lda sysRandom
  and #$03 ;mask out lowest 2 bits
  clc
  adc #2
  sta appleH
  rts

loop:
  jsr readKeys
  jsr drawSnake
  jsr drawApple
  jmp loop

  readKeys:
    lda sysKey
    cmp #ASCII_w
    beq upKey
    cmp #ASCII_d
    beq rightKey
    cmp #ASCII_s
    beq downKey
    cmp #ASCII_a
    beq leftKey
    rts
  upKey:
    lda #movingDown
    bit snakeDirection
    bne illegalMove

    lda #movingUp
    sta snakeDirection
    rts
  rightKey:
    lda #movingLeft
    bit snakeDirection
    bne illegalMove

    lda #movingRight
    sta snakeDirection
    rts
  downKey:
    lda #movingUp
    bit snakeDirection
    bne illegalMove

    lda #movingDown
    sta snakeDirection
    rts
  leftKey:
    lda #movingRight
    bit snakeDirection
    bne illegalMove

    lda #movingLeft
    sta snakeDirection
    rts
  illegalMove:
    rts

drawSnake:
  ldx snakeLength
  lda #0
  sta (snakeHeadL,x) ; erase end of tail

  ldx #0
  lda #1
  sta (snakeHeadL,x) ; paint head
  rts

drawApple:
  ldy #0
  lda sysRandom
  sta (appleL),y
  rts
