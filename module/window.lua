require "config"

local m = {}

m.key = {}
m.map = {}

local majorkey = g_window_major_keys or {}

m.key = {{}, majorkey[1] or 'w', majorkey[2] or "window"}

if hs.spoons.isLoaded("WindowGrid") then
  local k = g_window_keymap.wingrid.key or 'g'
  local name = g_window_keymap.wingrid.desc or "window grid"
  m.map[{{}, k, name}] = function () hs.grid.toggleShow() end
end

return m
