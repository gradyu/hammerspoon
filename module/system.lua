require "config"

local utils = require("utils")

local m = {}

m.key = {}
m.map = {}

local majorkey = g_system_major_keys or {}

m.key = {{}, majorkey[1] or 's', majorkey[2] or "system"}

if hs.spoons.isLoaded("Caffeine") then
  local k = g_system_keymap.caffeine.key or 'space'
  local name = g_system_keymap.caffeine.desc or "sleep toggle"
  m.map[utils.singleKey(k, name)] = function () spoon.Caffeine.clicked() end
  spoon.Caffeine:start()
end

if hs.spoons.isLoaded("AClock") then
  local k = g_system_keymap.aclock.key or 'return'
  local name = g_system_keymap.aclock.desc or "clock"
  m.map[utils.singleKey(k, name)] = function () spoon.AClock:toggleShow() end
end

if g_system_keymap and g_system_keymap.sp then
  for _, v in ipairs(g_system_keymap.sp) do
    m.map[utils.singleKey(v.key, v.desc)] = utils.findfunction(v.fn)
  end
end

return m
