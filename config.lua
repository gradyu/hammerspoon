-- ----------------------------------------
-- Global Config
-- ----------------------------------------
-- auto reload toggle
g_auto_reload = fasle

-- ----------------------------------------
-- Sponns and modules Config
-- Note: default load as follow:
--       SpoonInstall
--       RecursiveBinder
--       ReloadConfiguration 
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
-- Modules which will be load
g_module_list = {
  "apps",
  "dirs",
  "countdown", -- require CountDown
  "system",    -- require Caffeine AClock
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
g_apps_keymap = {
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
g_dirs_keymap = {
  {key = 'h', name = "Home", path = "~"},
  {key = 'D', name = "Desktop", path = "~/Desktop"},
  {key = 'd', name = "Download", path = "~/Downloads"},
  {key = 'w', name = "Workspace", path = "~/Documents/workspace"},
  {key = 'l', name = "Library", path = "~/Library"},
}

-- ----------------------------------------
-- CountDown Maps
-- ----------------------------------------
g_count_major_key = {'c', "countdown"}
g_count_resume_pause_key = {'space', "Pause/Resume"}
g_count_keymap = {
  {key = '1', count = 5, desc="5 minutes"},
  {key = '2', count = 10, desc="10 minutes"},
  {key = '3', count = 15, desc="15 minutes"},
  {key = '4', count = 30, desc="30 minutes"},
  {key = '5', count = 45, desc="45 minutes"},
  {key = '6', count = 60, desc="60 minutes"},
  {key = '7', count = 90, desc="90 minutes"},
  {key = '8', count = 120, desc="120 minutes"},
}
-- ----------------------------------------
-- System Maps
-- ----------------------------------------
g_system_major_key = {'s', "system"}
g_system_keymap = {
  caffeine = { key = 'space', desc = "sleep toggle" },
  aclock = { key = 'return', desc = "clock" },
}

