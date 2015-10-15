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
define sysLastKey   $ff

jsr init
jsr test
brk

init:
jsr initSnake
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

test:
  lda #$01 ;white
  ldx #$00
  sta (snakeHeadL,X)
  ldx snakeLength
body:
  dex
  dex
  sta (snakeBodyStart,X)
  cpx #$00
  bne body
  rts
