;
; **** ZP ABSOLUTE ADRESSES **** 
;
a01 = $01
a02 = $02
a03 = $03
a04 = $04
a05 = $05
a06 = $06
a07 = $07
a08 = $08
a09 = $09
a0A = $0A
a0B = $0B
a0C = $0C
a0D = $0D
a0E = $0E
a0F = $0F
a10 = $10
a11 = $11
a12 = $12
a13 = $13
a14 = $14
a15 = $15
a16 = $16
a17 = $17
a18 = $18
a19 = $19
a1A = $1A
a1B = $1B
a1C = $1C
a1D = $1D
a1E = $1E
a1F = $1F
a22 = $22
a23 = $23
a24 = $24
a25 = $25
a27 = $27
a28 = $28
a29 = $29
a2A = $2A
a2B = $2B
a2C = $2C
a2D = $2D
a2E = $2E
a2F = $2F
a30 = $30
a31 = $31
a32 = $32
a33 = $33
a34 = $34
a35 = $35
a38 = $38
a39 = $39
a40 = $40
a42 = $42
a43 = $43
a5A = $5A
a7A = $7A
a7B = $7B
aAA = $AA
aAB = $AB
aC5 = $C5
aC9 = $C9
aFB = $FB
aFD = $FD
;
; **** ZP POINTERS **** 
;
p00 = $00
p0A = $0A
p31 = $31
p33 = $33
p42 = $42
;
j03E5 = $03E5
jEA31 = $EA31
;
; **** FIELDS **** 
;
f0000 = $0000
f00A2 = $00A2
f0340 = $0340
f0341 = $0341
f0360 = $0360
f0405 = $0405
f0406 = $0406
f0428 = $0428
f0430 = $0430
f044F = $044F
f0450 = $0450
f046B = $046B
f04CB = $04CB
f0500 = $0500
f0549 = $0549
f054A = $054A
f054C = $054C
f054F = $054F
f0574 = $0574
f0599 = $0599
f059A = $059A
f05E9 = $05E9
f05EA = $05EA
f0600 = $0600
f063A = $063A
f068A = $068A
f0699 = $0699
f06D3 = $06D3
f0700 = $0700
f0773 = $0773
f07A4 = $07A4
fD800 = $D800
fD805 = $D805
fD830 = $D830
fD900 = $D900
fD949 = $D949
fD94F = $D94F
fD971 = $D971
fD999 = $D999
fD9E9 = $D9E9
fDA00 = $DA00
fDA3A = $DA3A
fDB00 = $DB00
fDBA4 = $DBA4
fE000 = $E000
fE001 = $E001
fE002 = $E002
fE003 = $E003
fE004 = $E004
;
; **** ABSOLUTE ADRESSES **** 
;
a0291 = $0291
a0314 = $0314
a0315 = $0315
a0318 = $0318
a0319 = $0319
a041A = $041A
a041E = $041E
a041F = $041F
a0442 = $0442
a0446 = $0446
a0447 = $0447
a046E = $046E
a046F = $046F
a0646 = $0646
a0647 = $0647
a0648 = $0648
a07F8 = $07F8
a07F9 = $07F9
a07FA = $07FA
aD81A = $D81A
aD842 = $D842
aD86C = $D86C
aDA46 = $DA46
aFFFE = $FFFE
;
; **** POINTERS **** 
;
p01 = $0001
p26 = $0026
p0104 = $0104
p0201 = $0201
p0300 = $0300
p0308 = $0308
p0351 = $0351
p03F6 = $03F6
p0400 = $0400
p0402 = $0402
p0520 = $0520
p05FF = $05FF
;
; **** PREDEFINED LABELS **** 
;
ROM_SCNKEY = $FF9F
ROM_CHROUT = $FFD2


        * = $0800

p0800   .BYTE $00,$0B,$08,$00,$00,$9E,$31,$36
        .BYTE $33,$38,$34,$00,$00
        LDA #$93
        JSR ROM_CHROUT ;$FFD2 - output character                 
        LDA #$8E
        JSR ROM_CHROUT ;$FFD2 - output character                 
        LDA #$00
        STA $D020    ;Border Color
        LDA #$0B
        STA $D021    ;Background Color 0
        LDX #$0F
b0823   LDA f0341,X
        AND #$3F
        STA f054F,X
        LDA #$01
        STA fD94F,X
        LDA f08A0,X
        STA f07A4,X
        LDA #$0F
        STA fDBA4,X
        DEX 
        BPL b0823
        SEI 
        LDA #$05
        STA a01
        LDA #$1F
        STA $DC0D    ;CIA1: CIA Interrupt Control Register
        STA $DD0D    ;CIA2: CIA Interrupt Control Register
        LDA $DC0D    ;CIA1: CIA Interrupt Control Register
        LDA $DD0D    ;CIA2: CIA Interrupt Control Register
        LDA #$F0
        STA $D400    ;Voice 1: Frequency Control - Low-Byte
        STA $D406    ;Voice 1: Sustain / Release Cycle Control
        LDA #$0F
        STA $D418    ;Select Filter Mode and Volume
        STA aAB
        LDA #$00
        STA $D404    ;Voice 1: Control Register
        STA $D405    ;Voice 1: Attack / Decay Cycle Control
        STA $D40B    ;Voice 2: Control Register
        STA $D412    ;Voice 3: Control Register
        STA aFD
        STA aFB
        LDA #$21
        STA $D404    ;Voice 1: Control Register
        LDA #$55
        STA aAA
        LDA #$F4
        STA $DC04    ;CIA1: Timer A: Low-Byte
        LDA #$03
        STA $DC05    ;CIA1: Timer A: High-Byte
        LDA #$90
        STA $DC0D    ;CIA1: CIA Interrupt Control Register
        LDA #<p0351
        STA aFFFE    ;IRQ
        LDA #>p0351
        STA $FFFF    ;IRQ
        LDA #<p03F6
        STA a7A
        LDA #>p03F6
        STA a7B
        CLI 
        JMP j03E5

.include "data1.asm"
.include "charset.asm"
.include "sprites.asm"
s4000   LDA #$00
        STA $D020    ;Border Color
        STA $D021    ;Background Color 0
p4009   =*+$01
        STA a5E56
        LDA #$36
        STA a01
        LDA #$02
        STA a5E57
        LDA #$0F
        STA $D418    ;Select Filter Mode and Volume
        JSR s41A9
        JSR s4848
        JSR s41F8
        JSR s4046
        LDX #$10
b4027   LDA #$FF
        STA f4045,X
        DEX 
        BNE b4027
        JSR s5885
j4032   LDA a4DE0
        STA a17
        LDA a4DE2
        STA a5E6A
        LDA #$FF
        STA $D01B    ;Sprite to Background Display Priority
        JMP j4280

f4045   RTI 

s4046   SEI 
        LDA #<p4084
        STA a0314    ;IRQ
        LDA #>p4084
        STA a0315    ;IRQ
        LDA #<f4045
        STA a0318    ;NMI
        LDA #>f4045
        STA a0319    ;NMI
        LDA #$80
        STA a0291
        LDA #$7F
        STA $DC0D    ;CIA1: CIA Interrupt Control Register
        LDA #$01
        STA $D01A    ;VIC Interrupt Mask Register (IMR)
        LDA #$81
        STA $D019    ;VIC Interrupt Request Register (IRR)
        LDA $D011    ;VIC Control Register 1
        ORA #$80
        STA $D011    ;VIC Control Register 1
        LDA #$01
        STA $D012    ;Raster Position
        CLI 
        RTS 

b407E   PLA 
        TAY 
        PLA 
        TAX 
        PLA 
        RTI 

p4084   LDA $D019    ;VIC Interrupt Request Register (IRR)
        AND #$01
        BEQ b407E
        JSR s4E90
        JSR s59FE
        LDA a5E56
        BEQ b409C
        JSR s412E
        JMP j40B0

b409C   LDA a47C1
        BEQ b40A7
        JSR s47C2
        JMP j40B0

b40A7   JSR s4CBE
        JSR s43B9
        JSR s412E
j40B0   LDA #$81
        STA $D019    ;VIC Interrupt Request Register (IRR)
        LDA $D011    ;VIC Control Register 1
        ORA #$80
        STA $D011    ;VIC Control Register 1
        LDA #$01
        STA $D012    ;Raster Position
        LDA $D01F    ;Sprite to Background Collision Detect
        STA a14
        LDA $D01E    ;Sprite to Sprite Collision Detect
        STA a15
        JSR s5A62
        JSR s58EC
        JSR s533F
        JSR s4A37
        INC a4D17
        JSR s54A8
        JSR s5530
        JMP jEA31

f40E4   .BYTE $CE
a40E5   .BYTE $FF
a40E6   .BYTE $CA,$D0,$03,$4C,$01,$CB
f40EC   .BYTE $AD
a40ED   .BYTE $00
a40EE   .BYTE $DC,$29,$10,$D0,$01,$60
f40F4   .BYTE $A5,$C5,$C9,$40,$F0,$3C,$A0,$FF
f40FC   .BYTE $8C,$FF,$CA,$48,$20,$A2,$41,$8D
f4104   .BYTE $72,$5A,$20,$A2,$41,$29,$07,$09
f410C   .BYTE $01,$8D,$80,$5A,$20,$A2,$41,$29
f4114   .BYTE $01,$02,$04,$08,$10,$20,$40,$80
f411C   .BYTE $04
a411D   .BYTE $D0
a411E   .BYTE $03,$4C,$41,$C9,$C9,$05
a4124   .BYTE $D0,$03,$4C,$74,$C9,$29,$3F,$85
a412C   .BYTE $00
a412D   .BYTE $03
s412E   LDX #$00
        STX a03
        STX a04
        STX a02
        STX a05
b4138   TXA 
        CLC 
        ASL 
        TAY 
        LDA f40EC,X
        CLC 
        ADC a412D
        STA $D001,Y  ;Sprite 0 Y Pos
        LDA a412C
        CLC 
        ASL 
        ADC f40E4,X
        CLC 
        ASL 
        STA $D000,Y  ;Sprite 0 X Pos
        BCC b4161
        LDA $D010    ;Sprites 0-7 MSB of X coordinate
        ORA f4114,X
        STA $D010    ;Sprites 0-7 MSB of X coordinate
        JMP j416C

b4161   LDA f4114,X
        EOR #$FF
        AND $D010    ;Sprites 0-7 MSB of X coordinate
        STA $D010    ;Sprites 0-7 MSB of X coordinate
j416C   LDA f4104,X
        ORA a02
        STA a02
        LDA f40F4,X
        ORA a03
        STA a03
        LDA f40FC,X
        ORA a04
        STA a04
        LDA f411C,X
        ORA a05
        STA a05
        INX 
        CPX #$08
        BNE b4138
        LDA a03
        STA $D01D    ;Sprites Expand 2x Horizontal (X)
        LDA a04
        STA $D017    ;Sprites Expand 2x Vertical (Y)
        LDA a02
        STA $D01C    ;Sprites Multi-Color Mode Select
        LDA a05
        STA $D015    ;Sprite display Enable
        RTS 

a41A3   =*+$01
s41A2   LDA aCE00
        INC a41A3
        RTS 

s41A9   LDA #<p0400
        STA a0A
        LDA #>p0400
        STA a0B
        LDX #$00
b41B3   LDA a0A
        STA f0340,X
        LDA a0B
        STA f0360,X
        LDA a0A
        CLC 
        ADC #$28
        STA a0A
        LDA a0B
        ADC #$00
        STA a0B
        INX 
        CPX #$20
        BNE b41B3
        RTS 

s41D0   LDX a07
        LDA f0360,X
        STA a0B
        LDA f0340,X
        STA a0A
        LDY a06
        RTS 

s41DF   JSR s41D0
        LDA (p0A),Y
        RTS 

s41E5   JSR s41D0
        LDA a09
        STA (p0A),Y
        LDA a0B
        CLC 
        ADC #$D4
        STA a0B
        LDA a08
        STA (p0A),Y
        RTS 

s41F8   LDA #$20
        LDX #$00
b41FC   STA p0400,X
        STA f0500,X
        STA f0600,X
        STA f0700,X
        LDA #$01
        STA fD800,X
        STA fD900,X
        STA fDA00,X
        STA fDB00,X
        LDA #$20
        INX 
        BNE b41FC
        LDA #$18
        STA $D018    ;VIC Memory Control Register
        LDA #$18
        STA $D016    ;VIC Control Register 2
        RTS 

s4226   LDA #$0B
        STA $D022    ;Background Color 1, Multi-Color Register 0
        LDA #$0A
        STA $D023    ;Background Color 2, Multi-Color Register 1
        LDA #<p4009
        STA a08
        LDA #>p4009
        STA a09
        LDA #<p0300
        STA a06
b423C   LDA #>p0300
        STA a07
        JSR s4271
        LDA #$18
        STA a07
        JSR s4271
        INC a06
        INC a06
        LDA a06
        CMP #$28
        BNE b423C
        LDA #>p0300
        STA a07
b4258   LDA #<p0300
        STA a06
        JSR s4271
        LDA #$26
        STA a06
        JSR s4271
        INC a07
        LDA a07
        CMP #$18
        BNE b4258
        JMP j49C4

s4271   JSR s41E5
        INC a09
        INC a06
        JSR s41E5
        DEC a09
        DEC a06
        RTS 

j4280   LDX #$00
        SEI 
b4283   LDA #$00
        STA f503F,X
        INX 
        CPX #$11
        BNE b4283
        JSR s4A9C
        LDA #$00
        STA a1D
        STA a1E
        STA a5E5E
        STA a38
        JSR sC800
        JSR s5885
        LDX a5E57
        LDA f5E5A,X
        STA a5E59
        STA a5E58
j42AD   LDA #$04
        SEI 
        STA a4124
        JSR s5E5F
        LDA #$E1
        STA a4F31
        LDA #$80
        STA f40E4
        LDA #$78
        STA f40EC
        LDA #$0A
        STA a30
j42C9   SEI 
        LDX #$17
        LDA #$20
b42CE   STA f044F,X
        DEX 
        BNE b42CE
        JSR s4226
        JSR s5B86
        JSR s4F32
        LDA #$30
        STA a041F
        STA a041E
        LDX a17
        LDY fC390,X
        BEQ b4305
        CPY #$FF
        BEQ b4305
