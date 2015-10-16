; adventure.asm
;
; A simple adventure-like game for the 6502asm.com site
;
; RRRRR    EEEEEE     AA     DDDDD        MM      MMM  EEEEEE
; RR  RR   EE       AA  AA   DD  DD       MMM    MMMM  EE
; RRRRR    EEEEEE   AAAAAA   DD   DD      MM MM MM MM  EEEEEE
; RR  RR   EE      AA    AA  DD  DD       MM  MM   MM  EE
; RR   RR  EEEEEE  AA    AA  DDDDD        MM  MM   MM  EEEEEE
;
; Thank you for trying my game! You are Good Guy, and you are on a
; quest to defeat Bad Guy, the only other guy in this area of The
; World.
;
; You start in the forest. Somewhere within the forest are a pair of
; flippers, which will allow you to swim in the river. Somewhere along
; the banks of the river there is a key to the White Castle. Within the
; White Castle are a protective crown and a deadly weapon (it looks like
; a red star thingy). These two items are needed to defeat Evil Guy.
;
; Evil Guy lives in the Black Castle, which you can get to through the
; desert. Conveniantly enough, the key to the Black Castle is somewhere
; in the desert.
;
; Find Evil Guy in the Black Castle while wearing the crown and weapon
; and you win! If you lack either the crown or weapon, the screen will
; flash only red, and you will loose!
;
; Copyright (c) 2010 Norman B. Lancaster
;
;  Released under the GNU General Public License version 3 or later.
;  See http://gnu.org/licenses/gpl.html
;
;

*=128
player_map_x:
*=129
player_map_y:
*=130
player_screen_x:
*=131
player_screen_y:
*=132
player_sprite:
*=133
screen_item_x:
*=134
screen_item_y:
*=135
screen_item_idx:
*=136
item_flags:
*=138

*=254
random:
*=255
keypress:

*=512
frame_buffer:

*=1536
jmp		start

screen_item_x:		dcb $00
screen_item_y:		dcb $00
screen_item_idx:	dcb $00

; Screen RAM, 64 Bytes
screen_ram:
dcb $0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f
dcb $0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f
dcb $0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f
dcb $0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f
dcb $0f,$03,$0f,$05,$0f,$0f,$0f,$0f
dcb $0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f
dcb $0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f
dcb $0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f

; Item RAM, 64 Bytes
; Map X, Screen X, Map Y, Screen Y, Item Number, Fill x3
item_ram:
dcb $00,$05,$00,$05,$00,$00,$00,$00 ; Flippers
dcb $01,$05,$00,$05,$01,$00,$00,$00 ; White Key
dcb $0d,$05,$0d,$05,$02,$00,$00,$00 ; Black Key
dcb $0d,$05,$0e,$05,$03,$00,$00,$00 ; Crown
dcb $0d,$04,$0c,$05,$04,$00,$00,$00 ; Death Star
dcb $08,$03,$0d,$03,$05,$00,$00,$00 ; Evil Guy (DO NOT MAKE TAKEABLE!)
dcb $ff,$ff,$ff,$ff,$06,$00,$00,$00 ; Not Used
dcb $ff,$ff,$ff,$ff,$07,$00,$00,$00 ; Not Used

start:
	; Init item patch table pointers
	ldx		#0
	lda		#<screen_data
	sta		item_patch_table_lo,x
	lda		#>screen_data
	sta		item_patch_table_hi,x
	inx
	lda		#<sprite_data
	sta		item_patch_table_lo,x
	lda		#>sprite_data
	sta		item_patch_table_hi,x
	inx
	lda		#<tile_flags
	sta		item_patch_table_lo,x
	lda		#>tile_flags
	sta		item_patch_table_hi,x
	inx
	lda		#<item_flags
	sta		item_patch_table_lo,x
	lda		#>item_flags
	sta		item_patch_table_hi,x

	; Init player position, etc
	lda		#$00
	sta		player_map_x
	lda		#$00
	sta		player_map_y
	lda		#0
	sta		player_sprite
	lda		#4
	sta		player_screen_x
	sta		player_screen_y
	sta		keypress
	jsr		spawn_items

	; Initial map rendering
	jsr		update_map_screen
	jsr		blit_player

	; Main game loop
	main_loop:
		; Debug, load location info into registers
		lda		player_map_x
		asl
		asl
		asl
		asl
		ora		player_screen_x
		tax
		lda		player_map_y
		asl
		asl
		asl
		asl
		ora		player_screen_y
		tay

		; Wait for input
		input_loop:
			lda		keypress
			beq		input_loop
			ldx		#0
			stx		keypress

		; Act on input (key code in A)
		cmp		#97					; Move left
		bne		test_input_1
			jmp		input_do_move_left
		test_input_1:
		cmp		#104				; Move left
		bne		test_input_2
			jmp		input_do_move_left
		test_input_2:
		cmp		#100				; Move right
		bne		test_input_3
			jmp		input_do_move_right
		test_input_3:
		cmp		#108				; Move right
		bne		test_input_4
			jmp		input_do_move_right
		test_input_4:
		cmp		#119				; Move up
		bne		test_input_5
			jmp		input_do_move_up
		test_input_5:
		cmp		#107				; Move up
		bne		test_input_6
			jmp		input_do_move_up
		test_input_6:
		cmp		#115				; Move down
		bne		test_input_7
			jmp		input_do_move_down
		test_input_7:
		cmp		#106				; Move down
		bne		test_input_8
			jmp		input_do_move_down
		test_input_8:
		jmp		input_loop

; Input handlers
input_do_move_left:
	lda		#2
	ldx		player_screen_x
	ldy		player_screen_y
	dex
	jsr		move_player
	jmp		main_loop
input_do_move_right:
	lda		#1
	ldx		player_screen_x
	ldy		player_screen_y
	inx
	jsr		move_player
	jmp		main_loop
input_do_move_up:
	lda		#3
	ldx		player_screen_x
	ldy		player_screen_y
	dey
	jsr		move_player
	jmp		main_loop
input_do_move_down:
	lda		#0
	ldx		player_screen_x
	ldy		player_screen_y
	iny
	jsr		move_player
	jmp		main_loop

end:
	jmp		end

;
;
; palette_rotate_effect
;
; Rotate all colors in the framebuffer
;
; Uses
;	$2 - $3	Framebuffer pointer
;	$4		Itterations counter
;	$5		Step
;	$6		Itterations
;
; Inputs
;	A		Palette rotation step
;	X		Number of itterations
palette_rotate_effect_max_fb_page:		dcb $00
palette_rotate_effect:
	sta		$5
	stx		$6
	; Loop through itterations
	lda		#0
	sta		$4
	palette_rotate_effect_itter_loop:
		lda		#<frame_buffer
		sta		$2
		lda		#>frame_buffer
		sta		$3
		; Loop through pixels
		ldx		#0
		palette_rotate_effect_pixel_page_loop:
			ldy		#0
			palette_rotate_effect_pixel_loop:
				lda		($2),y
				clc
				adc		$5
				sta		($2),y
				iny
				bne		palette_rotate_effect_pixel_loop
			; Page step
			inc		$3
			inx
			cpx		#4
			bne		palette_rotate_effect_pixel_page_loop
		; Itteration step
		inc		$4
		lda		$4
		cmp		$6
		bne		palette_rotate_effect_itter_loop
	rts

