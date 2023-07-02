# colored_logger

A simple colored logger from std/logging

## Install

`nimble install colored_logger`

## Example

```nim
import std/logging
import colored_logger

let logger = newColoredLogger(fmtStr="[$time] - $levelname: ", useStderr = true)
addHandler(logger)

debug "Debugging !"
info "Hello There !"
notice "Let's notice this !"
warn "Careful here !"
error "Error here please check !"
fatal "Bye :("
```
