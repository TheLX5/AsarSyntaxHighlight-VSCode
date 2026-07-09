# Version 1.0.3
- Now supports asar 1.91

# Version 1.0.2
- Fixed macro labels not being captured in a scope if they're missing : at the end

# Version 1.0.1
- Fixed an issue with opcode lengths not being captured in a scope in some math and bitwise mnemonics
- Anonymous label references now work properly if there's any character after other than a `;` and a new line
- `mov` and `movw` mnemonics now have their lengths captured in a different scope

# Version 1.0.0
- Fixed a limitation from label references being converted to indexes if they were right before a comma
- Added support for anonymous labels:
  - Forward anonymous label (`label.asar.anonymous.forward`)
  - Forward anonymous label reference (`label.asar.anonymous.forward.reference`)
  - Backward anonymous label (`label.asar.anonymous.backward`)
  - Backward anonymous label reference (`label.asar.anonymous.backward.reference`)
- Added support for spc700 mnemonics. Scopes:
  - `keyword.asar.mnemonics.math.spc700`
  - `keyword.asar.mnemonics.branch.spc700`
  - `keyword.asar.mnemonics.bitwise.spc700`
  - `keyword.asar.mnemonics.status.spc700`
  - `keyword.asar.mnemonics.stack.spc700`
  - `keyword.asar.mnemonics.calls.spc700`
  - `keyword.asar.mnemonics.interrupts.spc700`
  - `keyword.asar.mnemonics.move.spc700`
  - `keyword.asar.mnemonics.return.stop`
  - `keyword.asar.mnemonics.return.sleep`
- Added support for GSU mnemonics. Scopes:
  - `keyword.asar.mnemonics.math.gsu`
  - `keyword.asar.mnemonics.bitwise.gsu`
  - `keyword.asar.mnemonics.branch.gsu`
  - `keyword.asar.mnemonics.move.gsu`
  - `keyword.asar.mnemonics.jump.gsu`
  - `keyword.asar.mnemonics.return.gsu`
  - `keyword.asar.mnemonics.return.stop`
  - `keyword.asar.mnemonics.gsu.regops`
  - `keyword.asar.mnemonics.gsu.regwrite`
  - `keyword.asar.mnemonics.gsu.ram`
  - `keyword.asar.mnemonics.gsu.bytemod`
  - `keyword.asar.mnemonics.gsu.plot`
  - `keyword.asar.mnemonics.gsu.bank`
  - `keyword.asar.mnemonics.gsu.alt`
  - `keyword.asar.mnemonics.gsu.cache`
  - `keyword.asar.mnemonics.gsu.loop`
- Added support for the bank() and datasize() functions (`keyword.asar.functions.data`)
- Added support for the global directive for labels in namespaces (`keyword.asar.namespace.global`)
- Added support for the # prefix in label declarations (`label.asar.label.hierarchy`)
- (Atari2.0) Added support for variadic macros (`keyword.asar.macro.variadic`)
- (Atari2.0) Macro arguments have their own scope (`keyword.asar.macro.argumentslist`)
- The letters after certain opcodes such as `INC A` now have their own scope (`keyword.asar.mnemonics.letters`)
- Warn ID from warnings enable/disable is now properly captured in a scope
- Added sfxrom directive to `keyword.asar.mapping`
- Namespaces prefixes are now properly captured, they also have their own child scope (`keyword.asar.namespace.name`)
- Namespaces without a prefix or the directive "off" aren't captured in `keyword.asar.namespace`
- Removed `label.asar.label.macro`. It was causing issues with macro sublabels

# Version 0.0.2
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

# Version 0.0.1
* Initial release
