# Package

version       = "0.1.0"
author        = "kkrriisssshh"
description   = "simple crackme in nim"
license       = "GPL-3.0-or-later"
srcDir        = "src"
bin           = @["nim_crackme"]
binDir        = "build"

# Dependencies

requires "nimcrypto"
requires "nigui"
requires "nim >= 2.0.4"