;
;
; spawn_items
;
; Spawns items everywhere
;
;
spawn_items:
	lda		#0
	jsr		spawn_item
	lda		#1
	jsr		spawn_item
	lda		#2
	jsr		spawn_item
	lda		#3
	jsr		spawn_item
	lda		#4
	jsr		spawn_item
	rts

;
;
; spawn_item
;
; Spawns a single item
;
; Uses
;	$2 - $3	The item\'s address in the item RAM area
;
; Inputs
;	A		The item number to spawn
spawn_item_number_backup:			dcb $00
spawn_item_x_backup:				dcb $00
spawn_item_y_backup:				dcb $00
spawn_item:
	sta		spawn_item_number_backup
	jsr		get_random_spawn_location
	stx		spawn_item_x_backup
	sty		spawn_item_y_backup

	; Calculate the item\'s RAM address
	lda		spawn_item_number_backup
	asl
	asl
	asl
	clc
	adc		#<item_ram
	sta		$2
	lda		#0
	adc		#>item_ram
	sta		$3

	; X location
	ldy		#0
	lda		spawn_item_x_backup
	lsr
	lsr
	lsr
	lsr
	sta		($2),y
	iny
	lda		spawn_item_x_backup
	and		#$0f
	sta		($2),y

	; Y location
	iny
	lda		spawn_item_y_backup
	lsr
	lsr
	lsr
	lsr
	sta		($2),y
	iny
	lda		spawn_item_y_backup
	and		#$0f
	sta		($2),y

	rts

;
;
; get_random_spawn_location
;
; Gets a random spawn location for a given item
;
; Uses
;	$2 - $3	The base address in the spawn location table
;
; Inputs
;	A		The item number to spawn
;
; Outputs
;	X		The X location byte
;	Y		The Y location bytes
get_random_spawn_location:
	; Calculate the base address in the spawn location table
	asl
	asl
	asl
	asl
	asl
	clc
	adc		#<spawn_points
	sta		$2
	lda		#0
	adc		#>spawn_points
	sta		$3

	; Get a random number between 0 and 15
	lda		random
	and		#$0f


	; Convert to the offset
	asl


	; X location byte
	tay
	lda		($2),y
	tax

	; Y location bytes
	iny
	lda		($2),y
	tay

	rts

;
;
; End of Game
;
;
end_of_game_count:		dcb $00
end_of_game:
	; Does the player have the crown and death star?
	ldx		#0
	lda		item_flags,x
	beq		end_of_game_loose
	inx
	lda		item_flags,x
	beq		end_of_game_loose

	; Win routine
	lda		#1
	ldx		#32
	jsr		palette_rotate_effect
	jmp		end

	; Loose routine
	end_of_game_loose:
	lda		#0
	sta		end_of_game_count
	end_of_game_loose_loop:
		lda		#7
		ldx		#1
		jsr		palette_rotate_effect
		lda		#9
		ldx		#1
		jsr		palette_rotate_effect
		inc		end_of_game_count
		lda		end_of_game_count
		cmp		#8
		bne		end_of_game_loose_loop
	lda		#7
	ldx		#1
	jsr		palette_rotate_effect
	jmp		end

;
;
; move_player
;
; Handles moving the player to a new location
;
; Inputs
;	A		The new direction code of the player
;			0 = Down, 1 = Right, 2 = Left, 3 = Up
;	X		The new screen X location of the player
;	Y		The new screen Y location of the player
move_player_direction:		dcb $00
move_player_x:				dcb $00
move_player_y:				dcb $00
move_player:
	sta		move_player_direction
	stx		move_player_x
	sty		move_player_y


	; Check for Out of Bounds move
	lda		move_player_x
	bpl		move_player_bounds_1	; Went off left side of screen
		dec		player_map_x
		lda		#7
		sta		move_player_x
		jsr		update_map_screen
	move_player_bounds_1:
	cmp		#8
	bmi		move_player_bounds_2	; Went off right side of screen
		inc		player_map_x
		lda		#0
		sta		move_player_x
		jsr		update_map_screen
	move_player_bounds_2:
	lda		move_player_y
	bpl		move_player_bounds_3	; Went off top side of screen
		dec		player_map_y
		lda		#7
		sta		move_player_y
		jsr		update_map_screen
	move_player_bounds_3:
	cmp		#8
	bmi		move_player_bounds_4	; Went off bottom side of screen
		inc		player_map_y
		lda		#0
		sta		move_player_y
		jsr		update_map_screen
	move_player_bounds_4:

	; Clear previous location
	ldx		player_screen_x
	ldy		player_screen_y
	jsr		clear_screen_position

	; Test location for moveability
	; Calculate screen RAM offset to get tile color
	lda		move_player_y
	asl
	asl
	asl
	ora		move_player_x
	tay
	ldx		screen_ram,y		; Now X is the tile color
	lda		tile_flags,x		; Load the tile flags into A
	lsr
	bcs		move_player_do_move	; If the walkable flag is set, continue
		jmp		move_player_skip_move
	move_player_do_move:
		ldx		move_player_x
		ldy		move_player_y
		stx		player_screen_x
		sty		player_screen_y
	move_player_skip_move:

	; Update the position and sprite
	ldx		player_screen_x
	ldy		player_screen_y
	lda		player_sprite
	and		#$fc
	ora		move_player_direction
	sta		player_sprite
	jsr		blit_sprite

	; Check for Items and Act on Them
	lda		player_screen_x
	cmp		screen_item_x
	bne		move_player_skip_item
	lda		player_screen_y
	cmp		screen_item_y
	bne		move_player_skip_item
	jsr		take_screen_item
	move_player_skip_item:

	; At end of game check
	lda		player_map_x
	cmp		#$08
	bne		move_player_skip_eog
	lda		player_map_y
	cmp		#$0d
	bne		move_player_skip_eog
	lda		player_screen_x
	cmp		#$03
	bne		move_player_skip_eog
	lda		player_screen_y
	cmp		#$04
	bne		move_player_skip_eog
	jsr		end_of_game
	move_player_skip_eog:

	rts

;
;
; take_screen_item
;
; Called when the player has stepped onto the item on this screen.
;
; Uses
;	$2 - $3	Base pointer into the item patch table
;	$4 - $5	Patch pointer
;	$6		Temp
take_screen_item_idx:			dcb $00
take_screen_item_patch:			dcb $00
take_screen_item:
	; Remove the item from the screen
	lda		screen_item_idx
	sta		take_screen_item_idx
	lda		#$ff
	sta		screen_item_x
	sta		screen_item_y
	sta		screen_item_idx

	; Remove the item from the map
	lda		take_screen_item_idx
	asl
	asl
	asl
	tax
	lda		#$ff
	sta		item_ram,x
	inx
	sta		item_ram,x
	inx
	sta		item_ram,x
	inx
	sta		item_ram,x
	inx
	sta		item_ram,x

	; Calculate the base offset into the item patch table
	lda		take_screen_item_idx
	asl
	asl
	asl
	asl
	asl
	clc
	adc		#<item_patch_data
	sta		$2
	lda		#0
	adc		#>item_patch_data
	sta		$3

	; Itterate through all patches
	lda		#0
	ldy		#0
	sta		take_screen_item_patch
	take_screen_item_patch_loop:
		; Validate the patch is valid
		lda		($2),y
		bpl		take_screen_item_valid_patch
			; Skip over this patch
			iny
			iny
			iny
			iny
			jmp		take_screen_item_next_patch
		take_screen_item_valid_patch:

		; Calculate the patch pointer
		lda		($2),y
		tax
		lda		item_patch_table_lo,x
		sta		$4
		lda		item_patch_table_hi,x
		sta		$5
		iny
		clc
		lda		($2),y
		adc		$4
		sta		$4
		iny
		lda		($2),y
		adc		$5
		sta		$5
		iny

		; Do the patch
		lda		($2),y
		iny
		sty		$6
		ldy		#0
		sta		($4),y
		ldy		$6

		; Go to the next patch
		take_screen_item_next_patch:
		inc		take_screen_item_patch
		lda		take_screen_item_patch
		cmp		#8
		bne		take_screen_item_patch_loop

	lda		#1
	ldx		#16
	jsr		palette_rotate_effect
	jsr		render_screen
	lda		player_sprite
	ldx		player_screen_x
	ldy		player_screen_y
	jsr		blit_sprite

	rts

