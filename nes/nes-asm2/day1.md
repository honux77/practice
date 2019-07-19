# nes asm 2 day 1

NES architecture overview 

http://nintendoage.com/forum/messageview.cfm?catid=22&threadid=4291

## NES System Architecture

![nes-arch](http://www.nesmuseum.com/images/nesarchitecture.png)

### Memory Address

- 2KB for RAM
- 2KB for PPU
- WRAM for saving

### Cartridge

- PRG ROM (program)
- CHR ROM / RAM (character graphics)

### CPU

![6502](http://www.nesmuseum.com/images/cpumemmap.png)

- $0000 - $0800: RAM/ 2KB
- $2000 - $3FFF: PPU (Memory Mapped IO)
- $8000 - $FFFA: Cartridge (32KB)
- $FFFA - $FFFF: MMI/RESET/IRQ vectors - for interupts

### PPU

![PPU](http://www.nesmuseum.com/images/ppumemmap.png)

- 그래픽 처리용 칩, 내부에 메모리를 가지고 있다.
- 카트리지에서 데이터를 불러와서 그림
- 스캔라인 순서로 그리는데 한 스캔라인에 8개 이상의 스프라이트가 있으면 무시됨 (스프라이트 깜박이는 현상 발생)
- 스캔라인이 완료되면 VBlank 발생

### Graphics System Overview

#### Tiles

- nes의 모든 그림은 8x8 타일로 구성

#### Sprites

- PPU에는 최대 64개의 스프라이트 저장 가능
- 스프라이트는 화면에서 움직임
- 한 스캔라인당 8개의 스프라이트만 그릴 수 있음

#### Background

- 한 번에 두 장의 배경 가능
- 32 * 30 타일로구성

#### 패턴 테이블

- 실제 타일 데이터 저장
- 각 테이블당 256개의 타일을 저장 
- 두 개의 패턴 테이블 (배경 / 스프라이트 용)
- 픽셀당 2비트

#### Attribute Tables

- 2 * 2 타일 영역의 색깔 정보를 저장
- 16 * 16 pixel 당 4컬러 표현 가능

#### Pallettes

- 색깔 정보 저장
- backgournd pallete, sprite pallete
- 한 팔레트에는 16 color 저장

![render](http://www.nesmuseum.com/images/pputile.png)

