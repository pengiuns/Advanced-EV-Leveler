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


-- start declare
trainlist = {}
for i=1, #Train_Hp do
	name = Train_Hp[i]
	trainlist[name] = {}
end
-- end declare

-- converting config to training table's keys and values
function convertTables()

	for i=1, #Train_Hp do
		table.insert (trainlist[Train_Hp[i]], #trainlist+1, "HP")
		
	end
	
	for i=1, #Train_Atk do
	
		table.insert (trainlist[Train_Hp[i]], #trainlist+1, "Attack")
		
	end
	
	for i=1, #Train_Def do
	
		table.insert (trainlist[Train_Hp[i]], #trainlist+1, "Defense")
		
	end
	
	for i=1, #Train_Spd do
	
		table.insert (trainlist[Train_Hp[i]], #trainlist+1, "Speed")
		
	end

	for i=1, #Train_SpAtk do
	
		table.insert (trainlist[Train_Hp[i]], #trainlist+1, "Spattack")
		
	end

	for i=1, #Train_SpDef do
	
		table.insert (trainlist[Train_Hp[i]], #trainlist+1, "Spdefense")
		
	end
	
end


function getTrainlist(name)
	EVtrain = {}
	for i=1, #trainlist[name] do
		
		EVtrain[i] = trainlist[name][i]
		
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
