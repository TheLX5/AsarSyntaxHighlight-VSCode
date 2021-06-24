;################################################
;# SPC700 MNEMONICS

; Specific bit
; Scope: 
; Some of the opcodes below also accept using ".X" for specifying bits in a address
; However, this makes it impossible for structs to be a single digit

    and1 C,!define.0
    and1 C,label.struct.2
    mov1 C,$0000.7

    mov.b label.2.struct, !define       ; breaks

; Math
; Scope: keyword.asar.mnemonics.math
; Scope: keyword.asar.mnemonics.math.spc700

    ADC $00,#$00
    ADC $00,$00
    ADC (X),(Y)
    ADC A,#$00
    ADC A,$00
    ADC A,$00+X
    ADC A,$0000
    ADC A,$0000+X
    ADC A,$0000+Y
    ADC A,($00)+Y
    ADC A,($00+X)
    ADC A,(X)
    ADDW YA,$00

    SBC $00,#$00
    SBC $00,$00
    SBC (X),(Y)
    SBC A,#$00
    SBC A,$00
    SBC A,$00+X
    SBC A,$0000
    SBC A,$0000+X
    SBC A,$0000+Y
    SBC A,($00)+Y
    SBC A,($00+X)
    SBC A,(X)
    SUBW YA,$00

    DIV YA,X
    MUL YA

    DAA A
    DAS A
    
; Branch
; Scope: keyword.asar.mnemonics.branch
; Scope: keyword.asar.mnemonics.branch.spc700

    BCC $00
    BCS $00
    BEQ $00
    BMI $00
    BNE $00
    BPL $00
    BRA $00
    BVC $00
    BVS $00

    BBC0 $00,$00
    BBC1 $00,$00
    BBC2 $00,$00
    BBC3 $00,$00
    BBC4 $00,$00
    BBC5 $00,$00
    BBC6 $00,$00
    BBC7 $00,$00
    
    BBS0 $00,$00
    BBS1 $00,$00
    BBS2 $00,$00
    BBS3 $00,$00
    BBS4 $00,$00
    BBS5 $00,$00
    BBS6 $00,$00
    BBS7 $00,$00

    CBNE $00+x,$00
    CBNE $00,$00
    DBNZ $00,$00
    DBNZ Y,$00

; Bits
; Scope: keyword.asar.mnemonics.bitwise
; Scope: keyword.asar.mnemonics.bitwise.spc700

    AND $00,#$00
    AND $00,$00
    AND (X),(Y)
    AND A,#$00
    AND A,$00
    AND A,$00+X
    AND A,$0000
    AND A,$0000+X
    AND A,$0000+Y
    AND A,($00)+Y
    AND A,($00+X)
    AND A,(X)
    AND1 C,!$0000
    AND1 C,$0000

    OR $00,#$00
    OR $00,$00
    OR (X),(Y)
    OR A,#$00
    OR A,$00
    OR A,$00+X
    OR A,$0000
    OR A,$0000+X
    OR A,$0000+Y
    OR A,($00)+Y
    OR A,($00+X)
    OR A,(X)
    OR1 C,!$0000
    OR1 C,$0000

    EOR $00,#$00
    EOR $00,$00
    EOR (X),(Y)
    EOR A,#$00
    EOR A,$00
    EOR A,$00+X
    EOR A,$0000
    EOR A,$0000+X
    EOR A,$0000+Y
    EOR A,($00)+Y
    EOR A,($00+X)
    EOR A,(X)
    EOR1 C,$0000

    ASL $00
    ASL $00+X
    ASL $0000
    ASL A
    LSR $00
    LSR $00+X
    LSR $0000
    LSR A

    ROL $00
    ROL $00+X
    ROL $0000
    ROL A
    ROR $00
    ROR $00+X
    ROR $0000
    ROR A

    CLR0 $00
    CLR1 $00
    CLR2 $00
    CLR3 $00
    CLR4 $00
    CLR5 $00
    CLR6 $00
    CLR7 $00
    
    SET0 $00
    SET1 $00
    SET2 $00
    SET3 $00
    SET4 $00
    SET5 $00
    SET6 $00
    SET7 $00

    XCN A

    NOT1 $0000

    TCLR $0000,a
    TSET $0000,a

