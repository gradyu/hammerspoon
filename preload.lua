-- The default duration for animations, in seconds. Initial value is 0.2; set to 0 to disable animations.
hs.window.animationDuration = 0.2

-- persist console history across launches
hs.shutdownCallback = function() hs.settings.set('history', hs.console.getHistory()) end
hs.console.setHistory(hs.settings.get('history') or {})

-- hotkey logge info too much
hs.hotkey.setLogLevel("warning")

-- ensure CLI installed
hs.ipc.cliInstall()

