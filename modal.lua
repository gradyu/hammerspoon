local modal = {}
local stateMachine = require "statemachine"
local utils = require "utils"
local windows = require "windows"

modal.displayModalText = function (txt)
  hs.alert.closeAll()
  hs.alert.show(txt, 999999)
end

modal.exitAllModals = function ()
  hs.fnutils.each(modal.states, function (s)
                    if s.hotkeyModal then
                      s.hotkeyModal:exit()
                    end
                  end)
end

modal.addState = function (name, state)
  modal.states[name] = state
end

local filterAllowedApps = function (w)
  local allowedApps = {"Emacs", "iTerm2"}
  if (not w:isStandard()) and (not hs.fnutils.contains(allowedApps, w:application():name())) then
	return false
  end
  return true
end

modal.states = {
  idle = {
    from = "*", to = "idle",
    callback = function (self, event, from, to)
      hs.alert.closeAll()
      modal.exitAllModals()
    end
  },
  main = {
    from = "*", to = "main",
    init = function (self, fsm)
      if self.hotkeyModal then
        self.hotkeyModal:enter()
      else
        self.hotkeyModal = hs.hotkey.modal.new({"cmd"}, "space")
      end
      self.hotkeyModal:bind("", "space", nil, function() fsm:toIdle(); windows.activeApp("Alfred 4") end)
      self.hotkeyModal:bind("", "w", nil, function() fsm:toWindows() end)
      self.hotkeyModal:bind("", "a", nil, function() fsm:toApps() end)
      self.hotkeyModal:bind("", "m", nil, function() fsm:toMedia() end)
      self.hotkeyModal:bind("", "x", nil, function() fsm:toEmacs() end)
      self.hotkeyModal:bind("", "j", nil, function() fsm:toIdle() end)
      self.hotkeyModal:bind("", "escape", nil, function() fsm:toIdle() end)
      self.hotkeyModal:bind("", "q", nil, function() fsm:toIdle() end)
      self.hotkeyModal:bind("ctrl", "[", nil, function() fsm:toIdle() end)
      self.hotkeyModal:bind("ctrl", "g", nil, function() fsm:toIdle() end)

      function self.hotkeyModal:entered()
        modal.displayModalText "w \t- windows\na \t- apps\nj \t- jump\nm \t- media\nx \t- emacs"
      end
    end
  }
}

modal.createMachine = function ()
  local events = {}
  local params = function (fsm)
	local callbacks = {}
    for k, s in pairs(modal.states) do
      table.insert(events, {name = "to" .. utils.capitalize(k),
                            from = s.from or {"main", "idle"},
                            to = s.to or k})
      if s.callback then
        cFn = s.callback
      else
        cFn = function (self, event, from, to)
          local st = modal.states[to]
          st.init(st, self)
        end
      end
      callbacks["on" .. k] = cFn
    end
    return callbacks
  end

  return stateMachine.create({initial = "idle", events = events, callbacks = params(self)})
end

return modal


