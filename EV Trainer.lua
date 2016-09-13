name = "Advanced EV Trainer"
author = "imMigno & SCode"

Import_Essentials = require "pathfind/Maps_Pathfind"

function onStart()
 	dofile 'config.lua'
 	dofile 'libs/logs.lua'
 	dofile 'libs/EV_KantoMap.lua'
	
	log("EV Trainer | Welcome")
	getStartLogs()
	
	convertTables()

end

function onPause()
	log("EV Trainer | Paused")
end

function onResume()
	dofile 'config.lua'
	log("EV Trainer | Resumed -> Config reloaded")
end

function onPathAction()

end

function onBattleAction()
	if isOpponentCorrect() then
		return attack() or sendUsablePokemon() or run()
	end
end

function onDialogMessage(message)
	SolveDialog(message)
end

function onStop()
	ResetPath()
end
