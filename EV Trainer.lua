name = "Advanced EV Trainer"
author = "imMigno & SCode"

Import_Essentials = require "pathfind/Maps_Pathfind"

function onStart()
 	dofile 'config.lua'
 	dofile 'libs/logs.lua'
	dofile 'libs/KantoEvMap.lua'
 	dofile 'libs/core_functions.lua'
	dofile 'libs/path_functions.lua'
	
	log("EV Trainer | Welcome")
	getStartLogs()
	
	-- Overall PokemonToTrainCounter
	TrainHp = #Train_Hp
	TrainAtk = #Train_Atk
	TrainDef = #Train_Def
	TrainSpd = #Train_Spd
	TrainSpAtk = #Train_SpAtk
	TrainSpDef = #Train_SpDef

end

function onPause()
	log("EV Trainer | Paused")
end

function onResume()
	dofile 'config.lua'
	log("EV Trainer | Resumed -> Config reloaded")
end

function onPathAction()
	-- start Hp Training
	if TrainHp ~= 0 then
		startHpTraining()
	-- start Atk Training
	elseif TrainHp == 0 and TrainAtk ~= 0 then
		startAtkTraining()
	-- Start Def Training
	elseif TrainHp == 0 and TrainAtk == 0 and TrainDef ~= 0 then
		startDefTraining()
	-- Start Spd Training
	elseif TrainHp == 0 and TrainAtk == 0 and TrainDef == 0 and TrainSpd ~= 0 then
		startSpdTraining()
	-- Start SpAtk Training
	elseif TrainHp == 0 and TrainAtk == 0 and TrainDef == 0 and TrainSpd == 0 and TrainSpAtk ~= 0 then
		startSpAtkTraining()
	-- Start SpDef Training
	elseif TrainHp == 0 and TrainAtk == 0 and TrainDef == 0 and TrainSpd == 0 and TrainSpAtk == 0 and TrainSpDef ~= 0 then
		startSpDefTraining()
	-- Finished all Trainings
	elseif TrainHp == 0 and TrainAtk == 0 and TrainDef == 0 and TrainSpd == 0 and TrainSpAtk == 0 and TrainSpDef == 0 then
		fatal("Ev Trainer | Training finished !")
	end
end

function onBattleAction()
	
	if isPokemonUsable(1) then
		if isTrainingMap() then
			logging = loggin - 1
			-- Battle conditions for specific EV Type
		else
			return run()
		end
	else
		return run() or sendUsablePokemon() or sendAnyPokemon()
	end
	
end

function onDialogMessage(message)
	SolveDialog(message)
end

function onStop()
	ResetPath()
end
