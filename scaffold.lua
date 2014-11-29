print "Loaded scaffold v0.1"
-- Replace a program with the current version
-- Arguments
  -- filename: the program name
  -- pastebin: where to get the file from pastebin
function replacePastebin(pastebin, filename)
  shell.run("rm", filename)
  shell.run("pastebin", "get", pastebin, filename)
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

function turnAround()
  turtle.turnRight()
  turtle.turnRight()
end


