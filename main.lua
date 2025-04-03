require("mintmousse")

-- love.mintmousse.updateSubscription("dashboard")

love.mintmousse.start({
  -- defaults
  title = "MintMousse",
  host = "*",
  httpPort = 80,
  -- not default
  whitelist = { "127.0.0.1", "192.168.0.0/16" }
})

local cardTextID = "example"

local tab = love.mintmousse.newTab("Dashboard", "dashboard")
tab:newCard({ size = 2 })
  :addCardText({ id = cardTextID, text = "World" })
  -- :addProgressBar({
  --     id = "ProgressBar1",
  --     percentage = 0,
  --     label = true,
  --     style = { color = "danger" },
  --   })

local cardText = love.mintmousse.get(cardTextID)

local timer, flop = 0, false
love.update = function(dt)
  timer = timer + dt
  while timer >= 2 do
    timer = timer - 2
    flop = not flop
    if flop then
      cardText.text = "Hello"
    else
      cardText.text = "World"
    end
  end
end

love.mousepressed = function(_, _, button)
  if button == 1 then
    cardText.text = "Mouse button was pressed!"
    timer = 0
  end
end

love.graphics.setNewFont(24)
love.draw = function()
  love.graphics.print(love.mouse.isDown(1) and "Mouse is down" or "Mouse is up")
end