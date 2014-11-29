-- 1. place a bucket in slot 1
-- 2. place turtle over infinite water source
-- 3. place chest in front of turtle
-- 4. profit

while true do
  turtle.placeDown()
  turtle.craft()
  turtle.select(2)
  turtle.drop()
  turtle.select(1)
end