;
;
; clear_screen_position
;
; Redraws a single location on the current screen
;
; Uses
;	$2 - $3	Frame buffer base address
;	$4		X location
;	$5		Y location
;	$6		Tile color
;
; Inputs
;	X		X location
;	Y		Y location
clear_screen_position:
	stx		$4
	sty		$5

	; Calculate the screen RAM offset and get the tile color
	tya
	asl
	asl
	asl
	ora		$4
	tay
	lda		screen_ram,y
	sta		$6

	; Calculate the framebuffer base offset
	asl		$4
	asl		$4
	asl		$5
	asl		$5
	lda		$5
	asl
	asl
	asl
	asl
	asl
	ora		$4
	sta		$2
	lda		$5
	lsr
	lsr
	lsr
	clc
	adc		#>frame_buffer
	sta		$3


	; Itterate rows
	ldx		#0
	ldy		#0
	clear_screen_position_row_loop:
		lda		$6
		sta		($2),y
		iny
		sta		($2),y
		iny
		sta		($2),y
		iny
		sta		($2),y
		tya
		clc
		adc		#29
		tay
		inx
		cpx		#4
		bne		clear_screen_position_row_loop

	rts

;
;
; blit_player
;
; Blits the player\'s sprite to the screen
;
;
blit_player:
	lda		player_sprite
	ldx		player_screen_x
	ldy		player_screen_y
	jsr		blit_sprite
	rts

;
;
; update_map_screen
;
; Loads and renders the player\'s current map screen
;
;
update_map_screen:
	; Render the screen
	ldx		player_map_x
	ldy		player_map_y
	jsr		load_map_screen
	jsr		render_screen
	rts

;
;
; blit_sprite
;
; Blits a sprite to the frame buffer
;
; Uses
;
; Inputs
;	A		Sprite number
;	X		X screen coordinate
;	Y		Y screen coordinate
blit_sprite:
	; Set up framebuffer offset
	sta		$6
	tya
	asl
	asl
	tay			; Now we have the pixel row, so make the row base offset
	asl
	asl
	asl
	asl
	asl
	sta		$2
	tya
	lsr
	lsr
	lsr
	clc
	adc		#>frame_buffer
	sta		$3	; Now we have the base row offset, add the collumn offset
	txa
	asl
	asl
	ora		$2
	sta		$2

	; Set up sprite data pointer
	lda		#<sprite_data
	sta		$4
	lda		#>sprite_data
	sta		$5
	lda		$6
	asl
	asl
	asl
	clc
	adc		$4
	sta		$4
	lda		$5
	adc		#0
	sta		$5

	; Itterate bytes
	ldy		#0
	ldx		#0
	blit_sprite_byte_loop:
		; Blat out the pixels
		lda		($4),y
		lsr
		lsr
		lsr
		lsr
		beq		blit_sprite_skip_pixel_1
			sta		($2,x)
		blit_sprite_skip_pixel_1:
		inc		$2
		lda		($4),y
		and		#$0f
		beq		blit_sprite_skip_pixel_2
			sta		($2,x)
		blit_sprite_skip_pixel_2:
		inc		$2
		; Step to next byte
		iny
		; If we are on an even byte, step the framebuffer pointer
		tya
		and		#$01
		bne		blit_sprite_fbinc_skip
			clc
			lda		$2
			adc		#28
			sta		$2
			lda		$3
			adc		#0
			sta		$3
		blit_sprite_fbinc_skip:
		cpy		#8
		bne		blit_sprite_byte_loop
	rts

;
;
; load_map_screen
;
; Loads a map screen from the world map into the screen RAM
;
; Uses
;	$2 - $3	Item RAM pointer
;	$4		Temp variable
;	$5		Item Map X
;	$6		Item Screen X
;	$7		Item Map Y
;	$8		Item Screen Y
;	$9		Item Idx
;
; Calls load_screen
;
; Inputs
;	X		X world coordinate
;	Y		Y world coordinate
load_map_screen_x:			dcb $00
load_map_screen_y:			dcb $00
load_map_screen:
	; Wrap coordinates
	tya
	and		#$0f
	tay
	txa
	and		#$0f
	tax
	sty		load_map_screen_y
	stx		load_map_screen_x

	; Calculate the offset into the world map table
	tya
	asl
	asl
	asl
	asl
	stx		$2
	ora		$2
	tax

	; Get the screen number and load
	lda		world_map,x
	jsr		load_screen

	; Clear out the screen item variables
	lda		#$ff
	sta		screen_item_x
	sta		screen_item_y
	sta		screen_item_idx

	; Itterate through all items to see if we have an item on this
	; screen.
	lda		#<item_ram
	sta		$2
	lda		#>item_ram
	sta		$3
	ldx		#0
	load_screen_item_loop:
		txa
		asl
		asl
		asl
		tay
		lda		($2),y
		sta		$5
		iny
		lda		($2),y
		sta		$6
		iny
		lda		($2),y
		sta		$7
		iny
		lda		($2),y
		sta		$8
		iny
		lda		($2),y
		sta		$9
		lda		$5
		cmp		load_map_screen_x
		bne		load_screen_item_skip
		lda		$7
		cmp		load_map_screen_y
		bne		load_screen_item_skip
		; Now we have an item that is on this map, put that item\'s
		; info into the screen item variables.
		lda		$6
		sta		screen_item_x
		lda		$8
		sta		screen_item_y
		lda		$9
		sta		screen_item_idx
		; And go to the next item
		load_screen_item_skip:
		inx
		cpx		#8
		bne		load_screen_item_loop
	rts

;
;
; load_screen
;
; Decompresses a screen into the screen RAM
;
; Uses
;	$2 - $3	Map data pointer
;
; Inputs
; 	A		Screen number to load
load_screen:
	; Calculate base screen data offset
	tay
	asl
	asl
	asl
	asl
	asl
	sta		$2
	tya
	lsr
	lsr
	lsr
	sta		$3
	clc
	lda		$2
	adc		#<screen_data
	sta		$2
	lda		$3
	adc		#>screen_data
	sta		$3


	; Itterate through all bytes
	ldy		#0
	ldx		#0
	load_screen_byte_loop:
		lda		($2),y
		lsr
		lsr
		lsr
		lsr
		sta		screen_ram,x
		inx
		lda		($2),y
		and		#$0f
		sta		screen_ram,x
		inx
		iny
		cpy		#32
		bne		load_screen_byte_loop
	rts

