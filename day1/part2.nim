import strutils
import intsets

var curFreq = 0
var freqs = initIntSet()
freqs.incl(0)

var found = false

while not found:
  for line in lines "input":
    let sign = line[0]
    let num = line[1..^1].parseInt()

    if sign == '+':
      curFreq += num
    elif sign == '-':
      curFreq -= num

    if curFreq in freqs:
      echo curFreq
      found = true
      break
    else:
      freqs.incl(curFreq)