b42F0   INC a041F
        LDA a041F
        CMP #$3A
        BNE b4302
        LDA #$30
        STA a041F
        INC a041E
b4302   DEY 
        BNE b42F0
b4305   LDA a1E
        CLC 
        ADC #$30
        STA a041A
        LDA a1D
        CLC 
        ADC #$30
        STA a0442
        JSR s4EDA
        LDX #$01
        JSR s4A82
        LDA #$00
        STA f40F4
        STA f4104
        STA f40FC
        STA a1A
        STA a28
        LDX #$01
b432E   STA f411C,X
        STA f410C,X
        STA f447A,X
        STA f4FFF,X
        STA f500F,X
        LDA f503F,X
        AND #$F0
        STA f503F,X
        LDA f5047,X
        AND #$F0
        STA f5047,X
        LDA #$01
        STA f5007,X
        STA f5007
        LDA #$00
        STA a504F
        INX 
        CPX #$08
        BNE b432E
        LDA f503F
        AND #$F0
        STA f503F
        LDA a4F31
        STA a07F8
        LDA #$01
        STA f411C
        STA f410C
        STA $D027    ;Sprite 0 Color
        LDA #$00
        STA a47C1
        LDA #>p0402
        STA a12
        LDA #<p0402
        STA a11
        LDA #$03
        STA a4F21
        LDA #$00
        STA f447A
        STA a0F
        STA a10
        STA a13
        LDA $D01F    ;Sprite to Background Collision Detect
        LDA $D01E    ;Sprite to Sprite Collision Detect
        LDA #$03
        STA a448A
        JSR s4D5B
        JSR s412E
        JSR s5D69
        LDA #$00
        STA a2D
        STA a2E
        STA a2A
        STA a14
        STA a15
        CLI 
        JMP j45B5

s43B9   LDX #$00
b43BB   JSR s5279
        JSR s554D
        LDA f410C,X
        BEQ b43CE
        LDA f411C,X
        BEQ b43CE
        JSR s449C
b43CE   INX 
        CPX #$08
        BNE b43BB
        RTS 

s43D4   LDY a4124,X
        LDA #$00
        STA f4462,X
        LDA f40E4,X
        SEC 
        SBC #$0C
        CLC 
        ROR 
        CLC 
        ROR 
        CLC 
        ADC f446A,Y
        STA a06
        LDA f40EC,X
        SEC 
        SBC #$2D
        CLC 
        ROR 
        CLC 
        ROR 
        CLC 
        ROR 
        CLC 
        ADC f4472,Y
        STA a07
        LDA #$00
        STA a18
        LDA f4B57,Y
        STA a19
        STX a40
        JSR s41DF
        JSR s4B4F
        LDX a40
        JSR s5BFF
        BEQ b441E
        LDA f4462,X
        ORA #$08
        STA f4462,X
b441E   INY 
        INY 
        LDA (p0A),Y
        JSR s4B4F
        JSR s5BFF
        BEQ b4432
        LDA f4462,X
        ORA #$04
        STA f4462,X
b4432   INC a07
        INC a07
        STX a40
        JSR s41DF
        JSR s4B4F
        LDX a40
        JSR s5BFF
        BEQ b444D
        LDA f4462,X
        ORA #$02
        STA f4462,X
b444D   INY 
        INY 
        LDA (p0A),Y
        JSR s4B4F
        JSR s5BFF
        BEQ b4461
        LDA f4462,X
        ORA #$01
        STA f4462,X
b4461   RTS 

f4462   .BYTE $D4,$8A,$48,$A2,$18,$88,$D0,$FD
f446A   .BYTE $00,$01,$01,$01,$00,$00,$00,$00
f4472   .BYTE $FF,$FF,$00,$01,$01,$01,$00,$FF
f447A   .BYTE $CC,$18,$69,$04,$8D,$91,$CC,$C9
f4482   .BYTE $C0,$D0,$CC,$20,$40,$48
a448A   =*+$02
        JSR sCD19
        LDX #$F8
        TXS 
        JMP j4032

        .BYTE $20
f4492   .BYTE $0C,$0C,$05,$05,$03,$03,$0A,$0A
a449A   .BYTE $0F
a449B   .BYTE $0E
s449C   CPX #$00
        BNE b44A3
        JSR s46FB
b44A3   LDA a4124,X
        AND #$0E
        TAY 
        LDA f40E4,X
        STA a449A
        LDA f40EC,X
        STA a449B
        CPY #$00
        BNE b44C6
        LDA a449B
        SEC 
        SBC f447A,X
        STA f40EC,X
        JMP j44F2

b44C6   CPY #$02
        BNE b44D7
        LDA a449A
        CLC 
        ADC f447A,X
        STA f40E4,X
        JMP j44F2

b44D7   CPY #$04
        BNE b44E8
        LDA a449B
        CLC 
        ADC f447A,X
        STA f40EC,X
        JMP j44F2

b44E8   LDA a449A
        SEC 
        SBC f447A,X
        STA f40E4,X
j44F2   TYA 
        PHA 
        JSR s43D4
        PLA 
        TAY 
        LDA f4462,X
        AND f4492,Y
        BEQ b457E
        CPY #$00
        BEQ b451A
        CPY #$04
        BEQ b451A
        LDA a449A
        AND #$FC
        CPY #$02
        BNE b4514
        ORA #$03
b4514   STA f40E4,X
        JMP j4528

b451A   LDA a449B
        AND #$F8
        CPY #$04
        BNE b4525
        ORA #$07
b4525   STA f40EC,X
j4528   JSR s4541
        LDA #$00
        STA f447A,X
        LDA f4114,X
        ORA a28
        STA a28
        CPX #$00
        BEQ b453C
b453B   RTS 

b453C   LDA #$01
        STA a0E
        RTS 

s4541   LDA a0E
        CMP #$01
        BEQ b453B
        CPX #$00
        BNE b453B
        LDA #$80
        STA a13
        LDA a18
        BEQ b456F
        CMP #$01
        BEQ b456F
        TXA 
        PHA 
        LDX a17
        LDA fC390,X
        BEQ b4569
        CMP #$FF
        BEQ b4569
        PLA 
        TAX 
        JMP b456F

b4569   PLA 
        TAX 
        LDA #$FF
        STA a1A
b456F   LDA a38
        BEQ b457D
        JSR s4F18
        BEQ b457D
        LDA a4124
        STA a29
b457D   RTS 

b457E   DEC a448A,X
        BEQ b4584
b4583   RTS 

b4584   LDA a4F21,X
        STA a448A,X
        INC f447A,X
        LDA f447A,X
        CMP f4599,Y
        BNE b4583
        DEC f447A,X
        RTS 

f4599   .BYTE $09,$09,$08,$08,$09,$09,$08,$08
f45A1   .BYTE $02,$04,$01,$08
f45A5   .BYTE $FF,$01,$FF,$01
f45A9   .BYTE $FF,$02,$FF,$02
f45AD   .BYTE $04,$FF,$04,$FF
f45B1   .BYTE $08,$FF,$08,$FF
j45B5   JSR s45BB
        JMP j45B5

s45BB   DEC a0C
        BEQ b45C0
        RTS 

b45C0   LDA #$C0
        STA a0C
        LDA a14
        AND #$01
        BEQ b45CD
        JMP j47FD

b45CD   LDA a1A
        BEQ b45D4
        JMP j4B5F

b45D4   LDA a1C
        CMP #$FF
        BNE b45DD
        JSR s4C30
b45DD   JSR s51B2
        LDA a4124
        CLC 
        ROR 
        TAY 
        DEC a12
        BNE b45F1
        LDA #$0A
        STA a12
        JSR s4767
b45F1   LDA a13
        BEQ b45F8
        JMP j469E

b45F8   LDA f447A
        BNE b4620
        LDA $DC00    ;CIA1: Data Port Register A
        AND #$10
        BEQ b4620
        LDA f45A1,Y
        AND $DC00    ;CIA1: Data Port Register A
        BEQ b460F
        JMP b4620

b460F   LDA a4124
        CLC 
        ADC #$04
        AND #$07
        STA a4124
        LDA #$00
        STA a0E
        STA a1A
b4620   LDA #$00
        STA a47BF
        LDA f45A5,Y
        CMP #$FF
        BEQ b463E
        STA a0D
        AND $DC00    ;CIA1: Data Port Register A
        BNE b463E
        DEC f40EC
        JSR s469F
        LDA #$08
        STA a47BF
b463E   LDA f45A9,Y
        CMP #$FF
        BEQ b4657
        STA a0D
        AND $DC00    ;CIA1: Data Port Register A
        BNE b4657
        INC f40EC
        JSR s469F
        LDA #$04
        STA a47BF
b4657   DEC a47C0
        LDA a47C0
        AND #$01
        STA a47C0
        LDA f45AD,Y
        CMP #$FF
        BEQ b4680
        STA a0D
        AND $DC00    ;CIA1: Data Port Register A
        BNE b4680
        LDA a47C0
        BEQ b4678
        DEC f40E4
b4678   JSR s469F
        LDA #$04
        STA a47BF
b4680   LDA f45B1,Y
        CMP #$FF
        BEQ j469E
        STA a0D
        AND $DC00    ;CIA1: Data Port Register A
        BNE j469E
        LDA a47C0
        BEQ b4696
        INC f40E4
b4696   JSR s469F
        LDA #$08
        STA a47BF
j469E   RTS 

s469F   LDA f447A
        BEQ j469E
        LDA a0E
        BNE j469E
        LDA $DC00    ;CIA1: Data Port Register A
        AND #$10
        BNE j469E
        STA a0F
        STA a10
        LDA a4124
        BNE b46C2
        LDA f447A
        EOR #$FF
        STA a10
        JMP j46E1

b46C2   CMP #$02
        BNE b46CE
        LDA f447A
        STA a0F
        JMP j46E1

b46CE   CMP #$04
        BNE b46DA
        LDA f447A
        STA a10
        JMP j46E1

b46DA   LDA f447A
        EOR #$FF
        STA a0F
j46E1   LDA #$FF
        STA a0E
        STA f447A
        LDA a0D
        TAX 
        LDA f46F2,X
        STA a4124
        RTS 

f46F2   .BYTE $00,$00,$04,$04,$06,$06,$02,$02
        .BYTE $02
s46FB   LDA f40E4
        CLC 
        ADC a0F
        STA f40E4
        LDA f40EC
        CLC 
        ADC a10
        STA f40EC
        DEC a11
        BEQ b4712
        RTS 

b4712   LDA #$02
        STA a11
        LDA a0F
        BEQ b4724
        AND #$80
        BNE b4722
        DEC a0F
        DEC a0F
b4722   INC a0F
b4724   LDA a10
        BEQ b4732
        AND #$80
        BNE b4730
        DEC a10
        DEC a10
b4730   INC a10
b4732   RTS 

f4733   .BYTE $E4
f4734   .BYTE $E5,$E6,$E7,$C8,$C9,$CA,$CB,$CC
        .BYTE $CD,$CE,$CF,$EC,$ED,$EE,$EF,$D8
        .BYTE $D9,$DA,$DB,$DC,$DD,$DE,$DF,$E0
        .BYTE $E1,$E2,$E3,$C0,$C1,$C2,$C3,$C4
        .BYTE $C5,$C6,$C7,$E8,$E9,$EA,$EB,$D4
        .BYTE $D5,$D6,$D7,$D0,$D1,$D2,$D3
f4763   .BYTE $00,$0C,$18,$24
s4767   LDA f4763,Y
        TAX 
        LDA a13
        BEQ b4790
        AND #$80
        BEQ b4789
        INC a13
        LDA a13
        CMP #$83
        BNE b477F
        LDA #$03
        STA a13
b477F   AND #$03
j4781   CLC 
        ADC f4733,X
        STA a07F8
        RTS 

b4789   DEC a13
        LDA a13
        JMP j4781

b4790   LDA a0E
        CMP #$01
        BEQ b479D
b4796   LDA f4734,X
        STA a07F8
        RTS 

b479D   LDA a47BF
        BEQ b4796
        INC a47BE
        LDA a47BE
        AND #$03
        STA a47BE
        TXA 
        CLC 
        ADC a47BE
        CLC 
        ADC a47BF
        TAX 
        LDA f4733,X
        STA a07F8
        RTS 

a47BE   .BYTE $00
a47BF   .BYTE $00
a47C0   .BYTE $85
a47C1   .BYTE $14
s47C2   LDA a47C1
        CMP #$01
        BNE b47F9
        LDA $D020    ;Border Color
        AND #$0F
        CMP #$06
        BNE b47DC
        LDA #$00
        STA $D020    ;Border Color
        STA $D021    ;Background Color 0
        BEQ b47F5
b47DC   LDA #$06
        STA $D020    ;Border Color
        STA $D021    ;Background Color 0
        LDA #>p01
        STA a49C2
        LDA #<p01
        STA a49C1
        STA a49C3
        LDA #$10
        STA a16
b47F5   INC $D027    ;Sprite 0 Color
        RTS 

b47F9   JMP j4911

a47FC   .BYTE $A2
j47FD   LDA #$01
        STA a47C1
        LDA #$18
        STA a5A99
        JSR s4848
        LDA #$F0
        STA $D405    ;Voice 1: Attack / Decay Cycle Control
        STA $D406    ;Voice 1: Sustain / Release Cycle Control
        LDA #$20
        STA $D401    ;Voice 1: Frequency Control - High-Byte
        LDA #$14
        STA $D40F    ;Voice 3: Frequency Control - High-Byte
        LDA #$13
        STA $D404    ;Voice 1: Control Register
        LDA #$00
        STA a47FC
        STA $D412    ;Voice 3: Control Register
b4829   LDX #$F0
b482B   STX $D401    ;Voice 1: Frequency Control - High-Byte
        LDY a47FC
b4831   DEY 
        BNE b4831
        DEX 
        BNE b482B
        LDA a47FC
        SEC 
        SBC #$10
        STA a47FC
        BNE b4829
        JSR s4848
        JMP j486F

