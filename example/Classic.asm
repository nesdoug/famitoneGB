;this file for FamiTone2 GB library generated by text2dataGB tool

Classic_music_data:
	db 4
	dw .instruments
	dw .song0ch0,.song0ch1,.song0ch2,.song0ch3,256 ; Orpheus
	dw .song1ch0,.song1ch1,.song1ch2,.song1ch3,256 ; Mountain King
	dw .song2ch0,.song2ch1,.song2ch2,.song2ch3,256 ; Lightning Polka
	dw .song3ch0,.song3ch1,.song3ch2,.song3ch3,256 ; Carmen

.instruments:
	db $70 ;instrument $00
	dw .env1,.env0,.env24
	db $00
	db $70 ;instrument $01
	dw .env2,.env0,.env0
	db $00
	db $70 ;instrument $02
	dw .env3,.env0,.env0
	db $00
	db $70 ;instrument $03
	dw .env4,.env0,.env0
	db $00
	db $b0 ;instrument $04
	dw .env5,.env0,.env24
	db $00
	db $b0 ;instrument $05
	dw .env6,.env0,.env0
	db $00
	db $b0 ;instrument $06
	dw .env7,.env0,.env0
	db $00
	db $b0 ;instrument $07
	dw .env8,.env0,.env24
	db $00
	db $b0 ;instrument $08
	dw .env9,.env0,.env0
	db $00
	db $b0 ;instrument $09
	dw .env11,.env23,.env0
	db $00
	db $b0 ;instrument $0a
	dw .env10,.env0,.env0
	db $00
	db $b0 ;instrument $0b
	dw .env12,.env0,.env0
	db $00
	db $30 ;instrument $0c
	dw .env13,.env23,.env0
	db $00
	db $70 ;instrument $0d
	dw .env14,.env0,.env0
	db $00
	db $70 ;instrument $0e
	dw .env15,.env0,.env0
	db $00
	db $70 ;instrument $0f
	dw .env7,.env0,.env0
	db $00
	db $b0 ;instrument $10
	dw .env16,.env0,.env0
	db $00
	db $b0 ;instrument $11
	dw .env17,.env0,.env0
	db $00
	db $b0 ;instrument $12
	dw .env18,.env0,.env0
	db $00
	db $b0 ;instrument $13
	dw .env19,.env0,.env0
	db $00
	db $70 ;instrument $14
	dw .env20,.env0,.env24
	db $00
	db $b0 ;instrument $15
	dw .env21,.env23,.env0
	db $00
	db $70 ;instrument $16
	dw .env22,.env0,.env0
	db $00

.env0:
	db $c0,$00,$00
.env1:
	db $c3,$c4,$c3,$c5,$c6,$c8,$ca,$c8,$c7,$c6,$c4,$02,$c2,$00,$0c
.env2:
	db $c1,$c9,$c6,$c5,$c4,$02,$c1,$04,$c0,$00,$08
.env3:
	db $c0,$c8,$c5,$02,$c1,$c0,$00,$05
.env4:
	db $c2,$c4,$c6,$c7,$c7,$c6,$c5,$02,$c2,$00,$08
.env5:
	db $c9,$00,$00
.env6:
	db $c3,$c9,$cf,$cb,$c8,$c5,$02,$c1,$02,$c0,$00,$09
.env7:
	db $c3,$c9,$cf,$cb,$c9,$c7,$c5,$03,$c2,$03,$c1,$00,$0a
.env8:
	db $c3,$c7,$cb,$cd,$cb,$c9,$c7,$c6,$c4,$02,$c3,$00,$0a
.env9:
	db $c1,$ce,$ca,$c7,$c5,$02,$c2,$02,$c1,$04,$c0,$00,$0a
.env10:
	db $c0,$c1,$c2,$c3,$02,$c0,$00,$05
.env11:
	db $c0,$c3,$c2,$02,$c0,$00,$04
.env12:
	db $c0,$c8,$c5,$c3,$02,$c1,$02,$c0,$00,$07
.env13:
	db $c0,$c3,$c5,$c7,$c6,$c5,$02,$c1,$03,$c0,$00,$09
.env14:
	db $c4,$c6,$cb,$cc,$cc,$cd,$cd,$c6,$c0,$00,$08
.env15:
	db $c3,$c9,$cf,$cd,$c9,$c7,$c4,$02,$c2,$02,$c1,$02,$c0,$00,$0c
.env16:
	db $c2,$c6,$ca,$c8,$c6,$c5,$02,$c2,$02,$c1,$00,$09
.env17:
	db $c1,$c3,$c6,$c5,$02,$c3,$02,$c1,$00,$07
.env18:
	db $c2,$c5,$ca,$c8,$c6,$c4,$02,$c1,$02,$c0,$00,$09
.env19:
	db $c1,$c3,$c6,$c5,$c4,$02,$c1,$02,$c0,$00,$08
.env20:
	db $c2,$c3,$c2,$c3,$c4,$c5,$c6,$c7,$c6,$c5,$02,$c2,$00,$0b