;
;
; render_screen
;
; Renders the entire screen from RAM to the display as well as any
; item that may be present.
;
; Uses $2 - $3
;
;
render_screen:
	; Set up the base screen offset
	lda		#<frame_buffer
	sta		$2
	lda		#>frame_buffer
	sta		$3

	; Itterate through all tiles
	ldx		#0
	render_screen_tile_loop:
		; Blat out the pixels
		ldy		#0
		lda		screen_ram,x
		sta		($2),y
		iny
		sta		($2),y
		iny
		sta		($2),y
		iny
		sta		($2),y
		tya
		clc
		adc		#29
		tay
		lda		screen_ram,x
		sta		($2),y
		iny
		sta		($2),y
		iny
		sta		($2),y
		iny
		sta		($2),y
		tya
		clc
		adc		#29
		tay
		lda		screen_ram,x
		sta		($2),y
		iny
		sta		($2),y
		iny
		sta		($2),y
		iny
		sta		($2),y
		tya
		clc
		adc		#29
		tay
		lda		screen_ram,x
		sta		($2),y
		iny
		sta		($2),y
		iny
		sta		($2),y
		iny
		sta		($2),y
		; Go to the next tile
		inx
		; Update the screen base offset
		clc
		lda		$2
		adc		#4
		sta		$2
		lda		$3
		adc		#0
		sta		$3
		; If we have gone to a new row, jump ahead
		txa
		and		#$07
		bne		render_screen_skip_row_adjust
			clc
			lda		$2
			adc		#96
			sta		$2
			lda		$3
			adc		#0
			sta		$3
		render_screen_skip_row_adjust:
		cpx		#64
		bne		render_screen_tile_loop

	; Render the on-screen item if one is present
	lda		screen_item_idx
	bmi		render_screen_skip_item
	; Add 4 to the item number to get the item sprite number
	clc
	adc		#4
	ldx		screen_item_x
	ldy		screen_item_y
	jsr		blit_sprite

	render_screen_skip_item:
	rts


;
;
; DATA
;
;


world_map:
;   0   1   2   3   4   5   6   7   8   9   a   b   c   d   e   f
dcb $04,$02,$00,$02,$00,$02,$00,$07,$17,$0f,$18,$19,$19,$19,$1a,$14 ; 0
dcb $04,$03,$08,$03,$05,$01,$ff,$0b,$16,$0e,$15,$14,$17,$0f,$13,$12 ; 1
dcb $ff,$01,$01,$06,$01,$06,$ff,$0c,$0f,$0f,$13,$12,$1b,$1c,$0e,$11 ; 2
dcb $ff,$06,$0a,$00,$09,$00,$ff,$0d,$0e,$0e,$10,$11,$16,$1d,$19,$1e ; 3
dcb $ff,$ff,$ff,$ff,$45,$43,$43,$43,$40,$3d,$36,$3a,$2c,$25,$25,$1f ; 4
dcb $ff,$ff,$ff,$ff,$45,$43,$40,$43,$37,$3e,$37,$3b,$2d,$2f,$30,$21 ; 5
dcb $ff,$ff,$ff,$ff,$46,$43,$37,$43,$41,$38,$38,$3c,$2e,$26,$27,$20 ; 6
dcb $ff,$ff,$ff,$ff,$47,$44,$44,$44,$42,$3f,$39,$39,$31,$28,$29,$21 ; 7
dcb $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$32,$22,$22,$20 ; 8
dcb $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$33,$2a,$2b,$20 ; 9
dcb $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$32,$28,$29,$21 ; a
dcb $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$33,$22,$22,$20 ; b
dcb $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$48,$4f,$4f,$4e,$32,$26,$27,$21 ; c
dcb $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$49,$4a,$50,$51,$34,$28,$29,$21 ; d
dcb $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$4b,$4c,$4e,$4b,$32,$22,$22,$20 ; e
dcb $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$4a,$4d,$4a,$4d,$35,$24,$24,$23 ; f