s4848   LDA #$08
        STA $D404    ;Voice 1: Control Register
        STA $D40B    ;Voice 2: Control Register
        STA $D412    ;Voice 3: Control Register
        LDA #$0F
        STA $D418    ;Select Filter Mode and Volume
        LDA #$00
        STA $D405    ;Voice 1: Attack / Decay Cycle Control
        STA $D40C    ;Voice 2: Attack / Decay Cycle Control
        STA $D413    ;Voice 3: Attack / Decay Cycle Control
        LDA #$F4
        STA $D406    ;Voice 1: Sustain / Release Cycle Control
        STA $D40D    ;Voice 2: Sustain / Release Cycle Control
        STA $D414    ;Voice 3: Sustain / Release Cycle Control
        RTS 

j486F   LDX #$00
b4871   LDA f40E4
        STA f40E4,X
        LDA #$00
        STA f4104,X
        LDA f40EC
        STA f40EC,X
        LDA f4114,X
        STA f411C,X
        JSR s41A2
        AND #$03
        ORA #$01
        STA f4991,X
        JSR s41A2
        AND #$07
        ORA #$01
        STA f4999,X
        STA f49A1,X
        JSR s41A2
        AND #$01
        BNE b48AE
        LDA f4991,X
        EOR #$FF
        STA f4991,X
b48AE   JSR s41A2
        AND #$01
        BNE b48BD
        LDA f4999,X
        EOR #$FF
        STA f4999,X
b48BD   INX 
        CPX #$08
        BNE b4871
        LDA #$02
        STA a47C1
        LDA #$00
        STA $D020    ;Border Color
        STA $D021    ;Background Color 0
        LDX #$0F
b48D1   LDA #$00
        STA $D405    ;Voice 1: Attack / Decay Cycle Control
        LDA #$81
        STA $D404    ;Voice 1: Control Register
        TXA 
        CLC 
        ADC #$02
        STA $D401    ;Voice 1: Frequency Control - High-Byte
        STX $D418    ;Select Filter Mode and Volume
        TXA 
        PHA 
        LDX #$40
b48E9   DEY 
        BNE b48E9
        DEX 
        BNE b48E9
        PLA 
        TAX 
        DEX 
        BNE b48D1
        JSR s4848
        DEC a5E6A
        BNE b4907
        LDA #$30
        STA a046F
        JSR sCD19
        JMP jCA58

b4907   JSR s4F32
        SEI 
        LDX #$F8
        TXS 
        JMP j42AD

j4911   DEC a49C3
        BNE b497A
        LDX #$00
b4918   INC f49A1,X
        LDA f49A1,X
        CMP #$0C
        BNE b4927
        LDA #$00
        STA f49A1,X
b4927   TAY 
        LDA #$00
        STA $D01C    ;Sprites Multi-Color Mode Select
        STA f4104,X
        LDA f49A9,Y
        STA a07F8,X
        LDA f49B5,Y
        STA $D027,X  ;Sprite 0 Color
        LDY f4991,X
        LDA f40E4,X
        JSR s497D
        STA f40E4,X
        LDY f4999,X
        LDA f40EC,X
        JSR s497D
        STA f40EC,X
        INX 
        CPX #$08
        BNE b4918
        DEC a16
        BEQ b4966
        LDA a49C1
        STA a49C3
        JMP b497A

b4966   LDA #$10
        STA a16
        INC a49C2
        LDA a49C2
        CLC 
        ADC a49C1
        STA a49C1
        STA a49C3
b497A   JMP s412E

s497D   BNE b4982
b497F   LDA #$00
        RTS 

b4982   STA a47FC
        AND #$F0
        CMP #$F0
        BEQ b497F
        TYA 
        CLC 
        ADC a47FC
        RTS 

f4991   .BYTE $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
f4999   .BYTE $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
f49A1   .BYTE $F0,$F1,$F2,$F3,$F2,$F1,$F4,$F5
f49A9   .BYTE $F0,$F1,$F2,$F3,$F2,$F1,$F4,$F5
        .BYTE $F6,$F7,$F6,$F5
f49B5   .BYTE $01,$0C,$0B,$0B,$0B,$0C,$01,$0C
        .BYTE $0B,$0B,$0B,$0C
a49C1   .BYTE $17
a49C2   .BYTE $A9
a49C3   .BYTE $08
j49C4   LDA #$07
        STA a08
        LDX a17
        LDA #<p0308
        STA a06
b49CE   LDA #>p0308
        STA a07
        LDA fC200,X
        BNE b49E0
        LDA #$44
        STA a09
        JSR s41E5
        LDX a17
b49E0   LDA #$18
        STA a07
        LDA fC32C,X
        BNE b49F2
        LDA #$45
        STA a09
        JSR s41E5
        LDX a17
b49F2   INC a06
        LDA a06
        CMP #$20
        BNE b49CE
        LDA #>p0800
        STA a07
b49FE   LDA #<p0800
        STA a06
        LDA fC264,X
        BNE b4A15
        LDA #$42
        STA a09
        JSR s41E5
        INC a06
        JSR s41E5
        LDX a17
b4A15   LDA #$26
        STA a06
        LDA fC2C8,X
        BNE b4A2C
        LDA #$43
        STA a09
        JSR s41E5
        INC a06
        JSR s41E5
        LDX a17
b4A2C   INC a07
        LDA a07
        CMP #$14
        BNE b49FE
        JMP j4AE4

s4A37   LDX a17
        LDA fC390,X
        BEQ b4A43
        CMP #$FF
        BEQ b4A43
        RTS 

b4A43   LDA a2220
        PHA 
        LDX #$00
b4A49   LDA f2210,X
        CLC 
        ROL 
        ADC #$00
        STA f2210,X
        LDA f2218,X
        CLC 
        ROR 
        BCC b4A5C
        ORA #$80
b4A5C   STA f2218,X
        LDA f2221,X
        STA a2220,X
        INX 
        CPX #$08
        BNE b4A49
        PLA 
        STA a2227
        LDA a222F
        PHA 
b4A72   LDA f2226,X
        STA a2227,X
        DEX 
        BNE b4A72
        PLA 
        STA a2228
        RTS 

s4A80   LDX #$00
s4A82   LDA #$00
        STA f40E4,X
        STA f40EC,X
        STA f40F4,X
        STA f40FC,X
        STA f411C,X
        STA f4104,X
        INX 
        CPX #$08
        BNE s4A82
        RTS 

s4A9C   LDX #$00
b4A9E   LDA #$10
        STA fC390,X
        LDA fC200,X
        CMP #$FF
        BEQ b4AB0
        JSR s4F29
        STA fC200,X
b4AB0   LDA fC32C,X
        CMP #$FF
        BEQ b4ABD
        JSR s4F29
        STA fC32C,X
b4ABD   LDA fC2C8,X
        CMP #$FF
        BEQ b4ACA
        JSR s4F29
        STA fC2C8,X
b4ACA   LDA fC264,X
        CMP #$FF
        BEQ b4AD7
        JSR s4F29
        STA fC264,X
b4AD7   INX 
        CPX #$64
        BNE b4A9E
        LDA #$10
        STA fC390
        JMP j5D99

j4AE4   LDA #>p26
        STA a07
        LDA #<p26
        STA a06
        LDA #$1E
        STA a09
        LDX a17
        LDA fC200,X
        JSR s4B25
        LDA #$1F
        STA a09
        INC a06
        INC a07
        LDA fC2C8,X
        JSR s4B25
        LDA #$1D
        STA a09
        DEC a06
        DEC a06
        LDA fC264,X
        JSR s4B25
        LDA #$1C
        STA a09
        INC a07
        INC a06
        LDA fC32C,X
        JSR s4B25
        JMP j4D9D

s4B25   PHA 
        CMP #$FF
        BEQ b4B41
        AND #$F0
        BEQ b4B32
        LDA #$56
        STA a09
b4B32   PLA 
        AND #$0F
        TAY 
        LDA f4B47,Y
j4B39   STA a08
        JSR s41E5
        LDX a17
        RTS 

b4B41   PLA 
        LDA #$00
        JMP j4B39

f4B47   .BYTE $01,$07,$03,$05,$04,$02,$06,$01
s4B4F   CMP a19
        BEQ b4B54
        RTS 

b4B54   INC a18
        RTS 

f4B57   .BYTE $44,$44,$43,$43,$45,$45,$42,$42
j4B5F   LDX #$00
        LDA a07F8
        STA a4F31
b4B67   LDA f40E4
        STA f40E4,X
        LDA f40EC
        STA f40EC,X
        STA a4D9A
        LDA f4114,X
        STA f411C,X
        LDA #$00
        STA f49A1,X
        LDA f4C14,X
        STA f4991,X
        LDA f4C1C,X
        STA f4999,X
        INX 
        CPX #$08
        BNE b4B67
        LDX a17
        LDA fC390,X
        BNE b4B9E
        LDA #$FF
        STA fC390,X
b4B9E   LDA #>p01
        STA a49C2
        LDA #<p01
        STA a49C1
        STA a49C3
        LDA #$10
        STA a16
        LDA #$02
        STA a47C1
        JSR s4848
        LDA #$0F
        STA a1B
        LDA #$21
        STA $D404    ;Voice 1: Control Register
b4BC0   LDX #$C0
b4BC2   STX $D401    ;Voice 1: Frequency Control - High-Byte
        LDA a1B
        STA $D418    ;Select Filter Mode and Volume
b4BCA   DEY 
        BNE b4BCA
        INX 
        BNE b4BC2
        DEC a1B
        BNE b4BC0
        LDA a4124
        CLC 
        ROR 
        TAY 
        LDA a17
        CLC 
        ADC f4C24,Y
        STA a17
        LDA f4C28,Y
        CLC 
        ADC a1D
        STA a1D
        LDA f4C2C,Y
        CLC 
        ADC a1E
        STA a1E
        LDX #$F8
        TXS 
        LDA a4124
        CLC 
        ROR 
        TAY 
        LDA a4D9A
        STA f40EC
        LDA f4D96,Y
        BEQ b4C09
        STA f40EC
b4C09   LDA f4D92,Y
        BEQ b4C11
        STA f40E4
b4C11   JMP j42C9

f4C14   .BYTE $00,$00,$00,$00,$01,$02,$FF,$FE
f4C1C   .BYTE $01,$02,$FF,$FE,$00,$00,$00,$00
f4C24   .BYTE $F6,$01,$0A,$FF
f4C28   .BYTE $00,$01,$00,$FF
f4C2C   .BYTE $FF,$00,$01,$00
s4C30   LDA #$02
        JSR s59C5
        LDX a17
        LDA a29
        BEQ b4C67
        CMP #$04
        BEQ b4C7A
        LDA #$07
        STA a1C
        LDA a29
        CMP #$06
        BEQ b4C58
        LDA fC2C8,X
        JSR s4C8D
        STA fC2C8,X
        STA fC265,X
        JMP j4CAF

b4C58   LDA fC264,X
        JSR s4C8D
        STA fC264,X
        STA fC2C7,X
        JMP j4CAF

b4C67   LDA #$F7
        STA a1C
        LDA fC200,X
        JSR s4C8D
        STA fC200,X
        STA fC322,X
        JMP j4CAF

b4C7A   LDA #$F7
        STA a1C
        LDA fC32C,X
        JSR s4C8D
        STA fC32C,X
        STA fC20A,X
        JMP j4CAF

s4C8D   PHA 
        BEQ b4C9B
        AND #$F0
        BNE b4C9B
        PLA 
        TAY 
        DEY 
        TYA 
        JMP j4CA5

b4C9B   LDA #$00
        STA a1C
        PLA 
        PLA 
        PLA 
        JMP j4CAF

j4CA5   CMP #$00
        BNE b4CAC
        JSR s5C72
b4CAC   LDX a17
        RTS 

j4CAF   SEI 
        CMP #$00
        BNE b4CB9
        STA a1C
        JSR j49C4
b4CB9   JSR j4AE4
        CLI 
        RTS 

s4CBE   LDA a1C
        BEQ b4CC6
        CMP #$FF
        BNE b4CE0
b4CC6   LDA #$18
        STA $D016    ;VIC Control Register 2
        LDA $D011    ;VIC Control Register 1
        AND #$80
        ORA #$1B
        STA $D011    ;VIC Control Register 1
        LDA #>p0300
        STA a412D
        LDA #<p0300
        STA a412C
b4CDF   RTS 

b4CE0   LDA a4D17
        AND #$01
        BNE b4CDF
        LDA a1C
        AND #$F0
        BNE b4D18
        DEC a1C
        BNE b4CFC
        LDA #$18
        STA $D016    ;VIC Control Register 2
        LDA #$00
        STA a412C
        RTS 

b4CFC   LDA $D016    ;VIC Control Register 2
        AND #$07
        BEQ b4D0A
        LDA #$00
        STA a412C
        BEQ b4D11
b4D0A   LDA #$01
        STA a412C
        LDA #$02
b4D11   ORA #$18
        STA $D016    ;VIC Control Register 2
        RTS 

a4D17   .BYTE $00
b4D18   LDA a1C
        AND #$07
        BNE b4D32
        LDA #$00
        STA a1C
        LDA $D011    ;VIC Control Register 1
        AND #$80
        ORA #$1B
        STA $D011    ;VIC Control Register 1
        LDA #$03
        STA a412D
        RTS 

b4D32   DEC a1C
        LDA $D011    ;VIC Control Register 1
        AND #$07
        BEQ b4D4B
        LDA #$00
        STA a412D
        LDA $D011    ;VIC Control Register 1
        AND #$80
        ORA #$18
        STA $D011    ;VIC Control Register 1
        RTS 

b4D4B   LDA #$06
        STA a412D
        LDA $D011    ;VIC Control Register 1
        AND #$80
        ORA #$1E
        STA $D011    ;VIC Control Register 1
        RTS 

s4D5B   LDA #$FF
        STA a0E
        LDA #$00
        STA a1C
        STA a412C
        STA a14
        STA a15
        LDA #$18
        STA $D016    ;VIC Control Register 2
        LDA $D011    ;VIC Control Register 1
        AND #$80
        ORA #$1B
        STA $D011    ;VIC Control Register 1
        LDA #$03
        STA a412D
        JSR s4848
        LDA #$05
        STA $D40C    ;Voice 2: Attack / Decay Cycle Control
        STA $D413    ;Voice 3: Attack / Decay Cycle Control
        LDA #$00
        STA $D40D    ;Voice 2: Sustain / Release Cycle Control
        STA $D414    ;Voice 3: Sustain / Release Cycle Control
        RTS 

