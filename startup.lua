-- General startup program for all systems
  -- Installs scaffold from pastebin
  -- Checks the file located at "pastebin" for the program to run on this box, downloads a fresh copy and installs it
  -- Outputs the fuel level if this is a turtle (for convenience)

-- If this is a turtle, output the fuel level
if turtle then
  write "Fuel level:"
  write(turtle.getFuelLevel())
end

-- Set the computer's name if necessary
-- os.setComputerLabel("DeviceName")

-- Replace a program with the current version from pastebin
-- Arguments
  -- filename: the startup program
  -- pastebin: where to get the file from pastebin
function replaceProgram(options)
  print "replaceProgram"
  for key,value in pairs( options ) do
    print(tostring(key)..": "..tostring(value))
  end
  if options.filename and options.pastebin then
    shell.run("rm", options.filename)
    shell.run("pastebin", "get", options.pastebin, options.filename)
  else
    print "usage: replaceProgram(filename=filename, pastebin=pastebin)"
  end
end

-- get new scaffold
replaceProgram{pastebin="2eFQ8BEe", filename="scaffold"}

-- get new startup program
local file = fs.open("pb","r")
if file then
  local address = file.readLine()

  if address then
    replaceProgram{pastebin=address, filename="StartupProgram"}
    shell.run("StartupProgram")
  else
    print "no address listed in 'pastebin,' skipping"
  end
else
  print "No file 'pastebin' provided, skipping"
end
