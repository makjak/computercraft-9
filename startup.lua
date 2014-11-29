-- Startup program for Computercraft Systems

-- Author: n3rdgir1
-- Github: https://github.com/n3rdgir1
-- My Computercraft code: https://github.com/n3rdgir1/computercraft
-- Pastebin Location: http://pastebin.com/7dQ2zbk9

-- General startup program for all systems
  -- Installs scaffold from my github
  -- Checks the file located at "pb" for the program to run on this box, downloads a fresh copy and installs it

-- Set the computer's name if necessary
-- os.setComputerLabel("DeviceName")

-- load the scaffold
shell.run("rm", "scaffold")
local wget = http.get("https://raw.githubusercontent.com/n3rdgir1/computercraft/master/scaffold.lua")
local txt = wget:readAll()
local file = io.open("scaffold", "w")
file:write(txt)
file:close()

-- reload the api to get the freshest copy
os.unloadAPI("scaffold")
os.loadAPI("scaffold")

-- get and run new startup program
local file = fs.open("pb","r")
if file then
  local address = file.readLine()

  if address then
    scaffold.replacePastebin(address, "StartupProgram")
    shell.run("StartupProgram")
  else
    print "no address listed in 'pb,' skipping"
  end
else
  print "No file 'pb' provided, skipping"
end