f4D92   .BYTE $00,$1C,$00,$90
f4D96   .BYTE $D0,$00,$50,$00
a4D9A   .BYTE $AE
a4D9B   .BYTE $94
a4D9C   .BYTE $4D
j4D9D   LDA #$00
        STA a4D9C
b4DA2   LDX a4D9C
        LDA f4DCA,X
        STA a06
        LDA f4DD3,X
        STA a07
        LDA #$04
        STA a08
        LDA f4DDC,X
        CLC 
        ADC a17
        STA a4D9B
        JSR s4DEE
        INC a4D9C
        LDA a4D9C
        CMP #$09
        BNE b4DA2
        RTS 

f4DCA   .BYTE $21,$22,$23,$21,$22,$23,$21,$22
        .BYTE $23
f4DD3   .BYTE $00,$00,$00,$01,$01,$01,$02,$02
        .BYTE $02
f4DDC   .BYTE $F5,$F6,$F7,$FF
a4DE0   .BYTE $00,$01
a4DE2   .BYTE $09,$0A,$0B
f4DE5   .BYTE $FF,$00,$01,$FF,$00,$01,$FF,$00
        .BYTE $01
s4DEE   LDA a4D9B
        AND #$80
        BEQ b4DFC
b4DF5   LDA #$20
        STA a09
        JMP s41E5

b4DFC   LDA a4D9B
        CMP #$64
        BPL b4DF5
        LDY a4D9C
        LDA f4DE5,Y
        CLC 
        ADC a1D
        CMP #$FF
        BEQ b4DF5
        CMP #$0A
        BEQ b4DF5
        LDA a4D9B
        CMP a17
        BNE b4E1F
        LDA #$07
        STA a08
b4E1F   LDX a4D9B
        LDA #$00
        PHA 
        LDA fC200,X
        BNE b4E2E
        PLA 
        ORA #$01
        PHA 
b4E2E   LDA fC2C8,X
        BNE b4E37
        PLA 
        ORA #$02
        PHA 
b4E37   LDA fC32C,X
        BNE b4E40
        PLA 
        ORA #$04
        PHA 
b4E40   LDA fC264,X
        BNE b4E49
        PLA 
        ORA #$08
        PHA 
b4E49   PLA 
        CLC 
        ADC #$46
        STA a09
        JMP s41E5

s4E52   LDA #$80
        STA $D40B    ;Voice 2: Control Register
        LDA a5FF7
        BNE b4E70
        LDA #$08
        STA $D40C    ;Voice 2: Attack / Decay Cycle Control
        LDA #$00
        STA $D40D    ;Voice 2: Sustain / Release Cycle Control
        LDA #$30
        STA $D408    ;Voice 2: Frequency Control - High-Byte
        LDA #$81
        STA $D40B    ;Voice 2: Control Register
b4E70   RTS 

s4E71   LDA #$80
        STA $D412    ;Voice 3: Control Register
        LDA a5FF7
        BNE b4E70
        LDA #$05
        STA $D413    ;Voice 3: Attack / Decay Cycle Control
        LDA #$00
        STA $D414    ;Voice 3: Sustain / Release Cycle Control
        LDA #$10
        STA $D40F    ;Voice 3: Frequency Control - High-Byte
        LDA #$81
        STA $D412    ;Voice 3: Control Register
        RTS 

s4E90   DEC a23
        BEQ b4E95
        RTS 

b4E95   LDA #$06
        STA a23
        LDA a1F
        ROL 
        STA a1F
        BCC b4EA3
        JSR s4E52
b4EA3   LDA a22
        ROL 
        STA a22
        BCC b4EAD
        JSR s4E71
b4EAD   INC a24
        LDA a24
        CMP #$08
        BEQ b4EB6
        RTS 

b4EB6   LDA #$00
        STA a24
        INC a25
        LDA a25
        CMP #$04
        BNE b4EC6
        LDA #$00
        STA a25
b4EC6   TAX 
        LDA f4ED2,X
        STA a1F
        LDA f4ED6,X
        STA a22
        RTS 

f4ED2   .BYTE $A6
a4ED3   .BYTE $17
a4ED4   .BYTE $BD
a4ED5   .BYTE $00
f4ED6   .BYTE $E0
a4ED7   .BYTE $8D
a4ED8   .BYTE $CA
a4ED9   .BYTE $4E
s4EDA   LDX a17
        LDA fE000,X
        STA f4ED2
        ADC fE001,X
        STA a4ED3
        EOR #$FF
        STA a4ED4
        AND fE002,X
        STA a4ED5
        LDA fE003,X
        ORA #$AA
        STA f4ED6
        STA a4ED8
        LDA fE004,X
        ORA #$AA
        STA a4ED7
        STA a4ED9
        LDA #$01
        STA a23
        STA a25
        LDA #$00
        STA a1F
        STA a22
        STA a24
b4F17   RTS 

s4F18   LDA a1C
        BNE b4F17
        LDA #$FF
        STA a1C
        RTS 

a4F21   .BYTE $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
s4F29   JSR s41A2
        AND #$07
        ORA #$03
        RTS 

a4F31   .BYTE $8D
s4F32   LDX #$04
b4F34   LDA f4F5A,X
        STA f046B,X
        DEX 
        BNE b4F34
        LDA #$07
        STA aD86C
        LDX a5E6A
b4F45   INC a046F
        LDA a046F
        CMP #$3A
        BNE b4F57
        LDA #$30
        STA a046F
        INC a046E
b4F57   DEX 
        BNE b4F45
f4F5A   RTS 

        .BYTE $28,$3A,$30,$30
f4F5F   .BYTE $80,$80,$80,$00,$04,$02,$06,$80
f4F67   .BYTE $00,$81,$00,$00,$00,$00,$00,$00
f4F6F   .BYTE $01,$00,$01,$01,$01,$01,$01,$00
f4F77   .BYTE $C0,$C4,$C8,$CC,$D0,$D4,$D8,$DC
f4F7F   .BYTE $C3,$C7,$CB,$CF,$D3,$D7,$DB,$DE
f4F87   .BYTE $00,$02,$00,$00,$00,$02,$00,$00
f4F8F   .BYTE $60,$60,$60,$00,$00,$00,$00,$0C
f4F97   .BYTE $00,$00,$00,$00,$00,$00,$00,$00
f4F9F   .BYTE $0F,$40,$50,$60,$70,$80,$90,$0F
f4FA7   .BYTE $01,$01,$01,$01,$01,$01,$01,$03
f4FAF   .BYTE $02,$03,$02,$01,$02,$03,$03,$03
f4FB7   .BYTE $00,$02,$01,$04,$03,$06,$05,$00
f4FBF   .BYTE $00,$02,$02,$04,$03,$06,$05,$00
f4FC7   .BYTE $01,$02,$02,$02,$02,$02,$02,$01
f4FCF   .BYTE $36,$36,$36,$36,$36,$36,$37,$36
f4FD7   .BYTE $01,$02,$03,$04,$05,$06,$07,$09
f4FDF   .BYTE $FF,$11,$12,$20,$21,$22,$30,$FF
f4FE7   .BYTE $F0,$50,$30,$40,$50,$30,$40,$F0
f4FEF   .BYTE $80,$60,$70,$80,$60,$70,$80,$70
f4FF7   .BYTE $01,$02,$03,$04,$05,$06,$07,$08
f4FFF   .BYTE $37,$4A,$EE,$17,$4D,$20,$A8,$54
f5007   .BYTE $01,$01,$01,$01,$01,$01,$01,$01
f500F   .BYTE $CA,$D0,$03,$4C,$01,$CB,$AD,$00
f5017   .BYTE $00,$00,$00,$00,$00,$00,$00,$00
f501F   .BYTE $C9,$40,$F0,$3C,$A0,$FF,$8C,$FF
f5027   .BYTE $CA,$48,$20,$A2,$41,$8D,$72,$5A
f502F   .BYTE $20,$A2,$41,$29,$07,$09,$01,$8D
f5037   .BYTE $80,$5A,$20,$A2,$41,$29,$01,$02
f503F   .BYTE $04,$08,$10,$20,$40,$80,$04,$D0
f5047   .BYTE $03,$4C,$41,$C9,$C9,$05,$D0,$03
a504F   .BYTE $4C
s5050   LDA f4FC7,Y
        TAX 
b5054   LDA f411C,X
        BEQ b505F
b5059   INX 
        CPX #$08
        BNE b5054
        RTS 

b505F   LDA #$00
        STA f5027,X
        STA f502F,X
        LDA f4FDF,Y
        CMP #$FF
        BNE b5079
        LDA a2B
        BEQ b5059
        LDA #$00
        STA a2B
        JSR s59E1
b5079   TXA 
        PHA 
        LDX a17
        LDA fC390,X
        CMP #$FF
        BNE b508F
        LDA #$00
        STA $D404    ;Voice 1: Control Register
        STA a59E0
        PLA 
        TAX 
        RTS 

b508F   PLA 
        TAX 
        JSR s57E1
        LDA f4FE7,Y
        AND #$F0
        CMP #$F0
        BNE b50A3
        JSR s5724
        JMP j50CF

b50A3   LDA f4FD7,Y
        AND #$10
        BEQ b50B9
        LDA f4FE7,Y
        STA f40E4,X
        LDA f4FEF,Y
        STA f40EC,X
        JMP j50CF

b50B9   JSR s41A2
        AND #$1F
        ADC f4FE7,Y
        STA f40E4,X
        JSR s41A2
        AND #$1F
        ADC f4FEF,Y
        STA f40EC,X
j50CF   TYA 
        STA f5017,X
        LDA f4FDF,Y
        STA f500F,X
        LDA f4FD7,Y
        AND #$20
        BEQ b50E5
        LDA #$FF
        STA f500F,X
b50E5   LDA f4F5F,Y
        CMP #$80
        BNE b5102
j50EC   JSR s41A2
        AND #$06
        STA a4124,X
        JSR s41A2
        AND #$07
        SEC 
        SBC #$04
        STA f5027,X
        JMP j5117

b5102   CMP #$CC
        BNE b510E
        LDA #$FC
        STA f447A,X
        JMP j50EC

b510E   JSR s5C94
        LDA f4F5F,Y
        STA a4124,X
j5117   LDA f4F77,Y
        STA a07F8,X
        LDA f4FA7,Y
        AND #$F0
        CMP #$80
        BNE b5129
        JMP j575E

b5129   LDA f4F5F,Y
        CMP #$81
        BEQ b513C
        LDA f4FA7,Y
        STA f5027,X
        LDA f4FAF,Y
        STA f502F,X
b513C   LDA f4FB7,Y
        STA f5037,X
        LDA f4FD7,Y
        STA $D027,X  ;Sprite 0 Color
        LDA f4F8F,Y
        STA f4FFF,X
        LDA #$00
        STA f447A,X
        STA f4482,X
        STA f4104,X
        LDA #$01
        STA a448A,X
        LDA f4F87,Y
        BEQ b5165
        LDA #$02
b5165   STA f501F,X
        LDA f4F6F,Y
        BNE b5174
        LDA #$00
        STA f410C,X
        BEQ b517A
b5174   LDA f4114,X
        STA f410C,X
b517A   LDA f4FF7,Y
        AND #$80
        BEQ b518E
        JSR s41A2
        AND #$07
        ORA #$03
        STA a4F21,X
        JMP j5194

b518E   LDA f4FF7,Y
        STA a4F21,X
j5194   LDA f4114,X
        STA f411C,X
        LDA f4FD7,Y
        AND #$40
        BEQ b51A7
        LDA f4114,X
        STA f4104,X
b51A7   LDA f4FDF,Y
        CMP #$FF
        BNE b51B1
        JSR s560A
b51B1   RTS 

s51B2   LDX #$00
        JSR s5E01
b51B7   LDA a27
        CMP #$08
        BNE b51F0
        LDA f4FDF,X
        CMP #$FF
        BNE b51C7
        JMP j51D7

b51C7   LDA f4FDF,X
        BEQ b51DE
        DEC f5007,X
        BNE b51E7
        LDA f4FDF,X
        STA f5007,X
j51D7   TXA 
        TAY 
        JSR s5050
        TYA 
        TAX 
b51DE   CPX #$00
        BEQ b51F0
        LDA f411C,X
        BEQ b51F0
b51E7   JSR s5230
        JSR s5434
        JSR s5461
b51F0   INX 
        CPX #$08
        BNE b51B7
        LDA aCAFF
        BEQ b521B
        JSR s54F9
        JSR s55C0
        DEC a5D68
        BNE b521B
        LDX a17
        LDA fC390,X
        BEQ b521B
        CMP #$FF
        BEQ b521B
        JSR s5D2D
        DEC fC390,X
        BNE b521B
        JSR s5D46
b521B   DEC a27
        BNE b522F
        LDA #$08
        STA a27
        LDA aCAFF
        BEQ b522F
        DEC a39
        BNE b522F
        JSR s5C8B
b522F   RTS 

s5230   LDY f5017,X
        LDA f411C,X
        BEQ b522F
        LDA f501F,X
        BNE b5253
        LDA a07F8,X
        CMP f4F7F,Y
        BNE b524C
        LDA f4F77,Y
        STA a07F8,X
        RTS 

b524C   CLC 
        ADC #$01
        STA a07F8,X
        RTS 

b5253   AND #$01
        BNE b5268
        LDA a07F8,X
        CMP f4F7F,Y
        BNE b524C
b525F   LDA f501F,X
        EOR #$FF
        STA f501F,X
        RTS 

b5268   LDA a07F8,X
        CMP f4F77,Y
        BNE b5272
        BEQ b525F
b5272   SEC 
        SBC #$01
        STA a07F8,X
        RTS 

s5279   CPX #$00
        BNE b527E
b527D   RTS 

b527E   LDA f411C,X
        BEQ b527D
        LDA a5E56
        BNE b527D
        LDY f5017,X
        LDA f4FD7,Y
        AND #$80
        BEQ b5295
        INC $D027,X  ;Sprite 0 Color
