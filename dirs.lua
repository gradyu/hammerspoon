require "config"

local m = {}

m.key = {}
m.map = {}

local majorkey = g_dirs_major_key or {}
if g_dirs_keymap then
  local singleKey = spoon.RecursiveBinder.singleKey
  m.key = singleKey(majorkey[1] or 'd', majorkey[2] or "dirs")
  for _, dir in ipairs(g_dirs_keymap) do 
    local k = singleKey(dir.key, dir.name)
    m.map[k] = function ()
      os.execute('open ' .. dir.path)
      hs.application.launchOrFocus('Finder')
    end
  end
end

return m
