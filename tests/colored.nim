# This is just an example to get you started. You may wish to put all of your
# tests into a single file, or separate them into multiple `test1`, `test2`
# etc. files (better names are recommended, just make sure the name starts with
# the letter 't').
#
# To run these tests, simply execute `nimble test`.

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
