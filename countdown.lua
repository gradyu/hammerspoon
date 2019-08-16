require "config"

local m = {}

m.key = {}
m.map = {}

local majorkey = g_count_major_key or {}

if hs.spoons.isLoaded("CountDown") then
  local singleKey = spoon.RecursiveBinder.singleKey
  m.key = singleKey(majorkey[1] or 'c', majorkey[2] or "countdown")
  m.map[{{}, g_count_resume_pause_key[1], g_count_resume_pause_key[2]}] = function ()
    spoon.CountDown:pauseOrResume()
  end
  m.map[{{}, "return", "30 minutes"}] = function ()
    spoon.CountDown:startFor(30)
  end
  for _, v in ipairs(g_count_keymap) do
    m.map[singleKey(v.key, v.desc)] = function ()
      spoon.CountDown:startFor(v.count)
    end
  end
end

return m