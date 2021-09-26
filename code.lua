--CGPU Library, author nordway
--A little library to make color drawings easier

local component = require("component")
local gpu = component.gpu

local cgpu = {}

w, h = gpu.getResolution()

function cgpu.clear(char, fg, bg)
  if fg ~= nil then gpu.setForeground(fg) end
  if bg ~= nil then gpu.setBackground(bg) end
  gpu.fill(1, 1, w, h, char)
end

function cgpu.set(xset, yset, char, fg, bg)
  if fg ~= nil then
    gpu.setForeground(fg)
  end
  if bg ~= nil then
    gpu.setBackground(bg)
  end
  gpu.set(xset, yset, char)
end

function cgpu.drawLine(x0, y0, x1, y1, iter, char, fg, bg)
  xi = (x1-x0)/iter
  yi = (y1-y0)/iter
  xc = x0
  yc = y0
  if fg ~= nil then gpu.setForeground(fg) end
  if bg ~= nil then gpu.setBackground(bg) end
  for i = 1, iter do  
    gpu.set(xc, yc, char)
    xc = xc + xi
    yc = yc + yi
  end
end

function cgpu.fill(xfill, yfill, wid, hei, char, fg, bg)
  if fg ~= nil then
    gpu.setForeground(fg)
  end
  if bg ~= nil then
    gpu.setBackground(bg)
  end
  gpu.fill(xfill, yfill, wid, hei, char)
end

return cgpu
