require("mintmousse")

love.mintmousse.setSVGIcon({
  emoji = "🦆",
  shape = "rect",
  rounded = true,
  color = "mintcream",
  outsideColor = "#00FF07",
  easterEgg = true
})

local dbTab = love.mintmousse.newTab("Dashboard")
dbTab:insert({
  type = "Card",
  size = 5,
  children = { {
      type = "CardText",
      text = "Hello World!",
    } }
})

love.mintmousse.start({
  host = "*",
  port = 80, -- default
  whitelist = { "127.0.0.1", "192.168.*.*" },
})