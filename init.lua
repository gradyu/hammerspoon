require "config"
require "preload"

hyper_keys = g_hyper_keys or {"ctrl", "alt"}

keymap = {
  [{ {}, 'f', 'files'}] = {
    [{ {}, 'D', 'Desktop' }] = function () openWithFinder('~/Desktop') end,
    [{ {}, 'd', 'Download' }] = function () openWithFinder('~/Downloads') end,
    [{ {}, 'h', 'Home' }] = function () openWithFinder('~') end,
    [{ {}, 'w', 'Workspace' }] = function () openWithFinder('~/Documents/workspace') end,
  },
  [{ {}, 'a', 'apps'}] = {
    [{ {}, 'e', "Emacs" }] = function () openOrFocusApp('Emacs') end,
    [{ {}, 's', "Safari" }] = function () openOrFocusApp('Safari') end,
    [{ {}, 'f', "Finder" }] = function () openOrFocusApp('Finder') end,
    [{ {}, 'w', "Wechat" }] = function () openOrFocusApp('Wechat') end,
    [{ {}, 'g', "Google" }] = function () openOrFocusApp('open http://google.com') end,
  },
}

if hs.spoons.isLoaded("RecursiveBinder") then
  hs.hotkey.bind(hyper_keys, "space", spoon.RecursiveBinder.recursiveBind(keymap))
end

function openWithFinder(path)
  os.execute('open ' .. path)
  hs.application.launchOrFocus('Finder')
end

function openOrFocusApp(app)
  hs.application.launchOrFocus(app)
end


hs.alert.show("Hammerspoon config loaded")
