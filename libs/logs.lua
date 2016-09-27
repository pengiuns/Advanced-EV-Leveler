function getStartLogs()
	if Train_Hp[1] ~= nil then
		for i = 1, #Train_Hp do
			log("EV Trainer | HP Training -> "..Train_Hp[i])
		end
	else
		log("EV Trainer | HP Training -> none")
	end

	if Train_Atk[1] ~= nil then
		for i = 1, #Train_Atk do
			log("EV Trainer | Atk Training -> "..Train_Atk[i])
		end
	else
		log("EV Trainer | Atk Training -> none")
	end

	if Train_Def[1] ~= nil then
		for i = 1, #Train_Def do
			log("EV Trainer | Def Training -> "..Train_Def[i])
		end
	else
		log("EV Trainer | Def Training -> none")
	end

	if Train_Spd[1] ~= nil then
		for i = 1, #Train_Spd do
			log("EV Trainer | Spd Training -> "..Train_Spd[i])
		end
	else
		log("EV Trainer | Spd Training -> none")
	end

	if Train_SpAtk[1] ~= nil then
		for i = 1, #Train_SpAtk do
			log("EV Trainer | SpAtk Training -> "..Train_SpAtk[i])
		end
	else
		log("EV Trainer | SpAtk Training -> none")
	end

	if Train_SpDef[1] ~= nil then
		for i = 1, #Train_SpDef do
			log("EV Trainer | SpDef Training -> "..Train_SpDef[i])
		end
	else
		log("EV Trainer | SpDef Training -> none")
	end

end