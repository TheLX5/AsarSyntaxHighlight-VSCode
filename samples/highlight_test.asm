;################################################
;# Sample file for asar syntax highlight v1.0
;# 
;# NOTES:
;# - Every mnemonic, directive and function is case-insensitive
;# - Scopes used for highlights are documented alongside each highlight
;# - Specific notes, missing highlights and limitations are stated in each highlight
;# - Some scopes have children scopes that you can watch by using the tool to watch scopes in VSCode
;#   In the command palette  (Ctrl+Shift+P on Windows) write:
;#   Developer: Inspect Editor Tokens and Scopes


;################################################
;# CONSTANTS

; Values and addresses are constants, the only way to differentiate them is by
; checking if they're alone, after an asar directive or after any operator
; Every Address/Value test under the hexadecimal section applies to Decimal and Binary as well
; SPC700 and GSU opcodes aren't guaranteed to work fine with this.

; Hex constants
; Scope: constant.asar.numeric.hex.value
; Hex addresses
; Scope: constant.asar.numeric.hex.addr

$00                 ; Value
$4302               ; Value
$FFFFFF             ; Value

lda #$00            ; Value
lda #$0000          ; Value
lda $00             ; Address
lda $0000           ; Address
lda ($00)           ; Address
lda #($00)          ; Value
lda [$00]           ; Address
!define = $00       ; Value
if !define > $00    ; Value
db $00              ; Value
dl $000000,$0FF000  ; Values
lda.b ($00+$00)     ; Address+Value
lda ($00,s),y       ; Address
bra $00             ; Value


; Decimal constants
; Scope: constant.asar.numeric.dec.value
; Decimal constants
; Scope: constant.asar.numeric.dec.addr

0
165
29478201
000F                ; Invalid

; Binary values
; Scope: constant.asar.numeric.bin.value
; Binary values
; Scope: constant.asar.numeric.bin.addr

%00010111
%1111
%00002              ; Invalid

;################################################
;# STRINGS

; String with single quote
; Scope: string.asar.quoted.single

'single quote'

; String with double quotes
; Scope: string.asar.quoted.double

"double quote"

;################################################
;# COMMENTS

; Single line comment
; Scope: comment.asar.line

; this is a comment... like everything else

;################################################
;# COMMAND CONCATENATE

; Command concatenate
; Scope: keyword.asar.command.concatenate

0 : %01 : $0E

;################################################
;# OPERATORS

; While asar doesn't support spaces between operators in most cases
; the highlighter will still highlight them in any case

; Some operators were ommited since they're addressed in a way more suitable area

; Arithmetic operators
; Scope: keyword.asar.operator.arithmetic

0+1             ; Addition
4-$F            ; Substraction
$FE*%01         ; Multiplication
64/16           ; Division
64%$10          ; Modulo
2**8            ; Exponential

; Bitwise operators
; Scope: keyword.asar.operator.bitwise

2<<$A           ; Bit shift left
$1000>>12       ; Bit shift right
$F|%10000       ; OR
$1F&8           ; AND
~5              ; NOT
%1110^%0001     ; XOR

; Logical operators
; Scope: keyword.asar.operator.logical

; Do note that asar requires logical operators have a space before and after them

1 == 1          ; Equal
1 != 1          ; Not equal
1 >= 1          ; Greater or equal
1 <= 1          ; Less or equal
1 > 1           ; Greater
1 < 1           ; Less
1 && 1          ; AND
1 || 1          ; OR

1==1            ; Invalid
1&&1            ; Also invalid

; Brackets
; Scope: keyword.asar.operator.brackets

; It won't match brackets, but it will color them at the very least

(124)
($20)
(%00001) 
(2+3)*64
[$0000]

; Misc operators
; Scope: keyword.asar.operator

,               ; Separates values and other things
#               ; Defines a constant
\               ; Multiline operator

;################################################
;# DEFINES

; Defines
; Scope: keyword.asar.define

!define         ; Define
!{define}EE     ; Nested define

; Assignment operators
; Scope: keyword.asar.operator.assignment
 
!define = 0
!define ?= $20
!define += !i+24
!define := !define+%001
!define #= !define+1

