-- ----------------------------------------
-- Global Config
-- ----------------------------------------

-- Spoons which will be loaded
g_hspoon_list = {
  "AClock",
  "Caffeine",
  "CountDown",
  "FnMate",
  "KSheet",
  "Seal",
  "SpeedMenu",
  "URLDispatcher",
  "WindowGrid",
  "WindowHalfsAndThirds",
  "WindowScreenLeftAndRight"
}

-- auto reload enble
g_auto_reload = fasle

-- ----------------------------------------
-- Top Key Maps
-- ----------------------------------------

-- hyper
g_hyper_keys = {"ctrl", "alt"}

-- reload keys
g_reload_keys = {g_hyper_keys, "R"}

-- supervisor keys
g_supervisor_keys = {g_hyper_keys, "space"}

-- help keys
g_help_keys = {g_hyper_keys, "/"}

-- ----------------------------------------
-- App Maps
-- ----------------------------------------
g_app_list = {
  {key = 'e', name="Emacs", desc="Emacs"},
  {key = 's', name="Safari", desc="Safari"},
  {key = 'f', name="Finder", desc="Finder"},
  {key = 'w', name="Wechat", desc="微信"},
  {key = 'c', id="com.google.Chrome", desc="Chrome"},
  {key = 'y', id="com.apple.systempreferences", desc="系统设置"},
  {key = 'g', url="https://google.com", desc="Google Search"},
}