b5295   LDA f410C,X
        BNE b529D
        JMP j53E2

b529D   LDA a4124,X
        CMP #$00
        BEQ b52AB
        CMP #$04
        BEQ b52AB
        JMP j52E5

b52AB   LDA f5027,X
        PHA 
        LDA a4124,X
        CMP #$00
        BEQ b52BB
        PLA 
        JSR s54A2
        PHA 
b52BB   PLA 
        PHA 
        CLC 
        ADC f40E4,X
        STA f40E4,X
        AND #$FC
        CMP #$10
        BEQ b52D0
        CMP #$98
        BEQ b52D0
        PLA 
        RTS 

b52D0   LDA f5027,X
        JSR s54A2
        STA f5027,X
        PLA 
        JSR s54A2
        CLC 
        ADC f40E4,X
        STA f40E4,X
        RTS 

j52E5   LDA f5027,X
        PHA 
        LDA a4124,X
        CMP #$06
        BNE b52F5
        PLA 
        JSR s54A2
        PHA 
b52F5   PLA 
        PHA 
        CLC 
        ADC f40EC,X
        STA f40EC,X
        AND #$FC
        CMP #$4C
        BEQ b530A
        CMP #$D8
        BEQ b530A
        PLA 
        RTS 

b530A   LDA f5027,X
        JSR s54A2
        STA f5027,X
        PLA 
        JSR s54A2
        CLC 
        ADC f40EC,X
        STA f40EC,X
        RTS 

f531F   .BYTE $02,$15,$10,$16,$0C,$0F,$1A,$08
f5327   .BYTE $05,$12,$16,$07,$0C,$0F,$04,$11
f532F   .BYTE $01,$03,$02,$04,$02,$01,$03,$04
f5337   .BYTE $01,$02,$03,$02,$01,$02,$03,$02
s533F   LDA a4D17
        AND #$01
        BNE b5347
        RTS 

b5347   LDX #$00
j5349   LDA f531F,X
        PHA 
        STA a06
        LDA f5327,X
        PHA 
        STA a07
        LDY f532F,X
b5358   INC f5337,X
        LDA f5337,X
        CMP #$04
        BNE b538A
        LDA #$00
        STA f5337,X
        DEC a06
        DEC a07
        LDA a06
        CMP #$01
        BNE b5375
        LDA #$26
        STA a06
b5375   LDA a07
        CMP #$03
        BNE b538A
        LDA #$17
        STA a07
        JSR s41A2
        AND #$03
        CLC 
        ADC #$01
        STA f532F,X
b538A   DEY 
        BNE b5358
        LDA #$09
        STA a08
        LDA a06
        STA f531F,X
        LDA a07
        STA f5327,X
        STX a16
        PLA 
        STA a07
        PLA 
        STA a06
        LDA #$20
        STA a09
        JSR s53CB
        LDX a16
        LDA f5337,X
        CLC 
        ADC #$23
        STA a09
        LDA f531F,X
        STA a06
        LDA f5327,X
        STA a07
        JSR s53CB
        LDX a16
        INX 
        CPX #$08
        BEQ b53DE
        JMP j5349

s53CB   JSR s41DF
        AND #$7F
        CMP #$21
        BEQ b53DE
        CMP #$27
        BEQ b53DE
        AND #$78
        CMP #$20
        BEQ b53DF
b53DE   RTS 

b53DF   JMP s41E5

j53E2   LDA f5027,X
        CLC 
        ADC f40E4,X
        STA f40E4,X
        AND #$FC
        CMP #$10
        BEQ b53F9
        CMP #$98
        BEQ b53F9
        JMP j540C

b53F9   LDA f5027,X
        JSR s54A2
        STA f5027,X
        CLC 
        ADC f40E4,X
        STA f40E4,X
        JSR s5DF0
j540C   LDA f502F,X
        CLC 
        ADC f40EC,X
        STA f40EC,X
        AND #$FC
        CMP #$4C
        BEQ b5421
        CMP #$D8
        BEQ b5421
        RTS 

b5421   LDA f502F,X
        JSR s54A2
        STA f502F,X
        CLC 
        ADC f40EC,X
        STA f40EC,X
        JMP s5DF0

s5434   LDA f4FFF,X
        BEQ b543E
        DEC f4FFF,X
        BEQ b543F
b543E   RTS 

b543F   LDY f5017,X
        LDA f4FB7,Y
        AND #$F0
        BEQ b544C
        JMP j56A6

b544C   LDA f4FB7,Y
        BEQ b5455
        TAY 
        JMP j50CF

b5455   LDA #$00
        STA f411C,X
        STA f410C,X
        STA f5017,X
        RTS 

s5461   LDA f410C,X
        BNE b5467
b5466   RTS 

b5467   LDY f5017,X
        LDA f4F6F,Y
        BEQ b5466
        LDA f4114,X
        AND a28
        BEQ b5466
        LDA f4114,X
        EOR #$FF
        AND a28
        STA a28
        LDA f4FBF,Y
        CMP #$FF
        BNE b5489
        JMP j571E

b5489   AND #$80
        BEQ b5497
        JSR s4F18
        BEQ b5497
        LDA a4124,X
        STA a29
b5497   LDA f4FBF,Y
        AND #$07
        BEQ b5455
        TAY 
        JMP j50CF

s54A2   EOR #$FF
        CLC 
        ADC #$01
        RTS 

s54A8   LDA a15
        AND #$01
        BNE b54AF
        RTS 

b54AF   LDX #$01
b54B1   LDA f4114,X
        AND a15
        BEQ b54BB
        JSR s54C1
b54BB   INX 
        CPX #$08
        BNE b54B1
        RTS 

s54C1   LDA f40E4
        SEC 
        SBC f40E4,X
        PHA 
        AND #$80
        BNE b54D1
        PLA 
        JMP j54D4

b54D1   PLA 
        EOR #$FF
j54D4   CMP #$10
        BMI b54D9
        RTS 

b54D9   LDA f40EC
        SEC 
        SBC f40EC,X
        PHA 
        AND #$80
        BNE b54E9
        PLA 
        JMP j54EC

b54E9   PLA 
        EOR #$FF
j54EC   CMP #$10
        BMI b54F1
        RTS 

b54F1   LDA f4114,X
        ORA a2A
        STA a2A
b54F8   RTS 

s54F9   LDA a2A
        BEQ b54F8
        LDX #$01
b54FF   LDA f4114,X
        AND a2A
        BNE b550C
        INX 
        CPX #$08
        BNE b54FF
b550B   RTS 

b550C   LDY f5017,X
        LDA #$00
        STA a2A
        LDA f411C,X
        BEQ b551E
        JSR s5804
        JSR s5973
b551E   LDA f4F9F,Y
        AND #$0F
        BNE b5528
        JMP b5455

b5528   CMP #$0F
        BEQ b550B
        TAY 
        JMP j50CF

s5530   LDA $DC00    ;CIA1: Data Port Register A
        AND #$10
        BEQ b5540
        LDA #>p0300
        STA a2C
        LDA #<p0300
        STA a2B
b553F   RTS 

b5540   DEC a2C
        BNE b553F
        LDA #>p05FF
        STA a2C
        LDA #<p05FF
        STA a2B
        RTS 

s554D   LDA f500F,X
        CMP #$FF
        BEQ b5555
b5554   RTS 

b5555   LDA f4114,X
        AND a15
        BEQ b5554
        TXA 
        PHA 
        LDX #$01
b5560   LDA f4114,X
        AND a15
        BEQ b557E
        LDA f500F,X
        CMP #$FF
        BEQ b557E
        LDY f5017,X
        LDA f4F97,Y
        CMP #$0F
        BEQ b557E
        PLA 
        PHA 
        TAY 
        JSR s5586
b557E   INX 
        CPX #$08
        BNE b5560
        PLA 
        TAX 
        RTS 

s5586   LDA f40E4,X
        SEC 
        SBC f40E4,Y
        PHA 
        AND #$80
        BEQ b5596
        PLA 
        EOR #$FF
        PHA 
b5596   PLA 
        CMP #$10
        BMI b559C
b559B   RTS 

b559C   LDA f40EC,Y
        CLC 
        SBC f40EC,X
        PHA 
        AND #$80
        BEQ b55AC
        PLA 
        EOR #$FF
        PHA 
b55AC   PLA 
        CMP #$10
        BPL b559B
        LDA f4114,X
        ORA a2D
        STA a2D
        LDA f4114,Y
        ORA a2E
        STA a2E
        RTS 

s55C0   LDA a2D
        BNE b55C5
        RTS 

b55C5   LDX #$01
b55C7   LDA f4114,X
        AND a2D
        BEQ b55F4
        LDA f411C,X
        BEQ b55F4
        LDY f5017,X
        LDA f4F97,Y
        BNE b55E4
        JSR b5455
        JSR s593F
        JMP b55F4

b55E4   CMP #$0F
        BNE b55EB
        JMP b55F4

b55EB   PHA 
        JSR s593F
        PLA 
        TAY 
        JSR j50CF
b55F4   LDA f4114,X
        AND a2E
        BEQ b55FE
        JSR b5455
b55FE   INX 
        CPX #$08
        BNE b55C7
        LDA #$00
        STA a2D
        STA a2E
        RTS 

s560A   LDA f4F6F,Y
        BEQ b5646
        TYA 
        PHA 
        LDA a4124
        CLC 
        ROR 
        TAY 
        LDA $DC00    ;CIA1: Data Port Register A
        AND f56A2,Y
        BEQ b5638
        LDA $DC00    ;CIA1: Data Port Register A
        AND f569E,Y
        BNE b5633
        LDA f5027,X
        JSR s54A2
        STA f5027,X
        JMP b5638

b5633   LDA #$00
        STA f5027,X
b5638   LDA a4124
        CLC 
        ADC #$04
        AND #$07
        STA a4124,X
        PLA 
        TAY 
        RTS 

b5646   TYA 
        PHA 
        LDA a4124
        CLC 
        ROR 
        TAY 
        JSR s5697
        AND #$03
        CMP #$03
        BNE b565F
        LDA #$00
        STA f502F,X
        JMP j566F

b565F   JSR s5697
        AND #$01
        BNE j566F
        LDA f502F,X
        JSR s54A2
        STA f502F,X
j566F   JSR s5697
        AND #$0C
        CMP #$0C
        BNE b5680
        LDA #$00
        STA f5027,X
        PLA 
        TAY 
        RTS 

b5680   JSR s5697
        AND #$04
        BNE b5690
        LDA f5027,X
        JSR s54A2
        STA f5027,X
b5690   PLA 
        TAY 
        RTS 

f5693   .BYTE $FD,$FB,$FE,$F7
s5697   LDA $DC00    ;CIA1: Data Port Register A
        AND f5693,Y
        RTS 

f569E   .BYTE $08,$02,$04,$01
f56A2   .BYTE $04,$01,$08,$02
j56A6   LDA f4F8F,Y
        STA f4FFF,X
        LDA f5037,X
        AND #$F0
        CMP #$90
        BNE b56B8
        JMP j5CB0

b56B8   CMP #$A0
        BNE b56BF
        JMP j5CF5

b56BF   LDY #$00
b56C1   LDA f5037,X
        AND #$0F
        CMP f5017,Y
        BEQ b56D1
        INY 
        CPY #$08
        BNE b56C1
        RTS 

b56D1   LDA f40E4,X
        SEC 
        SBC f40E4,Y
        BMI b56E6
        JSR s570C
        JSR s54A2
        STA f5027,X
        JMP j56EF

b56E6   JSR s54A2
        JSR s570C
        STA f5027,X
j56EF   LDA f40EC,X
        SEC 
        SBC f40EC,Y
        BMI b5702
        JSR s570C
        JSR s54A2
        STA f502F,X
        RTS 

b5702   JSR s54A2
        JSR s570C
        STA f502F,X
        RTS 

s570C   PHA 
        LDA a4D17
        AND #$01
        BEQ b5718
        PLA 
        AND #$03
        RTS 

b5718   PLA 
        AND #$03
        ORA #$01
        RTS 

j571E   LDA #$FB
        STA f447A,X
        RTS 

s5724   TXA 
        PHA 
        LDX #$00
b5728   LDA f4FE7,Y
        AND #$07
        CMP f5017,X
        BEQ b573C
b5732   INX 
        CPX #$08
        BNE b5728
        PLA 
        TAX 
        PLA 
        PLA 
        RTS 

b573C   LDA f411C,X
        BEQ b5732
        LDA f40EC,X
        STA a575C
        LDA f40E4,X
        STA a575D
        PLA 
        TAX 
        LDA a575C
        STA f40EC,X
        LDA a575D
        STA f40E4,X
        RTS 

a575C   .BYTE $C8
a575D   .BYTE $CC
j575E   LDA f4FA7,Y
        CMP #$80
        BNE b5782
        JSR s41A2
        AND #$07
        ORA #$01
        SEC 
        SBC #$03
        STA f5027,X
        JSR s41A2
        AND #$07
        ORA #$01
        SEC 
        SBC #$03
        STA f502F,X
        JMP b513C

b5782   CMP #$81
        BNE b57AD
        LDA #$01
        STA f5027,X
        LDA f40E4,X
        CMP f40E4
        BMI b5798
        LDA #$FF
        STA f5027,X
b5798   LDA #$02
        STA f502F,X
        LDA f40EC,X
        CMP f40EC
        BMI b57AA
        LDA #$FE
        STA f502F,X
b57AA   JMP b513C

b57AD   CMP #$82
        BNE b57BA
        LDA a4124
        STA a4124,X
        JMP b513C

b57BA   CMP #$83
        BNE b57D3
        LDA f5027,X
        JSR s54A2
        STA f5027,X
        LDA f502F,X
        JSR s54A2
        STA f502F,X
        JMP b513C

b57D3   LDA a4124
        CLC 
        ADC #$04
        AND #$07
        STA a4124,X
        JMP b513C

s57E1   LDA f4F67,Y
        BNE b57E7
        RTS 

b57E7   TXA 
        PHA 
        LDA f4F67,Y
        AND #$0F
        TAX 
        LDA f503F,X
        BNE b57FC
        LDA #$0F
        STA f503F,X
        PLA 
        TAX 
        RTS 

