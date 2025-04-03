require("mintmousse.prepare")() -- saves ~2.5ms

love.conf = function(t)
  t.modules.window = true
end