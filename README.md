# colored_logger

A simple colored logger from std/logging

## Install

`nimble install colored_logger`

## Example

```nim
import std/[logging]
import colored_logger

let logger = newColoredLogger(fmtStr="$datetime $levelname [$appname] ")
addHandler(logger)

debug "Debugging !"
info "Hello There !"
notice "Let's notice this !"
warn "Careful here !"
error "Error here please check !"
fatal "Bye :("
```

## Look

![image](https://github.com/4zv4l/colored_logger/assets/46655455/90c26501-0a22-4642-b7ab-8bacfc3ad815)
