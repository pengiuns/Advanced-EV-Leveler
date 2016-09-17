function gainHp()
	if getActivePokemonNumber() == 1 then
		if getOpponentName() == Hp[2][1] or getOpponentName() == Hp[2][2] then
			logging = logging - 1
			return attack() or sendUsablePokemon() or sendAnyPokemon() or run()
		else
			logging = logging - 1
			return run()
		end
	else
		return run()
	end
end