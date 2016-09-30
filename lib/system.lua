local PathFinder = require "Pathfinder/Maps_Pathfind"

function onStart()
	PathFinder.DisableDigPath()
end

-- Return index from PokemonName
function getPokemonNameIndex(name)
	for i = 1, getTeamSize() do
		if getPokemonName(i) == name then
			return i
		end
	end
end

-- Return true/false if EV is maxed or not
function isEvDone(ev)
	if getPokemonEffortValue(1, ev) >= 252 then
		return true
	else
		return false
	end
end

function isFullyTrained(index)
	if getPokemonEffortValue(index, "HP") + getPokemonEffortValue(index, "ATK") + getPokemonEffortValue(index, "DEF") + getPokemonEffortValue(index, "SPATK") + getPokemonEffortValue(index, "SPDEF") + getPokemonEffortValue(index, "SPD") == 510 then
		return true
	else
		return false
	end
end

function isOpponentCorrect(EvShort)
    for i = 1 , #EvShort[2] do
        if getOpponentName() == EvShort[2][i] then
            return true
        end
    end
    return false
end

function gainEv(EvShort)
	if getActivePokemonNumber() == 1 then
		if isOpponentCorrect(EvShort) then
			return attack() or sendUsablePokemon() or sendAnyPokemon() or run()
		else
			return run() or sendUsablePokemon() or sendAnyPokemon()
		end
	else
		return run() or sendUsablePokemon() or sendAnyPokemon()
	end
end

function onLearningMove(moveName, pokemonIndex)
    local ForgetMoveName
    local ForgetMoveTP = 9999
    for moveId=1, 4, 1 do
        local MoveName = getPokemonMoveName(pokemonIndex, moveId)
        if MoveName == nil or MoveName == "cut" or MoveName == "surf" or MoveName == "rock smash" or MoveName == "rocksmash" then
        else
        local CalcMoveTP = math.modf((getPokemonMaxPowerPoints(pokemonIndex,moveId) * getPokemonMovePower(pokemonIndex,moveId))*(math.abs(getPokemonMoveAccuracy(pokemonIndex,moveId)) / 100))
            if CalcMoveTP < ForgetMoveTP then
                ForgetMoveTP = CalcMoveTP
                ForgetMoveName = MoveName
            end
        end
    end
    log("==== Learning new Move ====")
    log(" ")
    log("[ Learned -> ] ".. moveName)
    log("[ Forgot  -> ] ".. ForgetMoveName)
    log(" ")
    log("========================")
    return ForgetMoveName
end

function getHealed()
	if stringContains(getMapName(), "Pokecenter") then
		usePokecenter()
	else
		PathFinder.MoveToPC()
	end
end

function getLevelSpot(EvShort)
	if EvShort[3][1] == "Grass" then
		moveToGrass()
	elseif EvShort[3][1] == "Water" then
		moveToWater()
	else
		moveToRectangle(EvShort[3][1], EvShort[3][2], EvShort[3][3], EvShort[3][4])
	end
end

function startTraining(EvTable, EvName, EvShort)
	if isPokemonUsable(1) then
		if getPokemonName(1) ~= EvTable[1] then
			swapPokemonWithLeader(EvTable[1])
		elseif getPokemonName(1) == EvTable[1] and not isEvDone(EvName) then
			if getMapName() ~= EvShort[1] then
				PathFinder.MoveTo(EvShort[1])
			else
				getLevelSpot(EvShort)
			end
		elseif getPokemonName(1) == EvTable[1] and isEvDone(EvName) then
			log("EV Trainer | "..getPokemonName(1).." finished "..EvName.."-Training !")
			table.remove(EvTable, 1)
		end
	else
		getHealed()
	end
end

function getStartLogs()
	if Hp_Training[1] then
		for i = 1, #Hp_Training do
			log("EV Trainer | HP Training -> "..Hp_Training[i])
		end
	end

	if Atk_Training[1] then
		for i = 1, #Atk_Training do
			log("EV Trainer | Atk Training -> "..Atk_Training[i])
		end
	end

	if Def_Training[1] then
		for i = 1, #Def_Training do
			log("EV Trainer | Def Training -> "..Def_Training[i])
		end
	end

	if Spd_Training[1] then
		for i = 1, #Spd_Training  do
			log("EV Trainer | Spd Training -> "..Spd_Training[i])
		end
	end

	if SpAtk_Training[1] then
		for i = 1, #SpAtk_Training do
			log("EV Trainer | SpAtk Training -> "..SpAtk_Training[i])
		end
	end

	if SpDef_Training[1] then
		for i = 1, #SpDef_Training do
			log("EV Trainer | SpDef Training -> "..SpDef_Training[i])
		end
	end

end