.env21:
	db $c0,$c2,$c1,$02,$c0,$00,$04
.env22:
	db $c3,$c6,$c9,$c8,$c7,$c5,$c3,$02,$c2,$02,$c1,$02,$c0,$00,$0c
.env23:
	db $c0,$bf,$be,$00,$02
.env24:
	db $c0,$06,$c1,$c2,$02,$c1,$c0,$c0,$c0,$00,$02


; Orpheus
.song0ch0:
	db $fb,$07
.song0ch0loop:
.ref0:
	db $a2,$17,$a0,$25,$a4,$25,$8a,$29,$25,$21,$21,$8c,$29,$2b,$8a,$33
	db $39,$a4,$33,$8a,$33,$8c,$2f,$8e,$2e,$85
.ref1:
	db $8a,$33,$a4,$1f,$a0,$1f,$8c,$33,$8a,$2f,$a4,$21,$a0,$21,$8c,$29
	db $8e,$29,$25,$29,$25,$8c,$29,$a0,$25,$8c,$29,$a0,$24,$81
	db $ff,$10
	dw .ref0
.ref3:
	db $8a,$33,$a4,$1f,$a0,$1f,$8c,$33,$8a,$2f,$a4,$21,$a0,$21,$8c,$29
	db $8e,$29,$25,$29,$25,$8c,$25,$21,$20,$85
.ref4:
	db $8e,$28,$85,$20,$85,$1a,$85,$16,$85,$8c,$2f,$a4,$25,$29,$2b,$a0
	db $29,$25,$8e,$20,$85
.ref5:
	db $28,$85,$20,$85,$1a,$85,$16,$85,$8c,$15,$a4,$17,$1b,$1f,$a0,$25
	db $21,$8e,$20,$85
.ref6:
	db $28,$85,$20,$85,$1a,$85,$16,$85,$8c,$2f,$a4,$25,$29,$2b,$a0,$29
	db $25,$8e,$20,$85
.ref7:
	db $28,$85,$20,$85,$1a,$85,$16,$85,$8c,$15,$a4,$17,$1b,$1f,$a0,$21
	db $17,$8e,$1f,$a4,$16,$81
.ref8:
	db $8a,$21,$a4,$17,$8a,$1f,$a4,$17,$8a,$21,$a4,$20,$81
.ref9:
	db $8a,$21,$a4,$21,$8a,$21,$a4,$21,$8a,$21,$a4,$20,$81
.ref10:
	db $8e,$2a,$8d,$a0,$2f,$8c,$35,$a0,$33,$8c,$2f,$8e,$38,$85,$38,$85
	db $a0,$39,$8c,$3d,$a0,$33,$8c,$34,$81
.ref11:
	db $8e,$2e,$85,$2e,$85,$a0,$2f,$8c,$35,$a0,$33,$8c,$2f,$8e,$2b,$8c
	db $43,$41,$3d,$39,$a0,$35,$33,$2e,$81
	db $ff,$0f
	dw .ref10
.ref13:
	db $8e,$2e,$85,$2e,$85,$a0,$2f,$8c,$35,$a0,$33,$8c,$2f,$8e,$2b,$01
	db $8c,$20,$85,$2b,$a0,$21,$21,$20,$81
	db $ff,$0f
	dw .ref10
	db $ff,$11
	dw .ref11
	db $ff,$0f
	dw .ref10
	db $ff,$11
	dw .ref13
	db $fd
	dw .song0ch0loop

; Orpheus
.song0ch1:
.song0ch1loop:
.ref18:
	db $82,$0d,$84,$2f,$2f,$2f,$82,$09,$84,$2f,$2f,$2f,$13,$21,$21,$21
	db $01,$21,$21,$20,$81
.ref19:
	db $01,$1f,$1f,$1f,$01,$21,$21,$21,$82,$0d,$84,$21,$21,$21,$82,$17
	db $84,$2f,$82,$2f,$00,$81
.ref20:
	db $0d,$84,$2f,$2f,$2f,$82,$09,$84,$2f,$2f,$2f,$13,$21,$21,$21,$01
	db $21,$21,$20,$81
	db $ff,$11
	dw .ref19
.ref22:
	db $80,$58,$85,$50,$85,$4a,$85,$46,$85,$82,$0d,$84,$2f,$2f,$2f,$21
	db $2f,$2e,$85
	db $ff,$10
	dw .ref22
	db $ff,$10
	dw .ref22
	db $ff,$10
	dw .ref22
.ref26:
	db $8e,$46,$85,$46,$85,$8a,$39,$a4,$38,$81
.ref27:
	db $8a,$39,$a4,$39,$86,$08,$8d
.ref28:
	db $80,$13,$8a,$21,$21,$21,$80,$13,$8a,$21,$21,$21,$80,$13,$8a,$21
	db $21,$21,$80,$13,$8a,$21,$21,$20,$81
	db $ff,$11
	dw .ref28
	db $ff,$11
	dw .ref28
