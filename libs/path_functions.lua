function startTraining(EvTable, EvCount, EvName, EvShort)
	if isPokemonUsable(1) then
		if getPokemonName(1) ~= EvTable[EvCount] then
			swapPokemonWithLeader(EvTable[EvCount])
		elseif getPokemonName(1) == EvTable[EvCount] and not isEvDone(EvName) then
			if getMapName() ~= EvShort[1] then
				ResetPath()
				MoveTo(EvShort[1])
			else
				if getMapName() == "Digletts Cave Entrance 2" then
					moveToRectangle(17, 23, 25, 27)
				elseif getMapName() == "Route 19" then
					moveToWater()
				else
					moveToGrass()
				end
			end
		elseif getPokemonName(1) == EvTable[EvCount] and isEvDone(EvName) then
			EvCount = EvCount - 1
		end
	else
		if getMapName() ~= EvShort[3] then
			ResetPath()
			MoveTo(EvShort[3])
		else
			usePokecenter()
			ResetPath()
		end
	end
end