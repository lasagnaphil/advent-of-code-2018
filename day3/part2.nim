import re
import strutils
import tables
import strformat
import sequtils

type
  Fabric = array[1000000, int]
  Order = tuple[edgeX: int, edgeY: int, sizeX: int, sizeY: int]
  Orders = array[1..1341, Order]

proc addRect(fabric: var Fabric, order: Order) = 
  let (edgeX, edgeY, sizeX, sizeY) = order
  for j in edgeY..<(edgeY + sizeY):
    for i in edgeX..<(edgeX + sizeX):
      fabric[j * 1000 + i] += 1

proc isRectOverlapping(fabric: Fabric, order: Order): bool =
  let (edgeX, edgeY, sizeX, sizeY) = order
  for j in edgeY..<(edgeY + sizeY):
    for i in edgeX..<(edgeX + sizeX):
      if fabric[j * 1000 + i] > 1:
        return false
  return true

var fabric: Fabric
var orders: Orders

var regex = re"#\d+ @ (\d+),(\d+): (\d+)x(\d+)"
var idx = 1
for line in lines "input":
  var matches: array[4, string]
  if line.match(regex, matches):
    let m = map(matches, parseInt)
    orders[idx] = (m[0], m[1], m[2], m[3])
    idx += 1
  else:
    echo "Regex match invalid"
    quit(1)

for order in orders:
  addRect(fabric, order)

var overlapCount = 0
for j in 0..<1000:
  for i in 0..<1000:
    if fabric[j*1000 + i] >= 2:
      overlapCount += 1

echo overlapCount

for i in 1..1341:
  if isRectOverlapping(fabric, orders[i]):
    echo &"Found ID: {i}"
