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
tab:newCard({ size = 5, isContentCenter = true })
  :addCardHeader({ text = "header", isTransparent = true })
  :newCardBody()
    :addCardTitle({ text = "Title text" })
    :addCardSubtitle({ text = "Subtitle text" })
    :addCardText({ id = cardTextID, text = "World" })
    :addProgressBar({
        id = "ProgressBar1",
        percentage = 0,
        showLabel = false,
        isStriped = false,
        color = "danger",
      })

local cardText = love.mintmousse.get(cardTextID)
local progressBar = love.mintmousse.get("ProgressBar1")

local timer, flop = 0, false
local lastInterval = -1
love.update = function(dt)
  timer = timer + dt
  local currentInterval = math.floor(timer / 0.1)
  if currentInterval > lastInterval then
    lastInterval = currentInterval
    progressBar.percentage = math.max(math.min((timer / 4.8) * 100, 100), 0)
  end
  while timer >= 5 do
    timer = timer - 5
    lastInterval = -1
    flop = not flop
    if flop then
      cardText.text = "Hello"
      progressBar.isStriped = not progressBar.isStriped
      progressBar.color = "danger"
    else
      cardText.text = "World"
      progressBar.color = "warning"
    end
  end
end

love.mousepressed = function(_, _, button)
  if button == 1 then
    cardText.text = "Mouse button was pressed!"
    timer = 0
  end
end

if love.window then
  love.graphics.setNewFont(24)
  love.draw = function()
    love.graphics.print(love.mouse.isDown(1) and "Mouse is down" or "Mouse is up")
  end
end