name = "Advanced EV Trainer"
author = "imMigno & SCode"

Import_Essentials = require "pathfind/Maps_Pathfind"

function onStart()
 	dofile 'config.lua'
 	dofile 'libs/logs.lua'
 	dofile 'libs/core_functions.lua'
	
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
	if isPokemonUsable(1) then
        if not isTrainingMap() then
        	if trainlist[getPokemonName(1)][1] == "Hp" then
            	moveTo("Virdian Forest")
        	elseif trainlist[getPokemonName(1)][1] == "Atk" then
            	moveTo(Atk[1])
            elseif trainlist[getPokemonName(1)][1] == "Def" then
            	moveTo(Def[1])
            elseif trainlist[getPokemonName(1)][1] == "Spd" then
            	moveTo(Spd[1])
            elseif trainlist[getPokemonName(1)][1] == "SpAtk" then
            	moveTo(SpAtk[1])
            elseif trainlist[getPokemonName(1)][1] == "SpDef" then
            	moveTo(SpDef[1])
            end
        end -- etc etc
    end
end

function onBattleAction()
	if isOpponentCorrect() then
		return attack() or sendUsablePokemon() or run()
	else
		return run() or sendUsablePokemon()
	end
end

function onDialogMessage(message)
	SolveDialog(message)
end

function onStop()
	ResetPath()
end
