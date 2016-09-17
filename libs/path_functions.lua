logging = 0

function startHpTraining()
	if getPokemonName(1) ~= Train_Hp[TrainHp] then
		swapPokemonWithLeader(Train_Hp[TrainHp])
	elseif getPokemonName(1) == Train_Hp[TrainHp] and not isEvDone(getPokemonName(1), "HP") then
		if getMapName() ~= Hp[1] then
			MoveTo(Hp[1])
		else
			if logging == 0 then
				log("EV Trainer | Current HP-EV Value: "..getPokemonEffortValue(1, "HP"))
				logging = logging + 1
				moveToGrass()
			else
				moveToGrass()
			end
		end
	elseif getPokemonName(1) == Train_Hp[TrainHp] and isEvDone(TrainHp, "HP") then
		TrainHp = TrainHp - 1
	end
end

function startAtkTraining()
	if getPokemonName(1) ~= Train_Atk[TrainAtk] then
		swapPokemonWithLeader(Train_Atk[TrainAtk])
	elseif getPokemonName(1) == Train_Atk[TrainAtk] and not isEvDone(getPokemonName(1), "Attack") then
		if getMapName() ~= Atk[1] then
			MoveTo(Atk[1])
		else
			if logging == 0 then
				log("EV Trainer | Current ATK-EV Value: "..getPokemonEffortValue(1, "Attack"))
				logging = logging + 1
				moveToGrass()
			else
				moveToGrass()
			end
		end
	elseif getPokemonName(1) == Train_Atk[TrainAtk] and isEvDone(TrainAtk, "Attack") then
		TrainAtk = TrainAtk - 1
	end
end

function startDefTraining()
	if getPokemonName(1) ~= Train_Def[TrainDef] then
		swapPokemonWithLeader(Train_Def[TrainDef])
	elseif getPokemonName(1) == Train_Def[TrainDef] and not isEvDone(getPokemonName(1), "Defense") then
		if getMapName() ~= Def[1] then
			MoveTo(Def[1])
		else
			if logging == 0 then
				log("EV Trainer | Current DEF-EV Value: "..getPokemonEffortValue(1, "Defense"))
				logging = logging + 1
				moveToGrass()
			else
				moveToGrass()
			end
		end
	elseif getPokemonName(1) == Train_Def[TrainDef] and isEvDone(TrainDef, "Defense") then
		TrainDef = TrainDef - 1
	end
end

function startSpdTraining()
	if getPokemonName(1) ~= Train_Spd[TrainSpd] then
		swapPokemonWithLeader(Train_Spd[TrainSpd])
	elseif getPokemonName(1) == Train_Spd[TrainSpd] and not isEvDone(getPokemonName(1), "Speed") then
		if getMapName() ~= Spd[1] then
			MoveTo(Spd[1])
		else
			if logging == 0 then
				log("EV Trainer | Current SPD-EV Value: "..getPokemonEffortValue(1, "Speed"))
				logging = logging + 1
				moveToGrass()
			else
				moveToGrass()
			end
		end
	elseif getPokemonName(1) == Train_Spd[TrainSpd] and isEvDone(TrainSpd, "Speed") then
		TrainSpd = TrainSpd - 1
	end
end

function startSpAtkTraining()
	if getPokemonName(1) ~= Train_SpAtk[TrainSpAtk] then
		swapPokemonWithLeader(Train_SpAtk[TrainSpAtk])
	elseif getPokemonName(1) == Train_SpAtk[TrainSpAtk] and not isEvDone(getPokemonName(1), "Spattack") then
		if getMapName() ~= SpAtk[1] then
			MoveTo(SpAtk[1])
		else
			if logging == 0 then
				log("EV Trainer | Current SpATK-EV Value: "..getPokemonEffortValue(1, "Spattack"))
				logging = logging + 1
				moveToGrass()
			else
				moveToGrass()
			end
		end
	elseif getPokemonName(1) == Train_SpAtk[TrainSpAtk] and isEvDone(TrainSpAtk, "Spattack") then
		TrainSpAtk = TrainSpAtk - 1
	end
end

function startSpDefTraining()
	if getPokemonName(1) ~= Train_SpDef[TrainSpDef] then
		swapPokemonWithLeader(Train_SpDef[TrainSpDef])
	elseif getPokemonName(1) == Train_SpDef[TrainSpDef] and not isEvDone(getPokemonName(1), "Spdefense") then
		if getMapName() ~= SpDef[1] then
			MoveTo(SpDef[1])
		else
			if logging == 0 then
				log("EV Trainer | Current SpDef-EV Value: "..getPokemonEffortValue(1, "Spdefense"))
				logging = logging + 1
				moveToGrass()
			else
				moveToGrass()
			end
		end
	elseif getPokemonName(1) == Train_SpDef[TrainSpDef] and isEvDone(TrainSpDef, "Spdefense") then
		TrainSpDef = TrainSpDef - 1
	end
end