.ref31:
	db $80,$13,$8a,$21,$21,$21,$80,$13,$8a,$21,$21,$21,$80,$12,$85,$8a
	db $08,$85,$12,$85,$08,$85
	db $ff,$11
	dw .ref28
	db $ff,$11
	dw .ref28
	db $ff,$11
	dw .ref28
	db $ff,$10
	dw .ref31
	db $fd
	dw .song0ch1loop

; Orpheus
.song0ch2:
.song0ch2loop:
.ref36:
	db $00,$bd
.ref37:
	db $bf
.ref38:
	db $00,$bd
.ref39:
	db $bf
.ref40:
	db $8e,$28,$85,$20,$85,$1a,$85,$16,$85,$00,$9d
.ref41:
	db $28,$85,$20,$85,$1a,$85,$16,$85,$00,$9d
	db $ff,$0a
	dw .ref41
	db $ff,$0a
	dw .ref41
.ref44:
	db $00,$8d,$88,$20,$00,$83
.ref45:
	db $20,$00,$83,$8e,$20,$00,$20,$00,$20,$00,$20,$00
.ref46:
	db $00,$85,$8a,$12,$85,$00,$85,$12,$85,$00,$85,$12,$85,$00,$85,$12
	db $85
.ref47:
	db $00,$85,$12,$85,$00,$85,$12,$85,$00,$85,$12,$85,$00,$85,$12,$85
	db $ff,$10
	dw .ref47
.ref49:
	db $00,$85,$12,$85,$00,$85,$12,$85,$00,$9d
	db $ff,$10
	dw .ref47
	db $ff,$10
	dw .ref47
	db $ff,$10
	dw .ref47
	db $ff,$0a
	dw .ref49
	db $fd
	dw .song0ch2loop

; Orpheus
.song0ch3:
.song0ch3loop:
.ref54:
	db $96,$21,$92,$19,$19,$94,$17,$96,$21,$92,$19,$19,$94,$17,$96,$21
	db $92,$19,$19,$94,$17,$96,$21,$92,$19,$18,$85
.ref55:
	db $96,$21,$92,$19,$19,$94,$17,$96,$21,$92,$19,$19,$94,$17,$96,$21
	db $92,$19,$19,$94,$17,$96,$21,$92,$19,$19,$18,$81
	db $ff,$10
	dw .ref54
	db $ff,$11
	dw .ref55
.ref58:
	db $96,$20,$85,$20,$85,$20,$85,$20,$85,$21,$92,$19,$19,$94,$17,$96
	db $21,$92,$19,$18,$85
	db $ff,$10
	dw .ref58
	db $ff,$10
	dw .ref58
	db $ff,$10
	dw .ref58
.ref62:
	db $96,$21,$92,$19,$19,$94,$17,$96,$21,$92,$18,$81
.ref63:
	db $19,$94,$17,$96,$21,$92,$19,$19,$94,$16,$81
.ref64:
	db $96,$20,$85,$98,$18,$85,$96,$20,$85,$98,$18,$85,$96,$20,$85,$98
	db $18,$85,$96,$20,$85,$98,$18,$85
	db $ff,$10
	dw .ref64
	db $ff,$10
	dw .ref64
.ref67:
	db $96,$20,$85,$98,$18,$85,$96,$20,$85,$98,$18,$85,$96,$20,$85,$00
	db $95
.ref68:
	db $20,$85,$98,$18,$85,$96,$20,$85,$98,$18,$85,$96,$20,$85,$98,$18
	db $85,$96,$20,$85,$98,$18,$85
	db $ff,$10
	dw .ref64
	db $ff,$10
	dw .ref64
	db $ff,$0c
	dw .ref67
	db $fd
	dw .song0ch3loop


; Mountain King
.song1ch0:
.ref72:
	db $8c,$02,$85,$10,$85,$02,$85,$10,$85,$02,$85,$10,$85,$02,$85,$10
	db $85,$02,$85,$10,$85,$02,$85,$10,$85,$08,$85,$16,$85,$08,$85,$16
	db $85
.ref73:
	db $02,$85,$10,$85,$02,$85,$10,$85,$02,$85,$10,$85,$02,$85,$10,$85
	db $02,$85,$10,$85,$02,$85,$10,$85,$08,$85,$16,$85,$08,$85,$16,$85
.ref74:
	db $10,$85,$1e,$85,$10,$85,$1e,$85,$08,$85,$18,$85,$10,$85,$18,$85
	db $10,$85,$1e,$85,$10,$85,$1e,$85,$08,$85,$18,$85,$10,$85,$18,$85
	db $ff,$20
	dw .ref74
	db $ff,$20
	dw .ref73
	db $ff,$20
	dw .ref73
	db $ff,$20
	dw .ref74
	db $ff,$20
	dw .ref74
	db $ff,$20
	dw .ref73
	db $ff,$20
	dw .ref73
