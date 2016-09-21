function startTraining(EvTable, EvCount, EvName, EvShort)
	if isPokemonUsable(1) then
		if getPokemonName(1) ~= EvTable[EvCount] then
			swapPokemonWithLeader(EvTable[EvCount])
		elseif getPokemonName(1) == EvTable[EvCount] and not isEvDone(EvName) then
			if getMapName() ~= EvShort[1] then
				MoveTo(EvShort[1])
			else
				ResetPath()
				moveToGrass()
			end
		elseif getPokemonName(1) == EvTable[EvCount] and isEvDone(EvName) then
			EvCount = EvCount - 1
		end
	else
		if getMapName() ~= EvShort[3] then
			MoveTo(EvShort[3])
		else
			ResetPath()
			usePokecenter()
		end
	end
end