screen_data:
;   0   1   2   3   4   5   6   7   8   9   10  11  12  13  14  15  16  17  18  19  20  21  22  23  24  25  26  27  28  29  30  31
dcb $55,$55,$55,$55,$55,$dd,$dd,$55,$dd,$99,$d9,$d9,$99,$99,$99,$99,$99,$99,$99,$99,$9d,$d9,$99,$dd,$55,$dd,$dd,$55,$55,$55,$55,$55 ; $00 Forest, E/W Path
dcb $55,$d9,$9d,$55,$55,$99,$9d,$55,$5d,$99,$9d,$d5,$5d,$99,$99,$d5,$5d,$9d,$99,$d5,$5d,$99,$99,$d5,$55,$d9,$99,$55,$55,$d9,$9d,$55 ; $01 Forest, N/S Path
dcb $55,$55,$55,$55,$55,$dd,$dd,$55,$d9,$99,$99,$9d,$99,$d9,$99,$99,$99,$99,$99,$99,$d9,$99,$d9,$99,$5d,$99,$99,$d5,$55,$d9,$9d,$55 ; $02 Forest, E/W/S Path
dcb $55,$d9,$9d,$55,$5d,$99,$99,$55,$99,$99,$99,$d5,$99,$9d,$99,$d5,$d9,$99,$99,$d5,$dd,$99,$99,$d5,$5d,$d9,$9d,$55,$55,$dd,$9d,$55 ; $03 Forest, N/S/W Path
dcb $55,$55,$55,$55,$55,$dd,$dd,$55,$5d,$d9,$99,$dd,$5d,$99,$99,$99,$5d,$99,$d9,$99,$5d,$d9,$99,$d9,$55,$dd,$dd,$55,$55,$55,$55,$55 ; $04 Forest, Dead End E
dcb $55,$55,$55,$55,$55,$d9,$dd,$55,$5d,$9d,$9d,$d5,$5d,$d9,$d9,$d5,$5d,$d9,$99,$d5,$5d,$9d,$d9,$d5,$55,$d9,$9d,$55,$55,$dd,$99,$55 ; $05 Forest, Dead End S
dcb $55,$99,$9d,$55,$55,$99,$9d,$55,$5d,$d9,$99,$d5,$5d,$99,$d9,$d5,$5d,$d9,$99,$d5,$5d,$9d,$9d,$d5,$55,$dd,$dd,$55,$55,$55,$55,$55 ; $06 Forest, Dead End N
dcb $55,$55,$55,$55,$55,$dd,$dd,$55,$dd,$9d,$9d,$d5,$d9,$99,$d9,$d5,$9d,$9d,$99,$d5,$d9,$d9,$9d,$d5,$5d,$dd,$dd,$d5,$55,$dd,$dd,$55 ; $07 Forest, Path W/S
dcb $55,$55,$55,$55,$55,$dd,$dd,$d5,$5d,$d9,$99,$dd,$5d,$9d,$99,$99,$5d,$99,$99,$d9,$5d,$99,$d9,$99,$55,$d9,$99,$d5,$55,$d9,$9d,$55 ; $08 Forest, Path E/S
dcb $55,$d9,$9d,$55,$5d,$d9,$99,$55,$dd,$99,$d9,$d5,$99,$9d,$99,$d5,$99,$99,$99,$d5,$dd,$99,$9d,$d5,$5d,$dd,$dd,$55,$55,$55,$55,$55 ; $09 Forest, Path N/W
dcb $55,$d9,$9d,$55,$5d,$99,$99,$d5,$5d,$9d,$9d,$9d,$5d,$99,$99,$99,$5d,$d9,$99,$99,$5d,$dd,$99,$dd,$5d,$dd,$dd,$55,$55,$55,$55,$55 ; $0a Forest, Path N/E
dcb $55,$d9,$dd,$55,$55,$9d,$d9,$d5,$5d,$dd,$dd,$d5,$55,$9d,$9d,$95,$55,$dd,$d9,$55,$55,$dd,$dd,$55,$5d,$d9,$dd,$55,$5d,$dd,$dd,$55 ; $0b Forest, River Transition 1
dcb $5d,$dd,$dd,$55,$5d,$dd,$d9,$d5,$5d,$dd,$d9,$dd,$5d,$9d,$d9,$99,$5d,$dd,$99,$ee,$55,$dd,$99,$ee,$55,$dd,$9e,$ee,$55,$5d,$9e,$e6 ; $0c Forest, River Transition 2
dcb $55,$5d,$9e,$e6,$55,$5d,$9e,$ee,$55,$5d,$9e,$ee,$55,$55,$d9,$ee,$55,$55,$d9,$99,$55,$55,$59,$9d,$55,$55,$55,$d5,$55,$55,$55,$55 ; $0d Forest, River Transition 3
dcb $66,$66,$66,$66,$e6,$6e,$e6,$6e,$ee,$ee,$ee,$ee,$ee,$ee,$ee,$ee,$99,$99,$99,$99,$dd,$9d,$dd,$9d,$55,$d5,$55,$d5,$55,$55,$55,$55 ; $0e River, E/W Channel Bottom
dcb $55,$55,$55,$55,$55,$55,$55,$d5,$d9,$dd,$dd,$dd,$99,$99,$99,$99,$ee,$ee,$ee,$ee,$ee,$ee,$ee,$ee,$e6,$ee,$66,$ee,$66,$66,$66,$66 ; $0f River, E/W Channel Top
dcb $66,$66,$66,$66,$e6,$6e,$e6,$6e,$ee,$ee,$ee,$ee,$ee,$ee,$ee,$ee,$9e,$ee,$99,$e9,$de,$ff,$ff,$9d,$5f,$ff,$ff,$f5,$11,$ff,$ff,$11 ; $10 River, White Transition
dcb $6e,$ee,$ed,$55,$ee,$ee,$ed,$d5,$ee,$ee,$e9,$d5,$ee,$ee,$99,$d5,$ee,$e9,$9d,$d5,$dd,$99,$dd,$55,$5d,$dd,$d5,$55,$55,$55,$55,$55 ; $11 River, N/W Channel
dcb $ee,$ee,$ed,$55,$ee,$ee,$9d,$55,$ee,$e9,$9d,$55,$ee,$ee,$99,$d5,$ee,$ee,$99,$d5,$ee,$e9,$9d,$55,$ee,$ee,$9d,$55,$6e,$ee,$ed,$55 ; $12 River, N/S Channel Right
dcb $55,$d9,$ee,$ee,$55,$99,$ee,$ee,$d9,$ee,$ee,$ee,$99,$ee,$ee,$ee,$ee,$ee,$ee,$ee,$ee,$ee,$ee,$ee,$e6,$6e,$e6,$ee,$66,$66,$66,$66 ; $13 River, N/W Channel Join E
dcb $55,$55,$55,$55,$5d,$dd,$d5,$55,$d9,$99,$9d,$d5,$e9,$99,$99,$d5,$ee,$ee,$99,$d5,$ee,$ee,$e9,$d5,$ee,$ee,$e9,$55,$ee,$ee,$ed,$55 ; $14 River, S/W Channel
dcb $6e,$ee,$9d,$55,$ee,$ee,$99,$d5,$ee,$ee,$e9,$9d,$ee,$ee,$ee,$99,$99,$ee,$ee,$ee,$d9,$9e,$ee,$ee,$5d,$99,$ee,$ee,$55,$d9,$ee,$ee ; $15 River, SE/NW Gap
dcb $55,$de,$ee,$e6,$55,$d9,$ee,$ee,$5d,$99,$ee,$ee,$5d,$99,$9e,$ee,$5d,$99,$99,$9e,$5d,$9d,$d9,$dd,$55,$d5,$5d,$d5,$55,$55,$55,$55 ; $16 River, N/E Channel
dcb $55,$55,$55,$55,$55,$5d,$dd,$d5,$55,$dd,$dd,$dd,$5d,$dd,$99,$9e,$5d,$d9,$9e,$ee,$5d,$d9,$ee,$ee,$5d,$d9,$ee,$ee,$55,$de,$ee,$e6 ; $17 River, E/S
dcb $55,$55,$55,$55,$5d,$dd,$dd,$dd,$dd,$dd,$99,$99,$99,$99,$ee,$ee,$ee,$ee,$ee,$ee,$ee,$ee,$ee,$99,$ee,$ee,$e9,$dd,$6e,$ee,$9d,$55 ; $18 River, Gulch Transition West
dcb $55,$55,$55,$55,$dd,$99,$dd,$dd,$99,$ee,$99,$99,$ee,$ee,$ee,$ee,$ee,$ee,$ee,$ee,$99,$99,$9e,$e9,$dd,$dd,$d9,$9d,$55,$55,$55,$55 ; $19 River, Gulch
dcb $55,$55,$55,$55,$dd,$dd,$dd,$55,$99,$99,$99,$dd,$ee,$ee,$99,$99,$ee,$ee,$e9,$9e,$99,$ee,$ee,$ee,$dd,$9e,$ee,$ee,$55,$d9,$ee,$ee ; $1a River, Gulch Transition East
dcb $55,$d9,$ee,$e6,$55,$d9,$9e,$ee,$5d,$d9,$99,$ee,$5d,$99,$ee,$ee,$55,$9e,$ee,$ee,$55,$9e,$ee,$e6,$5d,$d9,$ee,$66,$55,$d9,$ee,$e6 ; $1b River, Confluance SW
dcb $66,$66,$66,$66,$e6,$6e,$e6,$6e,$ee,$ee,$ee,$ee,$ee,$ee,$ee,$ee,$ee,$ee,$ee,$99,$6e,$ee,$e9,$9d,$6e,$ee,$99,$d5,$6e,$e9,$99,$d5 ; $1c River, Confluance SE
dcb $6e,$e9,$99,$d5,$ee,$97,$77,$dd,$ee,$97,$77,$d9,$ee,$e9,$99,$9e,$ee,$ee,$ee,$ee,$dd,$d9,$99,$99,$55,$5d,$dd,$dd,$55,$55,$55,$55 ; $1d River, Gluch Transition South by West
dcb $55,$55,$56,$66,$dd,$d9,$66,$66,$99,$9e,$ee,$66,$ee,$ee,$e7,$e6,$ee,$ee,$77,$e8,$9e,$e7,$7e,$e8,$d9,$77,$77,$88,$57,$77,$78,$88 ; $1e River, Desert Transition
dcb $88,$77,$77,$88,$87,$77,$78,$88,$77,$77,$78,$88,$77,$77,$77,$88,$77,$77,$78,$88,$77,$77,$88,$88,$77,$77,$78,$88,$77,$77,$77,$88 ; $1f Desert, Entrance
dcb $77,$77,$77,$88,$77,$77,$78,$88,$77,$87,$88,$88,$77,$78,$88,$88,$77,$77,$88,$88,$77,$77,$88,$88,$78,$77,$78,$88,$77,$77,$77,$88 ; $20 Desert, East Wall 1
dcb $77,$77,$77,$88,$77,$77,$78,$88,$77,$77,$88,$88,$77,$77,$78,$88,$78,$77,$77,$88,$77,$77,$78,$88,$77,$77,$78,$88,$77,$77,$77,$88 ; $21 Desert, East Wall 2
dcb $77,$77,$77,$77,$77,$77,$77,$77,$77,$77,$77,$77,$77,$77,$77,$77,$77,$77,$77,$77,$77,$77,$77,$77,$77,$77,$77,$77,$77,$77,$77,$77 ; $22 Desert, Center
dcb $77,$77,$77,$88,$77,$87,$78,$88,$78,$77,$88,$88,$77,$77,$88,$88,$77,$78,$88,$88,$78,$88,$88,$88,$88,$88,$88,$88,$88,$88,$88,$88 ; $23 Desert, SE Wall
dcb $77,$77,$77,$77,$77,$77,$77,$77,$77,$78,$77,$87,$77,$77,$77,$77,$77,$77,$78,$77,$78,$87,$77,$77,$88,$88,$88,$88,$88,$88,$88,$88 ; $24 Desert, South Wall
dcb $88,$88,$88,$88,$88,$88,$88,$88,$78,$88,$87,$87,$77,$88,$77,$77,$77,$77,$77,$77,$77,$77,$78,$77,$77,$87,$77,$77,$77,$77,$77,$77 ; $25 Desert, North Wall
dcb $77,$77,$77,$77,$77,$77,$77,$77,$77,$77,$77,$77,$77,$77,$77,$77,$77,$77,$77,$78,$77,$77,$78,$88,$77,$77,$78,$88,$77,$77,$88,$88 ; $26 Desert, Rock Formation 1, NW
dcb $77,$77,$77,$77,$77,$77,$77,$77,$77,$77,$77,$77,$77,$77,$77,$77,$87,$77,$77,$77,$88,$77,$77,$77,$88,$87,$77,$77,$88,$87,$77,$77 ; $27 Desert, Rock Formation 1, NE
dcb $77,$77,$88,$88,$77,$77,$78,$88,$77,$77,$77,$88,$77,$77,$77,$78,$77,$77,$77,$88,$77,$77,$77,$77,$77,$77,$77,$77,$77,$77,$77,$77 ; $28 Desert, Rock Formation 1/2, SW
dcb $88,$87,$77,$77,$88,$77,$77,$77,$88,$87,$77,$77,$88,$87,$77,$77,$87,$77,$77,$77,$77,$77,$77,$77,$77,$77,$77,$77,$77,$77,$77,$77 ; $29 Desert, Rock Formation 1/2, SE
dcb $77,$77,$77,$77,$78,$77,$77,$87,$78,$88,$78,$88,$77,$88,$88,$88,$77,$78,$87,$78,$77,$88,$77,$77,$77,$88,$87,$78,$77,$77,$88,$88 ; $2a Desert, Rock Formation 2, NW
dcb $77,$77,$77,$77,$77,$78,$88,$87,$87,$88,$87,$77,$88,$88,$77,$87,$88,$87,$78,$87,$77,$77,$88,$87,$88,$88,$88,$77,$88,$87,$77,$77 ; $2b Desert, Rock Formation 2, NE
dcb $18,$88,$88,$88,$18,$78,$88,$88,$17,$77,$88,$87,$11,$77,$78,$77,$ff,$17,$77,$77,$11,$77,$77,$87,$17,$78,$77,$77,$17,$77,$77,$77 ; $2c Desert, White Wall N/NE
dcb $17,$77,$77,$77,$17,$71,$11,$77,$17,$11,$f1,$17,$11,$1f,$ff,$11,$ff,$ff,$ff,$ff,$11,$1f,$ff,$11,$17,$1f,$ff,$17,$17,$1f,$ff,$17 ; $2d Desert, White Bastion 1, N
dcb $17,$1f,$ff,$17,$17,$1f,$ff,$17,$11,$1f,$ff,$17,$ff,$ff,$ff,$17,$11,$1f,$ff,$17,$17,$11,$f1,$17,$17,$71,$11,$77,$17,$77,$77,$77 ; $2e Desert, White Bastion 1, S
dcb $77,$77,$77,$77,$71,$11,$11,$11,$71,$ff,$ff,$ff,$11,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$11,$ff,$ff,$ff,$71,$11,$11,$11,$77,$77,$77,$77 ; $2f Desert, White Bastion 2, W
dcb $77,$77,$77,$77,$11,$11,$11,$17,$ff,$ff,$ff,$17,$ff,$ff,$ff,$17,$ff,$ff,$ff,$17,$ff,$ff,$ff,$17,$11,$11,$11,$17,$77,$77,$77,$77 ; $30 Desert, White Bastion 2, E
dcb $17,$77,$77,$77,$17,$77,$77,$77,$11,$77,$77,$77,$ff,$17,$77,$77,$11,$77,$77,$77,$17,$77,$77,$77,$17,$77,$77,$77,$17,$77,$77,$77 ; $31 Desert, White Wall S/SE
dcb $b7,$77,$77,$77,$b7,$77,$77,$77,$b7,$77,$77,$77,$b7,$77,$77,$77,$b7,$77,$77,$77,$b7,$77,$77,$77,$b7,$77,$77,$77,$b7,$77,$77,$77 ; $32 Desert, Black Wall
dcb $b7,$77,$77,$77,$b7,$77,$77,$77,$bb,$bb,$bb,$77,$ff,$ff,$fb,$77,$fb,$bb,$fb,$77,$ff,$ff,$fb,$77,$bb,$bb,$bb,$77,$b7,$77,$77,$77 ; $33 Desert, Black Bastion
dcb $b7,$77,$77,$77,$bb,$bb,$f7,$77,$bb,$bb,$ff,$77,$fb,$ff,$ff,$77,$bb,$bb,$ff,$77,$bb,$bb,$f7,$77,$b7,$77,$77,$77,$b7,$77,$77,$77 ; $34 Desert, Black Gate
dcb $b7,$77,$77,$77,$b8,$78,$77,$77,$b8,$77,$87,$77,$b8,$87,$88,$77,$b8,$88,$77,$77,$b8,$88,$88,$77,$b8,$88,$88,$88,$b8,$88,$88,$88 ; $35 Desert, Black Wall SW
dcb $11,$ff,$ff,$11,$1d,$ff,$ff,$d1,$1d,$df,$fd,$d1,$1d,$df,$fd,$d1,$1d,$ff,$ff,$d1,$11,$1f,$f1,$11,$11,$11,$11,$11,$11,$1f,$f1,$11 ; $36 White, Gate
dcb $11,$1f,$f1,$11,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$11,$11,$11,$11,$11,$11,$11,$11,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$11,$11,$11,$11 ; $37 White, W/E w/ N Door
dcb $11,$11,$11,$11,$1f,$ff,$ff,$f1,$1f,$ff,$ff,$f1,$1f,$f1,$1f,$f1,$1f,$f1,$1f,$f1,$1f,$f1,$1f,$f1,$1f,$f1,$1f,$f1,$1f,$f1,$11,$11 ; $38 White, S Snail
dcb $1f,$f1,$11,$11,$1f,$f1,$1f,$f1,$1f,$f1,$1f,$f1,$ff,$f1,$1f,$ff,$1f,$f1,$1f,$f1,$1f,$ff,$ff,$f1,$1f,$ff,$ff,$f1,$11,$11,$11,$11 ; $39 White, N Snail w/ E/W Doors
dcb $11,$11,$11,$11,$1f,$ff,$ff,$f1,$1f,$ff,$ff,$f1,$1f,$f1,$1f,$f1,$1f,$f1,$1f,$ff,$1f,$f1,$1f,$f1,$1f,$f1,$1f,$f1,$1f,$f1,$11,$11 ; $3a White, S Snail w/ E Door
dcb $1f,$f1,$11,$11,$ff,$f1,$1f,$f1,$ff,$f1,$1f,$f1,$1f,$f1,$1f,$f1,$1f,$f1,$1f,$ff,$ff,$f1,$1f,$f1,$ff,$f1,$1f,$f1,$11,$11,$1f,$f1 ; $3b White, 11x5
dcb $11,$11,$1f,$f1,$1f,$f1,$1f,$f1,$1f,$ff,$ff,$f1,$1f,$ff,$ff,$ff,$1f,$ff,$ff,$f1,$1f,$f1,$1f,$f1,$1f,$f1,$1f,$f1,$1f,$f1,$11,$11 ; $3c White, 11x6
dcb $11,$11,$11,$11,$ff,$ff,$ff,$f1,$ff,$ff,$ff,$f1,$11,$11,$1f,$f1,$11,$11,$1f,$f1,$ff,$f1,$1f,$f1,$ff,$f1,$1f,$f1,$1f,$f1,$1f,$f1 ; $3d White, Dual W/S Hall
dcb $1f,$f1,$1f,$f1,$ff,$f1,$1f,$ff,$ff,$f1,$1f,$ff,$11,$11,$11,$11,$11,$11,$11,$11,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$11,$11,$11,$11 ; $3e White, W/E, Dual N Hall
dcb $1f,$f1,$11,$11,$ff,$f1,$1f,$f1,$ff,$f1,$1f,$f1,$11,$11,$1f,$ff,$11,$11,$1f,$f1,$ff,$ff,$ff,$f1,$ff,$ff,$ff,$f1,$11,$11,$11,$11 ; $3f White, Dual W, N w/ E Door
dcb $11,$11,$11,$11,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$11,$1f,$f1,$11,$11,$1f,$f1,$11,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$11,$1f,$f1,$11 ; $40 White, Dual W/E, S Hall
dcb $11,$11,$11,$11,$ff,$ff,$ff,$f1,$ff,$ff,$ff,$f1,$11,$11,$1f,$f1,$11,$11,$1f,$f1,$ff,$ff,$ff,$f1,$ff,$ff,$ff,$f1,$11,$1f,$f1,$11 ; $41 White, Daul W, S Hall
dcb $11,$1f,$f1,$11,$1f,$ff,$ff,$ff,$1f,$ff,$ff,$ff,$1f,$f1,$11,$11,$1f,$f1,$11,$11,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$11,$11,$11,$11 ; $42 White, W, Dual E, N Hall
dcb $11,$11,$11,$11,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$11,$11,$11,$11,$11,$11,$11,$11,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$11,$11,$11,$11 ; $43 White, Dual E/W Hall
dcb $11,$11,$11,$11,$1f,$ff,$ff,$f1,$1f,$ff,$ff,$f1,$1f,$ff,$ff,$f1,$1f,$ff,$ff,$f1,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$11,$11,$11,$11 ; $44 White, Cell
dcb $11,$11,$11,$11,$1f,$ff,$ff,$ff,$1f,$ff,$ff,$ff,$1f,$ff,$11,$11,$1f,$ff,$11,$11,$1f,$ff,$11,$ff,$1f,$ff,$11,$ff,$11,$11,$11,$11 ; $45 White, E Snail
dcb $11,$11,$11,$11,$1f,$ff,$ff,$ff,$1f,$ff,$ff,$ff,$1f,$f1,$11,$11,$1f,$f1,$11,$11,$1f,$f1,$1f,$ff,$1f,$f1,$1f,$ff,$1f,$f1,$11,$11 ; $46 White, E/S Hall
dcb $1f,$f1,$11,$11,$1f,$ff,$ff,$f1,$1f,$ff,$ff,$f1,$11,$11,$11,$11,$11,$11,$11,$11,$1f,$ff,$ff,$ff,$1f,$ff,$ff,$ff,$11,$11,$11,$11 ; $47 White, Cell End
dcb $bb,$bb,$bb,$bb,$bb,$bb,$bb,$bb,$bb,$ff,$fb,$bb,$bb,$ff,$ff,$ff,$bb,$ff,$fb,$bb,$bb,$bb,$bb,$bb,$bb,$bb,$bb,$bb,$bb,$bb,$bb,$bb ; $48 Black, E
dcb $bb,$bb,$bb,$bb,$bb,$bb,$bb,$bb,$bb,$ff,$fb,$bb,$bb,$ff,$fb,$bb,$bb,$ff,$fb,$bb,$bb,$bf,$bb,$bb,$bb,$bf,$bb,$bb,$bb,$bf,$bb,$bb ; $49 Black, S
dcb $bb,$bf,$bb,$bb,$bb,$bf,$bb,$bb,$bb,$ff,$fb,$bb,$bb,$ff,$ff,$ff,$bb,$ff,$fb,$bb,$bb,$bb,$bb,$bb,$bb,$bb,$bb,$bb,$bb,$bb,$bb,$bb ; $4a Black, N/E
dcb $bb,$bf,$bb,$bb,$bb,$bf,$bb,$bb,$bb,$ff,$fb,$bb,$bb,$ff,$fb,$bb,$bb,$ff,$fb,$bb,$bb,$bf,$bb,$bb,$bb,$bf,$bb,$bb,$bb,$bf,$bb,$bb ; $4b Black, N/S
dcb $bb,$bb,$bb,$bb,$bb,$bb,$bb,$bb,$bb,$ff,$fb,$bb,$bb,$ff,$ff,$ff,$bb,$ff,$fb,$bb,$bb,$bf,$bb,$bb,$bb,$bf,$bb,$bb,$bb,$bf,$bb,$bb ; $4c Black, S/E
dcb $bb,$bf,$bb,$bb,$bb,$bf,$bb,$bb,$bb,$ff,$fb,$bb,$ff,$ff,$fb,$bb,$bb,$ff,$fb,$bb,$bb,$bb,$bb,$bb,$bb,$bb,$bb,$bb,$bb,$bb,$bb,$bb ; $4d Black, N/W
dcb $bb,$bb,$bb,$bb,$bb,$bb,$bb,$bb,$bb,$ff,$fb,$bb,$ff,$ff,$fb,$bb,$bb,$ff,$fb,$bb,$bb,$bf,$bb,$bb,$bb,$bf,$bb,$bb,$bb,$bf,$bb,$bb ; $4e Black, S/W
dcb $bb,$bb,$bb,$bb,$bb,$bb,$bb,$bb,$bb,$ff,$fb,$bb,$ff,$ff,$ff,$ff,$bb,$ff,$fb,$bb,$bb,$bf,$bb,$bb,$bb,$bf,$bb,$bb,$bb,$bf,$bb,$bb ; $4f Black, S/E/W
dcb $bb,$bf,$bb,$bb,$bb,$bf,$bb,$bb,$bb,$ff,$fb,$bb,$ff,$ff,$ff,$ff,$bb,$ff,$fb,$bb,$bb,$bb,$bb,$bb,$bb,$bb,$bb,$bb,$bb,$bb,$bb,$bb ; $50 Black, N/E/W
dcb $bb,$bf,$bb,$bb,$bb,$bf,$bb,$bb,$bb,$ff,$fb,$bb,$ff,$ff,$ff,$ff,$bb,$ff,$fb,$bb,$bb,$bf,$bb,$bb,$bb,$bf,$bb,$bb,$bb,$bf,$bb,$bb ; $51 Black, N/E/S/W