.song1ch0loop:
.ref82:
	db $8c,$10,$85,$1e,$85,$10,$85,$1e,$85,$08,$85,$18,$85,$10,$85,$18
	db $85,$10,$85,$1e,$85,$10,$85,$1e,$85,$08,$85,$18,$85,$10,$85,$18
	db $85
	db $ff,$20
	dw .ref74
	db $ff,$20
	dw .ref73
	db $ff,$20
	dw .ref73
	db $fd
	dw .song1ch0loop

; Mountain King
.song1ch1:
.ref86:
	db $a6,$1b,$1f,$a4,$21,$25,$8a,$29,$21,$28,$85,$a4,$27,$1f,$26,$85
	db $a6,$25,$1d,$24,$85,$1b,$1f,$a4,$21,$25,$8a,$29,$21,$29,$33,$2f
	db $29,$21,$29,$2e,$8d
	db $ff,$1e
	dw .ref86
.ref88:
	db $a6,$29,$2d,$a4,$31,$33,$8a,$37,$31,$36,$85,$a4,$39,$31,$38,$85
	db $a6,$37,$31,$36,$85,$29,$2d,$a4,$31,$33,$8a,$37,$31,$36,$85,$39
	db $31,$38,$85,$36,$8d
	db $ff,$1e
	dw .ref88
.ref90:
	db $a6,$33,$37,$a4,$39,$3d,$8a,$41,$39,$40,$85,$a4,$3f,$37,$3e,$85
	db $a6,$3d,$35,$3c,$85,$33,$37,$a4,$39,$3d,$8a,$41,$39,$41,$4b,$47
	db $41,$39,$41,$46,$8d
	db $ff,$1e
	dw .ref90
	db $ff,$1e
	dw .ref88
	db $ff,$1e
	dw .ref88
	db $ff,$1e
	dw .ref86
	db $ff,$1e
	dw .ref86
.song1ch1loop:
	db $ff,$1e
	dw .ref88
	db $ff,$1e
	dw .ref88
	db $ff,$1e
	dw .ref86
	db $ff,$1e
	dw .ref86
	db $fd
	dw .song1ch1loop

; Mountain King
.song1ch2:
	db $fb,$08
.ref100:
	db $fb,$08,$97,$84,$40,$8d,$3e,$8d,$40,$9d,$40,$85,$46,$85,$38,$85
	db $46,$8d
.ref101:
	db $97,$40,$8d,$3e,$8d,$40,$9d,$40,$85,$46,$85,$38,$85,$46,$8d
.ref102:
	db $97,$4e,$8d,$50,$8d,$4e,$9d,$4e,$8d,$50,$85,$4e,$8d
	db $ff,$0d
	dw .ref102
.ref104:
	db $fb,$07,$97,$40,$8d,$3e,$8d,$40,$9d,$40,$85,$46,$85,$38,$85,$46
	db $8d
	db $ff,$0f
	dw .ref101
	db $ff,$0d
	dw .ref102
	db $ff,$0d
	dw .ref102
	db $ff,$0f
	dw .ref101
	db $ff,$0f
	dw .ref101
.song1ch2loop:
.ref110:
	db $fb,$06,$97,$9a,$4e,$8d,$50,$8d,$4e,$9d,$4e,$8d,$50,$85,$4e,$8d
	db $ff,$0d
	dw .ref102
	db $ff,$0f
	dw .ref101
	db $ff,$0f
	dw .ref101
	db $fd
	dw .song1ch2loop

; Mountain King
.song1ch3:
.ref114:
	db $96,$20,$85,$92,$16,$85,$96,$20,$85,$92,$16,$85,$96,$20,$85,$92
	db $16,$85,$96,$20,$85,$92,$16,$85,$96,$20,$85,$92,$16,$85,$96,$20
	db $85,$92,$16,$85,$96,$20,$85,$92,$16,$85,$96,$20,$85,$92,$16,$85
	db $ff,$20
	dw .ref114
	db $ff,$20
	dw .ref114
	db $ff,$20
	dw .ref114
	db $ff,$20
	dw .ref114
	db $ff,$20
	dw .ref114
	db $ff,$20
	dw .ref114
	db $ff,$20
	dw .ref114
	db $ff,$20
	dw .ref114
	db $ff,$20
	dw .ref114
.song1ch3loop:
	db $ff,$20
	dw .ref114
	db $ff,$20
	dw .ref114
	db $ff,$20
	dw .ref114
	db $ff,$20
	dw .ref114
	db $fd
	dw .song1ch3loop


; Lightning Polka
.song2ch0:
	db $fb,$07
.ref128:
	db $01,$ac,$2c,$28,$9c,$20,$85,$14,$85,$20,$85,$14,$81
.ref129:
	db $83,$28,$83,$ac,$28,$9c,$28,$83,$ac,$28,$9e,$28,$89,$ac,$2c,$28
