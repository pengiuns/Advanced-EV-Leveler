function isOpponentCorrect(EvShort)
    for i = 1 , #EvShort[2] do
        if getOpponentName() == EvShort[2][i] then
            return true
        end
    end
    return false
end

function gainEv(EvTable, EvCount, EvShort)
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