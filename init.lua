require "config"

-- load SpoonInstall
hs.loadSpoon("SpoonInstall")
Install = spoon.SpoonInstall

-- load spoons
hspoon_list = g_hspoon_list or { "SpeedMenu" }
for _, v in pairs(hspoon_list) do
  Install:andUse(v)
end

-- reload config
reload_keys = g_reload_keys or {g_hyper_keys, "R"}
Install:andUse("ReloadConfiguration", {
  hotkeys = {reloadConfiguration = reload_keys },
  start = g_auto_reload
})

-- load keymaps
supervisor_keys = g_supervisor_keys or {g_hyper_keys, "space"}
Install:andUse("RecursiveBinder", {
  fn = function ()
    local preload = require("preload")
    hs.hotkey.bind(supervisor_keys[1], supervisor_keys[2], 
        spoon.RecursiveBinder.recursiveBind(preload.keymaps))
  end 
})

hs.alert.show("Hammerspoon config loaded")
