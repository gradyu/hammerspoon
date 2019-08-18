require "config"
require "funcs"

local utils = hs.fnutils
local sp = hs.spoons

local hyper = g_hyper_keys or {"ctrl", "alt"}

-- load SpoonInstall
hs.loadSpoon("SpoonInstall")
local Install = spoon.SpoonInstall

-- load spoons
local hspoon_list = g_hspoon_list or { "SpeedMenu" }
for _, v in pairs(hspoon_list) do
  Install:andUse(v)
end

-- reload config
local reload_keys = g_reload_keys or {hyper, 'R'}
Install:andUse("ReloadConfiguration", {
  hotkeys = {reloadConfiguration = reload_keys },
  start = g_auto_reload
})

-- RecursiveBinder
local supervisor_keys = g_supervisor_keys or {hyper, 'space'}
Install:andUse("RecursiveBinder", {
  fn = function ()
    hs.hotkey.bind(supervisor_keys[1], supervisor_keys[2],
        spoon.RecursiveBinder.recursiveBind(require("keymap")))
  end
})

-- Seal
if utils.contains(hspoon_list, "Seal") and sp.isLoaded("Seal") then
  local seal_keys = g_seal_keys or {hyper, 'm'}
  sp.use("Seal", {
           hotkeys = {show = seal_keys},
           fn = function (s)
             print("Seal load plugins")
             s:loadPlugins({"apps", "calc", "rot13", "urlformats", "useractions"})
           end
  })
end

-- window grid
if utils.contains(hspoon_list, "WindowGrid") and sp.isLoaded("WindowGrid") then
  local window_grid_keys = g_window_grid_keys or {hyper, ','}
  sp.use("WindowGrid", {
           config = {gridGeometries = {{"3x2"}}},
           hotkeys = {show_grid = window_grid_keys},
           start = true
  })
end

-- WindowHalfsAndThirds
if utils.contains(hspoon_list, "WindowHalfsAndThirds") and sp.isLoaded("WindowHalfsAndThirds") then
  --[[{
    left_half   = { {"ctrl",        "cmd"}, "Left" },
    right_half  = { {"ctrl",        "cmd"}, "Right" },
    top_half    = { {"ctrl",        "cmd"}, "Up" },
    bottom_half = { {"ctrl",        "cmd"}, "Down" },
    third_left  = { {"ctrl", "alt"       }, "Left" },
    third_right = { {"ctrl", "alt"       }, "Right" },
    third_up    = { {"ctrl", "alt"       }, "Up" },
    third_down  = { {"ctrl", "alt"       }, "Down" },
    top_left    = { {"ctrl",        "cmd"}, "1" },
    top_right   = { {"ctrl",        "cmd"}, "2" },
    bottom_left = { {"ctrl",        "cmd"}, "3" },
    bottom_right= { {"ctrl",        "cmd"}, "4" },
    max_toggle  = { {"ctrl", "alt", "cmd"}, "f" },
    max         = { {"ctrl", "alt", "cmd"}, "Up" },
    undo        = { {        "alt", "cmd"}, "z" },
    center      = { {        "alt", "cmd"}, "c" },
    larger      = { {        "alt", "cmd", "shift"}, "Right" },
    smaller     = { {        "alt", "cmd", "shift"}, "Left" },
    }]]--
  sp.use("WindowHalfsAndThirds", {
           hotkeys = 'default'
  })
end

-- WindowScreenLeftAndRight
if utils.contains(hspoon_list, "WindowScreenLeftAndRight") and sp.isLoaded("WindowScreenLeftAndRight") then
  --[[{
    screen_left = { {"ctrl", "alt", "cmd"}, "Left" },
    screen_right= { {"ctrl", "alt", "cmd"}, "Right" },
    }]]--
  sp.use("WindowScreenLeftAndRight", {
           hotkeys = 'default'
  })
end

-- AClock
local aclock_toggle_keys = g_aclock_toggle_keys or {hyper, 'T'}
if utils.contains(hspoon_list, "AClock") and sp.isLoaded("AClock") then
  hs.hotkey.bind(aclock_toggle_keys[1], aclock_toggle_keys[2], "Clock toggle",
                 function () spoon.AClock:toggleShow() end)
end

-- hammerspoon home
local hs_home_keys = g_hs_home_keys or {hyper, 'H'}
hs.hotkey.bind(hs_home_keys[1], hs_home_keys[2], "Hammerspoon home", funcs.showHammerspoonHome)

-- lock screen
local lock_keys = g_lock_screen_keys or {hyper, 'L'}
hs.hotkey.bind(lock_keys[1], lock_keys[2], "Lock screen", funcs.systemLockSreen)

-- hammerspoon console toggle
local console_keys = g_hs_console_keys or {hyper, 'Z'}
hs.hotkey.bind(console_keys[1], console_keys[2], "Hammerspoon console", funcs.toggleConsole)

hs.alert.show("Hammerspoon config loaded")
