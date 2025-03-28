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

-- local dbTab = love.mintmousse.newTab("Dashboard", "dashboard")
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
  whitelist = { "127.0.0.1", "192.168.0.0/16" }
})

-- local progressBar = love.mintmousse.get("ProgressBar")

-- local timer, timerFlop = 0, false

-- love.update = function(dt)
--   timer = timer + dt
--   while timer >= .1 do
--     timer = timer - .1
--     progressBar.percentage = progressBar.percentage + (timerFlop and -1 or 1)
--     if progressBar.percentage >= 100 or progressBar.percentage <= 0 then
--       timerFlop = not timerFlop
--     end
--   end
-- end

local tab
local timer = 0
love.update = function(dt)
  timer = timer + dt
  while timer >= 2 do
    timer = timer - 2
    if tab then
      tab:remove()
      tab = nil
    else
      tab = love.mintmousse.newTab("Dashboard", "dashboard")
    end
  end
end