.song2ch0loop:
.ref130:
	db $9c,$1e,$85,$16,$85,$1e,$85,$16,$85,$28,$83,$ac,$28,$9c,$28,$83
	db $ac,$28,$9e,$28,$89,$ac,$2c,$28
.ref131:
	db $9c,$20,$85,$2c,$85,$2c,$85,$38,$85,$2c,$83,$ac,$2c,$9c,$2c,$83
	db $ac,$2c,$9e,$2c,$87,$ac,$28,$24,$20
.ref132:
	db $9c,$1e,$85,$2e,$85,$2e,$85,$36,$85,$2e,$83,$ac,$2e,$9c,$2e,$83
	db $ac,$2e,$9e,$2e,$89,$ac,$2c,$28
.ref133:
	db $9c,$20,$85,$14,$85,$20,$85,$14,$85,$28,$83,$ac,$28,$9c,$28,$83
	db $ac,$28,$9e,$28,$89,$ac,$2c,$28
.ref134:
	db $9c,$1e,$85,$16,$85,$1e,$85,$16,$85,$28,$83,$ac,$28,$9c,$28,$83
	db $ac,$28,$9e,$28,$89,$ac,$28,$24
.ref135:
	db $9c,$22,$85,$2e,$85,$2e,$85,$36,$85,$32,$83,$ac,$32,$9c,$32,$83
	db $ac,$32,$9e,$32,$85,$9c,$36,$ac,$32,$2e,$32
.ref136:
	db $9c,$37,$2f,$ac,$29,$2d,$2f,$33,$37,$9c,$3a,$81
.ref137:
	db $3d,$ac,$25,$25,$25,$27,$25,$29,$24,$81
.ref138:
	db $9e,$2a,$89,$9c,$25,$27,$25,$29,$25,$9e,$2c,$89,$9c,$25,$30,$85
.ref139:
	db $ac,$24,$85,$9c,$30,$85,$ac,$24,$85,$9e,$32,$85,$01,$9c,$41,$3d
	db $39,$37,$ac,$32,$81
.ref140:
	db $9c,$38,$85,$36,$85,$32,$85,$2e,$85,$ac,$2c,$85,$28,$85,$26,$85
	db $28,$85
.ref141:
	db $9c,$24,$85,$38,$83,$ac,$2c,$9e,$2c,$8d,$ac,$24,$85,$9c,$36,$83
	db $ac,$2e,$9c,$2f,$ac,$3d,$9c,$41,$3c,$81
.ref142:
	db $38,$85,$36,$85,$ac,$32,$85,$2e,$85,$2c,$85,$28,$85,$26,$85,$28
	db $85
.ref143:
	db $24,$85,$9c,$36,$83,$ac,$2e,$9c,$24,$85,$3c,$83,$ac,$36,$9c,$41
	db $3d,$ac,$33,$37,$9c,$2f,$3d,$41,$3c,$81
	db $ff,$10
	dw .ref142
.ref145:
	db $24,$85,$9c,$38,$83,$ac,$2c,$9e,$2c,$8d,$ac,$24,$85,$9c,$38,$83
	db $ac,$2e,$9c,$2f,$3d,$41,$3c,$81
	db $ff,$10
	dw .ref142
.ref147:
	db $24,$85,$9c,$38,$83,$ac,$2e,$9c,$24,$85,$3c,$83,$ac,$36,$9c,$41
	db $3d,$33,$ac,$37,$2f,$2f,$9e,$2e,$83,$00
.ref148:
	db $83,$ac,$2c,$28,$9c,$20,$85,$14,$85,$20,$85,$14,$81
.ref149:
	db $83,$28,$83,$ac,$28,$9c,$28,$83,$ac,$28,$9e,$28,$89,$ac,$2c,$9c
	db $28
	db $fd
	dw .song2ch0loop

; Lightning Polka
.song2ch1:
.ref150:
	db $00,$85,$a4,$1b,$39,$0d,$39,$1b,$39,$0c,$81
.ref151:
	db $39,$2d,$39,$0d,$39,$2d,$39,$39,$38,$81
.song2ch1loop:
.ref152:
	db $a4,$17,$37,$1f,$37,$17,$37,$1f,$37,$17,$37,$1f,$37,$37,$37,$37
	db $36,$81
.ref153:
	db $1b,$39,$0d,$39,$1b,$39,$0d,$39,$1b,$39,$0d,$39,$1b,$39,$39,$38
	db $81
.ref154:
	db $17,$37,$0d,$37,$17,$37,$0d,$37,$17,$37,$0d,$37,$17,$37,$37,$36
	db $81
.ref155:
	db $1b,$39,$0d,$39,$1b,$39,$0d,$39,$15,$39,$0d,$39,$15,$39,$39,$38
	db $81
.ref156:
	db $17,$37,$1f,$37,$17,$37,$1f,$37,$17,$37,$1f,$37,$17,$37,$37,$36
	db $81
.ref157:
	db $29,$47,$1b,$47,$29,$47,$1b,$47,$25,$45,$25,$45,$25,$45,$45,$44
	db $81
