# Day 3 - About NES Programming

## The PPU

- NES에서 그래픽 출력을 하기 위해서는 PPU를 사용해야 한다.
- 메모리의 특정 주소에 값을 넣은 것으로 PPU 조작을 할 수 있다.
- 대부분의 NES 프로그래밍은 대부분 이런 식인데 이 방식을 "Memory Mapped Registers" 라고 한다.

## 이진 표기법

- 왼쪽이 상위비트:7번째 비트

```
	0 1 1 0 0 0 1 1
	
	7 6 5 4 3 2 1 0
```

## Setting Up The PPU

- 가장 처음 해야 할 것은 PPU 셋업
- $2000과 $2001은 PPU 콘트롤 레지스터인데 여기에 값을 써 넣어야 한다.

```
¦ addr    ¦       ¦          ¦                                             ¦
¦---------¦-------¦----------¦---------------------------------------------¦
| $2000   ¦  W    ¦ vhzcpwNN ¦ PPU Control Register #1           [PPUCNT0] ¦
¦         ¦       ¦          ¦                                             ¦
¦         ¦       ¦          ¦  7 = Execute NMI on VBlank                  ¦
¦         ¦       ¦          ¦         0 = Disabled                        ¦
¦         ¦       ¦          ¦         1 = Enabled                         ¦
¦         ¦       ¦          ¦  6 = Execute NMI on Sprite Hit              ¦
¦         ¦       ¦          ¦         0 = Disabled                        ¦
¦         ¦       ¦          ¦         1 = Enabled                         ¦
¦         ¦       ¦          ¦  5 = Sprite Size                            ¦
¦         ¦       ¦          ¦         0 = 8x8                             ¦
¦         ¦       ¦          ¦         1 = 8x16                            ¦
¦         ¦       ¦          ¦  4 = Screen Pattern Table Address           ¦
¦         ¦       ¦          ¦         0 = $0000 (VRAM)                    ¦
¦         ¦       ¦          ¦         1 = $1000 (VRAM)                    ¦
¦         ¦       ¦          ¦  3 = Sprite Pattern Table Address           ¦
¦         ¦       ¦          ¦         0 = $0000 (VRAM)                    ¦
¦         ¦       ¦          ¦         1 = $1000 (VRAM)                    ¦
¦         ¦       ¦          ¦  2 = PPU Address Read/Write Increment       ¦
¦         ¦       ¦          ¦         0 = Increment by 1                  ¦
¦         ¦       ¦          ¦         1 = Increment by 32                 ¦
¦         ¦       ¦          ¦  1&0 = Name Table Select                    ¦
¦         ¦       ¦          ¦        00 = $2000 (VRAM)                    ¦
¦         ¦       ¦          ¦        01 = $2400 (VRAM)                    ¦
¦         ¦       ¦          ¦        10 = $2800 (VRAM)                    ¦
¦         ¦       ¦          ¦        11 = $2C00 (VRAM)                    ¦
|---------|-------|----------|---------------------------------------------¦
¦ $2001   ¦  W    ¦ fffpcSIt ¦ PPU Control Register #2           [PPUCNT1] ¦
¦         ¦       ¦          ¦                                             ¦
¦         ¦       ¦          ¦  7-5 = Full Background Colour               ¦
¦         ¦       ¦          ¦       000 = None   \                        ¦
¦         ¦       ¦          ¦       001 = Red     \ Select one only       ¦
¦         ¦       ¦          ¦       010 = Green   /                       ¦
¦         ¦       ¦          ¦       100 = Blue   /                        ¦
¦         ¦       ¦          ¦  4 = Sprite Display                         ¦
¦         ¦       ¦          ¦         0 = Hide sprites                    ¦
¦         ¦       ¦          ¦         1 = Show sprites                    ¦
¦         ¦       ¦          ¦  3 = Screen Display                         ¦
¦         ¦       ¦          ¦         0 = Off (screen off)                ¦
¦         ¦       ¦          ¦         1 = On  (screen on)                 ¦
¦         ¦       ¦          ¦  2 = Sprite Clip                            ¦
¦         ¦       ¦          ¦         0 = Don't show sprites in the left  ¦
¦         ¦       ¦          ¦             8-pixel column                  ¦
¦         ¦       ¦          ¦         1 = Show sprites everywhere         ¦
¦         ¦       ¦          ¦  1 = Image Clip                             ¦
¦         ¦       ¦          ¦         0 = Don't show the left 8 pixels of ¦
¦         ¦       ¦          ¦             the screen                      ¦
¦         ¦       ¦          ¦         1 = Show the left 8 pixels          ¦
¦         ¦       ¦          ¦  0 = Colour Display                         ¦
¦         ¦       ¦          ¦         0 = Mono-tone display               ¦
¦         ¦       ¦          ¦         1 = Colour display                  ¦
|---------|-------|----------|---------------------------------------------|
```

- 위 테이블의 내용을 바탕으로 PPU를 초기화하는 코드는 아래와 같다.

```assembly
	lda #%00001000
	sta $2000
	lda #%00011110
	sta $2001
```

The value we put into $2000 tells the PPU that the 2 NMIs are disabled, sprite size is 8x8,
we use Screen pattern table $0000 and sprite pattern table $1000, increment addresses by 1,
and we'll be using Name Table at $2000. These 2 memory registers are probably the two
most complicated, but still easy, mem. registers to use.

The store into $2001 tells the PPU to not influence the pallete toward any certain color,
show sprites, turn the screen on, show sprites everywhere, show left 8 pixels, color display.

## 배경 그리기

- Draw some tiles in Tile Layer Pro.
- Include that file as the first file in bank 2.
- Create and Load a pallete.
- Set tile numbers in Name Table.

## 스프라이트 그리기

- Draw the sprites in Tile Layer Pro.
- Include that file as the second file in bank 2.
- Create and Load a pallete.

## compile and run sample program

- cc65를 이용해서 컴파일 및 실행 가능
- blink-test.asm을 컴파일 해보자
- 에뮬레이터는 fceux 추천 (디버거 및 루아 스크립트 기능 내장)

```assembly
ca65 blink-test.asm -t nes
ld65 -o blink-test.nes blink-test.o -t nes
```
