local windows = {}
local utils = require "utils"

undo = {}

local arrowMap = {
  k = { half = {0,0,1,.5}, movement = {0,-20}, complement = "h", resize = "Shorter"},
  j = { half = {0,.5,1,.5}, movement = {0,20}, complement = "l", resize = "Taller"},
  h = { half = {0,0,.5,1}, movement = {-20,0}, complement = "j", resize = "Thinner"},
  l = { half = {.5,0,.5,1}, movement = {20,0}, complement = "k", resize = "Wider"},
}

local function quadrant(t1, t2)
  return {t1[1]+t2[1], t1[2]+t2[2], .5, .5}
end

local function rect(rect)
  return function ()
	undo:push()
    local win = hs.window.focusedWindow()
    if win then
      win:move(rect)
    end
  end
end

local function windowJump(modal, fsm, arrow)
  local dir = { h = "West", j = "South", k = "North", l = "East"}
  modal:bind({"ctrl"}, arrow, function ()
      slf = hs.window.focusedWindow().filter.defaultCurrentSpace
      local fn = slf["focusWindow" .. dir[arrow]]
      fn(slf, nil, true, true)
      windows.highlighActiveWin()
  end)
end

local function jumpToLastWindow(fsm)
  utils.globalFilter():getWindows(hs.window.filter.sortByFocusedLast)[2]:focus()
  fsm:toIdle()
end

local function maximizeWindowFrame()
  undo:push()
  hs.window.focusedWindow():maximize(0)
  windows.highlighActiveWin()
end

local function resizeWindow(modal, arrow)
  local dir = { h = "Left", j = "Down", k = "Up", l = "Right"}
  modal:bind({}, arrow, function ()
      undo:push()
      rect(arrowMap[arrow].half)()
  end)
  modal:bind({"alt"}, arrow, function ()
      undo:push()
      if arrow == "h" or arrow == "l" then
        hs.grid.resizeWindowThinner(hs.window.focusedWindow())
      end
      if arrow == "j" or arrow == "k" then
        hs.grid.resizeWindowShorter(hs.window.focusedWindow())
      end
      hs.grid['pushWindow' .. dir[arrow]](hs.window.focusedWindow())
  end)
  modal:bind({"shift"}, arrow, function ()
      undo:push()
      hs.grid['resizeWindow' .. arrowMap[arrow].resize](hs.window.focusedWindow())
                               end
)
end

hs.grid.setMargins({0,0})
hs.grid.setGrid("3x2")

local function showGrid(fsm)
  sh.grid.show()
  fsm:toIdle()
end

local bind = function (hkm, fsm)
  hkm:bind("", "m", maximizeWindowFrame)
  hkm:bind("", "u", function() undo:pop() end)
  hs.fnutils.each({"h", "l", "k", "j"}, hs.fnutils.partial(resizeWindow, hkm))
  hkm:bind("", "g", hs.fnutils.partial(showGrid, fsm))
  hs.fnutils.each({"h", "l", "k", "j"}, hs.fnutils.partial(windowJump, hkm, fsm))
  hkm:bind({}, "w", hs.fnutils.partial(jumpToLastWindow, fsm))
  hkm:bind({}, "p", function() undo:push(); hs.window.focusedWindow():moveOneScreenNorth(nil, true) end)
  hkm:bind({"shift"}, "n", function() undo:push(); hs.window.focusedWindow():moveOneScreenWest(nil, true) end)
  hkm:bind({"shift"}, "p", function() undo:push(); hs.window.focusedWindow():moveOneScreenEast(nil, true) end)
  hkm:bind({}, "n", function() undo:push(); hs.window.focusedWindow():moveOneScreenSouth(nil, true) end)
end

function undo:push()
  local win = hs.window.focusedWindow()
  if win and not undo[win:id()] then
	self[win:id()] = win:frame()
  end
end

function undo:pop()
  local win = hs.window.focusedWindow()
  if win and self[win:id()] then
    win:setFrame(self[win:id()])
    self[win:id()] = nil
  end
end

windows.highlighActiveWin = function ()
  local rctgl = hs.drawing.rectangle(hs.window.focusedWindow():frame())
  rctgl:setStrokeColor({["red"]=1, ["blue"]=0, ["green"]=1, ["alpha"]=1})
  rctgl:setStrokeWidth(5)
  rctgl:setFill(false)
  rctgl:show()
  hs.timer.doAfter(.3, function() rctgl:delete() end)
end

windows.activeApp = function (appName)
  hs.application.launchOrFocus(appName)
  local app = hs.application.find(appName)
  if app then
    app:activate()
    hs.timer.doAfter(.05, windows.highlighActiveWin)
    app:unhide()
  end
end

windows.setMouseCursorAtApp = function (appTitle)
  local sf = hs.application.find(appTitle):focusedWindow():frame()
  local desiredPoint = hs.geometry.point(sf._x + sf._w - (sf._w * 0.10), sf._y + sf._h - (sf._h * 0.10))
  hs.mouse.setAbsolutePosition(desiredPoint)
end

windows.addState = function (modal)
  modal.addState("windows", {
                   init = function (self, fsm)
                     self.hotkeyModal = hs.hotkey.modal.new()
                     modal.displayModalText("cmd + hjkl \t jumping\nhjkl \t\t\t\t halves\nalt + hjkl \t\t increments\nshift + hjkl \t resize\nn, p \t next, prev screen\ng \t\t\t\t\t grid\nm \t\t\t\t maximize\nu \t\t\t\t\t undo")
                     self.hotkeyModal:bind("", "escape", function() fsm:toIdle() end)
                     self.hotkeyModal:bind({"cmd"}, "space", nil, function() fsm:toMain() end)
                     bind(self.hotkeyModal, fsm)
                     self.hotkeyModal:enter()
  end})
end


return windows
