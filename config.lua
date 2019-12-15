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
  "window",    -- require WindowGrid
}

-- ----------------------------------------
-- Top Key Maps
-- ----------------------------------------

-- hyper
g_hyper_keys = {"ctrl", "alt"}

-- reload keys
g_reload_keys = {g_hyper_keys, 'R'}

-- supervisor keys
-- g_supervisor_keys = {g_hyper_keys, 'space'}
g_supervisor_keys = {{"ctrl"}, 'space'}

-- lock screen keys
g_lock_screen_keys = {g_hyper_keys, 'L'}

-- window grid keys
g_window_grid_keys = {g_hyper_keys, ','}

-- aclock keys
g_aclock_toggle_keys = {g_hyper_keys, 'T'}

-- seal manager keys
g_seal_keys = {g_hyper_keys, 'M'}

-- hammerspoon console toggle
g_hs_console_keys = {g_hyper_keys, 'Z'}

-- hammerspoon home keys
g_hs_home_keys = {g_hyper_keys, 'H'}

-- help keys
g_help_keys = {g_hyper_keys, '/'}

-- ----------------------------------------
-- Apps Maps
-- ----------------------------------------
g_apps_major_key = {'a', "apps"}
g_apps_keymap = {
  {key = 'C', name="CleanMyMac X", desc="CleanMyMac"},
  {key = 'e', name="Emacs", desc="Emacs"},
  {key = 'f', name="Finder", desc="Finder"},
  {key = 'i', name="iTerm", desc="iTerm2"},
  {key = 's', name="Safari", desc="Safari"},
  {key = 'w', name="Wechat", desc="wechat"},
  {key = 'm', name="NeteaseMusic", desc="music"},
  {key = 'v', id="com.microsoft.VSCode", desc="vscode"},
  {key = 'c', id="com.google.Chrome", desc="Chrome"},
  {key = 'y', id="com.apple.systempreferences", desc="preferences"},
}

-- ----------------------------------------
-- Dirs Maps
-- ----------------------------------------
g_dirs_major_keys = {'d', "dirs"}
g_dirs_keymap = {
  {key = 'a', name = "Android", path = "~/Documents/workspace/android"},
  {key = 'b', name = "Blog", path = "~/Documents/workspace/blog"},
  {key = 'h', name = "Home", path = "~"},
  {key = 'D', name = "Desktop", path = "~/Desktop"},
  {key = 'd', name = "Download", path = "~/Downloads"},
  {key = 'w', name = "Workspace", path = "~/Documents/workspace"},
  {key = 'l', name = "Library", path = "~/Library"},
  {key = 'p', name = "Dropbox", path = "~/Documents/Dropbox"},
  {key = 'o', name = "Org", path = "~/Documents/Dropbox/Grady-RMBP/org"}
}

-- ----------------------------------------
-- CountDown Maps
-- ----------------------------------------
g_count_major_keys = {'c', "countdown"}
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
g_system_major_keys = {'s', "system"}
g_system_keymap = {
  caffeine = { key = 'space', desc = "sleep toggle" },
  aclock = { key = 'return', desc = "clock" },
  funcs = {
    { key = 'h', fn = "funcs.showHammerspoonHome", desc = "hsp home" },
    { key = 'z', fn = "funcs.toggleConsole", desc = "hsp console" },
    { key = 'c', fn = "funcs.clearConsole", desc = "clear console" },
    { key = 'l', fn = "funcs.systemLockSreen", desc = "lock screen" },
    { key = 'f', fn = "funcs.systemRestart", desc = "restart" },
  }
}
-- ----------------------------------------
-- Window Maps
-- ---------------------------------------
g_window_major_keys = {'w', "window"}
g_window_keymap = {
  wingrid = { k = 'g', desc = "windows grid" },
  winmgr = {
    { key = 'h', method = "leftHalf", desc = "left half" },
    { key = 'l', method = "rightHalf", desc = "right half" },
    { key = 'k', method = "topHalf", desc = "top half" },
    { key = 'j', method = "bottomHalf", desc = "bottom half" },
    { key = 'H', method = "thirdLeft", desc = "left third" },
    { key = 'L', method = "thirdRight", desc = "right third" },
    { key = 'K', method = "thirdUp", desc = "top third" },
    { key = 'J', method = "thirdDown", desc = "bottom third" },
    { key = 'm', method = "toggleMaximized", desc = "toggle maximized" },
    { key = 'c', method = "center", desc = "center" },
    { key = 'z', method = "undo", desc = "undo" },
  }
}

