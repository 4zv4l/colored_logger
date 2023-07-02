import std/[logging, strutils, terminal, colors]

type ColoredConsoleLogger = ref object of ConsoleLogger

proc newColoredLogger*(threshold = lvlAll, fmtStr = defaultFmtStr, useStderr = false): ColoredConsoleLogger =
  ColoredConsoleLogger(levelThreshold: threshold, fmtStr: fmtStr, useStderr: useStderr)

#                                         ALL       DEBUG     INFO     NOTICE   WARN       ERROR   FATAL     NONE
const LevelColours: array[Level, Color] = [colWhite, colWhite, colDarkCyan, colDarkOliveGreen, colOrange, colRed, colDarkRed, colWhite]

method log*(logger: ColoredConsoleLogger, level: Level, args: varargs[string, `$`]) =
  let
    color = ansiForegroundColorCode(LevelColours[level])
    cdef = ansiForegroundColorCode(fgDefault)
    lvlname = LevelNames[level]
    spaces = " ".repeat("NOTICE".len - lvlname.len)
    fmt = logger.fmtStr.multiReplace(("$levelname", color & "$levelname" & cdef & spaces), ("$levelid", color & "$levelid" & cdef))
    line = substituteLog(fmt, level, args)
  if logger.useStderr: stderr.writeLine line
  else: stdout.writeLine line
