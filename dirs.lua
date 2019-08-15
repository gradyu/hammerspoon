require "config"

local obj = {}
obj.__index = obj

obj.key = {}
obj.map = {}

local majorkey = g_dirs_major_key or {}
if g_dirs_list then
  local singleKey = spoon.RecursiveBinder.singleKey
  obj.key = singleKey(majorkey[1] or 'd', majorkey[2] or "dirs")
  for _, dir in ipairs(g_dirs_list) do 
    local k = singleKey(dir.key, dir.name)
    obj.map[k] = function ()
      os.execute('open ' .. dir.path)
      hs.application.launchOrFocus('Finder')
    end
  end
end

return obj
