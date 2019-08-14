require "config"

hyper_keys = g_hyper_keys or {"ctrl", "alt"}

-- load SpoonInstall
hs.loadSpoon("SpoonInstall")
Install = spoon.SpoonInstall

-- load spoons
hspoon_list = g_hspoon_list or {
  "SpeedMenu",
  "FnMate",
}
for _, v in pairs(hspoon_list) do
  Install:andUse(v)
end

-- reload config
reload_keys = g_reload_keys or {hyper_keys, "R"}
autoreload = g_auto_reload or true
Install:andUse("ReloadConfiguration", {
                 hotkeys = {reloadConfiguration = reload_keys },
                 start =  autoreload
})

-- load RecursiveBinder
Install:andUse("RecursiveBinder")

