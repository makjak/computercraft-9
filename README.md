# n3rdgir1's Computercraft Code

These are my running computer programs. I'm keeping them as a repository for managing them between servers so I never really lose anything. I'm integrating with [my pastebin](http://pastebin.com/u/n3rdgir1) to get them to the servers. Hopefully I'll keep this up to date as I go.

# Base Programs

## startup.lua

1. Load a fresh copy of my scaffold
2. Loads the configured pastebin or github file and runs it
  * Pastebin: add the paste location to the file 'pb'
  * Github: add the file locaiton to the file 'github', include the full path if the file is not in the root directory

## scaffold.lua

This program handles base utilities necessary for startup.lua and a function to load any api from my github. Supplemental apis are located in the `utils` directory.

## Helpful Tidbits

* Always name your devices (computers, turtles, disks), otherwise you will lose all programs when you move them.
 * Name your device using the command `label set your_name_here`
* Don't be upset when your turtle wanders off into the abyss, it's only doing what you told it to do
 * Test small in a controlled environment

## Helpful Links

* Lua: http://www.lua.org/
* Computercraft Wiki: http://computercraft.info/
* Pastebin: http://pasebin.com