sprite_data:
dcb $01,$cc,$11,$cc,$01,$cc,$01,$10 ; $00 Player Down
dcb $00,$1c,$01,$1c,$01,$1c,$00,$10 ; $01 Player Right
dcb $c1,$00,$c1,$10,$c1,$10,$01,$00 ; $02 Player Left
dcb $01,$1c,$11,$11,$01,$1c,$01,$10 ; $03 Player Up
dcb $00,$b0,$ee,$e0,$00,$0b,$0e,$ee ; $04 Flippers
dcb $01,$10,$11,$00,$01,$10,$01,$00 ; $05 White Key
dcb $0b,$0b,$bb,$bb,$00,$b0,$00,$00 ; $06 Black Key
dcb $e0,$0e,$70,$07,$77,$77,$77,$77 ; $07 Crown
dcb $00,$20,$22,$20,$02,$22,$02,$00 ; $08 Death Star
dcb $0c,$c0,$22,$22,$c2,$2c,$02,$20 ; $09 Evil Guy

; Tile flags meanings
; 0		Walkable
tile_flags:
dcb $00		; 0 Void, darkness, nothingness
dcb $00		; 1 White Castle wall
dcb $00		; 2 ???
dcb $00		; 3 ???
dcb $00		; 4 ???
dcb $00		; 5 Tress, forest
dcb $00		; 6 Deep water
dcb $01		; 7 Desert sand
dcb $00		; 8 Desert rocks
dcb $01		; 9 Dirt, road
dcb $00		; a ???
dcb $00		; b Black Castle Wall
dcb $00		; c ???
dcb $01		; d Grass
dcb $00		; e Shallow water
dcb $01		; f Castle Floor

