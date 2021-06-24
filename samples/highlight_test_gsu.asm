;################################################
;# SUPER FX/GSU MNEMONICS

; Math
; Scope: keyword.asar.mnemonics.math
; Scope: keyword.asar.mnemonics.math.gsu

    ADC #0 : ADD #15
    ADC R0 : ADD R15
    ADD #0 : ADD #15
    ADD R0 : ADD R15
    SBC R0 : SBC R15
    SUB #0 : SUB #15
    SUB R0 : SUB R15

    MULT #0 : MULT #15
    MULT R0 : MULT R15
    UMULT #0 : UMULT #15
    UMULT R0 : UMULT R15
    DIV2 : LMULT : FMULT

; Bits
; Scope: keyword.asar.mnemonics.bitwise
; Scope: keyword.asar.mnemonics.bitwise.gsu

    AND #1 : AND #15
    AND R1 : AND R15
    OR #1 : OR #15
    OR R1 : OR R15
    XOR #1 : XOR #15
    XOR R1 : XOR R15
    BIC #1 : BIC #15
    BIC R1 : BIC R15

    ASR : LSR : ROL : ROR

    NOT

; Branches
; Scope: keyword.asar.mnemonics.branch
; Scope: keyword.asar.mnemonics.branch.gsu
    
    BCC $00 : BCS $00 : BEQ $00 : BMI $00 : BNE $00 : BPL $00 : BRA $00 : BVC $00 : BVS $00
    BGE $00 : BLT $00

; Move
; Scope: keyword.asar.mnemonics.move.gsu

    MOVE ($00),R0
    MOVE R0,#$00
    MOVE R0,($00)
    MOVE R0,R0
    MOVEB (R0),R0
    MOVEB R0,(R0)
    MOVES R0,R0
    MOVEW (R0),R0
    MOVEW R0,(R0)

; Reg manipulation
; Scope: keyword.asar.mnemonics.gsu.regops

    FROM R0 : FROM R15
    TO R0 : TO R15
    WITH R0 : WITH R15

; Jumps
; Scope: keyword.asar.mnemonics.jump
; Scope: keyword.asar.mnemonics.jump.gsu

    JMP R8 : JMP R13
    LJMP R8 : LJMP R13

; INC/DEC
; Scope: keyword.asar.mnemonics.math.single
    
    DEC R0 : DEC R14
    INC R0 : INC R14

; Compare
; Scope: keyword.asar.mnemonics.compare
    
    CMP R0 : CMP R15

; Write to GSU Regs
; Scope: keyword.asar.mnemonics.gsu.regwrite

    IBT R0,#$00 : IBT R15,#$00
    IWT R0,#0000 : IWT R15,#0000

; RAM Operations
; Scope: keyword.asar.mnemonics.gsu.ram

    LDB (R0) : LDB (R11)
    LDW (R0) : LDW (R11)
    STB (R0) : STB (R11)
    STW (R0) : STW (R11)
        
    LM R0,($0000) : LM R15,($0000)
    LMS R0,($00) : LMS R15,($00)
    SM ($0000),R0 : SM ($0000),R15
    SMS ($00),R0 : SMS ($00),R15

    LEA R0,$0000

    SBK

    GETB : GETBH : GETBL : GETBS
    GETC

; Reg bytes modifications
; Scope: keyword.asar.mnemonics.gsu.bytemod

    LOB : HIB : SWAP
    MERGE
    SEX
    
; Return address
; Scope: keyword.asar.mnemonics.return.gsu

    LINK #1 : LINK #4
    
; Stop
; Scope: keyword.asar.mnemonics.return.stop

    STOP

; Plot related instructions
; Scope: keyword.asar.mnemonics.gsu.plot

    COLOR : RPIX : PLOT : CMODE

; Bank related instructions
; Scope: keyword.asar.mnemonics.gsu.bank

    RAMB : ROMB

; Set GSU Modes
; Scope: keyword.asar.mnemonics.gsu.alt

    ALT1 : ALT2 : ALT3

; Set cache base register
; Scope: keyword.asar.mnemonics.gsu.cache

    CACHE

; Set Loop
; Scope: keyword.asar.mnemonics.gsu.loop

    LOOP
    
; No operation
; Scope: keyword.asar.mnemonics.nop
    
    NOP