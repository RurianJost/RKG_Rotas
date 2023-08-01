local Tunnel = module('vrp', 'lib/Tunnel')

api = {}
Tunnel.bindInterface('RKG_Rotas', api)

function api.checkPermission(permission)
	local source = source

	return serverConfig.userHasPermissionToStartRoute(source, permission)
end

function api.giveRouteItems(routeName)
	local source = source
	local selectedRoute = CONFIG.ROUTES[routeName]
	
	if selectedRoute then
		local routeItems = selectedRoute.ITEMS
		
		if selectedRoute.RANDOM_ITEMS then
			local selectedItem = math.random(#routeItems)
			
			local itemName = routeItems[selectedItem].NAME
			local itemAmount = math.random(routeItems[selectedItem].MINIMUM, routeItems[selectedItem].MAXIMUM)
			
			if serverConfig.userHasSpaceInBackpack(source, itemName, itemAmount) then
				serverConfig.giveInventoryItem(source, itemName, itemAmount)
			end
		else
			for _, routeItem in pairs(routeItems) do
				local itemAmount = math.random(routeItem.MINIMUM, routeItem.MAXIMUM)
				
				if serverConfig.userHasSpaceInBackpack(source, routeItem.NAME, itemAmount) then
					serverConfig.giveInventoryItem(source, routeItem.NAME, itemAmount)
				end
			end
		end
	end
end