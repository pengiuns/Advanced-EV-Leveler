name = "Advanced EV Trainer"
author = "imMigno & SCode"

Import_Essentials = require "pathfind/Maps_Pathfind"

function onStart()
 	dofile 'config.lua'
 	dofile 'libs/logs.lua'

	log("EV Trainer | Welcome")
	getStartLogs()

end

function onPause()

end

function onResume()
	dofile 'config.lua'
end

function onPathAction()

end

function onBattleAction()

end

function onDialogMessage(message)
	SolveDialog(message)
end

function onStop()
	ResetPath()
end