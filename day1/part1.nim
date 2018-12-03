import strutils

var freq = 0
for line in lines "input":
  let sign = line[0]
  let num = line[1..^1].parseInt()
  if sign == '+':
    freq += num
  elif sign == '-':
    freq -= num
echo freq

