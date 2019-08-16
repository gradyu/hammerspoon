local keymap = {}

local modules = g_module_list or {
  "apps",
  "dirs",
}

for _, v in ipairs(modules) do
  local m = require(v)
  keymap[m.key] = m.map
end

return keymap
