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

local tab = love.mintmousse.newTab("Dashboard", "dashboard")
local card = tab:newCard({
    size = 5,
    isContentCenter = true,
    borderColor = "error",
  })
  :addCardHeader({ text = "header", isTransparent = true })
  :newCardBody()
    :addCardTitle({ text = "Title text" })
    :addCardSubtitle({ text = "Subtitle text" })
    :addCardText({ id = "example", text = "World" })
    :addProgressBar({
        id = "ProgressBar1",
        percentage = 0,
        showLabel = false,
        isStriped = false,
        color = "danger",
      })
    .back
  :addCardFooter({ id = "footer", text = "footer" })

--local cardText = love.mintmousse.get("example")
--local progressBar = love.mintmousse.get("ProgressBar1")

local footer = love.mintmousse.get("footer")

local timer, flop = 0, false
local lastInterval = -1
love.update = function(dt)
  timer = timer + dt
  local currentInterval = math.floor(timer / 0.1)
  if currentInterval > lastInterval then
    lastInterval = currentInterval
    --progressBar.percentage = math.max(math.min((timer / 2.8) * 100, 100), 0)
  end
  while timer >= 3 do
    timer = timer - 3
    lastInterval = -1
    flop = not flop
    if flop then
      --cardText.text = "Hello"
      --progressBar.isStriped = not progressBar.isStriped
      --progressBar.color = "danger"
      card.borderColor = "info"
      footer.text = "hello"
      --love.mintmousse.notify({ title = "MintMousse" })
    else
      --cardText.text = "World"
      --progressBar.color = "warning"
      card.borderColor = "success"
      footer.text = nil
      --love.mintmousse.notify({ title = "MintMousse" })
    end
  end
end

love.mousepressed = function(_, _, button)
  if button == 1 then
    --cardText.text = "Mouse button was pressed!"
    love.mintmousse.notify({ title = "MintMousse", text = "Noice" })
    timer = 0
  end
end

if love.window then
  love.graphics.setNewFont(24)
  love.draw = function()
    love.graphics.print(love.mouse.isDown(1) and "Mouse is down" or "Mouse is up")
  end
end

love.quit = function()
  love.mintmousse.stop()
end