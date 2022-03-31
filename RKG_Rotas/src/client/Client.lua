local oRP = {}
Tunnel.bindInterface("RKG_Main:Rotas",oRP)
local vSERVER = Tunnel.getInterface("RKG_Main:Rotas")

local blip = nil
local in_service = false
local route_name = nil
local position = 1
local time_seconds = 0

Citizen.CreateThread(function()
    while true do
        local timeDistance = 1000
        if not in_service then
            for k,v in pairs(Config_Rotas.Orgs) do
                local ped = PlayerPedId()
                local coords = GetEntityCoords(ped)
                local distance = #(coords - v.Locale)
                if distance <= 10 then
                    timeDistance = 4
                    DrawMarker(21,v.Locale.x,v.Locale.y,v.Locale.z - 0.60,0,0,0,0.0,0,0,0.5,0.5,0.4,255,0,0,50,0,0,0,1)
                    if distance <= 2 then
                        if IsControlJustPressed(1,38) and vSERVER.CheckPerm(k) and not IsPedInAnyVehicle(ped) and GetEntityHealth(ped) > 101 then
                            in_service = true
                            blip_rotas = v.BlipRoutes
                            position = 1
                            route_name = k
                            MakeBlipsPosition(blip_rotas,position)
                            TriggerEvent("Notify","sucesso",Config_Rotas.Notify.StartRoute)
                        end
                    end
                end
            end
        end
        Citizen.Wait(timeDistance)
    end
end)

Citizen.CreateThread(function()
    while true do
        local timeDistance = 1000
        if in_service then
            local ped = PlayerPedId()
            local coordsPed = GetEntityCoords(ped)
            local distance = #(coordsPed - blip_rotas[position])
            if distance <= 10 then
                timeDistance = 4
                DrawMarker(21,blip_rotas[position],0,0,0,0.0,0,0,0.5,0.5,0.4,255,0,0,50,0,0,0,1)
                if distance <= 2 then
                    if IsControlJustPressed(1,38) and time_seconds <= 0 and not IsPedInAnyVehicle(ped) and GetEntityHealth(ped) > 101 then
                        time_seconds = 2
                        if position == #blip_rotas then
                            position = 1
                            vSERVER.paymentMethod(route_name)
                        else
                            position = position + 1
                            vSERVER.paymentMethod(route_name)
                        end
                        TriggerEvent("cancelando",true)
                        if Config_Rotas.Creative then
                            vRP._playAnim(false,{"amb@prop_human_parking_meter@female@idle_a","idle_a_female"},true)
                        else
                            vRP._playAnim(false,{{"amb@prop_human_parking_meter@female@idle_a","idle_a_female"}},true)
                        end
                        Citizen.Wait(2000)
                        TriggerEvent("cancelando",false)
                        vRP._stopAnim(false)
                        vRP.removeObjects()
                        MakeBlipsPosition(blip_rotas,position)
                    end
                end
            end
        end
        Citizen.Wait(timeDistance)
    end
end)

Citizen.CreateThread(function()
    while true do
        if in_service then
            if time_seconds > 0 then
                time_seconds = time_seconds - 1
            end
        end
        Citizen.Wait(1000)
    end
end)

Citizen.CreateThread(function()
	while true do
		local idle = 1000
		if in_service then
			idle = 5
			if IsControlJustPressed(1,168) then
				in_service = false
                route_name = nil
                position = 1
                time_seconds = 0
                TriggerEvent("Notify","sucesso",Config_Rotas.Notify.StopService,5000)
                if DoesBlipExist(blip) then
                    RemoveBlip(blip)
                    blip = nil
                end 
			end
		end
		Citizen.Wait(idle)
	end
end)

function MakeBlipsPosition(blip_rotas,position)
	if DoesBlipExist(blip) then
		RemoveBlip(blip)
		blip = nil
	end

	if not DoesBlipExist(blip) then
		blip = AddBlipForCoord(blip_rotas[position],50.0)
		SetBlipSprite(blip,1)
        SetBlipColour(blip,5)
        SetBlipScale(blip,0.4)
        SetBlipAsShortRange(blip,false)
        SetBlipRoute(blip,true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString("Coleta de Itens")
        EndTextCommandSetBlipName(blip)
	end
end
