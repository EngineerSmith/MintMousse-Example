require("mintmousse")

-- love.mintmousse.updateSubscription("dashboard")

-- love.mintmousse.setIcon({
--   emoji = "🦆",
--   shape = "rect",
--   rounded = true,
--   insideColor = "#95d7ab",
--   outsideColor = "#00FF07",
--   easterEgg = true
-- })

local dbTab = love.mintmousse.newTab("Dashboard", "dashboard")
local dbTab = love.mintmousse.newTab("Dashboard 2", "dashboard2")
local dbTab = love.mintmousse.newTab("Dashboard 3", "dashboard3")
local dbTab = love.mintmousse.newTab("Dashboard 4", "dashboard4")
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
  -- defaults
  title = "MintMousse",
  host = "*",
  httpPort = 80,
  -- not default
  whitelist = { "127.0.0.1", "192.168.*.*" }
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