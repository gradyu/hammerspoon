require "config"

local m = {}

m.key = {}
m.map = {}

local majorkey = g_window_major_keys or {}

m.key = {{}, majorkey[1] or 'w', majorkey[2] or "window"}


local sp = hs.spoons

if g_window_keymap.wingrid and sp.isLoaded("WindowGrid") then
  local k = g_window_keymap.wingrid.key or 'g'
  local name = g_window_keymap.wingrid.desc or "window grid"
  m.map[{{}, k, name}] = function () hs.grid.toggleShow() end
end

if g_window_keymap.winmgr and sp.isLoaded("WindowHalfsAndThirds") then
  local utils = require("utils")
  for _, v in ipairs(g_window_keymap.winmgr) do
    m.map[utils.singleKey(v.key, v.desc)] = utils.findfunction("spoon.WindowHalfsAndThirds." .. v.method)
  end
end

return m
