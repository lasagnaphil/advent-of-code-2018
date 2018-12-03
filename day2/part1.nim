import tables

var doubleCount = 0
var tripleCount = 0

for line in lines "input":
  var freq = newCountTable[char]()
  for c in line:
    freq.inc(c)
  var doubleCounted = false
  var tripleCounted = false
  for k, v in freq:
    if v == 2 and not doubleCounted:
      doubleCount += 1
      doubleCounted = true
    elif v == 3 and not tripleCounted:
      tripleCount += 1
      tripleCounted = true

echo doubleCount * tripleCount
