function gainHp()
	if getActivePokemonNumber() == 1 then
		if getOpponentName() == Hp[2][1] or getOpponentName() == Hp[2][2] then
			return attack() or sendUsablePokemon() or sendAnyPokemon() or run()
		else
			return run()
		end
	else
		return run()
	end
end

function isOpponentCorrect(EvShort)
    for i = 1 , #EvShort[2] do
        if getOpponentName() == EvShort[2][i] then
            return true
        else
            return false
        end
    end
end

function gainEv(EvTable, EvCount, EvShort)
	if getActivePokemonNumber() == pokemonNameIndex(EvTable[EvCount]) then
		if isOpponentCorrect(EvShort) then
			return attack() or sendUsablePokemon() or sendAnyPokemon() or run()
		else
			return run() or sendUsablePokemon() or sendAnyPokemon()
		end
	else
		return run() or sendUsablePokemon() or sendAnyPokemon()
	end
end