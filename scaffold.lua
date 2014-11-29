print "Loaded scaffold v0.1"
-- Replace a program with the current version
-- Arguments
  -- filename: the program name
  -- pastebin: where to get the file from pastebin
function replacePastebin(pastebin, filename)
  if filename and pastebin then
    shell.run("rm", filename)
    shell.run("pastebin", "get", pastebin, filename)
    return true -- success
  else
    print "usage: replaceProgram(pastebin, filename)"
  end

  -- return false if anything went wrong
  return false

end

function replaceProgram(location, filename)
--shell.run("rm", "scaffold")
--local wget = http.get("https://raw.githubusercontent.com/n3rdgir1/computercraft/master/startup.lua")
--local scaffold = wget:readAll()
--local file = io.open("scaffold", "w")
--file:write(scaffold)
--file:close()

end

function startup()
  -- If this is a turtle, output the fuel level
  if turtle then
    write "Fuel level:"
    write(turtle.getFuelLevel())
  end
end

function transfer(array)
  for i,v in ipairs(array) do
    if not(turtle.transferTo(v,1)) then
      turtle.select(2)
      turtle.transferTo(v,1)
    end
  end
  turtle.select(1)
end

function sort(debug,count,i)
  i = i or 2
  count = count or turtle.getItemCount(1)
  if turtle.transferTo(i,count) then
    turtle.select(1)
    if debug then print("sorted") end
    return true
  else
    if i == 16 then
      print "Inventory Full"
      return false
    else
      if debug then print("not the right block, moving on") end
      return sort(debug,count, i+1)
    end
  end
end

function suckUp()
  turtle.suckUp()
  turtle.suckUp()
end

function dropUp()
  turtle.select(1)
  turtle.dropUp()
  turtle.select(2)
  turtle.dropUp()
  turtle.select(1)
end

function suckDown()
  turtle.suckDown()
  turtle.suckDown()
end

function dropDown()
  turtle.dropDown()
  turtle.select(2)
  turtle.dropDown()
  turtle.select(1)
end

function suck()
  turtle.suck()
  turtle.suck()
end

function drop()
  turtle.drop()
  turtle.select(2)
  turtle.drop()
  turtle.select(1)
end

function turnAround()
  turtle.turnRight()
  turtle.turnRight()
end


function mineForward(debug)
  if debug then print("mining forward") end
  turtle.dig()
  if sort(debug) then
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
  haveRoom = sort(debug)
  if turtle.detectUp() and haveRoom then
    if debug then print("*&@)$ falling blocks") end
    mineUp()
  end
  return haveRoom
end

function mineDown(debug)
  if debug then print("mining down") end
  turtle.digDown()
  haveRoom = sort(debug)
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
  turnAround()
  while i > 0 do
    turtle.forward()
    i = i - 1
  end
  if debug then turnAround() end
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
