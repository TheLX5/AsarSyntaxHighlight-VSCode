### Version 0.0.2
Changes:
* Macro calls and declarations have different scopes
* Replaced the arch specific `.tmLanguage` files with `mnemonics.tmLanguage`
* Defines and macro arguments are properly highlighted inside strings
* Mnemonics no longer highlight text if said text is a label reference
* Added a bunch of new scopes for 65c816 mnemonics. Check `highlight_test.asm`
* `INC`, `DEC`, `ASL`, `LSR`, `ROL` and `ROR` no longer treat their argument as label references if it's a single A, X or Y letter
* Made possible to differentiate between values and addresses in most cases
* Implemented the `rep` command

Color schemes changes:
* Made a new `default.json` file with a different color scheme
* Included `nordish.json` from Underrout

Scopes (changes & additions):
* `constant.asar.numeric.hexvalue` -> `constant.asar.numeric.hex`
* `constant.asar.numeric.hex.addr` (NEW!)
* `constant.asar.numeric.hex.value` (NEW!)
* `constant.asar.numeric.decvalue` -> `constant.asar.numeric.dec`
* `constant.asar.numeric.dec.addr` (NEW!)
* `constant.asar.numeric.dec.value` (NEW!)
* `constant.asar.numeric.binvalue` -> `constant.asar.numeric.bin`
* `constant.asar.numeric.bin.addr` (NEW!)
* `constant.asar.numeric.bin.value` (NEW!)
* `keyword.asar.macro.call` (NEW!)
* `keyword.asar.macro.call.name` (NEW!)
* `keyword.asar.mnemonics.65c816` -> `keyword.asar.mnemonics`
* `keyword.asar.mnemonics.65c816.length` -> `keyword.asar.mnemonics.length`
* `keyword.asar.mnemonics.accum` (NEW!)
* `keyword.asar.mnemonics.accum.load` (NEW!)
* `keyword.asar.mnemonics.accum.store` (NEW!)
* `keyword.asar.mnemonics.math` (NEW!)
* `keyword.asar.mnemonics.math.single` (NEW!)
* `keyword.asar.mnemonics.bitwise` (NEW!)
* `keyword.asar.mnemonics.compare` (NEW!)
* `keyword.asar.mnemonics.65c816.branch` -> `keyword.asar.mnemonics.branch`
* `keyword.asar.mnemonics.jump` (NEW!)
* `keyword.asar.mnemonics.stack.push` (NEW!)
* `keyword.asar.mnemonics.stack.pull` (NEW!)
* `keyword.asar.mnemonics.stack.value` (NEW!)
* `keyword.asar.mnemonics.status.carry` (NEW!)
* `keyword.asar.mnemonics.status.decimal` (NEW!)
* `keyword.asar.mnemonics.status.interrupt` (NEW!)
* `keyword.asar.mnemonics.status.overflow` (NEW!)
* `keyword.asar.mnemonics.65c816.status.repsep` -> `keyword.asar.mnemonics.status.repsep`
* `keyword.asar.mnemonics.65c816.return` -> `keyword.asar.mnemonics.return`
* `keyword.asar.mnemonics.65c816.breakpoint` -> `keyword.asar.mnemonics.breakpoint`
* `keyword.asar.mnemonics.65c816.block` -> `keyword.asar.mnemonics.block`
* `keyword.asar.mnemonics.transfer` (NEW!)
* `keyword.asar.mnemonics.nop` (NEW!)
* `keyword.asar.mnemonics.wait` (NEW!)
* `keyword.asar.mnemonics.swap` (NEW!)

### Version 0.0.1
* Initial release
