require "config"

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
reload_keys = g_reload_keys or {g_hyper_keys, "R"}
Install:andUse("ReloadConfiguration", {
                 hotkeys = {reloadConfiguration = reload_keys },
                 start = g_auto_reload
})

-- load RecursiveBinder
Install:andUse("RecursiveBinder")

