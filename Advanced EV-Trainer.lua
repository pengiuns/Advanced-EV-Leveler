name = "Advanced EV-Trainer"
author = "imMigno & SCode"

function onStart()

	dofile 'lib/system.lua'
	dofile 'config.lua'
	dofile 'lib/evMap.lua'

	TrainHp 		= #Hp_Training
	TrainAtk 		= #Atk_Training
	TrainDef 		= #Def_Training
	TrainSpd 		= #Spd_Training
	TrainSpAtk	 	= #SpAtk_Training
	TrainSpDef	 	= #SpDef_Training

	log("EV Trainer | Version 1.0 Release")
	getStartLogs()

end

function onPathAction()

		if TrainHp ~= 0 then
			startTraining(Hp_Training, TrainHp, "HP", Hp)
		-- start Atk Training
		elseif TrainHp == 0 and TrainAtk ~= 0 then
			startTraining(Atk_Training, TrainAtk, "ATK", Atk)
		-- Start Def Training
		elseif TrainHp == 0 and TrainAtk == 0 and TrainDef ~= 0 then
			startTraining(Def_Training, TrainDef, "DEF", Def)
		-- Start Spd Training
		elseif TrainHp == 0 and TrainAtk == 0 and TrainDef == 0 and TrainSpd ~= 0 then
			startTraining(Spd_Training, TrainSpd, "SPD", Spd)
		-- Start SpAtk Training
		elseif TrainHp == 0 and TrainAtk == 0 and TrainDef == 0 and TrainSpd == 0 and TrainSpAtk ~= 0 then
			startTraining(SpAtk_Training, TrainSpAtk, "SPATK", SpAtk)
		-- Start SpDef Training
		elseif TrainHp == 0 and TrainAtk == 0 and TrainDef == 0 and TrainSpd == 0 and TrainSpAtk == 0 and TrainSpDef ~= 0 then
			startTraining(SpDef_Training, TrainSpDef, "SPDEF", SpDef)
		-- Finished all Trainings
		elseif TrainHp == 0 and TrainAtk == 0 and TrainDef == 0 and TrainSpd == 0 and TrainSpAtk == 0 and TrainSpDef == 0 then
			fatal("Ev Trainer | Training finished !")
			logout()
		end

end

function onBattleAction()
	
		-- start Hp Training
		if TrainHp ~= 0 then
			gainEv(Hp_Training, TrainHp, Hp)
		-- start Atk Training
		elseif TrainHp == 0 and TrainAtk ~= 0 then
			gainEv(Atk_Training, TrainAtk, Atk)
		-- Start Def Training
		elseif TrainHp == 0 and TrainAtk == 0 and TrainDef ~= 0 then
			gainEv(Def_Training, TrainDef, Def)
		-- Start Spd Training
		elseif TrainHp == 0 and TrainAtk == 0 and TrainDef == 0 and TrainSpd ~= 0 then
			gainEv(Spd_Training, TrainSpd, Spd)
		-- Start SpAtk Training
		elseif TrainHp == 0 and TrainAtk == 0 and TrainDef == 0 and TrainSpd == 0 and TrainSpAtk ~= 0 then
			gainEv(SpAtk_Training, TrainSpAtk, SpAtk)
		-- Start SpDef Training
		elseif TrainHp == 0 and TrainAtk == 0 and TrainDef == 0 and TrainSpd == 0 and TrainSpAtk == 0 and TrainSpDef ~= 0 then
			gainEv(SpDef_Training, TrainSpDef, SpDef)
		-- Finished all Trainings
		elseif TrainHp == 0 and TrainAtk == 0 and TrainDef == 0 and TrainSpd == 0 and TrainSpAtk == 0 and TrainSpDef == 0 then
			fatal("Ev Trainer | Something went wrong, Try restarting the Script !")
		end
	
end

function onBattleMessage(wild)
	if stringContains(wild, "You have won the battle.") then
		log("EV Trainer | "..getPokemonName(1).." HP : "..getPokemonEffortValue(1, "HP"))
		log("EV Trainer | "..getPokemonName(1).." Atk : "..getPokemonEffortValue(1, "ATK"))
		log("EV Trainer | "..getPokemonName(1).." Def : "..getPokemonEffortValue(1, "DEF"))
		log("EV Trainer | "..getPokemonName(1).." Spd : "..getPokemonEffortValue(1, "SPD"))
		log("EV Trainer | "..getPokemonName(1).." SpAtk : "..getPokemonEffortValue(1, "SPATK"))
		log("EV Trainer | "..getPokemonName(1).." SpDef : "..getPokemonEffortValue(1, "SPDEF"))
		if useSound == true then
			playSound("sounds/"..getPokemonEffortValue(1, 'HP')..".mp3")
		end
	end

	if stringContains(wild, getPokemonName(1).." has fainted!") then
		log("EV Trainer | "..getPokemonName(1).." has fainted -> Resetting Path !")
		ResetPath()
	end
end