label = $0000   ; Also supported on labels!

;################################################
;# LABELS & SUBLABELS

; Labels
; Scope: label.asar.label

label:          ; Label declaration

?label:         ; Macro label declaration

#label:         ; Label that doesn't mess up hierarchy
#?label:        ; Same thing, but in a macro.
                ; Also it's invalid and I don't care enough to make
                ; the highlight not work on this case

label           ; Invalid declaration.

; Sublabels
; Scope: label.asar.sublabel

.sublabel       ; Sublabel declaration
.sublabel:      ; Also accepts : at the end.
?.sublabel      ; And accepts macro sublabels
#.sublabel      ; ... and those kind of sublabels
#?.sublabel     ; Probably not a good idea to use this

; Anonymous labels
; Scope: label.asar.anonymous.forward
; Scope: label.asar.anonymous.backward

+
?+
-
?-
++++++
------
?++
?---

; Label references
; Scope: label.asar.label.reference

lda label       ; This is a label reference, to spot labels without any issue.
jsl routine
dw value
lda #(label+4)>>8

; Sublabel references
; Scope: label.asar.label.reference

lda .sublabel   ; This is a sublabel reference
jsr .subroutine
dw .value
lda #(.sublabel+4)>>8

dl label,.sublabel
dl .sublabel,label

; Anonymous label references
; Scope: label.asar.anonymous.forward.reference
; Scope: label.asar.anonymous.backward.reference

bra +
bra -
bra ?+
bra ?-
lda +
lda 1+1         ; doesn't break math
lda label+3     ; not even with other label references
lda +-1         ; this cursed setup also works
db -+1          ; even the other way around

;################################################
;# 65c816 MNEMONICS

; Every mnemonic should be supported out of the box without issues
; Any other text (constant, label, math, etc) is handled by something else 
; and are ommited from this test area

lda #$00
lda #$0000
lda $00
lda $0000
lda $000000
lda ($00)
lda [$00]

; Mnemonic length and indexes are also supported for every opcode that supports them

; Mnemonic length
; Scope: keyword.asar.mnemonics.65c816.length

lda.b #%0001
lda.w #$00
lda.l 4823921
lda.b !define

; Mnemonic index
; Scope: keyword.asar.indexes

lda $00,s
lda $00,x
lda $0000,x
lda $0000,y
lda $000000,x
lda ($00),y
lda ($00,s),y
lda ($00,x)
lda [$00],y
lda label,x
lda .sublabel,y
lda !define,s
lda $00,sx          ; invalid

; 65c816's mnemonics
; Scope: keyword.asar.mnemonics.accum

LDA : LDX : LDY
STA : STX : STY : STZ

; 65c816's math mnemonics
; Scope: keyword.asar.mnemonics.math

ADC : SBC
INC : INX : INY
DEC : DEX : DEY

; 65c816's bitwise mnemonics
; Scope: keyword.asar.mnemonics.bitwise

AND : ORA : EOR
ASL : LSR : ROL : ROR
TSB : TRB
BIT 

; 65c816's comparison mnemonics
; Scope: keyword.asar.mnemonics.compare

CMP : CPX : CPY

; 65c816's branch mnemonics
; Scope: keyword.asar.mnemonics.branch

BRA : BRL : BEQ : BNE : BCS : BCC : BMI : BPL : BVC : BVS

; 65c816's jump mnemonics
; Scope: keyword.asar.mnemonics.jump

JSR : JMP : JSL : JML

; 65c816's return mnemonics
; Scope: keyword.asar.mnemonics.return

RTS : RTL : RTI 

; 65c816's status modifier mnemonics
; Scope: keyword.asar.mnemonics.status

CLC : CLD : CLI : CLV : SEC : SED : SEI

REP # : SEP #           ; REP and SEP require # in order to work here
                        ; It's a highlight thing.

; 65c816's stack manipulation mnemonics
; Scope: keyword.asar.mnemonics.stack

PHA : PHX : PHY : PHP : PHD : PHB : PHK
PLA : PLX : PLY : PLP : PLD : PLB 
PEA : PEI : PER

