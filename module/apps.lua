require "config"

local m ={}

m.key = {}
m.map = {}


local majorkey = g_apps_major_key or {}
if g_apps_keymap then
  local utils = require("utils")
  m.key = utils.singleKey(majorkey[1] or 'a', majorkey[2] or "apps")
  for _, app in ipairs(g_apps_keymap) do
    local k = utils.singleKey(app.key, app.desc)
    if app.name then
      m.map[k] = function () openAppByName(app.name) end
    elseif app.id then
      m.map[k] = function () openAppById(app.id) end
    elseif app.url then
      m.map[k] = function () openAppByName("open " .. app.url) end
    end
  end
end

function openAppByName(name)
  hs.application.launchOrFocus(name)
end

function openAppById(id)
  hs.application.launchOrFocusByBundleID(id)
end

return m
