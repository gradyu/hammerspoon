-- ----------------------------------------
-- Global Config
-- ----------------------------------------
-- auto reload toggle
g_auto_reload = fasle

-- ----------------------------------------
-- Sponns Config
-- Note: SpoonInstall, ReloadConfiguration 
--       and RecursiveBinder default to load 
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
-- Apps Maps
-- ----------------------------------------
g_apps_major_key = {'a', "apps"}
g_apps_list = {
  {key = 'e', name="Emacs", desc="Emacs"},
  {key = 'f', name="Finder", desc="Finder"},
  {key = 'i', name="iTerm", desc="iTerm2"},
  {key = 's', name="Safari", desc="Safari"},
  {key = 'w', name="Wechat", desc="微信"},
  {key = 'c', id="com.google.Chrome", desc="Chrome"},
  {key = 'y', id="com.apple.systempreferences", desc="系统设置"},
  {key = 'g', url="https://google.com", desc="Google Search"},
}

-- ----------------------------------------
-- Dirs Maps
-- ----------------------------------------
g_dirs_major_key = {'d', "dirs"}
g_dirs_list = {
  {key = 'h', name = "Home", path = "~"},
  {key = 'D', name = "Desktop", path = "~/Desktop"},
  {key = 'd', name = "Download", path = "~/Downloads"},
  {key = 'w', name = "Workspace", path = "~/Documents/workspace"},
  {key = 'l', name = "Library", path = "~/Library"},
}
