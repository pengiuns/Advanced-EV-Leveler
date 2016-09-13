-- Function to get the index of a Pokemon by its name ( for swapping ).
function pokemonNameIndex(name)
	for i = 1, getTeamSize() do
		if getPokemonName(i) == name then
			return i
		end
	end
end

-- STATS: "HP" , "ATK" , "DEF" , "SPATK" , "SPDEF" , "SPD"

-- isEvDone(Hp[1], "HP")
function isEvDone(index, stat)
	if PokemonGetEffortValue(index, stat) == 252 then
		return true
	else
		return false
	end
end

-- 2x 252 + 5 ( need recheck )
function isFullyTrained(index)
	if getPokemonEffortValue(index, "HP") + getPokemonEffortValue(index, "ATK") + getPokemonEffortValue(index, "DEF") + getPokemonEffortValue(index, "SPATK") + getPokemonEffortValue(index, "SPDEF") + getPokemonEffortValue(index, "SPD") == 509 then
		return true
	else
		return false
	end
end

-- use only onBattleAction
function isOpponentCorrect()
	
	for i=1, #trainlist[getPokemonName(getActivePokemonNumber())] do
		
		if isOpponentEffortValue(trainlist[getPokemonName(getActivePokemonNumber())]) then
			return true
		end
		
	end
	
	return false
	
end
