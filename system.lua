require "config"

local m = {}

m.key = {}
m.map = {}

local majorkey = g_system_major_key or {}

m.key = {{}, majorkey[1] or 's', majorkey[2] or "system"}

if hs.spoons.isLoaded("Caffeine") then
  local k = g_system_keymap.caffeine.key or 'space'
  local name = g_system_keymap.caffeine.desc or "sleep toggle"
  m.map[{{}, k, name}] = function () spoon.Caffeine.clicked() end
  spoon.Caffeine:start()
end

return m
