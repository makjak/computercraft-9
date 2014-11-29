os.loadAPI('scaffold')
scaffold.loadAPI('inventory')

function mineForward(debug)
  if debug then print("mining forward") end
  turtle.dig()
  if inventory.sort(debug) then
    if debug then print("sorted, moving forward") end
    turtle.forward()
    return true
  else
    return false
  end
end

function mineUp(debug)
  if debug then print("mining up") end
  turtle.digUp()
  haveRoom = inventory.sort(debug)
  if turtle.detectUp() and haveRoom then
    if debug then print("*&@)$ falling blocks") end
    mineUp()
  end
  return haveRoom
end

function mineDown(debug)
  if debug then print("mining down") end
  turtle.digDown()
  haveRoom = inventory.sort(debug)
  return haveRoom
end

function placeTorch(i, debug)
  if debug then print("placing torch") end
  if i%10 == 0 then
    turtle.select(16)
    turtle.placeDown()
    turtle.select(1)
  end

  return (turtle.getItemCount(16) > 0)
end

function goBack(i, debug)
  if debug then print("going back") end
  scaffold.turnAround()
  while i > 0 do
    turtle.forward()
    i = i - 1
  end
  if debug then scaffold.turnAround() end
end

function tunnelToFull(i, debug)
  turtle.select(1)
  if mineForward(debug) then
    i = i + 1
    if mineUp(debug) then
      if mineDown(debug) then
        torches = placeTorch(i, debug)
        if torches then
          if turtle.getFuelLevel() > i then
            tunnelToFull(i, debug)
          else
            print("Low On Fuel")
            goBack(i, debug)
          end
        else
          print("Out of Torches")
          goBack(i, debug)
        end
      else
        if debug then print "Could not mine down" end
        goBack(i, debug)
      end
    else
      if debug then print "Could not mine up" end
      goBack(i, debug)
    end
  else
    if debug then print "Could not mine forward" end
    goBack(i, debug)
  end
end