; 65c816's transfer mnemonics
; Scope: keyword.asar.mnemonics.transfer

TAX : TAY : TXA : TYA : TXY : TYX : TCD : TDC : TSC : TSX : TXS

; 65c816's no operation mnemonic
; Scope: keyword.asar.mnemonics.nop

NOP

; 65c816's swap operation mnemonics
; Scope: keyword.asar.mnemonics.swap

XBA : XCE

; 65c816's block move mnemonics
; Scope: keyword.asar.mnemonics.block

MVN : MVP

; 65c816's wait for interrupt mnemonic
; Scope: keyword.asar.mnemonics.wait

WAI 

; 65c816's misc mnemonics, useful for breakpoints
; Scope: keyword.asar.mnemonics.breakpoint

BRK : COP : WDM : STP

;################################################
;# SPC700 MNEMONICS

; Check highlight_test_spc700.asm!

;################################################
;# SUPER FX/GSU MNEMONICS

; Check highlight_test_gsu.asm!

;################################################
;# CONDITIONALS

; IF/WHILE/FOR/ELSE/ELSEIF conditionals
; Scope: keyword.asar.conditionals

; if, elseif, else and endif tests

if !define == 0
    lda.b #label
elseif !define > $10
    lda.w #label
else 
    lda #$00
endif

; while test

!i = 0
while !i < 10
    lda.b #!i
    sta $00,x
endwhile

; for test

for i = 1..5
    lda.b #!i
    sta $00+!i
endfor

for i = 0..10 : NOP : endfor

;################################################
;# BINARY DATA

; Raw data
; Scope: keyword.asar.binary.raw

db 123                  ; Byte
dw !define              ; Word
dl math                 ; Long
dd $FF000000            ; Dword

; Tables
; Scope: keyword.asar.binary.table

; The ",ltr" and ",rtl" commands will be affected by the scope!

table "file.txt"        ; Table
table "file.txt", ltr   ; Table, left to right
table "file.txt", rtl   ; Table, right to left

pulltable
cleartable

; Fill area with bytes
; Scope: keyword.asar.binary.fill

fillbyte $FF
fillword $DEAD
filllong $0D9040 
filldword $DEADBEEF
fill 4
fill align 8 offset 2
fill align $08 offset $02

; Pad area with bytes
; Scope: keyword.asar.binary.pad

padbyte $FF
padword $DEAD
padlong $0D9040 
paddword $DEADBEEF
pad $01A005

; Include binary data
; Scope: keyword.asar.binary.incbin

; Most of the stuff here is explained in other tests, except the "->" operator

incbin "file.bin"
incbin "file.bin":9-12
incbin "file.bin":$9..$F

; Incbin operator
; Scope: keyword.asar.operator.incbin

incbin "file.bin" -> label 
incbin "file.bin" -> $01C000
incbin "file.bin":($1F-$C) -> $00A420

;################################################
;# INCLUDES

; Include source
; Scope: keyword.asar.include.incsrc
incsrc "file.asm"

; Include options
; Scope: keyword.asar.include.options
include
includefrom "file.asm"

includeonce

;################################################
;# MACROS


; Macro declaration
; Scope: keyword.asar.macro

; Macro declaration - Name
; Scope: keyword.asar.macro.name

; Macro declaration - Argument list
; Scope: keyword.asar.macro.argumentslist

; Macro declaration - Variadic list
; Scope: keyword.asar.macro.variadic

; Macro declaration ending
; Scope: keyword.asar.macro.end

; Macro argument usage
; Scope: keyword.asar.macro.args.usage

; Calling a macro
; Scope: keyword.asar.macro.call

; Called macro's name
; Scope: keyword.asar.macro.call.name


macro macro()                   ; Creating a macro
endmacro                        ; Finishing a macro

%macro()                        ; Calling a macro

macro macro(a, b, c)            ; Macro with arguments
    lda #<a>                    ; Mnemonics and everything else works fine
    sta.l <b>                   ; Macro arguments being used have a different scope
    stz.w (<a>+<c>)>>8
    bra ?macrolabel
    db <a>+$00
    db !define+<a>
    dw <b><<2+8, %0001
