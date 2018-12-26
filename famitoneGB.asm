; FamiTone2 v1.12, by Shiru
; Gameboy port v1.1, 2019, Doug Fraker
; use with text2dataGB, nsf2dataGB, nsf_fix.py (see usage.txt)
; for rgbds assembler


; NOTE - many of the constants are from hardware.inc
; which should be included in the main file above where this file is included


; settings, modify this as needed, but MUST be xx00

FT_BASE_ADR	= $CE00	; page in the RAM used for FT2 variables, must be $xx00





; envelope structure offsets, 5 bytes per envelope, grouped by variable type

FT_ENVELOPES_ALL	= 11	; 3 for the pulse and WAV channels, 2 for the noise channel
FT_ENV_STRUCT_SIZE	= 5

FT_ENV_VALUE		= FT_BASE_ADR
FT_ENV_REPEAT		= FT_BASE_ADR+11
FT_ENV_ADR_L		= FT_BASE_ADR+22
FT_ENV_ADR_H		= FT_BASE_ADR+33
FT_ENV_PTR			= FT_BASE_ADR+44


; channel structure offsets, 7 bytes per channel

FT_CHANNELS			= FT_BASE_ADR+55

; channel struct size = 4

FT_CHN_PTR_L		= FT_CHANNELS+0
FT_CHN_PTR_H		= FT_CHANNELS+4
FT_CHN_NOTE			= FT_CHANNELS+8
FT_CHN_INSTRUMENT	= FT_CHANNELS+12
FT_CHN_REPEAT		= FT_CHANNELS+16
FT_CHN_RETURN_L		= FT_CHANNELS+20
FT_CHN_RETURN_H		= FT_CHANNELS+24
FT_CHN_REF_LEN		= FT_CHANNELS+28
FT_CHN_DUTY			= FT_CHANNELS+32


; variables and aliases
; FT_CH1_ENVS		= FT_BASE_ADR+0
; FT_CH2_ENVS		= FT_BASE_ADR+3
; FT_CH3_ENVS		= FT_BASE_ADR+6
; FT_CH4_ENVS		= FT_BASE_ADR+9


FT_CH1_VARS		= FT_CHANNELS+0
FT_CH2_VARS		= FT_CHANNELS+1
FT_CH3_VARS		= FT_CHANNELS+2
FT_CH4_VARS		= FT_CHANNELS+3


FT_CH1_NOTE		= FT_CHANNELS+8
FT_CH2_NOTE		= FT_CHANNELS+9
FT_CH3_NOTE		= FT_CHANNELS+10
FT_CH4_NOTE		= FT_CHANNELS+11

FT_CH1_INSTRUMENT	= FT_CHANNELS+12
FT_CH2_INSTRUMENT	= FT_CHANNELS+13
FT_CH3_INSTRUMENT	= FT_CHANNELS+14
FT_CH4_INSTRUMENT	= FT_CHANNELS+15

FT_CH1_DUTY		= FT_CHANNELS+32
FT_CH2_DUTY		= FT_CHANNELS+33
FT_CH4_DUTY		= FT_CHANNELS+34


FT_CH1_VOLUME		= FT_BASE_ADR
FT_CH2_VOLUME		= FT_BASE_ADR+3
FT_CH3_VOLUME		= FT_BASE_ADR+6
FT_CH4_VOLUME		= FT_BASE_ADR+9

FT_CH1_NOTE_OFF		= FT_BASE_ADR+1
FT_CH2_NOTE_OFF		= FT_BASE_ADR+4
FT_CH3_NOTE_OFF		= FT_BASE_ADR+7
FT_CH4_NOTE_OFF		= FT_BASE_ADR+10

FT_CH1_PITCH_OFF	= FT_BASE_ADR+2
FT_CH2_PITCH_OFF	= FT_BASE_ADR+5
FT_CH3_PITCH_OFF	= FT_BASE_ADR+8


FT_VARS			= FT_CHANNELS+35

FT_PAL_ADJUST	= FT_VARS+0
FT_SONG_LIST_L	= FT_VARS+1
FT_SONG_LIST_H	= FT_VARS+2
FT_INSTRUMENT_L = FT_VARS+3
FT_INSTRUMENT_H = FT_VARS+4
FT_TEMPO_STEP_L	= FT_VARS+5
FT_TEMPO_STEP_H	= FT_VARS+6
FT_TEMPO_ACC_L	= FT_VARS+7
FT_TEMPO_ACC_H	= FT_VARS+8
FT_SONG_SPEED	= FT_VARS+9
FT_PULSE1_PREV	= FT_VARS+10 ; changed, now represents volume
FT_PULSE2_PREV	= FT_VARS+11
FT_NOISE_PREV	= FT_VARS+12
FT_PULSE1_TRIG	= FT_VARS+13 ; flags for trigger
FT_PULSE2_TRIG	= FT_VARS+14
FT_WAV_TRIG		= FT_VARS+15
FT_NOISE_TRIG	= FT_VARS+16
FT_OUT_BUF	= FT_VARS+17	; 14 bytes

; see below to FT_MR_PULSE1_D

FT_SFX_ADR_L		= FT_OUT_BUF+14
FT_SFX_ADR_H		= FT_SFX_ADR_L+1
FT_SFX_BASE_ADR		= FT_SFX_ADR_L+2

FT_SFX_REPEAT		= FT_SFX_BASE_ADR+0
FT_SFX_PTR_L		= FT_SFX_BASE_ADR+1
FT_SFX_PTR_H		= FT_SFX_BASE_ADR+2
FT_SFX_OFF		= FT_SFX_BASE_ADR+3
FT_SFX_BUF		= FT_SFX_BASE_ADR+4	; 11 bytes

; SFX_PULSE1_V/D		= FT_SFX_BUF
; SFX_PULSE1_L		= FT_SFX_BUF+1
; SFX_PULSE1_H		= FT_SFX_BUF+2

; SFX_PULSE2_V/D		= FT_SFX_BUF+3
; SFX_PULSE2_L		= FT_SFX_BUF+4
; SFX_PULSE2_H		= FT_SFX_BUF+5

; extra, for alignment reasons, and future expansion
; SFX_WAV_V/D		= FT_SFX_BUF+6
; SFX_WAV_L			= FT_SFX_BUF+7
; SFX_WAV_H			= FT_SFX_BUF+8