; Spawn points.
; 16 spawn points per area
; 2 bytes per spawn point
; First byte is X position, second is Y position
; Hi-nibble of byte is map position, Lo is Screen position
spawn_points:
dcb $13,$13,$02,$13,$12,$35,$35,$15,$33,$23,$21,$12,$21,$36,$32,$32,$41,$31,$43,$24,$43,$11,$54,$25,$72,$03,$73,$16,$75,$25,$76,$36 ; Forest
dcb $b5,$35,$b5,$24,$b3,$13,$92,$15,$82,$15,$84,$04,$91,$02,$f4,$02,$f3,$15,$f2,$25,$d4,$26,$c6,$13,$c5,$22,$c3,$33,$d7,$32,$e4,$35 ; River
dcb $d2,$63,$d5,$85,$e4,$81,$e3,$97,$d5,$95,$e2,$a1,$d6,$a3,$c1,$91,$c6,$b4,$d2,$b2,$e5,$b4,$f3,$b2,$e3,$e3,$d1,$e5,$c3,$f3,$f2,$f2 ; Desert
dcb $c1,$44,$c4,$52,$c3,$53,$c5,$53,$c4,$56,$c4,$61,$c4,$65,$c3,$64,$c5,$64,$d3,$53,$d5,$53,$d7,$53,$e0,$53,$e2,$53,$e4,$53,$c1,$73 ; White Bastions
dcb $b6,$41,$b5,$51,$a6,$66,$a5,$71,$95,$71,$96,$66,$71,$71,$66,$71,$51,$71,$41,$75,$46,$72,$45,$66,$46,$54,$42,$55,$46,$46,$42,$45 ; White Castle

