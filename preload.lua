local obj = {}
obj.__index = obj

obj.keymaps = {}

local models = {
    "apps",
    "dirs",
    "countdown",
}
for _, v in ipairs(models) do
  local m = require(v)
  obj.keymaps[m.key] = m.map
end

return obj
