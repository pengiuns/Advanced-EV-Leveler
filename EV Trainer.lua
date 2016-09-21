name = "Advanced EV Trainer"
author = "imMigno & SCode"

Import_Essentials = require "pathfind/Maps_Pathfind"

function onStart()
 	dofile 'config.lua'
 	dofile 'libs/logs.lua'
	dofile 'libs/KantoEvMap.lua'
 	dofile 'libs/core_functions.lua'
	dofile 'libs/path_functions.lua'
	dofile 'libs/battle_functions.lua'
	dofile 'libs/AntiBanQuestions.lua'
	
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

		if TrainHp ~= 0 then
			startTraining(Train_Hp, TrainHp, "HP", Hp)
		-- start Atk Training
		elseif TrainHp == 0 and TrainAtk ~= 0 then
			startTraining(Train_Atk, TrainAtk, "ATK", Atk)
		-- Start Def Training
		elseif TrainHp == 0 and TrainAtk == 0 and TrainDef ~= 0 then
			startTraining(Train_Def, TrainDef, "DEF", Def)
		-- Start Spd Training
		elseif TrainHp == 0 and TrainAtk == 0 and TrainDef == 0 and TrainSpd ~= 0 then
			startTraining(Train_Spd, TrainSpd, "SPD", Spd)
		-- Start SpAtk Training
		elseif TrainHp == 0 and TrainAtk == 0 and TrainDef == 0 and TrainSpd == 0 and TrainSpAtk ~= 0 then
			startTraining(Train_SpAtk, TrainSpAtk, "SPATK", SpAtk)
		-- Start SpDef Training
		elseif TrainHp == 0 and TrainAtk == 0 and TrainDef == 0 and TrainSpd == 0 and TrainSpAtk == 0 and TrainSpDef ~= 0 then
			startTraining(Train_SpDef, TrainSpDef, "SPDEF", SpDef)
		-- Finished all Trainings
		elseif TrainHp == 0 and TrainAtk == 0 and TrainDef == 0 and TrainSpd == 0 and TrainSpAtk == 0 and TrainSpDef == 0 then
			fatal("Ev Trainer | Training finished !")
			logout()
		end

end

function onBattleAction()
	
	if isTrainingMap() then
		-- start Hp Training
		if TrainHp ~= 0 then
			gainEv(Train_Hp, TrainHp, Hp)
		-- start Atk Training
		elseif TrainHp == 0 and TrainAtk ~= 0 then
			gainAtk()
		-- Start Def Training
		elseif TrainHp == 0 and TrainAtk == 0 and TrainDef ~= 0 then
			gainDef()
		-- Start Spd Training
		elseif TrainHp == 0 and TrainAtk == 0 and TrainDef == 0 and TrainSpd ~= 0 then
			gainSpd()
		-- Start SpAtk Training
		elseif TrainHp == 0 and TrainAtk == 0 and TrainDef == 0 and TrainSpd == 0 and TrainSpAtk ~= 0 then
			gainSpAtk()
		-- Start SpDef Training
		elseif TrainHp == 0 and TrainAtk == 0 and TrainDef == 0 and TrainSpd == 0 and TrainSpAtk == 0 and TrainSpDef ~= 0 then
			gainSpDef()
		-- Finished all Trainings
		elseif TrainHp == 0 and TrainAtk == 0 and TrainDef == 0 and TrainSpd == 0 and TrainSpAtk == 0 and TrainSpDef == 0 then
			fatal("Ev Trainer | Something went wrong, Try restarting the Script !")
		end
	else
		return run()
	end
	
end

function onDialogMessage(message)
	SolveDialog(message)
end

function onBattleMessage(wild)
	if stringContains(wild, "You have won the battle.") then
		log("EV Trainer | "..getPokemonName(1).." HP : "..getPokemonEffortValue(1, "HP"))
		log("EV Trainer | "..getPokemonName(1).." Atk : "..getPokemonEffortValue(1, "ATK"))
		log("EV Trainer | "..getPokemonName(1).." Def : "..getPokemonEffortValue(1, "DEF"))
		log("EV Trainer | "..getPokemonName(1).." Spd : "..getPokemonEffortValue(1, "SPD"))
		log("EV Trainer | "..getPokemonName(1).." SpAtk : "..getPokemonEffortValue(1, "SPATK"))
		log("EV Trainer | "..getPokemonName(1).." SpDef : "..getPokemonEffortValue(1, "SPDEF"))
	end
end

function onStop()
	ResetPath()
end