.ref158:
	db $2f,$47,$2f,$47,$1b,$47,$1b,$46,$81
.ref159:
	db $45,$3d,$3d,$3d,$3f,$3d,$41,$3c,$81
.ref160:
	db $3d,$3d,$3d,$3d,$3f,$3d,$41,$3d,$3d,$3d,$3d,$3d,$42,$85
.ref161:
	db $1e,$85,$42,$85,$1e,$85,$44,$9d
.ref162:
	db $17,$2f,$17,$2f,$17,$2f,$17,$2f,$21,$39,$21,$39,$21,$39,$21,$38
	db $81
.ref163:
	db $25,$3d,$25,$3d,$25,$33,$2d,$25,$17,$2f,$17,$2f,$17,$2f,$2f,$2e
	db $81
	db $ff,$11
	dw .ref162
.ref165:
	db $3d,$01,$3d,$01,$25,$39,$25,$39,$36,$8d,$17,$2f,$2f,$2e,$81
	db $ff,$11
	dw .ref162
	db $ff,$11
	dw .ref163
	db $ff,$11
	dw .ref162
.ref169:
	db $3c,$8d,$3c,$8d,$17,$2f,$17,$2f,$17,$2f,$2e,$85
.ref170:
	db $87,$1b,$39,$0d,$39,$1b,$39,$0c,$81
.ref171:
	db $39,$1b,$39,$0d,$39,$1b,$39,$39,$38,$81
	db $fd
	dw .song2ch1loop

; Lightning Polka
.song2ch2:
.ref172:
	db $01,$8a,$24,$3c,$83,$44,$85,$44,$85,$44,$85
.ref173:
	db $44,$85,$4a,$85,$4a,$85,$45,$45,$44,$81
.song2ch2loop:
.ref174:
	db $83,$8a,$46,$85,$46,$85,$46,$85,$46,$85,$46,$85,$46,$85,$47,$47
	db $46,$81
.ref175:
	db $83,$44,$85,$44,$85,$44,$85,$44,$85,$44,$85,$44,$85,$45,$45,$44
	db $81
.ref176:
	db $83,$46,$85,$46,$85,$46,$85,$46,$85,$46,$85,$46,$85,$47,$47,$46
	db $81
.ref177:
	db $83,$44,$85,$44,$85,$44,$85,$44,$85,$4a,$85,$4a,$85,$45,$45,$44
	db $81
	db $ff,$11
	dw .ref176
.ref179:
	db $83,$84,$52,$85,$52,$85,$52,$85,$52,$85,$54,$85,$54,$85,$55,$55
	db $54,$81
.ref180:
	db $83,$58,$85,$58,$85,$58,$85,$58,$81
.ref181:
	db $55,$8a,$4b,$4b,$4a,$91
.ref182:
	db $51,$51,$50,$95,$4b,$4b,$4a,$85,$84,$54,$85
.ref183:
	db $8a,$30,$85,$84,$54,$85,$8a,$30,$85,$38,$9d
.ref184:
	db $83,$3c,$85,$3c,$85,$3c,$85,$3c,$85,$4a,$85,$4a,$85,$4a,$85,$4a
	db $81
.ref185:
	db $83,$50,$85,$50,$85,$33,$2d,$24,$85,$3c,$85,$3c,$85,$47,$47,$46
	db $81
	db $ff,$11
	dw .ref184
.ref187:
	db $4e,$8d,$4e,$91,$44,$85,$45,$46,$8d
	db $ff,$11
	dw .ref184
	db $ff,$11
	dw .ref185
	db $ff,$11
	dw .ref184
.ref191:
	db $4e,$8d,$4e,$91,$44,$85,$45,$47,$47,$46,$85
.ref192:
	db $8b,$44,$85,$44,$85,$44,$85
	db $ff,$0a
	dw .ref173
	db $fd
	dw .song2ch2loop

; Lightning Polka
.song2ch3:
.ref194:
	db $00,$85,$96,$21,$94,$13,$96,$21,$94,$13,$96,$21,$94,$13,$96,$20
	db $81
.ref195:
	db $94,$13,$96,$21,$94,$13,$96,$21,$94,$13,$96,$21,$94,$13,$13,$12
	db $81
.song2ch3loop:
.ref196:
	db $96,$21,$94,$13,$96,$21,$94,$13,$96,$21,$94,$13,$96,$21,$94,$13
	db $96,$21,$94,$13,$96,$21,$94,$13,$96,$21,$94,$13,$13,$12,$81
	db $ff,$11
	dw .ref196
	db $ff,$11
	dw .ref196
	db $ff,$11
	dw .ref196
	db $ff,$11
	dw .ref196
	db $ff,$11
	dw .ref196
.ref202:
	db $96,$21,$94,$13,$96,$21,$94,$13,$96,$21,$94,$13,$96,$21,$94,$12
	db $81
.ref203:
	db $96,$21,$94,$13,$96,$21,$94,$13,$96,$21,$94,$13,$13,$12,$81