?macrolabel:                    ; Macro labes are supported as well, same scope as the regular labels
endmacro

%macro($0000, label, !define)   ; Calling a macro with arguments will use their respective scopes

macro macro(a, ...)             ; Variadic macros are also supported
	db sizeof(...), <...>, <...[0]>, <...[!i]>
endmacro

; Some other valid macros

macro   space()
macro		tab()
%  space()
%		tab()

; Invalid macros

macro                       ; Not fully defined macro
macro name                  ; This one is highlighted, but still invalid
macro name(                 ; Same here
macroname                   ; Not possible
macro name ()               ; Highlighted, but will not work

%macro ()                   ; Highlighted, but will not work

; Limitations

; Like in label's references, you can't have labels starting with a number
; Otherwise the highlighter goes wild

macro 0macro()              ; Bug
%0macro()                   ; Bug
macro _0macro()             ; Possible workaround
%_0macro()                  ; Possible workaround

;################################################
;# STRUCTS

; Structs
; Scope: keyword.asar.struct
; Structs have barebones support, they rely on label and sublabel references in order to display them

struct 
endstruct
struct objectlist $7E0100
    .type: skip 1
endstruct
struct properties extends objectlist
    .color: skip 1
endstruct

lda objectlist.posy.posx
lda.w objectlist[0].posx.posy

;################################################
;# REPEAT

; rep command
; Scope: keyword.asar.repeat

rep 10
rep $10
rep %10

;################################################
;# SPCBLOCK

; spcblock command
; Scope: keyword.asar.spcblock

spcblock $6000 nspc
    db $00,$01,$02
    exec_start:
    mov $33,#$44
endspcblock execute exec_start

;################################################
;# NAMESPACES

; Namespaces
; Scope: keyword.asar.namespace

; Namespace's prefix
; Scope: keyword.asar.namespace.name

namespace prefix
namespace off
namespace               ; Requires a prefix or the "off" directive!

pushns
pullns

; Global labels
; Scope: keyword.asar.namespace.global

global label:
global #label:

;################################################
;# FUNCTIONS

; Everything below + structs
; Scope: keyword.asar.functions

; Like everything else, values, defines, labels, etc are handled by other scopes

; Read SNES addresses functions
; Scope: keyword.asar.functions.read

read1($008000)
read2(32768)
read3(!define)
read4($008000)
lda.w read2(32768)
org read3(!define)
if read4($008000)

; Read files functions
; Scope: keyword.asar.functions.file

readfile1("file.bin", 0, $FFFFFFFF)
readfile2(!define, 0, $FFFFFFFF)
readfile1("another_file.bin", 0, $FFFFFFFF)
readfile1("final/file.bin", 0, $FFFFFFFF)

canread1($008000)
canread2(123942)
canread3($008000)
canread4($008000)
canread($018000, 4)

canreadfile1("file.bin", 0)
canreadfile1("file.bin", 16)
canreadfile1("file.bin", 24)
canreadfile1("file.bin", 32768)

filesize("file.bin")

getfilestatus("file.bin")

; Math functions
; Scope: keyword.asar.functions.math

sqrt(x)
sin(x)
cos(x)
tan(x)
asin(x)
acos(x)
atan(x)
arcsin(x)
arccos(x)
arctan(x)
log(x)
log2(x)
log10(x)

safediv(15, !define, 0)

min(64, $FF)
max(64, $FF)
clamp(!value, 64, $FF)

; Conditional functions
; Scope: keyword.asar.functions.conditional

select(!define, $F, 5)

not(!a)
not(6)

equal(value, comparand)
notequal(value, comparand)
less(value, comparand)
lessequal(value, comparand)
greater(value, comparand)
greaterequal(value, comparand)

; Bitwise functions
; Scope: keyword.asar.functions.bitwise

and(a, b)
or(a, b)
nand(a, b)
nor(a, b)
xor(a, b)

; Other math functions
; Scope: keyword.asar.functions.number

round(number, precision)
floor(number)
ceil(number)

; Check if define exists function
; Scope: keyword.asar.functions.define

defined(identifier)	

; Structs related functions
; Scope: keyword.asar.functions.struct

sizeof(identifier)
objectsize(identifier)


; String related functions
; Scope: keyword.asar.functions.string

stringsequal("yes", "no")
stringsequalnocase("yes", "perhaps")	

; Address related functions
; Scope: keyword.asar.functions.address

pc()
realbase()

; Address conversion functions
; Scope: keyword.asar.functions.convert

snestopc($018000)
pctosnes(32768)

; Data related functions
; Scope: keyword.asar.functions.data

datasize(label)

bank(!define)
bank(label)
bank(123456)
bank($F00000)

; Used defined functions
; Scope: keyword.asar.functions.user

; Note that every function WILL be highlighted if it has a leading "_" in them 
; since user defined functions can replace the original functions.

function read1(z) = _read1(z+$010000)

;################################################
;# TEXT OUTPUT

; Print directive
; Scope: keyword.asar.text

print 
print "string"

; Print functions
; Scope: keyword.asar.text.functions

print bin(2+2)
print hex(16)
print dec($0F)
print double(!x, 3)
print pc
print freespaceuse
print bytes

print "string", pc, dec($0F)

; Print functions options
; Scope: keyword.asar.text.options

reset                   ; Requires specifying "freespaceuse" or "bytes"
reset freespaceuse
reset bytes

; error/warn/assert directives
; Scope: keyword.asar.text.error

warn
warn "string"

error
error "string"

assert 
assert !define == $23, "string"
assert pc() <= $008123

;################################################
;# FREESPACE

; Freespace finder
; Scope: keyword.asar.freespace

freecode
freedata
freespace                       ; This one requires to specify "ram" or "noram"
freespace noram
freespace ram
freespace noram, ram            ; Only one of these are supported at the same time
freecode cleaned, static
freedata align
freedata $00                    ; Values are supported, but deprecated in favour of freespacebyte
freedata cleaned, $00
freespacebyte $00

; autoclean/prot directives
; Scope: keyword.asar.freespace.misc

autoclean 
autoclean jsl label
autoclean jml label_sublabel
autoclean dl another_label
autoclean $008000

prot
prot label
prot label, label2, label3

;################################################
;# PROGRAM COUNTER

; Program counter directives
; Scope: keyword.asar.programcounter

; Not sure if they should be separated in their own scopes...

org
org 0
org label
org $008000
org $008000|$800000
base 
base 0
base $7E0000
base off
base !ram_define
skip 
skip 12
skip align 16
skip align 16 offset 5
skip align $20 offset $17
warnpc
warnpc 1
warnpc $008000
bank auto
bank noassume
bank 128
bank $7E
bank !define
dpbase
dpbase $008000
dpbase 0
optimize dp 
optimize dp none
optimize dp ram 
optimize dp always 
optimize address
optimize address default
optimize address ram 
optimize address mirrors
pushpc
pullpc
pushbase
pullbase

;################################################
;# ROM MAPPING

; Possible ROM mappings
; Scope: keyword.asar.mapping

lorom
hirom
exlorom
exhirom
sa1rom
fullsa1rom
sfxrom
norom

;################################################
;# CODE ARCHITECTURE

; Mnemonic architecture
; Scope: keyword.asar.arch

arch 65816
arch spc700
arch spc700-inline          ; Invalid
arch superfx

arch spc70                  ; Incomplete, doesn't work
arch                        ; Must specify an architecture in order to work

;################################################
;# COMPATIBILITY

; Compatibility directives
; Scope: keyword.asar.compatibility

warn xkas on
warn xkas off 
math pri on 
math pri off 
math round on 
math round off 
namespace nested on 
namespace nested off

;@xkas                      ; No special highlight
@asar                       ; Highlight doesn't work
asar 1.91

;################################################
;# CHECKS

; Misc checks
; Scope: keyword.asar.checks

check title "string"
check bankcross on          ; Invalid
check bankcross off
check bankcross half
check bankcross full

;################################################
;# WARNINGS

; Warnings
; Scope: keyword.asar.warnings

warnings push 
warnings pull 
warnings                    ; Invalid

warnings enable Wfreespace_leaked
warnings disable Wfreespace_leaked
warnings enable freespace_leaked ; Invalid
