require "config"

local obj = {}
obj.__index = obj

obj.keymaps = {}

local function generateKeymaps()
  local models = {
    "apps",
    "dirs"
  }
  for _, v in ipairs(models) do
    local m = require(v)
    obj.keymaps[m.key] = m.map
  end
  -- local app = require("apps")
  -- obj.keymaps[app.key] = app.map
  -- local dir = require("dirs")
  -- obj.keymaps[dir.key] = dir.map
end

generateKeymaps()

return obj