.ref204:
	db $96,$21,$94,$13,$13,$13,$13,$13,$13,$13,$96,$21,$94,$13,$13,$13
	db $13,$12,$81
.ref205:
	db $13,$13,$96,$21,$94,$13,$96,$21,$94,$13,$96,$21,$00,$85,$94,$13
	db $96,$21,$94,$13,$96,$21,$94,$12,$81
	db $ff,$11
	dw .ref196
	db $ff,$11
	dw .ref196
	db $ff,$11
	dw .ref196
	db $ff,$11
	dw .ref196
	db $ff,$11
	dw .ref196
	db $ff,$11
	dw .ref196
	db $ff,$11
	dw .ref196
.ref213:
	db $96,$21,$94,$13,$96,$21,$94,$13,$96,$21,$94,$13,$96,$21,$94,$13
	db $96,$21,$94,$13,$96,$21,$94,$13,$96,$21,$94,$13,$96,$21,$00,$81
.ref214:
	db $87,$21,$94,$13,$96,$21,$94,$13,$96,$21,$94,$13,$96,$20,$81
	db $ff,$0a
	dw .ref195
	db $fd
	dw .song2ch3loop


; Carmen
.song3ch0:
.song3ch0loop:
.ref216:
	db $90,$0a,$89,$96,$19,$90,$28,$85,$18,$85,$0a,$89,$96,$19,$90,$28
	db $85,$18,$85,$0a,$89,$96,$19,$90,$28,$85,$18,$85,$0a,$89,$96,$19
	db $90,$28,$85,$18,$85
.ref217:
	db $0a,$89,$96,$19,$90,$28,$85,$18,$85,$0a,$89,$96,$19,$90,$28,$85
	db $18,$85,$0a,$89,$96,$19,$90,$28,$85,$18,$85,$0a,$89,$96,$19,$90
	db $2a,$85,$18,$85
.ref218:
	db $0a,$89,$96,$19,$90,$2a,$85,$18,$85,$0a,$89,$96,$19,$90,$2a,$85
	db $18,$85,$0a,$89,$96,$19,$90,$2a,$85,$18,$85,$0a,$89,$96,$19,$90
	db $2a,$85,$18,$85
	db $ff,$1c
	dw .ref218
	db $ff,$1c
	dw .ref218
	db $ff,$1c
	dw .ref218
	db $ff,$1c
	dw .ref218
	db $ff,$1c
	dw .ref218
	db $ff,$1c
	dw .ref218
	db $ff,$1c
	dw .ref218
	db $ff,$1c
	dw .ref218
	db $ff,$1c
	dw .ref218
	db $ff,$1c
	dw .ref218
	db $ff,$1c
	dw .ref218
	db $fd
	dw .song3ch0loop

; Carmen
.song3ch1:
.song3ch1loop:
.ref230:
	db $00,$8d,$82,$30,$9d,$30,$9d,$30,$9d,$80,$3a,$85,$38,$85
.ref231:
	db $36,$83,$36,$83,$a8,$37,$80,$34,$85,$32,$85,$30,$85,$31,$a8,$31
	db $80,$2e,$85,$2c,$85,$a8,$28,$2c,$29,$80,$27,$29,$2c,$85,$28,$85
	db $26,$8d,$3a,$85,$38,$85
.ref232:
	db $36,$83,$36,$83,$a8,$37,$80,$34,$85,$32,$85,$31,$a8,$30,$85,$31
	db $80,$2c,$85,$28,$85,$a8,$26,$28,$27,$80,$23,$27,$28,$85,$26,$85
	db $22,$8d,$3a,$85,$38,$85
.ref233:
	db $36,$83,$36,$83,$a8,$37,$80,$34,$85,$32,$85,$31,$a8,$30,$85,$31
	db $80,$2e,$85,$2c,$85,$a8,$28,$2c,$29,$80,$27,$29,$2c,$85,$28,$85
	db $26,$8d,$3a,$85,$38,$85
.ref234:
	db $36,$83,$36,$83,$a8,$37,$80,$34,$85,$32,$85,$31,$a8,$30,$85,$31
	db $80,$2c,$85,$28,$85,$a8,$26,$28,$27,$80,$23,$27,$28,$85,$26,$85
	db $22,$8d,$52,$85,$50,$85
.ref235:
	db $4e,$83,$4e,$83,$a8,$4f,$80,$4c,$85,$4a,$85,$48,$85,$49,$a8,$49
	db $80,$46,$85,$44,$85,$a8,$40,$44,$41,$80,$3f,$41,$44,$85,$40,$85
	db $3e,$8d,$52,$85,$50,$85
.ref236:
	db $4e,$83,$4e,$83,$a8,$4f,$80,$4c,$85,$4a,$85,$49,$a8,$48,$85,$49
	db $80,$44,$85,$40,$85,$a8,$3e,$40,$3f,$80,$3b,$3f,$40,$85,$3e,$85
	db $3a,$8d,$52,$85,$50,$85
	db $ff,$20
	dw .ref235
