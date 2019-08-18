
funcs = {}

function funcs.showHammerspoonHome()
  hs.doc.hsdocs.forceExternalBrowser(true)
  hs.doc.hsdocs.moduleEntitiesInSidebar(true)
  hs.doc.hsdocs.help()
end

function funcs.systemLockSreen()
  hs.caffeinate.lockScreen()
end

function funcs.systemRestart()
  hs.caffeinate.restartSystem()
end


function funcs.toggleConsole()
  hs.toggleConsole()
end

function funcs.clearConsole()
  hs.console.clearConsole()
end