; SFX_NOISE_V		= FT_SFX_BUF+9
; SFX_NOISE_F/D		= FT_SFX_BUF+10


FT_TEMP_VAR1 = FT_SFX_BUF+11
FT_TEMP_PTR = FT_SFX_BUF+12 ; re-purposed as temp index to array
FT_SFX_QUEUE = FT_SFX_BUF+13 ; I changed the way this works
FT_BASE_SIZE = LOW(FT_SFX_QUEUE+1) ; last variable
; = $8d = 141 bytes


; aliases for sound effect channels to use in user calls

FT_SFX_CH0	= 0
; note the other sfx streams were removed


; aliases for the APU registers
; I didn't end up using these aliases.
APU_PL1_SWEEP	= $FF10 ; rNR10 ; sweep not used by this engine
APU_PL1_DUTY	= $FF11 ; rNR11
APU_PL1_VOL		= $FF12 ; rNR12
APU_PL1_LO		= $FF13 ; rNR13
APU_PL1_HI		= $FF14 ; rNR14

; APU_PL2_SWEEP not used
APU_PL2_DUTY	= $FF16 ; rNR21
APU_PL2_VOL		= $FF17 ; rNR22
APU_PL2_LO		= $FF18 ; rNR23
APU_PL2_HI		= $FF19 ; rNR24

APU_WAV_POWER	= $FF1A ; rNR30 
APU_WAV_LOAD	= $FF1B ; rNR31
APU_WAV_VOL		= $FF1C ; rNR32
APU_WAV_LO		= $FF1D ; rNR33
APU_WAV_HI		= $FF1E ; rNR34

APU_NOISE_LOAD	= $FF20 ; rNR41
APU_NOISE_VOL	= $FF21 ; rNR42
APU_NOISE_FREQ	= $FF22 ; rNR43
APU_NOISE_TRIG	= $FF23 ; rNR44

APU_SND_VOL		= $FF24 ; rNR50
APU_SND_CHN		= $FF25 ; rNR51
APU_SND_POWER	= $FF26 ; rNR52 ; enable


; aliases for the APU registers in the output buffer

FT_MR_PULSE1_D		= FT_OUT_BUF
FT_MR_PULSE1_V		= FT_OUT_BUF+1
FT_MR_PULSE1_L		= FT_OUT_BUF+2
FT_MR_PULSE1_H		= FT_OUT_BUF+3

FT_MR_PULSE2_D		= FT_OUT_BUF+4
FT_MR_PULSE2_V		= FT_OUT_BUF+5
FT_MR_PULSE2_L		= FT_OUT_BUF+6
FT_MR_PULSE2_H		= FT_OUT_BUF+7

FT_MR_WAV_V		= FT_OUT_BUF+8
FT_MR_WAV_L		= FT_OUT_BUF+9
FT_MR_WAV_H		= FT_OUT_BUF+10

FT_MR_NOISE_D		= FT_OUT_BUF+11
FT_MR_NOISE_V		= FT_OUT_BUF+12
FT_MR_NOISE_F		= FT_OUT_BUF+13









; ------------------------------------------------------------------------------
; initialize the music pointers
; in: hl = pointer to music data
; ------------------------------------------------------------------------------



FamiToneInit:
	ld a, l
	ld [FT_SONG_LIST_L], a
	ld a, h
	ld [FT_SONG_LIST_H], a
		; skip FT_PITCH_FIX
	inc hl
	ld a, [hl+]
	ld [FT_INSTRUMENT_L], a
	ld a, [hl]
	ld [FT_INSTRUMENT_H], a
	
	ld a, $80
	ldh [rNR52], a ; audio enable
	ld a, $ff
	ldh [rNR51], a ; audio enable channels
	ldh [rNR50], a ; audio full volume, maybe should be $77 ??
	
	xor a ; a = 0
	ld [FT_PULSE1_PREV], a
	ld [FT_PULSE2_PREV], a
	ld [FT_NOISE_PREV], a
	
	ld c, $14 ; zero ff10-ff23
	ld hl, $ff10
.loop
	ld [hl+], a ; a=0
	dec c
	jr nz, .loop

; fall through




; ------------------------------------------------------------------------------
; stop music that is currently playing
; ------------------------------------------------------------------------------
; song speed 0 = skips music updates

FamiToneMusicStop:
	xor a ; a = 0
	ld [FT_SONG_SPEED], a
	
; clear FT_CHN_NOTE, FT_CHN_INSTRUMENT, FT_CHN_REPEAT, 
; FT_CHN_RETURN_L, FT_CHN_RETURN_H, and FT_CHN_REF_LEN
; 32-8 = 24, skip FT_CHN_DUTY

	ld c, 24
	ld hl, FT_CH1_NOTE
.loop1
	ld [hl+], a ; zero
	dec c
	jr nz, .loop1
	
; clear FT_ENV_VALUE and FT_ENV_REPEAT

	ld c, FT_ENVELOPES_ALL*2
	ld hl, FT_ENV_VALUE
.loop2
	ld [hl+], a ; zero
	dec c
	jr nz, .loop2
	
; set dummy envelopes, HL now points to FT_ENV_ADR_L
	ld c, FT_ENVELOPES_ALL
	ld a, LOW(FT2DummyEnvelope)
.loop3	
	ld [hl+], a
	dec c
	jr nz, .loop3

; HL now points to FT_ENV_ADR_H	
	ld c, FT_ENVELOPES_ALL
	ld a, HIGH(FT2DummyEnvelope)
.loop4	
	ld [hl+], a
	dec c
	jr nz, .loop4
	
; HL now points to FT_ENV_PTR	
	xor a ; a = 0
	ld c, FT_ENVELOPES_ALL
.loop5	
	ld [hl+], a 
	dec c
	jr nz, .loop5
	ret
	
	
	
	
; ------------------------------------------------------------------------------
; copy a 16 byte (32 sample) wave to WAVE RAM. 
; should be done before playing a song.
; in: HL points to the wave address
; ------------------------------------------------------------------------------	

LoadWave:
	xor a ; a=0
	ldh [rNR30], a ; turn off waves
	ld c, 16
	ld de, $ff30 ; wave table
.loop
	ld a, [hl+]
	ld [de], a
	inc de
	dec c
	jr nz, .loop
	ld a, $80
	ldh [rNR30], a ; turn on waves
	ret
	
	
	
	
; ------------------------------------------------------------------------------
; start a new song
; in: A number of subsong
; ------------------------------------------------------------------------------