.ref238:
	db $4e,$83,$4e,$83,$a8,$4f,$80,$4c,$85,$4a,$85,$49,$a8,$48,$85,$49
	db $80,$44,$85,$40,$85,$a8,$3e,$40,$3f,$80,$3b,$3f,$40,$85,$3e,$85
	db $3a,$89,$19,$22,$85,$26,$85
.ref239:
	db $2a,$89,$a8,$31,$80,$2a,$85,$26,$85,$22,$89,$a8,$27,$80,$2a,$85
	db $2c,$85,$31,$a8,$31,$31,$31,$80,$34,$85,$30,$85,$2c,$89,$a8,$35
	db $80,$26,$85,$2a,$85
.ref240:
	db $2c,$89,$a8,$35,$80,$2c,$85,$2a,$85,$26,$89,$a8,$2b,$80,$2c,$85
	db $30,$85,$35,$a8,$35,$35,$35,$80,$38,$85,$34,$85,$30,$85,$01,$a8
	db $49,$80,$52,$85,$56,$85
.ref241:
	db $5a,$89,$a8,$31,$80,$2a,$85,$26,$85,$22,$89,$a8,$27,$80,$2a,$85
	db $2c,$85,$31,$a8,$31,$31,$31,$80,$3a,$89,$a8,$39,$80,$2c,$89,$a8
	db $4d,$80,$56,$85,$5a,$85
.ref242:
	db $5c,$89,$a8,$35,$80,$2c,$85,$2a,$85,$26,$89,$a8,$43,$80,$44,$85
	db $48,$85,$50,$83,$4c,$83,$49,$45,$a8,$3d,$80,$5a,$83,$a8,$56,$80
	db $52,$89,$a8,$49,$80,$5a,$85,$48,$85
.ref243:
	db $3a,$89,$a8,$31,$80,$42,$85,$30,$85,$22,$89,$a8,$19,$80,$2a,$85
	db $18,$85,$0a,$8d,$00,$8d,$00,$9d
	db $fd
	dw .song3ch1loop

; Carmen
.song3ch2:
	db $fb,$07
.song3ch2loop:
.ref244:
	db $00,$8d,$82,$22,$9d,$22,$9d,$22,$9d,$22,$8d
.ref245:
	db $fb,$05,$00,$83,$fb,$07,$89,$22,$9d,$22,$8d,$fb,$08,$83,$fb,$07
	db $8b,$22,$9d,$22,$8d
	db $ff,$0d
	dw .ref245
	db $ff,$0d
	dw .ref245
	db $ff,$0d
	dw .ref245
	db $ff,$0d
	dw .ref245
	db $ff,$0d
	dw .ref245
	db $ff,$0d
	dw .ref245
	db $ff,$0d
	dw .ref245
.ref253:
	db $00,$8d,$22,$9d,$22,$9d,$22,$9d,$22,$8d
	db $ff,$0a
	dw .ref253
	db $ff,$0a
	dw .ref253
.ref256:
	db $00,$8d,$22,$9d,$22,$8d,$fb,$06,$8b,$fb,$07,$83,$22,$85,$fb,$08
	db $87,$fb,$07,$8f,$22,$8d
.ref257:
	db $00,$8d,$22,$9d,$22,$cd
	db $fd
	dw .song3ch2loop

; Carmen
.song3ch3:
.song3ch3loop:
.ref258:
	db $f9,$85
.ref259:
	db $f9,$85
.ref260:
	db $f9,$85
.ref261:
	db $f9,$85
.ref262:
	db $eb,$aa,$17,$92,$16,$85,$16,$85
.ref263:
	db $16,$89,$aa,$17,$92,$16,$85,$16,$85,$16,$89,$aa,$17,$92,$16,$85
	db $16,$85,$16,$8d,$16,$85,$16,$85,$16,$89,$aa,$17,$92,$16,$85,$16
	db $85
	db $ff,$1b
	dw .ref263
	db $ff,$1b
	dw .ref263
	db $ff,$1b
	dw .ref263
.ref267:
	db $16,$89,$aa,$17,$92,$16,$85,$16,$85,$16,$89,$aa,$17,$92,$16,$85
	db $16,$85,$17,$aa,$17,$17,$17,$92,$16,$85,$16,$85,$16,$89,$aa,$17
	db $92,$16,$85,$16,$85
	db $ff,$1d
	dw .ref267
	db $ff,$1d
	dw .ref267
.ref270:
	db $16,$89,$aa,$17,$92,$16,$85,$16,$85,$16,$89,$aa,$17,$92,$16,$85
	db $16,$85,$16,$83,$aa,$16,$83,$17,$92,$17,$aa,$17,$92,$16,$83,$aa
	db $16,$92,$16,$89,$aa,$17,$92,$16,$85,$16,$85
.ref271:
	db $f9,$85
	db $fd
	dw .song3ch3loop