# Day 2 - A Source Code File's Structure

https://patater.com/gbaguy/day2n.htm

- NES 어셈블러는 인덴트에 매우 민감
- 라벨은 무조건 공백없이
- 코드는 탭 하나의 공백 필요

## about NES Bank

- 우리의 돈을 저장하지 않는다...
- 프로그램과 데이터를 저장하는 곳 
- 같은 6502지만 애플2와는 메모리 구조가 완전히 다르다.

```
Bank 0 - $8000부터 코드 시작
Bank 1 - $FFFA부터 시작하는 인터럽트 테이블 
Bank 2 - $0000부터 시작, 스프라이트와 배경 데이터 저장
```

## INES header

INES header 는 대부분의 롬 파일의 처음에 위치한다.

```asembly
	.inesprg     - tells how many program code banks there are.
	.ineschr     - tells how many picture data banks there are.
	.inesmir     - tells something I don't remember, but will be always 1.
	.inesmap     - We always use Mapper 0.

일반적으로 아래의 세팅을 사용한다.

```assembly
	.inesprg 1   ; one (1) bank of program code
	.ineschr 1   ; one (1) bank of picture data
	.inesmap 0   ; we use mapper 0
	.inesmir 1   ; Mirror setting always 1.
```

거의 대부분의 경우 이 네 줄이 코드 맨 위에 온다.

## Bank 0과 .org

코드는 Bank0 $8000부터 시작한다.

```assembly
	.bank 0   ; bank 0.
	.org $8000  ; goto location $8000.
	; program's code would go here.
```

### Bank 1과 3 종류의 인터럽트

```
    .bank 1     ; change to bank 1
	.org $FFFA  ; start at $FFFA

	.dw 0        ; location of NMI Interrupt
	.dw Start    ; code to run at reset, we give address of Start label that
	; we will eventually put in bank 0
	.dw 0        ; location of VBlank Interrupt I think. either way, we don't need
	; it right now.
```

### Bank 2와 picture data

이미지와 스프라이트 데이터를 저장한다.

```
	.bank 2        ; change to bank 2
	.org $0000    ; start at $0000

	.incbin "our.bkg"  ; INClude BINary file that will contain our background pic
	; data.
	.incbin "our.spr"  ; INClude BINary file that will contain our sprite pic data
