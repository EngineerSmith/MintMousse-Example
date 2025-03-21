require("mintmousse")

-- love.mintmousse.setIcon({
--   emoji = "🦆",
--   shape = "rect",
--   rounded = true,
--   color = "mintcream",
--   outsideColor = "#00FF07",
--   easterEgg = true
-- })

-- local dbTab = love.mintmousse.newTab("Dashboard")
-- dbTab:insert({
--   type = "Card",
--   size = 5,
--   children = { {
--       type = "CardText",
--       text = "Hello World!",
--     }, {
--       id = "ProgressBar",
--       type = "ProgressBar",
--       percentage = 0,
--       label = true,
--       style = {
--         color = "danger"
--       },
--     },
--   },
-- })

love.mintmousse.start({
  host = "*",
  port = 80, -- default
  whitelist = { "127.0.0.1", "192.168.*.*" },
})

-- local progressBar = love.mintmousse.get("ProgressBar")

-- local timer1, timer1Flop = 0, false

-- love.update = function(dt)
--   timer1 = timer1 + dt
--   while timer1 >= .1 do
--     timer1 = timer1 - .1
--     progressBar.percentage = progressBar.percentage + (timer1Flop and -1 or 1)
--     if progressBar.percentage >= 100 or progressBar.percentage <= 0 then
--       timer1Flop = not timer1Flop
--     end
--   end
-- end