FamiToneMusicPlay:
	ld [FT_TEMP_VAR1], a
	call FamiToneMusicStop
	
	ld a, [FT_SONG_LIST_L]
	ld l, a
	ld a, [FT_SONG_LIST_H]
	ld h, a
	ld a, [FT_TEMP_VAR1] ; song #
	cp [hl] ; see if in range
	jr nc, .skip
	
; multiply by 10, add 3, note the data header has been changed
	add a ; x2
	ld b, a ; b = x2
	add a ; x4
	add a ; x8
	add a, b ; 8+2 = 10
	add a, 3
	ld c, a
	ld b, 0 ; bc = offset to the song pointers
	add hl, bc ; hl = points to the start of the song pointers
; moved FamiToneMusicStop above

	ld c, 0 ; 4 channels, count up
	ld b, 4 ; count down
.set_channels
	ld de, FT_CHN_PTR_L
	ld a, c
	add a, e ; should never overflow
	ld e, a ; de points to FT_CHN_PTR_L of the channel
	ld a, [hl+] ; low byte of address
	ld [de], a
	
	ld de, FT_CHN_PTR_H
	ld a, c
	add a, e ; should never overflow
	ld e, a ; de points to FT_CHN_PTR_H of the channel
	ld a, [hl+] ; high byte of address
	ld [de], a
	
	inc c ; next channel
	dec b ; count
	jr nz, .set_channels	
	
; hl now points to the song speed constant
	ld a, [hl+]
	ld [FT_TEMPO_STEP_L], a
	ld a, [hl]
	ld [FT_TEMPO_STEP_H], a
	
; clear FT_CHN_NOTE, FT_CHN_INSTRUMENT, FT_CHN_REPEAT, 
; FT_CHN_RETURN_L, FT_CHN_RETURN_H, and FT_CHN_REF_LEN
; 24 bytes, skip FT_CHN_DUTY
	xor a ; a = 0
	ld hl, FT_CHN_NOTE
	ld c, 24 
.loop1
	ld [hl+], a ; zero
	dec c
	jr nz, .loop1

	; a = 0 still
	ld [FT_TEMPO_ACC_L], a
	ld a, 6
	ld [FT_TEMPO_ACC_H], a
	ld [FT_SONG_SPEED], a		; default song speed

.skip
	ret
	
	
	
	
; ------------------------------------------------------------------------------
; pause and unpause current music
; in: A = 0 to play, or not 0 to pause
; ------------------------------------------------------------------------------

FamiToneMusicPause:	
	or a ; set z flag
	jr z, .unpause
.pause
	; skip sample stuff
	xor a ; a = 0
	ld [FT_CH1_VOLUME], a
	ld [FT_CH2_VOLUME], a
	ld [FT_CH3_VOLUME], a
	ld [FT_CH4_VOLUME], a
	
	ld a, [FT_SONG_SPEED]
	or $80
	ld [FT_SONG_SPEED], a
	ret
	
.unpause
	ld a, [FT_SONG_SPEED]
	and $7f
	ld [FT_SONG_SPEED], a
	ret
	
	
	
	
; ------------------------------------------------------------------------------
; update FamiTone state, should be called every NMI
; ------------------------------------------------------------------------------	
	
FamiToneUpdate:
	xor a ; a=0
	ld [FT_PULSE1_TRIG], a ; only trigger on new notes
	ld [FT_PULSE2_TRIG], a
	ld [FT_WAV_TRIG], a
	ld [FT_NOISE_TRIG], a

	ld a, [FT_SONG_SPEED]
	bit 7, a
	jr nz, .pause
	or a ; set z flag
	jr nz, .update
.pause
	jp .update_sound
	
.update
	ld a, [FT_SONG_SPEED]
	ld c, a ; save for later
	
	ld a, [FT_TEMPO_ACC_L]
	ld b, a
	ld a, [FT_TEMPO_STEP_L]
	add a, b
	ld [FT_TEMPO_ACC_L], a
	ld a, [FT_TEMPO_ACC_H]
	ld b, a
	ld a, [FT_TEMPO_STEP_H]
	adc a, b
	cp c ; FT_SONG_SPEED
	jr nc, .update_row
	
	ld [FT_TEMPO_ACC_H], a
	jr .update_envelopes

.update_row
	sub c ; FT_SONG_SPEED
	ld [FT_TEMPO_ACC_H], a
	
	
	ld de, 0000 ; de = 0 = channel 1, Pulse 1
	call FT2ChannelUpdate
	jr nc, .no_new_note1
; new note, set trigger
	ld a, $80
	ld [FT_PULSE1_TRIG], a
	
	; de = 0 already, for FT_CH1_ENVS
	ld a, [FT_CH1_INSTRUMENT]
	call FT2SetInstrument
	ld [FT_CH1_DUTY], a
	
	
.no_new_note1:	
	ld de, 0001 ; = channel 2, Pulse 2
	call FT2ChannelUpdate
	jr nc, .no_new_note2
; new note, set trigger
	ld a, $80
	ld [FT_PULSE2_TRIG], a	
	
	ld de, 0003 ; de = 3 for FT_CH2_ENVS
	ld a, [FT_CH2_INSTRUMENT]
	call FT2SetInstrument
	ld [FT_CH2_DUTY], a
	
	
.no_new_note2:	
	ld de, 0002 ; = channel 3, WAVE
	call FT2ChannelUpdate
	jr nc, .no_new_note3
; new note, set trigger
	ld a, $80
	ld [FT_WAV_TRIG], a
	
	ld de, 0006 ; de = 6 for FT_CH3_ENVS
	ld a, [FT_CH3_INSTRUMENT]
	call FT2SetInstrument
; 	ld [FT_CH3_DUTY], a ; wav has no duty
; might add a subroutine to load a new wave table ...TODO ??
	
	
.no_new_note3:	
	ld de, 0003 ; = channel 4, Noise
	call FT2ChannelUpdate
	jr nc, .no_new_note4
; new note, set trigger
	ld a, $80
	ld [FT_NOISE_TRIG], a
	
	ld de, 0009 ; de = 9 for FT_CH4_ENVS
	ld a, [FT_CH4_INSTRUMENT]
	call FT2SetInstrument
	ld [FT_CH4_DUTY], a
	
	
.no_new_note4:

; no channel 5

	
; note, I re-purposed FT_TEMP_PTR, as temp index to array
.update_envelopes
	xor a ; a = 0
	ld d, a
	ld e, a ; de = 0 = index to arrays
	
	
.env_process		 ; main envelope loop
	ld hl, FT_ENV_REPEAT
	add hl, de
	ld a, [hl]
	or a ; set z flag
	jr z, .env_read
	
	dec [hl] ; count down FT_ENV_REPEAT
	jr nz, .env_next

.env_read	
; load a pointer to an envelope
	ld hl, FT_ENV_ADR_L
	add hl, de
	ld c, [hl]
	ld hl, FT_ENV_ADR_H
	add hl, de
	ld b, [hl] ; bc now points to start of envelope, don't touch it
	
	ld hl, FT_ENV_PTR
	add hl, de
	ld a, [hl] ; index into the envelope array
	ld l, a
	ld [FT_TEMP_PTR], a
	ld h, 0
	add hl, bc ; hl now points to the envelope byte
	
.env_read_value
	ld a, [hl] ; byte of envelope data
	bit 7, a
	jr z, .env_special
; if 128 - 255, = value	
	add a, 64 ; (output values are signed -63..64)
	ld hl, FT_ENV_VALUE
	add hl, de
	ld [hl+], a
		ld a, [FT_TEMP_PTR]
		inc a
		ld [FT_TEMP_PTR], a
	jr .env_next_store_ptr
	
.env_special	
	or a ; set z flag
	jr nz, .env_set_repeat
	
; if zero, next byte is loop point	
	inc hl
	ld a, [hl] ; read loop position
	ld l, a
	ld [FT_TEMP_PTR], a
	ld h, 0
	add hl, bc	; bc points to the start of the envelope
				; hl now points to the loop point
	jr .env_read_value
	
.env_set_repeat 
; if 1-127, that is the repeat #
	ld hl, FT_ENV_REPEAT
	add hl, de
	ld [hl], a
		ld a, [FT_TEMP_PTR] ; point to the next byte for another time
		inc a
		ld [FT_TEMP_PTR], a
		
.env_next_store_ptr		
	ld hl, FT_ENV_PTR
	add hl, de
	ld a, [FT_TEMP_PTR]
	ld [hl], a
	
.env_next	
	inc de ; next envelope
	ld a, e
	cp FT_ENVELOPES_ALL ; # of envelopes
	jp nz, .env_process ; loop back to the main envelope loop
	
	
.update_sound:
; convert envelope and channel output data into APU register values in the output buffer	
	
; channel 1, pulse 1
	ld a, [FT_CH1_VOLUME]
	ld [FT_MR_PULSE1_V], a
	ld a, [FT_CH1_NOTE]
	or a ; set z flag
	jr z, .ch1cut ; note cut = vol zero
	ld b, a
	ld a, [FT_CH1_NOTE_OFF]
	add b ; note + note offset
	ld e, a
	ld d, 0 ; de = note + note offset
		ld hl, FT2NoteTableMSB ; done early to not affect carry flag later
		add hl, de
		push hl
	ld hl, FT2NoteTableLSB
	add hl, de	
	ld b, [hl] ; note low byte in b
	ld a, [FT_CH1_PITCH_OFF] ; signed -64 to +64 ; ! opposite
	
	ld c, 0
	cpl ; nes is opposite gb, need to compliment pitch offset
	inc a
	bit 7, a
	jr z, .no_pitch_adj1
	inc c ; if neg, subtract 1 later
.no_pitch_adj1	
	
	add a, b
	ld [FT_MR_PULSE1_L], a
	pop hl
	ld a, [hl]
	adc 0 ; add the carry from low bytes
	sub c ; the signed value, if negative
	ld [FT_MR_PULSE1_H], a
	jr .pastch1cut
	
.ch1cut
	; note cut = vol 0
	ld [FT_MR_PULSE1_V], a
	
.pastch1cut	
	ld a, [FT_CH1_DUTY]
	ld [FT_MR_PULSE1_D], a
	
	
; channel 2, pulse 2
	ld a, [FT_CH2_VOLUME]
	ld [FT_MR_PULSE2_V], a
	ld a, [FT_CH2_NOTE]
	or a ; set z flag
	jr z, .ch2cut ; note cut = vol zero
	ld b, a
	ld a, [FT_CH2_NOTE_OFF]
	add b
	ld e, a
	ld d, 0 ; de = note
		ld hl, FT2NoteTableMSB ; done early to not affect carry flag later
		add hl, de
		push hl
	ld hl, FT2NoteTableLSB
	add hl, de	
	ld b, [hl] ; note low byte in b
	ld a, [FT_CH2_PITCH_OFF] ; signed -64 to +64 ; ! opposite
	
	ld c, 0
	cpl ; nes is opposite gb, need to compliment pitch offset
	inc a
	bit 7, a
	jr z, .no_pitch_adj2
	inc c ; if neg, subtract 1 later
.no_pitch_adj2	
	
	add a, b
	ld [FT_MR_PULSE2_L], a
	pop hl
	ld a, [hl]
	adc 0 ; add the carry from low bytes
	sub c ; the signed value, if negative
	ld [FT_MR_PULSE2_H], a
	jr .pastch2cut
	
.ch2cut
	; note cut = vol 0
	ld [FT_MR_PULSE2_V], a
	
.pastch2cut	
	ld a, [FT_CH2_DUTY]
	ld [FT_MR_PULSE2_D], a	
	
	
; channel 3, wave
	ld a, [FT_CH3_VOLUME]
	ld [FT_MR_WAV_V], a
	
	ld a, [FT_CH3_NOTE]
	or a ; set z flag
	jr z, .ch3cut ; note cut = vol zero
	ld b, a
	ld a, [FT_CH3_NOTE_OFF]
	add b
	ld e, a
	ld d, 0 ; de = note
		ld hl, FT2NoteTableMSB ; done early to not affect carry flag later
		add hl, de
		push hl
	ld hl, FT2NoteTableLSB
	add hl, de	
	ld b, [hl] ; note low byte in b
	ld a, [FT_CH3_PITCH_OFF] ; signed -64 to +64 ; ! opposite
	
	ld c, 0
	cpl ; nes is opposite gb, need to compliment pitch offset
	inc a
	bit 7, a
	jr z, .no_pitch_adj3
	inc c ; if neg, subtract 1 later
