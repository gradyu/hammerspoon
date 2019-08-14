require "config"
require "preload"

keymap = {
  [{ {}, 'f', 'files'}] = {
    [{ {}, 'D', 'Desktop' }] = function () openWithFinder('~/Desktop') end,
    [{ {}, 'd', 'Download' }] = function () openWithFinder('~/Downloads') end,
    [{ {}, 'h', 'Home' }] = function () openWithFinder('~') end,
    [{ {}, 'w', 'Workspace' }] = function () openWithFinder('~/Documents/workspace') end,
  },
}

supervisor_keys = g_supervisor_keys or {g_hyper_keys, "space"}
if hs.spoons.isLoaded("RecursiveBinder") then
  local app = require("apps")
  keymap[app.appkey] = app.keymaps
  hs.hotkey.bind(supervisor_keys[1], supervisor_keys[2], spoon.RecursiveBinder.recursiveBind(keymap))
end

function openWithFinder(path)
  os.execute('open ' .. path)
  hs.application.launchOrFocus('Finder')
end

function openOrFocusApp(app)
  hs.application.launchOrFocus(app)
end


hs.alert.show("Hammerspoon config loaded")
