print "Loaded scaffold v0.2"
-- Overwrite a file on disk from the internet
-- Arguments
  -- filename: the program name
  -- location: where to get the file from the net
function replaceProgram(location, filename)
  local wget = http.get(location)
  local txt = wget:readAll()
  local file = io.open(filename, "w")
  file:write(txt)
  file:close()
end

-- Replace a program from my github
-- Arguments
  -- filename: the program name
  -- filename: the full path to the file, ex: scaffold.lua or utils/mining.lua
    -- assumes file is on the master branch
function replaceGithub(github, filename)
  if github=="" then
    print("You must provide a github address")
    return false
  else
    replaceProgram("https://raw.githubusercontent.com/n3rdgir1/computercraft/master/"..github, filename)
    return true
  end
end

-- Replace a program from pastebin
-- Arguments
  -- filename: the program name
  -- pastebin: where to get the file from pastebin
function replacePastebin(pastebin, filename)
  if pastebin=="" then
    print("You must provide a pastebin address")
    return false
  else
    replaceProgram("http://pastebin.com/raw.php?i="..pastebin, filename)
    return true
  end
end

-- Downloads the api from github and loads it as an api
function loadAPI(api)
  apiLocation = "utils/"..api..".lua"
  replaceGithub(apiLocation, api)
  os.loadAPI(api)
end

function startup()
  -- If this is a turtle, output the fuel level
  if turtle then
    write "Fuel level:"
    write(turtle.getFuelLevel())
  end
end

function turnAround()
  turtle.turnRight()
  turtle.turnRight()
end
