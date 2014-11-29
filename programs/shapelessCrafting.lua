-- Config file:
  -- line 1: the inputs, as a comma separated list
  -- line 2: the ouput
-- Setup:
  -- If you need an item for the shapeless crafting, place in bottom right corner (slot 16)
-- Assumptions
  -- shapeless crafting
  -- there is only on item needed for each item type

config = fs.open('config','r')
inputs = config.readLine()
output = config.readLine()

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
    turtle.suckUp(1)
  elseif side == "bottom" then
    turtle.suckDown(1)
  else
    turnTo(side)
    turtle.suck(1)
    returnFrom(side)
  end

  t = { up = 2, down = 3, left = 4, right = 5, top = 6, bottom = 7 }
  turtle.transferTo(t[side])
end

function gaterMaterials(inputs)
  for side in inputs.gmatch(str, '([^,]+)') do
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
