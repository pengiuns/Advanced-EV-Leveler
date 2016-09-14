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

