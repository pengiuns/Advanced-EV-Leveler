-- Kanto: EV Map

Hp = {"Viridian Forest", {"Poke1", "Poke2", "Poke3", "and so on"}}
Atk = {"Route 12", {}}
Def = {"", {}}
Spd = {"", {}}
SpAtk = {"", {}}
SpDef = {"", {}}


function doesEffort(EVtype)
	for i = 1, #EVType[2] do
		if getOpponentName() == EVType[2][i] then
			return true
		else
			return false
		end
	end
end