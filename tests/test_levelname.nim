import std/[logging,unittest]
import colored_logger

test "levelname":
  let logger = newColoredLogger(fmtStr=coolerFmtStr)
  addHandler(logger)

  debug "Debugging !"
  info "Hello There !"
  notice "Let's notice this !"
  warn "Careful here !"
  error "Error here please check !"
  fatal "Bye :("
