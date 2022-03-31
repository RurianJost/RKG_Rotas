local oRP = {}
Tunnel.bindInterface("RKG_Main:Rotas",oRP)
local vCLIENT = Tunnel.getInterface("RKG_Main:Rotas")

function oRP.CheckPerm(org_name)
	local source = source
	local user_id = vRP.getUserId(source)
	local org_perm = Config_Rotas.Orgs[org_name]["Perm"]
	if user_id then
		if vRP.hasPermission(user_id,org_perm) then
			return true
		end
	end
end

function oRP.paymentMethod(org_name)
	local source = source
	local user_id = vRP.getUserId(source)
	local orgs_itens = Config_Rotas.Orgs[org_name]["Itens"]
	if user_id then
		if Config_Rotas.Creative then
			if vRP.computeInvWeight(user_id) + 1 > vRP.getBackpack(user_id) then
				TriggerClientEvent("Notify",source,"negado",Config_Rotas.Notify.BackpackFull,5000)
				return
			end
			for k,v in pairs(orgs_itens) do
				local random_item = math.random(#orgs_itens)
				local name_item = orgs_itens[random_item]
				local amount_item = orgs_itens.Quantity
				vRP.giveInventoryItem(user_id,name_item,math.random(amount_item[1],amount_item[2]),true)
				return
			end
		else
			if vRP.getInventoryWeight(user_id) + 1 > vRP.getInventoryMaxWeight(user_id) then
				TriggerClientEvent("Notify",source,"negado",Config_Rotas.Notify.BackpackFull,5000)
				return
			end
			for k,v in pairs(orgs_itens) do
				local random_item = math.random(#orgs_itens)
				local name_item = orgs_itens[random_item]
				local amount_item = orgs_itens.Quantity
				vRP.giveInventoryItem(user_id,name_item,math.random(amount_item[1],amount_item[2]))
				return
			end
		end
	end
end
