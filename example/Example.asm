; test songs for famitone engine
; select = switch song
; start = cycle through sfx


;--------------------------------------------------------------------------
;-                               Variables                                -
;--------------------------------------------------------------------------

	SECTION	"StartupVars", WRaM0
	
	RSSET  $c000
lcd_settings	rb 1 
temp			rb 1 	
cur_keys		rb 1
new_keys		rb 1
song			rb 1
mode_pause		rb 1
effect			rb 1
vblank_flag		rb 1

run_dma = $fff0

;-----------------------------------------------

	INCLUDE	"hardware.inc"


;--------------------------------------------------------------------------
;-                             RESTaRT VECTORS                            -
;--------------------------------------------------------------------------

	SECTION	"RST_00", ROM0[$0000]
	ret

	SECTION	"RST_08", ROM0[$0008]
	ret

	SECTION	"RST_10", ROM0[$0010]
	ret

	SECTION	"RST_18", ROM0[$0018]
	ret

	SECTION	"RST_20", ROM0[$0020]
	ret

	SECTION	"RST_28", ROM0[$0028]
	ret

	SECTION	"RST_30", ROM0[$0030]
	ret

	SECTION	"RST_38", ROM0[$0038]
	ret

;--------------------------------------------------------------------------
;-                            INTERRUPT VECTORS                           -
;--------------------------------------------------------------------------

	SECTION	"VBL Interrupt Vector", ROM0[$0040]
	jp vblank_handler

	SECTION	"LCD Interrupt Vector", ROM0[$0048]
	reti

	SECTION	"TIM Interrupt Vector", ROM0[$0050]
	reti

	SECTION	"SIO Interrupt Vector", ROM0[$0058]
	reti

	SECTION	"JOY Interrupt Vector", ROM0[$0060]
	reti





;--------------------------------------------------------------------------
;-                             CaRTRIDGE HEadeR                           -
;--------------------------------------------------------------------------

	SECTION	"Cartridge Header", ROM0[$0100]

	nop
	jp	StartPoint

	NINTENDO_LOGO
;134
	;    0123456789abcde
	DB  "TEST",0,0,0,0 ,0,0,0,0 ,0,0,0,0
;	DB  $C0 ;Gbc flag
;144
	DB  0,0 ;LICENCEE
	DB	0 ;SGB FLaG
	DB	0 ;CaRTTYPE
	DB	0	;ROMSIZE
	DB	0	;RaMSIZE

	DB	$01 ;destination (0 = Japan, 1 = Non Japan)
	DB	$00	;Manufacturer

	DB	0	;Version
	DB	0	;Complement check
	 DW	0	;Checksum

;--------------------------------------------------------------------------
;-                          INITIaLIZE THE GaMEBOY                        -
;--------------------------------------------------------------------------

	SECTION	"Program Start", ROM0[$0150]

StartPoint:

	di

	xor a
	ldh [rNR52], a ; Switch off sound
	ldh [rSCY], a ; Scroll
	ldh [rSCX], a ; Scroll
	
	call screen_off
	
Clear_RAM:
	xor a
	ld	hl, $c000 ; ram is at $c000-cfff
	ld 	bc, $1000 ; orig GB had this internal
.loop:
	ld [hl+],a
	dec c
	jr nz, .loop
	dec b
	jr nz, .loop
	
	ld	sp, $cfff
	
Clear_HiRAM:
	ld 	b, $7f ; # bytes
	ld  c, $80 ; hiram ff80-fffe
.loop:
;	ld [c],a
	LD [$FF00+C],A
	inc c
	dec b
	jr nz, .loop
	
Clear_VRAM:
	ld	hl, $8000 ; vram is at $c000-dfff
	ld 	bc, $2000 ; orig GB had this internal
.loop:
	ld [hl+],a
	dec c
	jr nz, .loop
	dec b
	jr nz, .loop
	
Clear_OAM:
	ld 	b, $a0 ; # bytes
	ld  hl, $fe00 ; oam
.loop:
	ld [hl+],a
	dec b
	jr nz, .loop	
	
;copy oam routine to hiram
	ld hl, run_dma_master
	ld de, run_dma
	ld bc, run_dma_end-run_dma_master
	call memcpy 	

;load graphics
Load_CHR:
	ld  hl, Tiles ; tiles
	ld	de, $8010	;8000
	ld 	bc, $02b0 ; # bytes
	call memcpy
	
;write something to the screen

	ld hl, _SCRN0+$42 ;9800
	ld c, EndText-Text
	ld de, Text
.load_text	
	ld a, [de]
	ld [hl+], a
	inc de
	dec c
	jr nz, .load_text
	jp EndText
	
Text:
	db $17, $12, $1e, $1a, $25, $20, $1f, $16 ;famitone
EndText:

	ld hl, _SCRN0+$82 ;9800
	ld c, EndText2-Text2
	ld de, Text2
.load_text2	
	ld a, [de]
	ld [hl+], a
	inc de
	dec c
	jr nz, .load_text2
	jp EndText2
	
Text2:
	db $18, $12, $1e, $16, $00, $13, $20, $2a ;gameboy
EndText2:

;load a palette
	ld a, $e4 ; 11 10 01 00
	ldh [rBGP], a
	ldh [rOBP0], a
	ld a, $90 ; 10 01 00 00 ;lighter
	ldh [rOBP1], a

