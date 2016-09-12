function getStartLogs()
	if Train_Hp[1] ~= nil then
		for i = 1, #Train_Hp do
			log("EV Trainer | "..Train_Hp[i].." -> HP Training")
		end
	else
		log("EV Trainer | No Pomemon @ HP Training")
	end

	if Train_Atk[1] ~= nil then
		for i = 1, #Train_Atk do
			log("EV Trainer | "..Train_Atk[i].." -> ATK Training")
		end
	else
		log("EV Trainer | No Pomemon @ ATK Training")
	end

	if Train_Def[1] ~= nil then
		for i = 1, #Train_Def do
			log("EV Trainer | "..Train_Hp[i].." -> DEF Training")
		end
	else
		log("EV Trainer | No Pomemon @ DEF Training")
	end

	if Train_Spd[1] ~= nil then
		for i = 1, #Train_Spd do
			log("EV Trainer | "..Train_Spd[i].." -> SPD Training")
		end
	else
		log("EV Trainer | No Pomemon @ SPD Training")
	end

	if Train_SpAtk[1] ~= nil then
		for i = 1, #Train_SpAtk do
			log("EV Trainer | "..Train_SpAtk[i].." -> SP.ATK Training")
		end
	else
		log("EV Trainer | No Pomemon @ SP.ATK Training")
	end

	if Train_SpDef[1] ~= nil then
		for i = 1, #Train_SpDef do
			log("EV Trainer | "..Train_SpDef[i].." -> SP.DEF Training")
		end
	else
		log("EV Trainer | No Pomemon @ SP.DEF Training")
	end

end