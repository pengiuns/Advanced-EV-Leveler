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
	if getPokemonEffortValue(index, stat) == 252 then
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


-- declaring training table
trainlist = {}
-- end declaration

-- config EV training check
function getTrainlist()
	
    	if trainSPD == true then
        	table.insert (trainlist, #trainlist+1, "SPD")
    	end
    	if trainHP == true then
        	table.insert (trainlist, #trainlist+1, "HP")
   	end
	if trainATK == true then
		table.insert (trainlist, #trainlist+1, "ATK")
	end
	if trainSPATK == true then
		table.insert (trainlist, #trainlist+1, "SPATK")
	end
	if trainSPDEF == true then
		table.insert (trainlist, #trainlist+1, "SPDEF")
	end
	if trainDEF == true then
		table.insert (trainlist, #trainlist+1, "DEF")
	end
    
end