;vblank interrupt on
	xor a
	ldh [rIF], a ;clear flags
	
	ld a, IEF_VBLANK ;allow vblanks to trip halt
	ldh [rIE], a
	

;screen on
	ld a, $91
	ld [lcd_settings], a
		;bit 7 = LCDCF_ON = 1
		;bit 6 = window tiles 9800 = 0
		;bit 5 = window off = 0
		;bit 4 = bg tiles 8000 = 1
		;bit 3 = tile map #0 9800 = 0
		;bit 2 = sprite 8x8 = 0
		;Bit 1 - OBJ (Sprite) Display Enable    (0=Off, 1=On)
		;bit 0 = background display = 1 = on
	call screen_on
	ei ;allow the vblank to set an inturrupt, so halt can work
	
	
	ld hl, MusicData
	call FamiToneInit ;MusicData
	ld hl, SfxData
	call FamiToneSfxInit
	ld hl, TriWave
	call LoadWave
	
	xor a ;a=0
	ld [vblank_flag], a
	ld [song], a
	ld [effect], a
	call FamiToneMusicPlay ;start the first song
	
	
	
Main:
	halt ;the assembler seems to be auto adding a nop
	nop
	ld a, [vblank_flag]
	or a ;set z flag
	jr z, Main
	xor a ;a=0
	ld [vblank_flag], a
	
	call Read_Buttons
	ld a, [new_keys]
	and a, PADF_START
	jr z, .skip
	
	ld a, [effect]
	call FamiToneSfxPlay
	ld a, [effect]
	inc a
	cp 4
	jr c, .effectok
	xor a
.effectok	
	ld [effect], a
.skip:


	ld a, [new_keys]
	and a, PADF_SELECT
	jr z, .skip2
	
	ld a, [song]
	inc a
	and 3
	ld [song], a
	call FamiToneMusicPlay
	
.skip2:
	
	jp Main
	
	
	
	
	
	
	
screen_off:
	ldh	a, [rLCDC]
	and	a, LCDCF_ON
	jr	z, .lcd_off_

	ld	b, $91
	call wait_ly

	xor a
	ldh	[rLCDC], a ;Shutdown LCD

.lcd_off_:
	ret	
	
	
screen_on:
	ld a, [lcd_settings]
	ldh [rLCDC], a
	ret
	
	
	
wait_ly:

	ld	c, LOW(rLY)

.no_same_ly:
	ld a, [$FF00+c]
	cp	a, b
	jr	nz, .no_same_ly
	ret	
	
	

; Copies BC bytes from HL to DE.	
memcpy:
  ; Increment B if C is nonzero
	dec bc
	inc b
	inc c
.loop:
	ld a, [hl+]
	ld [de],a
	inc de
	dec c
	jr nz, .loop
	dec b
	jr nz, .loop
	ret	
	
run_dma_master:
	ld a, $cf ;cf00 ram = oam buffer
	ldh [rDMA],a
	ld a, 40
.loop:
	dec a
	jr nz, .loop
	ret
run_dma_end:	


Read_Buttons: ;
	ld a,[cur_keys]
	ld [temp], a
	ld a,%00100000 ; select direction keys
	ld c,$00
	ldh [rP1],a
	ldh a,[rP1]
	ldh a,[rP1]
	ldh a,[rP1]
	ldh a,[rP1]
	ldh a,[rP1]
	ldh a,[rP1]
	cpl ; complement the result so that a set bit indicates a pressed key
	and a,%00001111
	swap a ; put direction keys in upper nibble
	ld b,a
	ld a,%00010000 ; select button keys
	ldh [rP1],a
	ldh a,[rP1]
	ldh a,[rP1]
	ldh a,[rP1]
	ldh a,[rP1]
	ldh a,[rP1]
	ldh a,[rP1]
	ldh a,[rP1]
	ldh a,[rP1]
	ldh a,[rP1]
	ldh a,[rP1]
	cpl ; complement the result so that a set bit indicates a pressed key
	and a,%00001111
	or b ; put button keys in lower nibble
	ld [cur_keys],a ; save joypad state
	ld a,%00110000 ; unselect all keys
	ldh [rP1],a
	
	ld a, [cur_keys]
	ld b, a
	ld a, [temp]
	xor $ff
	and b
	ld [new_keys], a
	ret
	

	
	
	
	
vblank_handler:
	push af
	push bc
	push de
	push hl
	
	call run_dma
	xor a
	ldh [rSCY], a ; Scroll
	ldh [rSCX], a ; Scroll
	
	call FamiToneUpdate
	
	ld a, 1
	ld [vblank_flag], a
	
	pop hl
	pop de
	pop bc
	pop af
	reti

	
	
Tiles:
	INCBIN "BG.chr"
;size $a0


MusicCode:
	INCLUDE "famitoneGB.asm"

MusicData:
	INCLUDE "Classic.asm"

SfxData:
	INCLUDE "soundsF.asm"


TriWave:
;	db $01,$23,$45,$67, $89,$AB,$CD,$EF, $fe,$dc,$ba,$98, $76,$54,$32,$10
	db $00,$24,$67,$77,$77,$77,$77,$77,$ee,$ca,$87,$77,$77,$77,$77,$77
	
	
	
	

	
	
	