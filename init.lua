require "config"

local utils = hs.fnutils
local sp = hs.spoons

-- load SpoonInstall
hs.loadSpoon("SpoonInstall")
local Install = spoon.SpoonInstall

-- load spoons
local hspoon_list = g_hspoon_list or { "SpeedMenu" }
for _, v in pairs(hspoon_list) do
  Install:andUse(v)
end

-- reload config
local reload_keys = g_reload_keys or {g_hyper_keys, 'R'}
Install:andUse("ReloadConfiguration", {
  hotkeys = {reloadConfiguration = reload_keys },
  start = g_auto_reload
})

-- load keymap
local supervisor_keys = g_supervisor_keys or {g_hyper_keys, 'space'}
Install:andUse("RecursiveBinder", {
  fn = function ()
    hs.hotkey.bind(supervisor_keys[1], supervisor_keys[2],
        spoon.RecursiveBinder.recursiveBind(require("keymap")))
  end
})

-- window grid
if utils.contains(hspoon_list, "WindowGrid") and sp.isLoaded("WindowGrid") then
  local window_grid_keys = g_window_grid_keys or {g_hyper_keys, ','}
  sp.use("WindowGrid", {
                  config = {gridGeometries = {{"3x2"}}},
                  hotkeys = {show_grid = window_grid_keys},
                  start = true
  })
end

-- Seal
if utils.contains(hspoon_list, "Seal") and sp.isLoaded("Seal") then
  local seal_keys = g_seal_keys or {g_hyper_keys, 'm'}
  sp.use("Seal", {
           hotkeys = {show = seal_keys}
  })
end

hs.alert.show("Hammerspoon config loaded")