b57FC   PLA 
        LDX #$07
        PLA 
        PLA 
        JMP b5059

s5804   LDA f4F67,Y
        BNE b580A
        RTS 

b580A   TXA 
        PHA 
        LDA f4F67,Y
        AND #$0F
        TAX 
        LDA #$FF
        STA f503F,X
        LDA f4F67,Y
        AND #$F0
        CMP #$80
        BEQ b5826
        JSR s5831
        JMP j5829

b5826   JSR s5A3E
j5829   PLA 
        TAX 
        LDA #$18
        STA a5A99
        RTS 

s5831   LDX #$00
        STA a2F
b5835   LDA fC200,X
        JSR s5874
        STA fC200,X
        LDA fC264,X
        JSR s5874
        STA fC264,X
        LDA fC2C8,X
        JSR s5874
        STA fC2C8,X
        LDA fC32C,X
        JSR s5874
        STA fC32C,X
        INX 
        CPX #$64
        BNE b5835
        TYA 
        PHA 
        LDA #$00
        JSR j4CAF
        LDA a5E6A
        CLC 
        ADC #$03
        STA a5E6A
        JSR s4F32
        PLA 
        TAY 
        RTS 

s5874   PHA 
        CMP #$FF
        BEQ b587F
        AND #$F0
        CMP a2F
        BEQ b5881
b587F   PLA 
        RTS 

b5881   PLA 
        LDA #$00
        RTS 

s5885   LDX #$00
b5887   LDA f5899,X
        STA p0400,X
        LDA f58B9,X
        STA f0428,X
        INX 
        CPX #$20
        BNE b5887
        RTS 

f5899   .BYTE $13,$03,$0F,$12,$05,$20,$30,$30
        .BYTE $30,$30,$30,$30,$30,$20,$20,$20
        .BYTE $20,$20,$20,$20,$0E,$0F,$12,$14
        .BYTE $08,$20,$30,$20,$14,$3A,$30,$30
f58B9   .BYTE $13,$14,$12,$05,$0E,$07,$14,$08
        .BYTE $20,$56,$56,$56,$56,$56,$56,$56
        .BYTE $56,$56,$56,$20,$17,$05,$13,$14
        .BYTE $20,$20,$30,$20,$2A,$3A,$30,$30
a58D9   .BYTE $07
a58DA   .BYTE $07
a58DB   .BYTE $07
f58DC   .BYTE $00,$06,$02,$04,$05,$03,$07,$01
        .BYTE $01,$07,$07,$05,$04,$02,$06,$06
s58EC   LDA a58D9
        CMP #$06
        BEQ b58FB
        LDA #$06
        STA a58D9
        JMP j5900

b58FB   LDA #$02
        STA a58D9
j5900   LDX #$0A
b5902   STA fD830,X
        DEX 
        BNE b5902
        DEC a58DB
        BEQ b590E
        RTS 

b590E   LDA #$03
        STA a58DB
        INC a58DA
        LDA a58DA
        AND #$0F
        STA a58DA
        TAX 
        LDA f58DC,X
        STA aD81A
        TXA 
        ADC #$07
        AND #$0F
        TAX 
        LDA f58DC,X
        STA aD842
        LDX #$07
b5933   STA fD805,X
        DEX 
        BNE b5933
        JSR s5FD7
        JMP j5F23

s593F   TXA 
        PHA 
        TYA 
        PHA 
        LDA f4FCF,Y
        AND #$0F
        TAX 
        LDA f4FCF,Y
        CLC 
        ROR 
        CLC 
        ROR 
        CLC 
        ROR 
        CLC 
        ROR 
        TAY 
b5955   TXA 
        PHA 
b5957   INC f0405,X
        LDA f0405,X
        CMP #$3A
        BNE b5969
        LDA #$30
        STA f0405,X
        DEX 
        BNE b5957
b5969   PLA 
        TAX 
        DEY 
        BNE b5955
        PLA 
        TAY 
        PLA 
        TAX 
        RTS 

s5973   LDA f4F9F,Y
        AND #$F0
        BNE b597B
        RTS 

b597B   LDA #$20
        JSR s59C5
        LDA #$40
        STA a5A25
        TXA 
        PHA 
        TYA 
        PHA 
        LDA f4F9F,Y
        CLC 
        ROR 
        CLC 
        ROR 
        CLC 
        ROR 
        CLC 
        ROR 
        TAY 
b5995   DEC a5E59
        BNE b59B9
        LDA a5E58
        STA a5E59
        LDX a30
        INC f0430,X
        LDA f0430,X
        CMP #$5E
        BNE b59B9
        LDA #$20
        STA f0430,X
        DEX 
        STX a30
        BNE b59B9
        JMP j47FD

b59B9   DEY 
        BNE b5995
        PLA 
        TAY 
        PLA 
        TAX 
        LDA #$10
        STA a39
        RTS 

s59C5   STA $D401    ;Voice 1: Frequency Control - High-Byte
        LDA #$08
        STA $D404    ;Voice 1: Control Register
        LDA #$0B
        STA $D405    ;Voice 1: Attack / Decay Cycle Control
        LDA #$00
        STA $D406    ;Voice 1: Sustain / Release Cycle Control
        STA a59E0
        LDA #$81
        STA $D404    ;Voice 1: Control Register
        RTS 

a59E0   .BYTE $00
s59E1   LDA #$08
        STA $D404    ;Voice 1: Control Register
        LDA #$03
        STA a59E0
        STA $D401    ;Voice 1: Frequency Control - High-Byte
        LDA #$0B
        STA $D405    ;Voice 1: Attack / Decay Cycle Control
        LDA #$00
        STA $D406    ;Voice 1: Sustain / Release Cycle Control
        LDA #$21
        STA $D404    ;Voice 1: Control Register
        RTS 

s59FE   LDA a59E0
        BEQ b5A26
        INC a59E0
        LDA a59E0
        ROL 
        ROL 
        ROL 
        ROL 
        LDY a5E56
        CPY #$00
        BEQ b5A1A
        EOR aC9A9
        JMP j5A1F

b5A1A   EOR a17
        EOR $D000    ;Sprite 0 X Pos
j5A1F   STA $D401    ;Voice 1: Frequency Control - High-Byte
        JMP b5A26

b5A26   =*+$01
a5A25   BRK #$AD
        AND a5A
        BNE b5A2C
        RTS 

b5A2C   DEC a5A25
        BEQ b5A38
        LDA a5A25
        STA $D027    ;Sprite 0 Color
        RTS 

b5A38   LDA #$01
        STA $D027    ;Sprite 0 Color
        RTS 

s5A3E   CPX #$0E
        BEQ b5A57
        INC a5E5E
        LDA f5A55,X
        STA f0406,X
        LDA a5E5E
        CMP #$05
        BNE b5A56
        LDA #$01
f5A55   =*+$01
        STA a38
b5A56   RTS 

b5A57   LDA #$0F
        STA f503F,X
        RTS 

        .BYTE $07,$0F,$01,$14,$13
s5A62   LDA a5A99
        BEQ b5A71
        LDA aC9AA
        BNE b5A8C
        DEC a5A98
        BEQ b5A72
b5A71   RTS 

b5A72   LDA $D020    ;Border Color
        AND #$0F
        BNE b5A87
a5A7A   =*+$01
        LDA #$01
        STA $D020    ;Border Color
        STA $D021    ;Background Color 0
        LDA #$01
        STA a5A98
        RTS 

a5A88   =*+$01
b5A87   LDA #$02
        STA a5A98
b5A8C   LDA #$00
        STA $D020    ;Border Color
        STA $D021    ;Background Color 0
        DEC a5A99
        RTS 

a5A99   =*+$01
a5A98   ORA (p00,X)
j5A9A   LDX #$00
a5A9D   =*+$01
a5A9E   =*+$02
        LDA $FFFF,X  ;IRQ
        CMP #$00
        BEQ b5AAC
        CMP #$FF
        BEQ b5AAC
        LDY #$01
        JMP j5ABE

b5AAC   PHA 
        INX 
a5AAF   =*+$01
a5AB0   =*+$02
        LDA $FFFF,X  ;IRQ
        BEQ b5AE3
        TAY 
        PLA 
        DEX 
        INC a5A9D
        BNE j5ABE
        INC a5A9E
a5ABF   =*+$01
a5AC0   =*+$02
j5ABE   STA $FFFF,X  ;IRQ
        INC a5ABF
        BNE b5AC9
        INC a5AC0
b5AC9   DEY 
        BNE j5ABE
        INC a5A9D
        BNE b5AD4
        INC a5A9E
b5AD4   LDA a5A9D
        STA a5AAF
        LDA a5A9E
        STA a5AB0
        JMP j5A9A

b5AE3   PLA 
        RTS 

a5AE5   .BYTE $FF
a5AE6   .BYTE $FF
a5AE7   .BYTE $FF
a5AE8   .BYTE $FF
        LDA a5AE5
        STA a32
        LDA a5AE6
        STA a31
        LDA a5AE7
        STA a34
        LDA a5AE8
        STA a33
        LDY #$00
j5AFF   LDA (p31),Y
        BEQ b5B19
        CMP #$FF
        BEQ b5B19
        CMP #$6A
        BNE b5B0E
        JSR s5B36
b5B0E   STA (p33),Y
        JSR s5B54
        JSR s5B5B
        JMP j5AFF

b5B19   STA (p33),Y
        LDX #$01
j5B1D   JSR s5B54
        LDA (p31),Y
        CMP (p33),Y
        BNE b5B2A
        INX 
        JMP j5B1D

b5B2A   JSR s5B5B
        TXA 
        STA (p33),Y
        JSR s5B5B
        JMP j5AFF

s5B36   INY 
        LDA (p31),Y
        CMP #$6A
        BEQ b5B42
b5B3D   LDY #$00
        LDA (p31),Y
        RTS 

b5B42   INY 
        LDA (p31),Y
        CMP #$6A
        BNE b5B3D
        LDY #$00
        TYA 
        STA (p33),Y
        INY 
        STA (p33),Y
        PLA 
        PLA 
b5B53   RTS 

s5B54   INC a31
        BNE b5B53
        INC a32
b5B5A   RTS 

s5B5B   INC a33
        BNE b5B5A
        INC a34
        RTS 

s5B62   LDA #<p0104
        STA a07
        LDA #>p0104
        STA a08
b5B6A   LDA #$02
        STA a06
        LDA #$20
        STA a09
b5B72   JSR s41E5
        INC a06
        LDA a06
        CMP #$26
        BNE b5B72
        INC a07
        LDA a07
        CMP #$18
        BNE b5B6A
        RTS 

s5B86   JSR s5B62
        LDX a17
        LDA fC000,X
        STA a31
        LDA fC064,X
        STA a32
j5B95   LDY #$00
        LDA (p31),Y
        CMP #$FF
        BNE b5BA3
        JSR s5B54
        JMP j5BEF

b5BA3   STA a06
        JSR s5B54
        LDA (p31),Y
        STA a07
        JSR s5B54
        LDA #>p5E09
        STA a09
        LDA #<p5E09
        STA a08
        LDA (p31),Y
        AND #$80
        BNE b5BD8
        LDA (p31),Y
        TAX 
b5BC0   TXA 
        PHA 
        TYA 
        PHA 
        JSR s4271
        PLA 
        TAY 
        PLA 
        TAX 
        INC a06
        INC a06
        DEX 
        BNE b5BC0
b5BD2   JSR s5B54
        JMP j5B95

b5BD8   LDA (p31),Y
        AND #$1F
        TAX 
b5BDD   TXA 
        PHA 
        TYA 
        PHA 
        JSR s4271
        PLA 
        TAY 
        PLA 
        TAX 
        INC a07
        DEX 
        BNE b5BDD
        BEQ b5BD2
j5BEF   LDA (p31),Y
        STA $D025    ;Sprite Multi-Color Register 0
        JSR s5B54
        LDA (p31),Y
        STA $D026    ;Sprite Multi-Color Register 1
        JMP j5C15

s5BFF   AND #$F0
        CMP #$40
        BNE b5C08
b5C05   LDA #$FF
        RTS 

b5C08   CPX #$00
        BEQ b5C0F
b5C0C   LDA #$00
        RTS 

b5C0F   CMP #$50
        BEQ b5C05
        BNE b5C0C
j5C15   LDX #$00
j5C17   JSR s5B54
        LDA (p31),Y
        BEQ b5C25
        STA f0450,X
        INX 
        JMP j5C17

b5C25   JSR s5B54
        LDA #$A0
        STA a35
        LDA #<f4F5F
        STA a33
        LDA #>f4F5F
        STA a34
b5C34   LDA (p31),Y
        STA (p33),Y
        JSR s5B54
        JSR s5B5B
        DEC a35
        BNE b5C34
        LDA (p31),Y
        BNE b5C47
        RTS 

b5C47   LDA #>p0800
        STA a5AC0
        LDA #<p0800
        STA a5ABF
        LDA a17
        CMP #$49
        BNE b5C64
        LDA #>p1700
        STA a5A9E
        LDA #<p1700
        STA a5A9D
        JMP b5AD4

b5C64   LDA (p31),Y
        STA a5A9E
        INY 
        LDA (p31),Y
        STA a5A9D
        JMP b5AD4

s5C72   TYA 
        PHA 
        LDX a30
        LDY #$04
b5C78   LDA #$56
        STA f0430,X
        CPX #$0A
        BEQ b5C86
        INX 
        DEY 
        BNE b5C78
        DEX 
b5C86   STX a30
        PLA 
        TAY 
        RTS 

s5C8B   TXA 
        PHA 
        TYA 
        PHA 
        LDY #$01
        JMP b5995

s5C94   CMP #$81
        BEQ b5C99
        RTS 

b5C99   JSR s41A2
        AND #$0F
        SEC 
        SBC #$07
        STA f5027,X
        JSR s41A2
        AND #$0F
        SEC 
        SBC #$07
        STA f502F,X
        RTS 

j5CB0   LDA f40E4,X
        AND #$F0
        STA a5D2C
        LDA f40E4
        AND #$F0
        CMP a5D2C
        BNE b5CD0
b5CC2   LDA f5037,X
        AND #$0F
        BEQ b5CCD
        TAY 
        JMP j50CF

b5CCD   JMP b5455

