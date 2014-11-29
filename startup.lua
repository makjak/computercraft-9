-- Startup program for Computercraft Systems

-- Author: n3rdgir1
-- Github: https://github.com/n3rdgir1
-- My Computercraft code: https://github.com/n3rdgir1/computercraft
-- Pastebin Location: http://pastebin.com/7dQ2zbk9

-- General startup program for all systems
  -- Installs scaffold from my github
  -- downloads and installs the configured pastebin or github file, and runs it

-- Set the computer's name if necessary
-- os.setComputerLabel("DeviceName")

-- Guard execution by requiring a label
if os.getComputerLabel() then
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

  -- get and run new startup program from pastebin or n3rdgir1's github
  if fs.exists('pb') then
    local file = fs.open("pb","r")
    local address = file.readLine()

    if scaffold.replacePastebin(address, "StartupProgram") then
      shell.run("StartupProgram")
    else
      print "could not replace file from pastebin"
    end
  elseif fs.exists('github') then
    local file = fs.open("github","r")
    local address = file.readLine()

    if scaffold.replaceGithub(address, "StartupProgram") then
      shell.run("StartupProgram")
    else
      print "could not replace file from github"
    end
  else
    print "provide a 'github' or 'pb' file to load startup program"
  end
else
  print "You can only run this on a named computer, be kind to your servermates"
end
