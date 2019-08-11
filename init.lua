require "preload"

local modal = require "modal"

hs.hints.style           = "vimperator"
hs.hints.showTitleThresh = 4
hs.hints.titleMaxSize    = 10
hs.hints.fontSize        = 30

require("windows").addState(modal)

local stateMachine = modal.createMachine()
stateMachine:toMain()

hs.alert.show("Hammerspoon config loaded")