b5CD0   LDA f5027,X
        AND #$80
        BNE b5CE0
        LDA f5027,X
        JSR s54A2
        STA f5027,X
b5CE0   LDA f40E4
        AND #$F0
        CMP a5D2C
        BPL b5CEB
        RTS 

b5CEB   LDA f5027,X
        JSR s54A2
        STA f5027,X
        RTS 

j5CF5   LDA f40EC,X
        AND #$F0
        STA a5D2C
        LDA f40EC
        AND #$F0
        CMP a5D2C
        BEQ b5CC2
        LDA f502F,X
        AND #$80
        BNE b5D17
        LDA f502F,X
        JSR s54A2
        STA f502F,X
b5D17   LDA f40EC
        AND #$F0
        CMP a5D2C
        BPL b5D22
        RTS 

b5D22   LDA f502F,X
        JSR s54A2
        STA f502F,X
b5D2B   RTS 

a5D2C   .BYTE $FF
s5D2D   LDA aCAFF
        BEQ b5D2B
        DEC a041F
        LDA a041F
        CMP #$2F
        BEQ b5D3D
        RTS 

b5D3D   LDA #$39
        STA a041F
        DEC a041E
        RTS 

s5D46   INC a0447
        LDA a0447
        CMP #$3A
        BNE b5D58
        LDA #$30
        STA a0447
        INC a0446
b5D58   LDA a0446
        CMP #$3A
        BNE b5D67
        LDA #$30
        STA a0446
        JMP jCB88

b5D67   RTS 

a5D68   RTS 

s5D69   LDA #$08
        STA $D404    ;Voice 1: Control Register
        LDX #$C0
        LDA #$11
        STA $D404    ;Voice 1: Control Register
b5D75   INC $D027    ;Sprite 0 Color
        DEY 
        BNE b5D75
        TXA 
        ROL 
        ROL 
        EOR #$C3
        STA $D401    ;Voice 1: Frequency Control - High-Byte
        DEX 
        BNE b5D75
        LDA #$08
        STA $D404    ;Voice 1: Control Register
        LDA #$01
        STA $D027    ;Sprite 0 Color
        LDA $D01E    ;Sprite to Sprite Collision Detect
        LDA $D01F    ;Sprite to Background Collision Detect
        JMP s59E1

j5D99   LDA #$90
        STA aC2CB
        STA aC2D5
        STA aC2DF
        STA aC2E9
        STA aC268
        STA aC272
        STA aC27C
        STA aC286
        LDA #$A1
        STA aC34E
        STA aC22C
        LDA #$B2
        STA aC36E
        STA aC24C
        LDA #$C3
        STA aC2F1
        STA aC28E
        LDA #$D4
        STA aC36A
        STA aC248
        LDA #$E5
        STA aC2F7
        STA aC301
        STA aC30B
        STA aC294
        STA aC29E
        STA aC2A8
        LDA #$F6
        STA aC30C
        STA aC2A9
        RTS 

s5DF0   LDA f4FFF,X
        BEQ b5DF6
b5DF5   RTS 

b5DF6   LDA f5037,X
        BEQ b5DF5
        LDA #$01
        STA f4FFF,X
b5E00   RTS 

s5E01   LDA aCAFF
        BEQ b5E00
        LDA aC5
p5E09   =*+$01
        CMP #$1D
        BEQ b5E38
        CMP #$1C
        BNE b5E13
        JMP j5F5A

b5E13   CMP #$39
        BNE b5E1D
        LDX #$F8
        TXS 
        JMP j4032

b5E1D   CMP #$12
        BNE b5E31
        LDA a5FF7
        EOR #$01
        STA a5FF7
        LDA #$01
        STA a5E56
        JSR s5FF8
b5E31   LDA #$00
        STA a5E56
        TAX 
        RTS 

b5E38   STA a5E56
b5E3B   JSR ROM_SCNKEY ;$FF9F - scan keyboard                    
        LDA aC5
        CMP #$40
        BNE b5E3B
        JMP j5E6B

b5E47   LDA aC5
        CMP #$40
        BEQ b5E47
b5E4D   LDA aC5
        CMP #$40
        BNE b5E4D
        JMP j5E94

a5E56   .BYTE $0C
a5E57   .BYTE $C9
a5E58   .BYTE $0C
a5E59   .BYTE $D0
f5E5A   .BYTE $08,$04,$02,$01
a5E5E   .BYTE $27
s5E5F   LDX #$0A
b5E61   LDA #$56
        STA f0430,X
        DEX 
        BNE b5E61
        RTS 

j5E6B   =*+$01
a5E6A   LDA @wf00A2,X
b5E6D   LDA $D027,X  ;Sprite 0 Color
        PHA 
        LDA #$0B
        STA $D027,X  ;Sprite 0 Color
        INX 
        CPX #$08
        BNE b5E6D
        LDX #$00
b5E7D   LDA f054A,X
        PHA 
        LDA f059A,X
        PHA 
        LDA f05EA,X
        PHA 
        INX 
        CPX #$14
        BNE b5E7D
        JSR s5EDC
        JMP b5E47

j5E94   LDX #$14
b5E96   PLA 
        JSR s5ED1
        STA f05E9,X
        PLA 
        JSR s5ED1
        STA f0599,X
        PLA 
        JSR s5ED1
        STA f0549,X
        LDA #$09
        STA fD9E9,X
        STA fD999,X
        STA fD949,X
        DEX 
        BNE b5E96
        LDX #$08
b5EBB   PLA 
        STA $D026,X  ;Sprite Multi-Color Register 1
        DEX 
        BNE b5EBB
        LDA #$01
        STA $D027    ;Sprite 0 Color
        LDA $D01F    ;Sprite to Background Collision Detect
        LDA #$00
        STA a14
        JMP b5E31

s5ED1   PHA 
        AND #$40
        BNE b5EDA
        PLA 
        LDA #$20
        RTS 

b5EDA   PLA 
        RTS 

s5EDC   LDA #<pA000
        STA a42
        LDA #>pA000
        STA a43
        LDA a17
        BEQ b5EF9
        TAX 
b5EE9   LDA a42
        CLC 
        ADC #$3C
        STA a42
        LDA a43
        ADC #$00
        STA a43
        DEX 
        BNE b5EE9
b5EF9   LDX #$00
        LDY #$00
b5EFD   LDA (p42),Y
        STA f054A,X
        INY 
        INX 
        CPX #$14
        BNE b5EFD
        LDX #$00
b5F0A   LDA (p42),Y
        STA f059A,X
        INY 
        INX 
        CPX #$14
        BNE b5F0A
        LDX #$00
b5F17   LDA (p42),Y
        STA f05EA,X
        INY 
        INX 
        CPX #$14
        BNE b5F17
        RTS 

j5F23   LDA a5E56
        BNE b5F29
        RTS 

b5F29   LDY #$14
b5F2B   LDA a58DA
        TAX 
        LDA f58DC,X
        STA fD949,Y
        STA fD971,Y
        LDA a58DA
        CLC 
        ADC #$02
        AND #$0F
        TAX 
        LDA f58DC,X
        STA fD999,Y
        LDA a58DA
        CLC 
        ADC #$04
        AND #$0F
        TAX 
        LDA f58DC,X
        STA fD9E9,Y
        DEY 
        BNE b5F2B
        RTS 

j5F5A   LDA #$08
        STA a5A88
        STA $D404    ;Voice 1: Control Register
        LDA #$21
        STA $D404    ;Voice 1: Control Register
        LDA #$00
        STA a59E0
        LDA #$05
b5F6E   TAX 
        LDA #$F0
        STA $D405    ;Voice 1: Attack / Decay Cycle Control
        LDA f58DC,X
        STA a5A7A
        LDA #$05
        STA a5A99
b5F7F   JSR s41A2
        AND #$1F
        STA $D401    ;Voice 1: Frequency Control - High-Byte
        LDA a5A99
        BNE b5F7F
        DEC a5A88
        LDA a5A88
        BNE b5F6E
        LDA #$02
        STA a5A88
        LDA #$01
        STA a5A7A
        LDX a17
        LDA fC200,X
        AND #$F0
        BNE b5FAD
        STA fC200,X
        STA fC322,X
b5FAD   LDA fC32C,X
        AND #$F0
        BNE b5FBA
        STA fC32C,X
        STA fC20A,X
b5FBA   LDA fC2C8,X
        AND #$F0
        BNE b5FC7
        STA fC2C8,X
        STA fC265,X
b5FC7   LDA fC264,X
        AND #$F0
        BNE b5FD4
        STA fC264,X
        STA fC2C7,X
b5FD4   JMP j47FD

s5FD7   LDX a17
        LDA a5E56
        BNE b5FED
        LDA fC390,X
        BEQ b5FED
        CMP #$FF
        BEQ b5FED
        LDA #$0B
        STA $D022    ;Background Color 1, Multi-Color Register 0
        RTS 

b5FED   LDX a58DA
        LDA f58DC,X
        STA $D022    ;Background Color 1, Multi-Color Register 0
        RTS 

a5FF7   .BYTE $00
s5FF8   LDA aC5
        CMP #$40
        BNE s5FF8
        RTS 

.include "data2.asm"
sC800   SEI 
        JSR s4A9C
        JSR s5B62
        JSR s4226
        JSR s4EDA
        LDX #$00
        STX aC9AA
        LDA #$0E
        STA aCB87
bC817   LDA fC84F,X
        STA f054C,X
        LDA fC85F,X
        STA f0574,X
        INX 
        CPX #$10
        BNE bC817
        LDA #<p0201
        STA a5E56
        LDA #>p0201
        STA a5E57
        LDA #$FF
        STA aCAFF
        JSR sC86F
        JSR sC9AB
        CLI 
        JSR sC8DE
        LDA #$02
        STA a5A88
        LDA #$01
        STA a5A7A
        LDA #$00
        STA a17
fC84F   RTS 

        .BYTE $62,$64,$66,$68,$6A,$6C,$6E,$70
        .BYTE $72,$74,$76,$78,$7A,$7C,$7E
fC85F   .BYTE $61,$63,$65,$67,$69,$6B,$6D,$6F
        .BYTE $71,$73,$75,$77,$79,$7B,$7D,$7F
sC86F   LDX #$00
bC871   LDA fC8A2,X
        STA f05EA,X
        LDA fC8B6,X
        STA f063A,X
        LDA fC8CA,X
        STA f068A,X
        INX 
        CPX #$14
        BNE bC871
        LDX #$00
bC88A   LDA fCCB0,X
        STA f04CB,X
        LDA fCCD2,X
        STA f0773,X
        LDA fCCF6,X
        STA f06D3,X
        INX 
        CPX #$22
        BNE bC88A
        RTS 

fC8A2   .BYTE $10,$12,$05,$13,$13,$20,$06,$09
        .BYTE $12,$05,$20,$14,$0F,$20,$13,$14
        .BYTE $01,$12,$14,$21
fC8B6   .BYTE $13,$14,$12,$0F,$02,$0F,$20,$06
        .BYTE $18,$20,$20,$20,$20,$05,$0E,$01
        .BYTE $02,$0C,$05,$04
fC8CA   .BYTE $04,$09,$06,$06,$09,$03,$15,$0C
        .BYTE $14,$19,$20,$20,$0F,$0E,$20,$20
        .BYTE $05,$01,$13,$19
sC8DE   JSR sC9F2
        JSR s41A2
        DEC aCAFF
        BNE bC8EC
        JMP jCB01

bC8EC   LDA $DC00    ;CIA1: Data Port Register A
        AND #$10
        BNE bC8F4
        RTS 

bC8F4   LDA aC5
        CMP #$40
        BEQ bC936
        LDY #$FF
        STY aCAFF
        PHA 
        JSR s41A2
        STA a5A7A
        JSR s41A2
        AND #$07
        ORA #$01
        STA a5A88
        JSR s41A2
        AND #$1F
        ORA #$01
        STA a5A99
        PLA 
        CMP #$04
        BNE bC922
        JMP jC941

bC922   CMP #$05
        BNE bC929
        JMP jC974

bC929   AND #$3F
        STA a17
        STA aC9A9
        JSR s4EDA
        JSR s59E1
bC936   LDX #$30
bC938   DEY 
        BNE bC938
        DEX 
        BNE bC938
        JMP sC8DE

jC941   LDA aC9AA
        EOR #$FF
        STA aC9AA
        BNE bC95D
        LDA #<p0520
        STA a0646
        LDA #>p0520
        STA a0647
        LDA #$0E
        STA a0648
        JMP bC929

bC95D   LDA #$04
        STA a0646
        LDA #$01
        STA aDA46
        LDA #<p1309
        STA a0647
        LDA #>p1309
        STA a0648
        JMP bC929

jC974   LDA a5E57
        CMP #$02
        BEQ bC98E
        LDA #$02
        STA a5E57
        LDX #$04
bC982   LDA fC9A0,X
        STA f0699,X
        DEX 
        BNE bC982
        JMP bC929

bC98E   LDA #$03
        STA a5E57
        LDX #$04
bC995   LDA fC9A4,X
        STA f0699,X
        DEX 
        BNE bC995
fC9A0   =*+$02
        JMP bC929

        .BYTE $05,$01,$13
fC9A4   .BYTE $19,$08,$01,$12,$04
aC9A9   .BYTE $AA
aC9AA   .BYTE $00
sC9AB   JSR s4A80
        LDA #$01
        STA f411C
        STA $D027    ;Sprite 0 Color
        STA $D028    ;Sprite 1 Color
        LDA #<p0402
        STA a411D
        LDA #>p0402
        STA a411E
        LDA #$70
        STA f40EC
        STA a40ED
        LDA #$C0
        STA a40EE
        LDA #$20
        STA f40E4
        STA a40E6
        LDA #$90
        STA a40E5
        LDA #>pC0C4
        STA a07F9
        LDA #<pC0C4
        STA a07F8
        LDA #$08
        STA $D029    ;Sprite 2 Color
        LDA #$B8
        STA a07FA
        RTS 

sC9F2   INC a07F8
        LDA a07F8
        CMP #$C8
        BNE bCA01
        LDA #$C4
        STA a07F8
bCA01   INC a07F9
        LDA a07F9
        CMP #$C4
        BNE bCA10
        LDA #$C0
        STA a07F9
