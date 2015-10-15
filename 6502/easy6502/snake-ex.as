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
define movingUp      1
define movingRight   2
define movingDown    4
define movingLeft    8

; ASCII values of keys controlling the snake
define ASCII_w      $77
define ASCII_a      $61
define ASCII_s      $73
define ASCII_d      $64

; System variables
define sysRandom    $fe
define sysLastKey   $ff

jsr init
jsr loop

init:
jsr initSnake
jsr generateApplePosition
rts

loop:
  jsr readKeys
  jsr checkCollision
  jsr updateSnake
  jsr drawApple
  jsr drawSnake
  jsr spinWheels
  jmp loop
