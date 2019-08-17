require "config"

local m = {}

m.key = {}
m.map = {}

local majorkey = g_count_major_keys or {}

if hs.spoons.isLoaded("CountDown") then
  local utils = require("utils")
  m.key = utils.singleKey(majorkey[1] or 'c', majorkey[2] or "countdown")
  m.map[{{}, g_count_resume_pause_key[1], g_count_resume_pause_key[2]}] = function ()
    spoon.CountDown:pauseOrResume()
  end
  m.map[{{}, 'return', "30 minutes"}] = function ()
    print("countdown 30")
    spoon.CountDown:startFor(30)
  end
  m.map[{{}, '0', "cancel"}] = function ()
	spoon.CountDown:setProgress(1.0)
  end
  for _, v in ipairs(g_count_keymap) do
    m.map[utils.singleKey(v.key, v.desc)] = function ()
      spoon.CountDown:startFor(v.count)
    end
  end
end

return m