.no_pitch_adj3	
	
	add a, b
	ld [FT_MR_WAV_L], a
	pop hl
	ld a, [hl]
	adc 0 ; add the carry from low bytes
	sub c ; the signed value, if negative
	ld [FT_MR_WAV_H], a
	jr .pastch3cut
	
.ch3cut
	; note cut = vol 0
	ld [FT_MR_WAV_V], a
	
.pastch3cut	
; 	ld a, [FT_CH3_DUTY] ; wave has no duty
; 	ld [FT_MR_WAV_D], a	


; channel 4, noise
	ld a, [FT_CH4_VOLUME]
	ld [FT_MR_NOISE_V], a
	ld a, [FT_CH4_NOTE]
	or a ; set z flag
	jr z, .ch4cut ; note cut = vol zero
	ld b, a
	ld a, [FT_CH4_NOTE_OFF]
	add b
	and $0f
	xor $0f
	ld [FT_MR_NOISE_F], a ; combine with duty later
	jr .pastch4cut
	
.ch4cut
	; note cut = vol 0
	ld [FT_MR_NOISE_V], a
	
.pastch4cut	
	ld a, [FT_CH4_DUTY]
	ld [FT_MR_NOISE_D], a	


; I changed the way starting sfx works
	ld a, [FT_SFX_QUEUE]
	or a ; set z flag
	jr z, .no_new_sfx
	
	call FamiToneSfxPlay2 ; a = effect
;	xor a ; a=0
;	ld [FT_SFX_QUEUE], a
; this is done in the FT2SfxClearChannel call inside FamiToneSfxPlay2
	
.no_new_sfx


; process the one sound effect stream

	call FT2SfxUpdate
; removed all but 1 sfx stream... could expand later




; try to improve the sound quality
; retriggering at a low volume seems
; less clicky than zombie mode stepping down
	ld a, [FT_MR_PULSE1_V] ; new volume
	cp 5				
	jr nc, .skip1t		
	ld b, a
	ld a, [FT_PULSE1_PREV]
	cp b ; new < old and < 5
	jr z, .skip1t
	jr c, .skip1t
	ld a, $80
	ld [FT_PULSE1_TRIG], a
	
.skip1t


	ld a, [FT_MR_PULSE2_V] ; new volume
	cp 5				
	jr nc, .skip2t		
	ld b, a
	ld a, [FT_PULSE2_PREV]
	cp b ; new < old and < 5
	jr z, .skip2t
	jr c, .skip2t
	ld a, $80
	ld [FT_PULSE2_TRIG], a
	
.skip2t


	ld a, [FT_MR_NOISE_V] ; new volume
	cp 5				
	jr nc, .skip4t	
	ld b, a
	ld a, [FT_NOISE_PREV]
	cp b ; new < old and < 5
	jr z, .skip4t
	jr c, .skip4t
	ld a, $80
	ld [FT_NOISE_TRIG], a
	
.skip4t
	
	
	
; send data from the output buffer to the APU
; process differently based on trigger or not
final_output1:
	xor a
	ldh [rNR10], a ; sweep off
	ld a, [FT_MR_PULSE1_D]
	ldh [rNR11], a ; duty
	ld a, [FT_MR_PULSE1_L]
	ldh [rNR13], a

	ld a, [FT_PULSE1_TRIG]
	or a ; set z flag
	jr z, .zombie1
	
; yes, trigger
	ld a, [FT_MR_PULSE1_V]
	swap a
	or 8
	ldh [rNR12], a
	
	ld a, [FT_MR_PULSE1_H]
	or $80 ; trigger
	ldh [rNR14], a
	jr final_output2
	
.zombie1 ; no triggers
	ld a, [FT_MR_PULSE1_H]
	ldh [rNR14], a
	
	ld a, [FT_MR_PULSE1_V]
	ld b, a
	ld a, [FT_PULSE1_PREV]
	sub b ; old >= new nc
	jr z, final_output2 ; same, skip
	jr nc, .zombie1goDown
	add 16
	
.zombie1goDown

.zombie1fast
; a = how many downward ticks
	sub 1
	and $0f ; sanitize
	add a ; x2
	ld e, a
	ld d, 0 ; de = jump in point
	ld hl, .zombie1start
	add hl, de
	ld a, $88 ; vol irrelevant, each write is +1 in zombie mode
	jp hl
	
.zombie1start
	; each is 2 bytes	
	ldh [rNR12], a ; -1 = +15
	ldh [rNR12], a ; -2 = +14
	ldh [rNR12], a ; -3 = +13
	ldh [rNR12], a ; -4 = +12
	ldh [rNR12], a ; -5 = +11
	ldh [rNR12], a ; -6 = +10
	ldh [rNR12], a ; -7 = +9
	ldh [rNR12], a ; -8 = +8
	ldh [rNR12], a ; -9 = +7
	ldh [rNR12], a ; -10 = +6
	ldh [rNR12], a ; -11 = +5
	ldh [rNR12], a ; -12 = +4
	ldh [rNR12], a ; -13 = +3
	ldh [rNR12], a ; -14 = +2
	ldh [rNR12], a ; -15 = +1
	nop
	nop ; ?? maybe delete these
	
final_output2:
	ld a, [FT_MR_PULSE2_D]
	ldh [rNR21], a ; duty
	ld a, [FT_MR_PULSE2_L]
	ldh [rNR23], a

	ld a, [FT_PULSE2_TRIG]
	or a ; set z flag
	jr z, .zombie2
	
; yes, trigger
	ld a, [FT_MR_PULSE2_V]
	swap a
	or 8
	ldh [rNR22], a
	
	ld a, [FT_MR_PULSE2_H]
	or $80 ; trigger
	ldh [rNR24], a
	jr final_output3
	
.zombie2 ; no triggers
	ld a, [FT_MR_PULSE2_H]
	ldh [rNR24], a
	
	ld a, [FT_MR_PULSE2_V]
	ld b, a
	ld a, [FT_PULSE2_PREV]
	sub b ; old >= new nc
	jr z, final_output3 ; same, skip
	jr nc, .zombie2goDown
	add 16
	
.zombie2goDown

.zombie2fast
; a = how many downward ticks
	sub 1
	and $0f ; sanitize
	add a ; x2
	ld e, a
	ld d, 0 ; de = jump in point
	ld hl, .zombie2start
	add hl, de
	ld a, $88 ; vol irrelevant, each write is +1 in zombie mode
	jp hl
	
