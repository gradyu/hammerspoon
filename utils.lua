local utils = {}

function utils.tempNotify(timeout, notify)
  notify:send()
  hs.timer.doAfter(timeout, function() notify:withdraw() end)
end

--- -----------------------------------------
--- String utils
--- -----------------------------------------
local i
function utils.splitString(str, sep)
  if sep == nil then
    sep = "%s"
  end
  local t = {}
  i = 1
  for str in string.gmatch(str, "([^"..sep.."]+)") do
    t[i] = str
    i = i + 1
  end
  return t
end

function utils.str2Table(str)
  local t = {}
  for i = 1, #str do
    t[i] = str:sub(i, i)
  end
  return t
end

--- -----------------------------------------
--- Keymap utils
--- -----------------------------------------
local REPEAT_FASTER = 10 * 1000
local REPEAT_SLOWER = 100 * 1000
local NO_REPEAT = -1

local function keyStroke(mod, key, repeatDelay)
  mod = mod or {}
  hs.eventtap.event.newKeyEvent(mod, key, true):post()
  if repeatDelay <= 0 then
	repeatDelay = REPEAT_FASTER
  end
  hs.timer.usleep(repeatDelay)
  hs.eventtap.event.newKeyEvent(mod, key, false):post()
end

local function keyStrokeSystem(key, repeatDelay)
  hs.eventtap.event.newSystemKeyEvent(key, true):post()
  if repeatDelay <= 0 then
	repeatDelay = REPEAT_FASTER
  end
  hs.timer.usleep(repeatDelay)
  hs.eventtap.event.newSystemKeyEvent(key, false):post()
end

utils.keymap = function(sourceKey, sourceMod, targetKey, targetMod, repeatDelay)
  sourceMod = sourceMod or {}
  repeatDelay = repeatDelay or REPEAT_FASTER
  noRepeat = repeatDelay <= 0

  local fn = nil
  if targetMod == nil then
    fn = hs.fnutils.partial(keyStroke, nil, targetKey, repeatDelay)
  else
    targetMod = utils.splitString(targetMod, '+')
    fn = hs.fnutils.partial(keyStroke, targetMod, targetKey, repeatDelay)
  end

  if noRepeat then
	return hs.hotkey.new(sourceMod, sourceKey, fn, nil, nil)
  else
	return hs.hotkey.new(sourceMod, sourceKey, fn, nil, fn)
  end
end

--- -----------------------------------------
--- Apps utils
--- -----------------------------------------
utils.globalFilter = function ()
  return hs.window.filter.new()
    :setAppFilter('Emacs', {allowRoles={'AXUnknown', 'AXStandardWindow'}})
end

function utils.applyAppSpecific(appNames, focusedFn, unfocusedFn, ignore)
  local funFn = function (fnToRun)
	local activeApp = hs.window.focusedWindow():application():name()
    local isListed = hs.fnutils.contains(appNames, activeApp)
    if (ignore and not isListed) or (not ignore and isLised) then
      if fnToRun then fnToRun() end
    end
  end
  utils.globalFilter()
  :subscribe(hs.window.filter.windowFocused, function() runFn(focusedFn) end)
  :subscribe(hs.window.filter.windowUnfocused, function() funFn(unfocusedFn) end)
end

function utils.capitalize(str)
  return string.gsub(" " .. str, "%W%l", string.upper):sub(2)
end

return utils

