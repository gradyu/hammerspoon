-- The default duration for animations
hs.window.animationDuration = 0.2

-- auto reload config
configFileWatcher =
  hs.pathwatcher.new(hs.configdir, function (files)
                       local isLuaFileChange = hs.fnutils.some(files, function(p)
                                                                 return hs.fnutils.contains(hs.fnutils.split(p, "%p"), "lua")
                       end)
                       if isLuaFileChange then
                         hs.reload()
                       end
  end):start()

-- persist console history across launches
hs.shutdownCallback = function() hs.settings.set('history', hs.console.getHistory()) end
hs.console.setHistory(hs.settings.get('history') or {})

-- ensure CLI installed
hs.ipc.cliInstall()