bCA10   LDX #$02
bCA12   DEY 
        BNE bCA12
        DEX 
        BNE bCA12
        LDA aCA57
        EOR #$01
        STA aCA57
        LDA aCA56
        BNE bCA41
        LDA aCA57
        CLC 
        ADC #$B8
        STA a07FA
        INC a40E6
        LDA a40E6
        CMP #$98
        BNE bCA40
bCA38   LDA aCA56
        EOR #$01
        STA aCA56
bCA40   RTS 

bCA41   LDA aCA57
        CLC 
        ADC #$BA
        STA a07FA
        DEC a40E6
        LDA a40E6
        CMP #$14
        BNE bCA40
        BEQ bCA38
aCA57   =*+$01
aCA56   BRK #$00
jCA58   SEI 
        JSR s5B62
        LDA #$01
        STA a5E56
        JSR sC9AB
        LDX #$00
bCA66   LDA fCA7F,X
        STA f054A,X
        LDA fCA93,X
        STA f059A,X
        LDA fCAA7,X
        STA f05EA,X
        INX 
        CPX #$14
        BNE bCA66
        BEQ bCABB
fCA7F   .BYTE $01,$0C,$0C,$20,$09,$0E,$03,$01
        .BYTE $12,$0E,$01,$14,$09,$0F,$0E,$13
        .BYTE $20,$20,$20,$20
fCA93   .BYTE $14,$20,$05,$20,$12,$20,$0D,$20
        .BYTE $09,$20,$0E,$20,$01,$20,$14,$20
        .BYTE $05,$20,$04,$20
fCAA7   .BYTE $13,$09,$0D,$15,$0C,$01,$14,$09
        .BYTE $0F,$0E,$3A,$20,$01,$02,$0F,$12
        .BYTE $14,$05,$04,$20
bCABB   LDA #$08
        STA $D404    ;Voice 1: Control Register
        CLI 
        LDA #$10
        STA aCAFE
        STA $D401    ;Voice 1: Frequency Control - High-Byte
        LDA #$0E
        STA $D405    ;Voice 1: Attack / Decay Cycle Control
        LDA #$00
        STA $D406    ;Voice 1: Sustain / Release Cycle Control
        LDA #$21
        STA $D404    ;Voice 1: Control Register
        LDX #$00
bCADA   TXA 
        PHA 
        JSR sC9F2
        LDA aCAFE
        CLC 
        ADC #$51
        STA aCAFE
        STA $D401    ;Voice 1: Frequency Control - High-Byte
        LDX #$0C
bCAED   DEY 
        BNE bCAED
        DEX 
        BNE bCAED
        PLA 
        TAX 
        DEX 
        BNE bCADA
        LDX #$F8
        TXS 
        JMP j4032

aCAFE   .BYTE $2A
aCAFF   .BYTE $2A
aCB00   .BYTE $00
jCB01   JSR s41A2
        PHA 
        AND #$80
        BEQ bCB0D
        PLA 
        JMP jCB01

bCB0D   PLA 
        CMP #$63
        BPL jCB01
        STA a17
        DEC aCB87
        BEQ bCB41
        LDA #$00
        STA a5E56
        JSR s4A80
        SEI 
        JSR sCB51
        JSR s5B86
        CLI 
bCB29   JSR s51B2
        LDX #$03
bCB2E   DEY 
        BNE bCB2E
        LDA aC5
        CMP #$40
        BNE bCB41
        LDA $DC00    ;CIA1: Data Port Register A
        AND #$10
        BEQ bCB41
        JMP jCB46

bCB41   PLA 
        PLA 
        JMP sC800

jCB46   DEX 
        BNE bCB2E
        DEC aCB00
        BNE bCB29
        JMP jCB01

sCB51   LDX #$17
bCB53   LDA #$20
        STA f044F,X
        DEX 
        BNE bCB53
        LDX #$00
bCB5D   LDA #$00
        STA f411C,X
        STA f410C,X
        STA f447A,X
        STA f4FFF,X
        STA f503F,X
        STA f5047,X
        STA a4124,X
        LDA #$01
        STA f5007,X
        STA f4FDF,X
        INX 
        CPX #$08
        BNE bCB5D
        LDA #$00
        STA a47C1
        RTS 

aCB87   .BYTE $D0
jCB88   LDA #$30
        STA a5A99
        LDA #$01
        STA a5E56
        LDX #$08
bCB94   LDA #$0B
        STA $D026,X  ;Sprite Multi-Color Register 1
        DEX 
        BNE bCB94
        LDX #$00
bCB9E   LDA fCBD7,X
        STA f054A,X
        LDA fCBEB,X
        STA f059A,X
        LDA fCBFF,X
        STA f05EA,X
        INX 
        CPX #$14
        BNE bCB9E
        JSR s59E1
        LDA #$05
        CLC 
        ADC a5E6A
        ASL 
        TAX 
        PHA 
jCBC1   LDY #$00
bCBC3   TYA 
        PHA 
        JSR sCC13
        PLA 
        TAY 
        DEY 
        BNE bCBC3
        PLA 
        TAX 
        DEX 
        BEQ bCC23
        TXA 
        PHA 
        JMP jCBC1

fCBD7   .BYTE $06,$01,$12,$20,$0F,$15,$14,$21
        .BYTE $20,$19,$0F,$15,$20,$04,$09,$04
        .BYTE $20,$09,$14,$21
fCBEB   .BYTE $19,$0F,$15,$20,$07,$05,$14,$20
        .BYTE $08,$01,$09,$12,$19,$20,$02,$0F
        .BYTE $0E,$15,$13,$20
fCBFF   .BYTE $06,$0F,$12,$20,$02,$05,$09,$0E
        .BYTE $07,$20,$13,$0F,$20,$01,$17,$05
        .BYTE $13,$0F,$0D,$05
sCC13   LDA #$07
        TAX 
        PHA 
        LDY #$40
bCC19   DEY 
        BNE bCC19
        LDA #$01
        TAY 
        PHA 
        JMP b5955

bCC23   LDA #$0E
        STA $D405    ;Voice 1: Attack / Decay Cycle Control
        LDA #$50
        STA a5A99
        LDA #$08
        STA $D404    ;Voice 1: Control Register
        LDX #$00
bCC34   LDA fCC92,X
        STA f063A,X
        LDA #$01
        STA fDA3A,X
        INX 
        CPX #$14
        BNE bCC34
        LDA #$00
        STA aCC91
        STA a59E0
        LDA #$21
        STA $D404    ;Voice 1: Control Register
bCC51   LDX #$05
bCC53   LDA fCCA5,X
        STA $D400    ;Voice 1: Frequency Control - Low-Byte
        LDA fCCAA,X
        CLC 
        ADC aCC91
        STA $D401    ;Voice 1: Frequency Control - High-Byte
        TXA 
        PHA 
        LDX #$18
bCC67   DEY 
        BNE bCC67
        JSR s41A2
        STA a5A7A
        DEX 
        BNE bCC67
        PLA 
        TAX 
        DEX 
        BNE bCC53
        LDA aCC91
        CLC 
        ADC #$04
        STA aCC91
        CMP #$C0
        BNE bCC51
        JSR s4848
        JSR sCD19
        LDX #$F8
        TXS 
        JMP j4032

aCC91   .BYTE $20
fCC92   .BYTE $13,$09,$0D,$15,$0C,$01,$14,$09
        .BYTE $0F,$0E,$3A,$20,$03,$0F,$0D,$10
        .BYTE $0C,$05,$14
fCCA5   .BYTE $05,$47,$47,$A7,$47
fCCAA   .BYTE $47,$06,$0C,$35,$16,$05
fCCB0   .BYTE $02,$05,$13,$14,$20,$07,$01,$0D
        .BYTE $05,$20,$13,$03,$0F,$12,$05,$04
        .BYTE $20
fCCC1   .BYTE $30,$30,$31,$30,$36,$30,$30,$20
        .BYTE $01,$0E,$04,$20
aCCCD   .BYTE $20
aCCCE   .BYTE $30
aCCCF   .BYTE $30,$20,$2A
fCCD2   .BYTE $03,$0F,$10,$19,$12,$09,$07,$08
        .BYTE $14,$20,$31,$39,$38,$34,$20,$20
        .BYTE $20,$0C,$20,$0C,$20,$01,$20,$0D
        .BYTE $20,$01,$20,$13,$20,$0F,$20,$06
        .BYTE $20,$14,$20,$20
fCCF6   .BYTE $20,$03,$12,$05,$01,$14,$05,$04
        .BYTE $20,$02,$19,$3A,$20,$0A,$05,$06
        .BYTE $06,$20,$27,$01,$0E,$09,$0D,$01
        .BYTE $0C,$27,$20,$0D,$09,$0E,$14,$05
        .BYTE $12,$20,$20
sCD19   LDX #$00
bCD1B   LDA f0406,X
        CMP fCCC1,X
        BEQ bCD26
        BPL bCD2C
        RTS 

bCD26   INX 
        CPX #$07
        BNE bCD1B
        RTS 

bCD2C   LDX #$00
bCD2E   LDA f0406,X
        STA fCCC1,X
        INX 
        CPX #$07
        BNE bCD2E
        LDA #$20
        STA aCCCD
        LDA a0446
        STA aCCCE
        LDA a0447
        STA aCCCF
        CMP aCCCE
        BEQ bCD50
bCD4F   RTS 

bCD50   CMP #$30
        BNE bCD4F
        LDA #$31
        STA aCCCD
        RTS 

        STA a5A9E
        INY 
        LDA (p31),Y
        STA a5A9D
        JMP b5AD4

        TYA 
        PHA 
        LDX a30
        LDY #$04
bCD6C   LDA #$56
        STA f0430,X
        CPX #$0A
        BEQ bCD7A
        INX 
        DEY 
        BNE bCD6C
        DEX 
bCD7A   STX a30
        PLA 
        TAY 
        RTS 

        TXA 
        PHA 
        TYA 
        PHA 
        LDY #$01
        JMP b5995

        CMP #$81
        BEQ bCD8D
        RTS 

bCD8D   JSR s41A2
        AND #$0F
        SEC 
        SBC #$07
        STA f5027,X
        JSR s41A2
        AND #$0F
        SEC 
        SBC #$07
        STA f502F,X
        RTS 

        LDA f40E4,X
        AND #$F0
        STA a5D2C
        LDA f40E4
        AND #$F0
        CMP a5D2C
        BNE bCDC4
        LDA f5037,X
        AND #$0F
        BEQ bCDC1
        TAY 
        JMP j50CF

bCDC1   JMP b5455

bCDC4   LDA f5027,X
        AND #$80
        BNE bCDD4
        LDA f5027,X
        JSR s54A2
        STA f5027,X
bCDD4   LDA f40E4
        AND #$F0
        CMP a5D2C
        BPL bCDDF
        RTS 

bCDDF   LDA f5027,X
        JSR s54A2
        STA f5027,X
        RTS 

        .BYTE $BD,$EC,$40,$29,$F0,$8D,$2C,$5D
        .BYTE $AD,$EC,$40,$29,$F0,$CD,$2C,$5D
        .BYTE $F0,$BB,$BD,$2F,$50,$29,$80
aCE00   .BYTE $8C,$00,$A7,$7A,$24,$B2,$8F,$3A
        .BYTE $DE,$11,$AE,$2C,$E1,$97,$ED,$28
        .BYTE $3E,$7D,$31,$57,$DF,$C0,$42,$8B
        .BYTE $58,$10,$1B,$36,$75,$B8,$9A,$C9
        .BYTE $1E,$04,$D8,$3B,$70,$CB,$B7,$68
        .BYTE $1F,$03,$13,$AD,$77,$53,$45,$48
        .BYTE $E5,$F4,$BA,$91,$B9,$D5,$A5,$7E
        .BYTE $EA,$60,$C6,$AB,$D1,$82,$4F,$F0
        .BYTE $25,$0C,$98,$FB,$A8,$BF,$38,$7C
        .BYTE $4B,$F8,$CE,$23,$CD,$06,$02,$22
        .BYTE $FC,$AA,$6C,$93,$DC,$90,$5E,$A9
        .BYTE $41,$65,$FA,$E2,$4A,$56,$7B,$BC
        .BYTE $E0,$0F,$C4,$59,$A1,$1D,$12,$17
        .BYTE $2E,$B3,$35,$95,$CA,$6A,$E9,$6E
        .BYTE $EF,$9F,$F2,$49,$C8,$C7,$32,$47
        .BYTE $19,$CF,$2F,$2D,$18,$64,$F6,$0D
        .BYTE $1A,$8A,$33,$44,$0A,$6D,$9D,$43
        .BYTE $D2,$61,$AC,$8D,$AF,$5C,$E3,$B1
        .BYTE $81,$D3,$BB,$E7,$99,$3C,$DD,$C2
        .BYTE $05,$62,$B4,$8E,$84,$67,$80,$F9
        .BYTE $4C,$A2,$76,$9C,$2A,$94,$A3,$16
        .BYTE $B0,$5D,$09,$E4,$B6,$D4,$B5,$FD
        .BYTE $3F,$BE,$74,$D9,$63,$87,$89,$72
        .BYTE $EE,$0B,$4D,$2B,$C5,$26,$46,$E8
        .BYTE $3D,$37,$A0,$55,$79,$54,$6F,$83
        .BYTE $FF,$0E,$D0,$4E,$15,$A6,$27,$9E
        .BYTE $73,$78,$C1,$71,$FE,$01,$E6,$21
        .BYTE $52,$34,$DA,$30,$69,$C3,$5A,$88
        .BYTE $EC,$7F,$29,$39,$F3,$EB,$14,$51
        .BYTE $50,$F1,$20,$D7,$08,$A4,$D6,$F5
        .BYTE $6B,$DB,$96,$85,$92,$86,$CC,$07
        .BYTE $F7,$5B,$BD,$5F,$1C,$40,$9B,$66
        .BYTE $7D,$FF,$FF,$DF,$FF,$FF,$FF,$FF
        .BYTE $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
        .BYTE $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
        .BYTE $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $FF,$FF,$FF,$FE,$FF,$FF,$FF,$FD
        .BYTE $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
        .BYTE $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
        .BYTE $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF

