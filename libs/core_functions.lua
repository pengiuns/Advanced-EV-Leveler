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
if #Train_Hp != 0 then
	for i=1, #Train_Hp do
		name = Train_Hp[i]
		trainlist[name] = {}
	end
end
if #Train_Spd != 0 then
	for i=1, #Train_Spd do
		name = Train_Spd[i]
		trainlist[name] = {}
	end
end

if #Train_Atk != 0 then
	for i=1, #Train_Atk do
		name = Train_Atk[i]
		trainlist[name] = {}
	end
end

if #Train_Def != 0 then
	for i=1, #Train_Def do
		name = Train_Def[i]
		trainlist[name] = {}
	end
end

if #Train_SpAtk != 0 then
	for i=1, #Train_SpAtk do
		name = Train_SpAtk[i]
		trainlist[name] = {}
	end
end

if #Train_SpDef != 0 then
	for i=1, #Train_SpDef do
		name = Train_SpDef[i]
		trainlist[name] = {}
	end
end

-- end declare

-- converting config to training table's keys and values
function convertTables()

	for i=1, #Train_Hp do
		table.insert (trainlist[Train_Hp[i]], "HP")
		
	end
	
	for i=1, #Train_Atk do
	
		table.insert (trainlist[Train_Hp[i]], "Attack")
		
	end
	
	for i=1, #Train_Def do
	
		table.insert (trainlist[Train_Hp[i]], "Defense")
		
	end
	
	for i=1, #Train_Spd do
	
		table.insert (trainlist[Train_Hp[i]], "Speed")
		
	end

	for i=1, #Train_SpAtk do
	
		table.insert (trainlist[Train_Hp[i]], "Spattack")
		
	end

	for i=1, #Train_SpDef do
	
		table.insert (trainlist[Train_Hp[i]], "Spdefense")
		
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
