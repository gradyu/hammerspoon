require "config"

local obj={}
obj.__index = obj

obj.appkey = {}
obj.keymaps = {}


if g_app_list then
  local singleKey = spoon.RecursiveBinder.singleKey
  obj.appkey = singleKey('a', "apps")
  for _, app in ipairs(g_app_list) do
    local k = singleKey(app.key, app.desc)
    if app.name then
      obj.keymaps[k] = function () openAppByName(app.name) end
    elseif app.id then
      obj.keymaps[k] = function () openAppById(app.id) end
    elseif app.url then
      obj.keymaps[k] = function () openAppByName("open " .. app.url) end
    end
  end
end

function openAppByName(name)
  hs.application.launchOrFocus(name)
end

function openAppById(id)
  hs.application.launchOrFocusByBundleID(id)
end


return obj