; Item patch data
; First byte is the table to patch, which indexes the item_patch_table_lo
; and item_patch_table_hi arrays.
; The tables are:
;	0	screen_data
;	1	sprite_data
;	2	tile_flags
;	3	object_flags
; Due to the lack of <> support for the dcb statement, we populate
; these pointers at startup time.
; The second and third bytes are the offest from the begining of the
; table to patch.
; The fourth byte is the value to insert.
; Each item has 8 patches thay may occur.
; A table index of $ff indicates that this patch is not valid.
item_patch_data:
; Flippers
dcb $02,$0e,$00,$01 ; Make shallow water walkable
dcb $01,$06,$00,$0e ; Sprite, Down, Left Foot
dcb $01,$07,$00,$e0 ; Sprite, Down, Right Foot
dcb $01,$0f,$00,$e0 ; Sprite, Right, Foot
dcb $01,$16,$00,$0e ; Sprite, Left, Foot
dcb $01,$1e,$00,$0e ; Sprite, Up, Left Foot
dcb $01,$1f,$00,$e0 ; Sprite, Up, Right Foot
dcb $ff,$ff,$ff,$ff ; Fill
; White Key
dcb $00,$d9,$06,$1f ; White castle gate 1
dcb $00,$da,$06,$f1 ; White castle gate 2
dcb $ff,$ff,$ff,$ff ; Fill
dcb $ff,$ff,$ff,$ff ; Fill
dcb $ff,$ff,$ff,$ff ; Fill
dcb $ff,$ff,$ff,$ff ; Fill
dcb $ff,$ff,$ff,$ff ; Fill
dcb $ff,$ff,$ff,$ff ; Fill
; Black Key
dcb $00,$8c,$06,$ff ; Black castle gate 1
dcb $ff,$ff,$ff,$ff ; Fill
dcb $ff,$ff,$ff,$ff ; Fill
dcb $ff,$ff,$ff,$ff ; Fill
dcb $ff,$ff,$ff,$ff ; Fill
dcb $ff,$ff,$ff,$ff ; Fill
dcb $ff,$ff,$ff,$ff ; Fill
dcb $ff,$ff,$ff,$ff ; Fill
; Crown
dcb $01,$00,$00,$08 ; Sprite, Down, Head
dcb $01,$09,$00,$8c ; Sprite, Right, Head
dcb $01,$10,$00,$c8 ; Sprite, Left, Head
dcb $01,$18,$00,$08 ; Sprite, Up, Head (Left)
dcb $01,$19,$00,$8c ; Sprite, Up, Head (Right)
dcb $03,$00,$00,$ff ; Crown object flag
dcb $ff,$ff,$ff,$ff ; Fill
dcb $ff,$ff,$ff,$ff ; Fill
; Death Star
dcb $01,$02,$00,$21 ; Sprite, Down, Hand
dcb $01,$0b,$00,$2c ; Sprite, Right, Hand
dcb $01,$1a,$00,$21 ; Sprite, Up, Hand
dcb $03,$01,$00,$ff ; Death Star object flag
dcb $ff,$ff,$ff,$ff ; Fill
dcb $ff,$ff,$ff,$ff ; Fill
dcb $ff,$ff,$ff,$ff ; Fill
dcb $ff,$ff,$ff,$ff ; Fill

item_patch_table_lo:
dcb $00,$00,$00,$00
item_patch_table_hi:
dcb $00,$00,$00,$00
