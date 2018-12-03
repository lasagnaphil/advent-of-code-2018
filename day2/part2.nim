var ids = newSeq[string]()
var idLen = 0

proc isSimilar(id1: string, id2: string): bool =
  var diffCount = 0
  for i in 0..<len(id1):
    if id1[i] != id2[i]:
      diffCount += 1
      if diffCount > 1:
        return false
  return diffCount == 1

for id in lines "input":
  for otherId in ids:
    if isSimilar(id, otherId):
      echo id
      echo otherId
      quit(0)
  ids.add(id)
