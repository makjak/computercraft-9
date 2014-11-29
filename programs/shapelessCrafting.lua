-- Config file:
  -- line 1: the inputs, as a comma separated list
  -- line 2: the ouput
-- Setup:
  -- If you need an item for the shapeless crafting, trial and error will let you know where it goes
-- Assumptions
  -- shapeless crafting
  -- there is only on item needed for each item type


print "WARNING: PROGRAM STILL IN PROGRESS"

config = fs.open('config','r')
inputs = config.readLine()
print("Inputs: "..inputs)
output = config.readLine()
print("Output: "..output)

function turnTo(side)
  if side == "right" then
    turtle.turnRight()
  elseif side == "left" then
    turtle.turnLeft()
  elseif side == "back" then
    turtle.turnLeft()
    turtle.turnLeft()
  end
end

function returnFrom(side)
  if side == "right" then
    turtle.turnLeft()
  elseif side == "left" then
    turtle.turnRight()
  elseif side == "back" then
    turtle.turnRight()
    turtle.turnRight()
  end
end

function gatherFor(side)
  if side == "top" then
    success = turtle.suckUp(1)
  elseif side == "bottom" then
    success = turtle.suckDown(1)
  else
    turnTo(side)
    success = turtle.suck(1)
    returnFrom(side)
  end

  return success
end

function gatherMaterials(inputs)
  for side in string.gmatch(inputs, '([^,]+)') do
    success = false
    while not success do
      success = gatherFor(side)
    end
  end
end

function ouputProduct(side)
  if side == "top" then
    turtle.dropUp()
  elseif side == "bottom" then
    turtle.dropDown()
  else
    turnTo(side)
    turtle.drop()
    returnFrom(side)
  end
end

while true do
  gatherMaterials(inputs)
  turtle.craft()
  ouputProduct(output)
end
