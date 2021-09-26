local event = require "event"
local cgpu = require "cgpu"
local keyboard = require "keyboard"

local args = {...}

if args[1] == nil or args[2] == nil then io.stderr:write("Too few arguments, expected two: HEX Color, HEX Color")
  os.exit()
end

cgpu.clear(" ", tonumber(args[1]), tonumber(args[2]))

while true do
  
  if keyboard.isKeyDown(keyboard.keys.a) and keyboard.isControlDown() then
    cgpu.clear(" ", tonumber(args[1]), tonumber(args[2]))
  end

  if keyboard.isKeyDown(keyboard.keys.w) and keyboard.isControlDown() then
    cgpu.clear(" ", 0xFFFFFF, 0x000000)
    os.exit()
  end

  name, address, x, y, button, player = event.pull()
  if name == "drag" or name == "touch" then
    x = (math.floor(x/2))*2
    if button == 0 then
      cgpu.fill(x, y, 2, 1, " ", nil, tonumber(args[1]))
    else
      cgpu.fill(x, y, 2, 1, " ", nil, tonumber(args[2]))
    end
  end
end
