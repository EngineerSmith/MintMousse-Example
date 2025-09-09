require("mintmousse")

love.mintmousse.start({
  -- defaults
  title = "MintMousse",
  host = "*",
  httpPort = 80,
  -- not default
  whitelist = { "127.0.0.1", "192.168.0.0/16" },
})

local tab = love.mintmousse.newTab("Dashboard", "dashboard")
tab:newAlert({ id = "alert", size = 5, text = "U've been hacked" })
local card = tab:newCard({
    size = 3,
    --isContentCenter = true,
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
    :addCardText({ text = "I'm below the progress bar" })
    :addButton({ width = "50", onEventClick = "test" })
    .back -- same as .parent
  :addCardFooter({ id = "footer", text = "footer" })

love.mintmousse.addCallback("test", function(button)
  button.text = (button.text or "") .. "a"
end)

tab:newAccordion({ size = 2 })
  :newContainer({ title = "Let's hope 1", id = "testing" })
    :addText({ text = "First text?" })
    :addButton({
        color = "warning",
        colorOutline = true,
        text = "I am a button :>",
        width = "50",
      })
    .back
  :addText({ title = "Let's hope 2", text = "Second text?" })
  :addText({ title = "Let's hope 3", text = "Third text?" })
  :addText({ title = "Let's hope 4", text = "Fourth text?" })
  :addAlert({ title = "Removable Alert", dismissible = true, text = "I am alert" })
  :newContainer({ title = "Alert" })
    :addAlert({ dismissible = true, text = "I am alert" })
    -- .back

tab:newList({ size = 5, numbered = true })
  :addText({ text = "hello 1" })
  :addText({ text = "hello 2" })
  :addText({ text = "hello 3" })
  :addText({ text = "4" })
  :addText({ text = "5" })

-- tab:newButton({
--   width = "50",
--   size = 2,
--   text = "How big is this button",
--   callback = function(componentID)
--     -- if component is removed, the callback will be removed
--     -- This will be documented, and a configurable behaviour
--   end,
-- })

-- tab:newButton({
--   width = "50",
--   size = 2,
--   text = "How big is this button",
--   callback = "example",
-- })

-- love.mintmousse.addCallback("example", function(componentID) end)
-- love.mintmousse.removeCallback("example") -> pass nil
-- love.mintmousse.handlers["example"] = function(componentID) end

local cardText = love.mintmousse.get("example")
local progressBar = love.mintmousse.get("ProgressBar1")
local alert = love.mintmousse.get("alert")
local footer = love.mintmousse.get("footer")

-- temp
-- love.mintmousse.get("MM_main_6"):remove()
-- love.mintmousse.get("MM_main_9"):remove()

local timer, flop = 0, false
local lastInterval = -1
love.update = function(dt)
  timer = timer + dt
  local currentInterval = math.floor(timer / 0.1)
  if currentInterval > lastInterval then
    lastInterval = currentInterval
    progressBar.percentage = math.max(math.min((timer / 2.8) * 100, 100), 0)
  end
  while timer >= 3 do
    timer = timer - 3
    lastInterval = -1
    flop = not flop
    alert.dismissible = not alert.dismissible
    if flop then
      cardText.text = "Hello"
      progressBar.isStriped = not progressBar.isStriped
      progressBar.color = "danger"
      card.borderColor = "info"
      footer.text = "hello"
      card.size = 2
    else
      cardText.text = "World"
      progressBar.color = "warning"
      card.borderColor = "success"
      footer.text = nil
      card.size = 3
    end
  end
end

love.mousepressed = function(_, _, button)
  if button == 1 then
    cardText.text = "Mouse button was pressed!"
    love.mintmousse.get("testing").title = "Hello world" .. love.math.random(1, 5000)
    love.mintmousse.notify({ title = "MintMousse", text = "Noice", autoHide = false })
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
  return false
end