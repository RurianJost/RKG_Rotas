local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")

oRP = {}
Tunnel.bindInterface(GetCurrentResourceName(),oRP)
vCLIENT = Tunnel.getInterface(GetCurrentResourceName())

function oRP.CheckPerm()
	local source = source
	local user_id = vRP.getUserId(source)
	for k,v in pairs(Config["Permissions"]) do
		if vRP.hasPermission(user_id,v) then
			return true
		end
	end
end

function oRP.paymentMethod(status)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.computeInvWeight(user_id) + 1 > vRP.getBackpack(user_id) then
            TriggerClientEvent("Notify",source,"negado",Config["Notify"]["BackpackFull"],5000)
            return
        end
		for k,v in pairs(Config["GiveItem"]) do
			if vRP.hasPermission(user_id, Config["Permissions"]["Bennys"]) or vRP.hasPermission(user_id, Config["Permissions"]["SportRace"]) then
				if v == Config["GiveItem"]["Mecanicas"] then
					local escolheritem = math.random(#Config["GiveItem"]["Mecanicas"])
					local nomeitem = Config["GiveItem"]["Mecanicas"][escolheritem]
					local quantityitem = Config["GiveItem"]["Mecanicas"]["Quantity"]
					vRP.giveInventoryItem(user_id,nomeitem,math.random(quantityitem[1],quantityitem[2]),true)
				end
			elseif vRP.hasPermission(user_id, Config["Permissions"]["Tequila"]) or vRP.hasPermission(user_id, Config["Permissions"]["Vanilla"]) then
				if v == Config["GiveItem"]["Bars"] then
					local escolheritem = math.random(#Config["GiveItem"]["Bars"])
					local nomeitem = Config["GiveItem"]["Bars"][escolheritem]
					local quantityitem = Config["GiveItem"]["Bars"]["Quantity"]
					vRP.giveInventoryItem(user_id,nomeitem,math.random(quantityitem[1],quantityitem[2]),true)
				end
			elseif vRP.hasPermission(user_id, Config["Permissions"]["Madrazo"]) or vRP.hasPermission(user_id, Config["Permissions"]["CosaNostra"]) then
				if v == Config["GiveItem"]["Mafias"] then
					local escolheritem = math.random(#Config["GiveItem"]["Mafias"])
					local nomeitem = Config["GiveItem"]["Mafias"][escolheritem]
					local quantityitem = Config["GiveItem"]["Mafias"]["Quantity"]
					vRP.giveInventoryItem(user_id,nomeitem,math.random(quantityitem[1],quantityitem[2]),true)
				end
			elseif vRP.hasPermission(user_id, Config["Permissions"]["TheLost"]) or vRP.hasPermission(user_id, Config["Permissions"]["YellowJack"]) then
				if v == Config["GiveItem"]["Municoes"] then
					local escolheritem = math.random(#Config["GiveItem"]["Municoes"])
					local nomeitem = Config["GiveItem"]["Municoes"][escolheritem]
					local quantityitem = Config["GiveItem"]["Municoes"]["Quantity"]
					vRP.giveInventoryItem(user_id,nomeitem,math.random(quantityitem[1],quantityitem[2]),true)
				end
			elseif vRP.hasPermission(user_id, Config["Permissions"]["Elements"]) or vRP.hasPermission(user_id, Config["Permissions"]["Furious"]) then
				if v == Config["GiveItem"]["Desmanches"] then
					local escolheritem = math.random(#Config["GiveItem"]["Desmanches"])
					local nomeitem = Config["GiveItem"]["Desmanches"][escolheritem]
					local quantityitem = Config["GiveItem"]["Desmanches"]["Quantity"]
					vRP.giveInventoryItem(user_id,nomeitem,math.random(quantityitem[1],quantityitem[2]),true)
				end
			elseif vRP.hasPermission(user_id, Config["Permissions"]["Aztecas"]) or vRP.hasPermission(user_id, Config["Permissions"]["Incas"]) then
				if v == Config["GiveItem"]["Contrabandos"] then
					local escolheritem = math.random(#Config["GiveItem"]["Contrabandos"])
					local nomeitem = Config["GiveItem"]["Contrabandos"][escolheritem]
					local quantityitem = Config["GiveItem"]["Contrabandos"]["Quantity"]
					vRP.giveInventoryItem(user_id,nomeitem,math.random(quantityitem[1],quantityitem[2]),true)
				end
			elseif vRP.hasPermission(user_id, Config["Permissions"]["Barragem"]) then
				if v == Config["GiveItem"]["Barragem"] then
					local escolheritem = math.random(#Config["GiveItem"]["Barragem"])
					local nomeitem = Config["GiveItem"]["Barragem"][escolheritem]
					local quantityitem = Config["GiveItem"]["Barragem"]["Quantity"]
					vRP.giveInventoryItem(user_id,nomeitem,math.random(quantityitem[1],quantityitem[2]),true)
				end
			elseif vRP.hasPermission(user_id, Config["Permissions"]["Observatorio"]) then
				if v == Config["GiveItem"]["Observatorio"] then
					local escolheritem = math.random(#Config["GiveItem"]["Observatorio"])
					local nomeitem = Config["GiveItem"]["Observatorio"][escolheritem]
					local quantityitem = Config["GiveItem"]["Observatorio"]["Quantity"]
					vRP.giveInventoryItem(user_id,nomeitem,math.random(quantityitem[1],quantityitem[2]),true)
				end
			elseif vRP.hasPermission(user_id, Config["Permissions"]["Catavento"]) then
				if v == Config["GiveItem"]["Catavento"] then
					local escolheritem = math.random(#Config["GiveItem"]["Catavento"])
					local nomeitem = Config["GiveItem"]["Catavento"][escolheritem]
					local quantityitem = Config["GiveItem"]["Catavento"]["Quantity"]
					vRP.giveInventoryItem(user_id,nomeitem,math.random(quantityitem[1],quantityitem[2]),true)
				end
			elseif vRP.hasPermission(user_id, Config["Permissions"]["SandyShores"]) then
				if v == Config["GiveItem"]["SandyShores"] then
					local escolheritem = math.random(#Config["GiveItem"]["SandyShores"])
					local nomeitem = Config["GiveItem"]["SandyShores"][escolheritem]
					local quantityitem = Config["GiveItem"]["SandyShores"]["Quantity"]
					vRP.giveInventoryItem(user_id,nomeitem,math.random(quantityitem[1],quantityitem[2]),true)
				end
			end
		end
		vRP.upgradeStress(user_id,1)
	end
end