-- SpoonInstall
hs.loadSpoon("SpoonInstall")
Install = spoon.SpoonInstall

-- auto reload
Install:andUse("ReloadConfiguration", {start = true})

-- FnMate
Install:andUse("FnMate")

-- SpeedMenu
Install:andUse("SpeedMenu")

hyper = {"ctrl", "alt"}

-- WindowGrid
Install:andUse("WindowGrid", {
                 config = { gridGeometries = {{ "3x2" }}},
                 hotkeys = { show_grid = { hyper, "g" }},
                 start = true
})

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
Install:andUse("RecursiveBinder", {
                 fn = function()
                   hs.hotkey.bind(hyper, "space", spoon.RecursiveBinder.recursiveBind(keymap))
                 end,
})

function openWithFinder(path)
  os.execute('open ' .. path)
  hs.application.launchOrFocus('Finder')
end

function openOrFocusApp(app)
  hs.application.launchOrFocus(app)
end


hs.alert.show("Hammerspoon config loaded")
