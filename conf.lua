require("mintmousse.prepare")() -- saves ~2.5ms loading time @ time of implementation

love.conf = function(t)
  t.modules.window = true
end