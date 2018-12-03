import re
import strutils

type
  Fabric = array[1000000, int]

proc addRect(fabric: var Fabric, edgeX: int, edgeY: int, sizeX: int, sizeY: int) = 
  for j in edgeY..<(edgeY + sizeY):
    for i in edgeX..<(edgeX + sizeX):
      fabric[j * 1000 + i] += 1

var fabric: Fabric
var regex = re"#\d+ @ (\d+),(\d+): (\d+)x(\d+)"
for line in lines "input":
  var matches: array[4, string]
  if line.match(regex, matches):
    addRect(fabric, parseInt(matches[0]), parseInt(matches[1]),
      parseInt(matches[2]), parseInt(matches[3]))
  else:
    echo "Regex match invalid"
    quit(1)

var overlapCount = 0
for j in 0..<1000:
  for i in 0..<1000:
    if fabric[j*1000 + i] >= 2:
      overlapCount += 1

echo overlapCount
