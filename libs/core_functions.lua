-- Function to get the index of a Pokemon by its name ( for swapping ).
function pokemonNameIndex(name)
	for i = 1, getTeamSize() do
		if getPokemonName(i) == name then
			return i
		end
	end
end

-- STATS: "HP" , "Attack" , "Defense" , "Spattack" , "Spdefense" , "Speed"

-- isEvDone(Hp[1], "HP")
function isEvDone(name, stat)
	if getPokemonEffortValue(pokemonNameIndex(name), stat) == 252 then
		return true
	else
		return false
	end
end

-- 2x 252 + 5 ( need recheck )
function isFullyTrained(name)
	if 	getPokemonEffortValue(pokemonNameIndex(name), "HP") + 
		getPokemonEffortValue(pokemonNameIndex(name), "ATK") + 
		getPokemonEffortValue(pokemonNameIndex(name), "DEF") + 
		getPokemonEffortValue(pokemonNameIndex(name), "SPATK") + 
		getPokemonEffortValue(pokemonNameIndex(name), "SPDEF") + 
		getPokemonEffortValue(pokemonNameIndex(name), "SPD") == 509 then
		return true
	else
		return false
	end
end

function isTrainingMap()
    if getMapName() == "Viridian Forest" or getMapName() == "" or getMapName() == "" or getMapName() == "" or getMapName() == "" or getMapName() =="" then
        return true
    else
        return false
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
    log("[Learned] ".. moveName)
    log("[Forgot ] ".. ForgetMoveName)
    log(" ")
    log("===========================")
    return ForgetMoveName
end
