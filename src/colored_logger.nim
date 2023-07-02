import std/[logging, strutils, terminal, colors]

type ColoredConsoleLogger = ref object of ConsoleLogger

proc newColoredLogger*(threshold = lvlAll, fmtStr = defaultFmtStr, useStderr = false): ColoredConsoleLogger =
  ColoredConsoleLogger(levelThreshold: threshold, fmtStr: fmtStr, useStderr: useStderr)

#                                         ALL       DEBUG     INFO     NOTICE   WARN       ERROR   FATAL     NONE
const LevelColours: array[Level, Color] = [colWhite, colWhite, colCyan, colLime, colOrange, colRed, colDarkRed, colWhite]

method log*(logger: ColoredConsoleLogger, level: Level, args: varargs[string, `$`]) =
  var
    line = substituteLog(logger.fmtStr, level, args)
    color = LevelColours[level]
    lvlname = LevelNames[level]
  line = line.replace(lvlname, ansiForegroundColorCode(color) & lvlname & ansiForegroundColorCode(fgDefault))
  if logger.useStderr: stderr.writeLine line
  else: stdout.writeLine line
