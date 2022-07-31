local oRP = {}
Tunnel.bindInterface("RKG_Main:Rotas",oRP)
local vCLIENT = Tunnel.getInterface("RKG_Main:Rotas")
--------------------------------
-- Check Permission
--------------------------------
function oRP.checkPermission(permission)
	local user_id = SV_Config.getUserId(source)
	if type(permission) == "table" then
		for k,v in ipairs(permission) do
			if SV_Config.hasPermission(user_id,v) then
				return true
			end
		end
		return false
	else
		if SV_Config.hasPermission(user_id,permission) then
			return true
		end
		return false
	end
end
--------------------------------
-- Recive Itens
--------------------------------
function oRP.receiveItems(org_name)
	local user_id = SV_Config.getUserId(source)
	local selected_org = Config.Orgs[org_name]
	local selected_itens = selected_org.Itens
	if user_id then
		if selected_org.RandomItens then
			local random_item = math.random(#selected_itens)
			local name_item = selected_itens[random_item].name
			local random = math.random(selected_itens[random_item].min,selected_itens[random_item].max)
			if returnBackPackItem(user_id,name_item) then
				SV_Config.giveInventoryItem(user_id,name_item,random)
			end
		else
			for k,v in pairs(selected_itens) do
				local random = math.random(v.min,v.max)
				if returnBackPackItem(user_id,v.name) then
					SV_Config.giveInventoryItem(user_id,v.name,random)
				end
			end
		end
	end
end
--------------------------------
-- Return Back Pack item
--------------------------------
function returnBackPackItem(user_id,item)
	if SV_Config.getInventoryWeight(user_id) + SV_Config.getItemWeight(item) > SV_Config.getInventoryMaxWeight(user_id) then
		TriggerClientEvent("Notify",source,"denied",Config.Notify.BackpackFull,5000)
		return false
	end
	return true
end