require "config"

local obj = {}
obj.__index = obj

obj.key = {}
obj.map = {}

local majorkey = g_count_major_key or {}

if hs.spoons.isLoaded("CountDown") then
  local singleKey = spoon.RecursiveBinder.singleKey
  obj.key = singleKey(majorkey[1] or 'c', majorkey[2] or "countdown")
  obj.map[{{}, g_count_resume_pause_key[1], g_count_resume_pause_key[2]}] = function ()
    spoon.CountDown:pauseOrResume()
  end
  obj.map[{{}, "return", "30 minutes"}] = function ()
    spoon.CountDown:startFor(30)
  end
  for _, v in ipairs(g_count_list) do
    obj.map[singleKey(v.key, v.desc)] = function ()
      spoon.CountDown:startFor(v.count)
    end
  end
end

return obj