; status
; Scope: keyword.asar.mnemonics.status.spc700

    CLRC
    CLRP
    CLRV
    SETC
    SETP
    NOTC

; stack
; Scope: keyword.asar.mnemonics.stack.spc700

    POP A
    POP P
    POP X
    POP Y
    PUSH A
    PUSH P
    PUSH X
    PUSH Y

; compare
; Scope: keyword.asar.mnemonics.compare

    CMP $00,#$00
    CMP $00,$00
    CMP (X),(Y)
    CMP A,#$00
    CMP A,$00
    CMP A,$00+X
    CMP A,$0000
    CMP A,$0000+X
    CMP A,$0000+Y
    CMP A,($00)+Y
    CMP A,($00+X)
    CMP A,(X)
    CMP X,#$00
    CMP X,$00
    CMP X,$0000
    CMP Y,#$00
    CMP Y,$00
    CMP Y,$0000
    CMPW YA,$00

; inc/dec
; Scope: keyword.asar.mnemonics.math.single
    
    DEC $00
    DEC $00+X
    DEC $0000
    DEC A
    DEC X
    DEC Y
    DECW $00
    INC $00
    INC $00+X
    INC $0000
    INC A
    INC X
    INC Y
    INCW $00

; break
; Scope: keyword.asar.mnemonics.breakpoint
    BRK

; no op
; Scope: keyword.asar.mnemonics.nop
    NOP

; jump
; Scope: keyword.asar.mnemonics.jump
    JMP $0000
    JMP ($0000+X)

; Calls
; Scope: keyword.asar.mnemonics.calls.spc700

    PCALL $00
    CALL $0000
    TCALL 0
    TCALL 1
    TCALL 2
    TCALL 3
    TCALL 4
    TCALL 5
    TCALL 6
    TCALL 7
    TCALL 8
    TCALL 9
    TCALL 10
    TCALL 11
    TCALL 12
    TCALL 13
    TCALL 14
    TCALL 15

; Interrupts
; Scope: keyword.asar.mnemonics.interrupts.spc700
    DI
    EI


; Move instructions
; Scope: keyword.asar.mnemonics.move.spc700

    MOV $00+X,A
    MOV $00+X,Y
    MOV $00+Y,X
    MOV $00,#$00
    MOV $00,$00
    MOV $00,A
    MOV $00,X
    MOV $00,Y
    MOV $0000+X,A
    MOV $0000+Y,A
    MOV $0000,A
    MOV $0000,X
    MOV $0000,Y
    MOV ($00)+Y,A
    MOV ($00+X),A
    MOV (X),A
    MOV (X+),A
    MOV A,#$00
    MOV A,$00
    MOV A,$00+X
    MOV A,$0000
    MOV A,$0000+X
    MOV A,$0000+Y
    MOV A,($00)+Y
    MOV A,($00+X)
    MOV A,(X)
    MOV A,(X+)
    MOV A,X
    MOV A,Y
    MOV SP,X
    MOV X,#$00
    MOV X,$00
    MOV X,$00+Y
    MOV X,$0000
    MOV X,A
    MOV X,SP
    MOV Y,#$00
    MOV Y,$00
    MOV Y,$00+X
    MOV Y,$0000
    MOV Y,A
    MOV1 $0000,C
    MOV1 C,$0000
    MOVW $00,YA
    MOVW YA,$00

; return
; Scope: keyword.asar.mnemonics.return
    RET
    RETI

; Stop
; Scope: keyword.asar.mnemonics.return.stop
    STOP

; Sleep
; Scope: keyword.asar.mnemonics.return.sleep
    SLEEP