.zombie2start
	; each is 2 bytes	
	ldh [rNR22], a ; -1 = +15
	ldh [rNR22], a ; -2 = +14
	ldh [rNR22], a ; -3 = +13
	ldh [rNR22], a ; -4 = +12
	ldh [rNR22], a ; -5 = +11
	ldh [rNR22], a ; -6 = +10
	ldh [rNR22], a ; -7 = +9
	ldh [rNR22], a ; -8 = +8
	ldh [rNR22], a ; -9 = +7
	ldh [rNR22], a ; -10 = +6
	ldh [rNR22], a ; -11 = +5
	ldh [rNR22], a ; -12 = +4
	ldh [rNR22], a ; -13 = +3
	ldh [rNR22], a ; -14 = +2
	ldh [rNR22], a ; -15 = +1
	nop
	nop ; ?? maybe delete these
	
	
final_output3:
	ld a, [FT_WAV_TRIG]
	or a ;set z flag
	jr z, .no_wav_trig
	xor a ;a=0
	ldh [rNR30], a	; there is a wave ram bug in the original
					; gameboy, and turning nNR30 off and on
					; before trigger should prevent it.
.no_wav_trig
	ld a, $80
	ldh [rNR30], a ; double checking, is on
	ld a, [FT_MR_WAV_V]
	ld e, a
	ld d, 0 ; de = offset
	ld hl, wave_volumes
	add hl, de
	ld a, [hl]
	ldh [rNR32], a ; volume
	ld a, [FT_MR_WAV_L]
	ldh [rNR33], a
	ld a, [FT_WAV_TRIG]
	ld b, a
	ld a, [FT_MR_WAV_H]
	or b
	ldh [rNR34], a
	
	
final_output4: ; review this, noise is different
	ld a, [FT_MR_NOISE_F]
	ld e, a
	ld d, 0 ; de = offset
	ld hl, NES2GB_Noise ; convert NES to GB noise
	add hl, de
	ld b, [hl]
	ld a, [FT_MR_NOISE_D] 
	swap a
	add a ; shift left
	and $08 ; just duty bit
	add b
	ldh [rNR43], a

	ld a, [FT_NOISE_TRIG]
	or a ; set z flag
	jr z, .zombie4
	
; yes, trigger
	ld a, [FT_MR_NOISE_V]
	swap a
	or 8
	ldh [rNR42], a
	
	ld a, $80 ; trigger
	ldh [rNR44], a
	jr .final_output5
	
.zombie4 ; no triggers	
	ld a, [FT_MR_NOISE_V]
	ld b, a
	ld a, [FT_NOISE_PREV]
	sub b ; old >= new nc
	jr z, .final_output5 ; same, skip
	jr nc, .zombie4goDown
	add 16
	
.zombie4goDown

.zombie4fast
; a = how many downward ticks
	sub 1
	and $0f ; sanitize
	add a ; x2
	ld e, a
	ld d, 0 ; de = jump in point
	ld hl, .zombie4start
	add hl, de
	ld a, $88 ; vol irrelevant, each write is +1 in zombie mode
	jp hl
	
.zombie4start
	; each is 2 bytes	
	ldh [rNR42], a ; -1 = +15
	ldh [rNR42], a ; -2 = +14
	ldh [rNR42], a ; -3 = +13
	ldh [rNR42], a ; -4 = +12
	ldh [rNR42], a ; -5 = +11
	ldh [rNR42], a ; -6 = +10
	ldh [rNR42], a ; -7 = +9
	ldh [rNR42], a ; -8 = +8
	ldh [rNR42], a ; -9 = +7
	ldh [rNR42], a ; -10 = +6
	ldh [rNR42], a ; -11 = +5
	ldh [rNR42], a ; -12 = +4
	ldh [rNR42], a ; -13 = +3
	ldh [rNR42], a ; -14 = +2
	ldh [rNR42], a ; -15 = +1
	nop
	nop	; ?? maybe delete these


	
.final_output5

.copyPrev
	ld a, [FT_MR_PULSE1_V]
	ld [FT_PULSE1_PREV], a
	ld a, [FT_MR_PULSE2_V]
	ld [FT_PULSE2_PREV], a
	; wave channel doesn't matter, no zombie mode
	ld a, [FT_MR_NOISE_V]
	ld [FT_NOISE_PREV], a
	ret
	
	

; convert NES noise frequency to closest equivalent GB	
NES2GB_Noise:
	db $20,$30,$30,$40,$40,$50,$50,$60,$60,$60,$70,$70,$80,$80,$90,$a0

; convert volume 0-15 to nearest wave channel equivalent
wave_volumes:
	db 0,$60,$60,$60,$60,$60,$40,$40,$40,$40,$40,$20,$20,$20,$20,$20

	
	

FT2SetInstrument:
; internal routine, sets up envelopes of a channel according to current instrument
; in de envelope group offset, A instrument number

	; precalculate all the pointers, in reverse order
	ld hl, FT_ENV_PTR
	add hl, de
	push hl
	ld hl, FT_ENV_REPEAT
	add hl, de
	push hl
	ld hl, FT_ENV_ADR_H
	add hl, de
	push hl
	ld hl, FT_ENV_ADR_L
	add hl, de
	push hl
	
							; the instrument definitions are 8 bytes each
	add a ; x2				; instrument number is pre multiplied by 4
	ld c, a
	ld b, 0 ; bc = offset
	ld a, [FT_INSTRUMENT_H]
	adc 0					; use carry to extend range for 64 instruments
	ld h, a
	ld a, [FT_INSTRUMENT_L]
	ld l, a 				; hl points to start of instrument list
	add hl, bc 				; now points to start of the instrument

	ld a, [hl+] 			; duty cycle
	ld [FT_TEMP_VAR1], a
	
	pop bc ; FT_ENV_ADR_L
	pop de ; FT_ENV_ADR_H

	ld a, [hl+] 	; vol envelope pointer LSB
	ld [bc], a		; FT_ENV_ADR_L
	ld a, [hl+] 	; vol envelope pointer MSB
	ld [de], a		; FT_ENV_ADR_H
		inc bc
		inc de
	ld a, [hl+] 	; arp envelope pointer LSB
	ld [bc], a		; FT_ENV_ADR_L
	ld a, [hl+] 	; arp envelope pointer MSB
	ld [de], a		; FT_ENV_ADR_H
		inc bc
		inc de
		
; noise doesn't have pitch, exit early		
	ld a, LOW(FT_ENV_ADR_H+10) ; if noise channel, it should be above this
	cp e ; if e > a skip
	jr c, .noise ; noise will skip pitch envelope
	
; all channels but noise	
	ld a, [hl+]		; pitch envelope pointer LSB
	ld [bc], a		; FT_ENV_ADR_L
	ld a, [hl]		; pitch envelope pointer MSB
	ld [de], a		; FT_ENV_ADR_H
	
	xor a ; a=0
	pop hl 			; FT_ENV_REPEAT
	ld [hl+], a
	ld [hl+], a
	ld [hl], a
	pop hl 			; FT_ENV_PTR
	ld [hl+], a
	ld [hl+], a
	ld [hl], a
	ld a, [FT_TEMP_VAR1]	; return the duty cycle in a
	ret

.noise		
; 2 envelopes only to clear
	xor a ; a=0
	pop hl 			; FT_ENV_REPEAT
	ld [hl+], a
	ld [hl], a
	pop hl 			; FT_ENV_PTR
	ld [hl+], a
	ld [hl], a
	ld a, [FT_TEMP_VAR1]	; return the duty cycle in a
	ret

	
	
	
FT2ChannelUpdate:
; internal routine, parses channel note data
; de is 0,1,2,or 3, don't touch it
; carry is clear if no new note
; or a  resets carry,  scf sets carry flag
	
	ld hl, FT_CHN_REPEAT	; check repeat counter
	add hl, de
	ld a, [hl]				; decrease repeat counter
	or a ; set z flag
	jr z, .no_repeat	
	dec [hl]
	; carry was cleared from the "or a" above
	ret ; no new note
	
.no_repeat 	
	ld hl, FT_CHN_PTR_L
	add hl, de
	ld c, [hl]
	ld hl, FT_CHN_PTR_H
	add hl, de
	ld b, [hl] ; bc points to channel

.no_repeat_r 

.read_byte 
	ld a, [bc]
	inc bc

	bit 7, a				; bit 7 0=note 1=special code
	jr nz, .special_code
; is note	
	sra a					; bit 0 set means the note is followed by an empty row
	jr nc, .no_empty_row
	ld hl, FT_CHN_REPEAT
	add hl, de
	inc [hl]				; set repeat counter to 1
.no_empty_row	
	ld hl, FT_CHN_NOTE
	add hl, de
	ld [hl], a				; store note code
	call FT_endstub
	scf ; set carry flag = new note
	ret

.special_code 
	and $7f
	sra a
	jr c, .set_empty_rows ; 0 bit, 0 = instrument, 1 = repeat or special
; is instrument	
	add a ; sla a
	add a ; sla a
	ld hl, FT_CHN_INSTRUMENT
	add hl, de
	ld [hl], a
	jr .read_byte

.set_empty_rows 
	cp $3d ; 3d = fb
	jr z, .set_speed
	jr c, .set_repeat
	cp $3e ; 3e = fd
	jr z, .set_loop

.set_reference ; 3f = ff	
; the order of bytes is legth, low address, high address

	ld hl, 3
	add hl, bc ; copy bc to hl, add 3
	ld a, h
	ld [FT_TEMP_VAR1], a ; hl is about to be wiped, save h in temp, save l in a
	ld a, l
	ld hl, FT_CHN_RETURN_L	; save a return address+3
	add hl, de
	ld [hl], a
	ld hl, FT_CHN_RETURN_H
	add hl, de 
	ld a, [FT_TEMP_VAR1]
	ld [hl], a
	
	ld a, [bc]	; read first byte = length of the reference
	inc bc
	ld hl, FT_CHN_REF_LEN
	add hl, de
	ld [hl], a
; read 16-bit absolute address of the reference	
	ld a, [bc] ; low byte address
	inc bc
	ld [FT_TEMP_VAR1], a
	ld a, [bc] ; high byte address
	ld b, a
	ld a, [FT_TEMP_VAR1]
	ld c, a ; bc now points to a reference
	jr .read_byte

.set_speed 
; read next byte = speed
	ld a, [bc]
	inc bc
	ld [FT_SONG_SPEED], a
	jr .read_byte

.set_loop 
; read next bytes = loop address
	ld a, [bc] ; low byte address
	inc bc
	ld [FT_TEMP_VAR1], a
	ld a, [bc] ; high byte address
	ld b, a
	ld a, [FT_TEMP_VAR1]
	ld c, a ; bc now points to a loop point
	jr .read_byte

.set_repeat 
; set up repeat counter
	ld hl, FT_CHN_REPEAT
	add hl, de
	ld [hl], a
	
.done 
	call FT_endstub
	or a ; clear carry
	ret


	
FT_endstub:	
	ld hl, FT_CHN_REF_LEN
	add hl, de
	ld a, [hl]
	or a ; set z flag
	jr z, .no_ref
	dec [hl]
	jr nz, .no_ref

; end of a reference, return to previous pointer
	ld hl, FT_CHN_RETURN_L
	add hl, de
	ld a, [hl]
	ld hl, FT_CHN_PTR_L
	add hl, de
	ld [hl], a
	ld hl, FT_CHN_RETURN_H
	add hl, de
	ld a, [hl]
	ld hl, FT_CHN_PTR_H
	add hl, de
	ld [hl], a
	ret

.no_ref  ; channel pointer is in bc, save it
	ld hl, FT_CHN_PTR_L
	add hl, de
	ld a, c
	ld [hl], a
	ld hl, FT_CHN_PTR_H
	add hl, de
	ld a, b
	ld [hl], a
	ret	
	
	
	
; note deleted all dpcm code



; ------------------------------------------------------------------------------
; init sound effects player, set pointer to data
; in: hl is address of sound effects data
; ------------------------------------------------------------------------------	
	
FamiToneSfxInit:
	ld a, l
	ld [FT_SFX_ADR_L], a
	ld a, h
	ld [FT_SFX_ADR_H], a

; changed it to 1 sfx at a time.
; fall through

FT2SfxClearChannel:
	xor a ; a = 0
	ld [FT_SFX_PTR_H], a	; this stops the effect
	ld [FT_SFX_REPEAT], a
	ld [FT_SFX_OFF], a
	ld [FT_SFX_BUF], a		; pulse1 vol
	ld [FT_SFX_BUF+3], a	; pulse2 vol
	ld [FT_SFX_BUF+6], a	; wave vol
	ld [FT_SFX_BUF+9], a	; noise vol
	
	ld [FT_SFX_QUEUE], a ; clear any sfx calls
	ret
	

	
	
; ------------------------------------------------------------------------------
; play sound effect
; in: A is a number of the sound effect 0-127
; ------------------------------------------------------------------------------

FamiToneSfxPlay:
	inc a ; because zero = queue empty now
	ld [FT_SFX_QUEUE], a
	ret


FamiToneSfxPlay2:
	ld [FT_TEMP_VAR1], a
	call FT2SfxClearChannel ; stops the effect if it plays
	ld a, [FT_TEMP_VAR1]
	dec a
	add a ; x2
	ld e, a
	ld d, 0 ; de = offset
	ld a, [FT_SFX_ADR_L]
	ld l, a
	ld a, [FT_SFX_ADR_H]
	ld h, a
	add hl, de ; points to sfx address
	ld a, [hl+]
	ld [FT_SFX_PTR_L], a
	ld a, [hl]
	ld [FT_SFX_PTR_H], a
	ret
	
	


; changed it, only 1 stream	
FT2SfxUpdate:
	ld hl, FT_SFX_REPEAT	; check if repeat counter is not zero
	ld a, [hl]
	or a ; set z flag
	jr z, .no_repeat
	dec [hl]
	jr nz, .update_buf
	
.no_repeat		
	ld a, [FT_SFX_PTR_H]	; check if MSB of the pointer is not zero
	or a ; set z flag
	jr nz, .sfx_active
	ret						; return otherwise, no active effect
	
.sfx_active
	ld d, a
	ld a, [FT_SFX_PTR_L]
	ld e, a ; de points to sfx data
	ld a, [FT_SFX_OFF]
	ld l, a
	ld h, 0
	add hl, de 				; hl now points to relevant data
	
.read_byte	
		ld a, [FT_SFX_OFF]
		inc a
		ld [FT_SFX_OFF], a
	ld a, [hl+]				; read byte of effect, increment
	bit 7, a
	jr nz, .get_data		; if bit 7 is set, it is a register write
	or a ; set z flag
	jr z, .eof
	ld [FT_SFX_REPEAT], a	; if bit 7 is 0, it is number of repeats

	jr .update_buf
	
.get_data
; get offset in the effect output buffer
	and $0f ; get low nibble
	ld c, a
	ld b, 0 ; bc = offset to sfx buffer
		ld a, [FT_SFX_OFF]
		inc a
		ld [FT_SFX_OFF], a
	ld a, [hl+] ; read next byte, increment
	push hl
	ld hl, FT_SFX_BUF
	add hl, bc
	ld [hl], a ; store in the buffer, parse it later
	pop hl
	jr .read_byte			; and read next byte	

.eof
; a = 0, mark channel as inactive
	ld hl, FT_SFX_PTR_H
	ld [hl], a
	

.update_buf ; changed. Will sound any time sfx vol > 0
; pulse 1	
	xor a	; just turn these off ??
	ld [FT_PULSE1_TRIG], a
	ld [FT_PULSE2_TRIG], a
	ld [FT_NOISE_TRIG], a

	ld a, [FT_SFX_BUF]
	and $0f ; just vol
	jr z, .no_pulse1
	ld [FT_MR_PULSE1_V], a
	ld a, [FT_SFX_BUF]
	and $f0 ; just duty
	ld [FT_MR_PULSE1_D], a
	ld a, [FT_SFX_BUF+1] 	; low byte
	ld [FT_MR_PULSE1_L], a
	ld a, [FT_SFX_BUF+2] 	; high byte
	ld [FT_MR_PULSE1_H], a
	
.no_pulse1	
; pulse 2
	ld a, [FT_SFX_BUF+3]
	and $0f ; just vol
	jr z, .no_pulse2
	ld [FT_MR_PULSE2_V], a
	ld a, [FT_SFX_BUF+3]
	and $f0 ; just duty
	ld [FT_MR_PULSE2_D], a
	ld a, [FT_SFX_BUF+4] 	; low byte
	ld [FT_MR_PULSE2_L], a
	ld a, [FT_SFX_BUF+5] 	; high byte
	ld [FT_MR_PULSE2_H], a
	
.no_pulse2	

; skip wave for now FT_SFX_BUF+6,7,8
; TODO, implement ??

; noise
	ld a, [FT_SFX_BUF+9] ; just vol
	and $0f ; just vol
	jr z, .no_noise
	ld [FT_MR_NOISE_V], a
	ld a, [FT_SFX_BUF+10] ; duty and freq
	and $80 ; just duty
	srl a  ; 0 -> 0111 1111 -> c
	ld [FT_MR_NOISE_D], a
	ld a, [FT_SFX_BUF+10]
	and $0f ; just freq
	ld [FT_MR_NOISE_F], a

.no_noise	

	ret
	
	
	
; dummy envelope used to initialize all channels with silence	
FT2DummyEnvelope:
	db $c0,$00,$00
	
	
; 63 tones, (0 = note cut) 
; c1 to d6
FT2NoteTableLSB:
	db	0 ; 0=note cut
	db  $2c, $9c, $06, $6b, $c9, $23,   $77, $c6, $12, $56, $9b, $da
	db  $16, $4e, $83, $b5, $e5, $11,   $3b, $63, $89, $ac, $ce, $ed
	db  $0a, $27, $42, $5b, $72, $89,   $9e, $b2, $c4, $d6, $e7, $f7
	db  $06, $14, $21, $2d, $39, $44,   $4f, $59, $62, $6b, $73, $7b
	db  $83, $8a, $90, $97, $9d, $a2,   $a7, $ac, $b1, $b6, $ba, $be
	db  $c1, $c4, $c8

FT2NoteTableMSB:
	db	0 ; 0=note cut
	db	0, 0, 1, 1, 1, 2,   2, 2, 3, 3, 3, 3 ; 12
	db  4, 4, 4, 4, 4, 5,   5, 5, 5, 5, 5, 5 ; 24
	db  6, 6, 6, 6, 6, 6,   6, 6, 6, 6, 6, 6 ; 36
	db  7, 7, 7, 7, 7, 7,   7, 7, 7, 7, 7, 7 ; 48
	db  7, 7, 7, 7, 7, 7,   7, 7, 7, 7, 7, 7 ; 60
	db  7, 7, 7


FT_End:



	