local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
local vRP = Proxy.getInterface("vRP")

local oRP = {}
Tunnel.bindInterface(GetCurrentResourceName(),oRP)
local vSERVER = Tunnel.getInterface(GetCurrentResourceName())

local blip = nil
local in_service = false
local position = 1
local time_seconds = 0
local blip_rotas = Config.BlipRoutes

RegisterCommand(Config.Commands.Rota,function(source,args,rawCommand)
    local ped = PlayerPedId()
    local coords = GetEntityCoords(ped)
    if in_service then
        in_service = false
        TriggerEvent("Notify","sucesso",Config.Notify.StopService,5000)
		if DoesBlipExist(blip) then
			RemoveBlip(blip)
			blip = nil
		end 
    else
        if vSERVER.CheckPerm() then
            for k,v in pairs(Config.Locates) do
                local distance = #(coords - vector3(v[1],v[2],v[3]))
                if distance <= Config.Distance[1] then
                    StartThreadService()
                    StartThreadTimeSeconds()
                    in_service = true
                    position = 1
                    MakeBlipsPosition(blip_rotas,position)
                    TriggerEvent("Notify","sucesso",Config.Notify.StartRoute,5000)
                end
            end
        else
            TriggerEvent("Notify","aviso",Config.Notify.NOPermission,5000)
        end
    end
end)

function StartThreadService()
	Citizen.CreateThread(function()
		while true do
			local timeDistance = 500
			if in_service then
				local ped = PlayerPedId()
                local coordsPed = GetEntityCoords(ped)
                local distance = #(coordsPed - vector3(blip_rotas[position][1],blip_rotas[position][2],blip_rotas[position][3]))
                if distance <= 10 then
                    timeDistance = 4
                    DrawMarker(21,blip_rotas[position][1],blip_rotas[position][2],blip_rotas[position][3]-0.6,0,0,0,0.0,0,0,0.5,0.5,0.4,255,0,0,50,0,0,0,1)
                    if distance <= 15 then
                        if IsControlJustPressed(1,38) and time_seconds <= 0 then
                            time_seconds = 2
                            if position == #blip_rotas then
                                position = 1
                                vSERVER.paymentMethod()
                            else
                                position = position + 1
                                vSERVER.paymentMethod()
                            end
                            TriggerEvent("cancelando",true)
                            if Config.Creative then
                                vRP._playAnim(false,{"amb@prop_human_parking_meter@female@idle_a","idle_a_female"},true)
                            else
                                vRP._playAnim(false,{{"amb@prop_human_parking_meter@female@idle_a","idle_a_female"}},true)
                            end
                            Citizen.Wait(2000)
                            TriggerEvent("cancelando",false)
                            vRP.removeObjects()
                            MakeBlipsPosition(blip_rotas,position)
                        end
                    end
                end
			end
			Citizen.Wait(timeDistance)
		end
	end)
end

function StartThreadTimeSeconds()
	Citizen.CreateThread(function()
		while true do
			if time_seconds > 0 then
				time_seconds = time_seconds - 1
			end
			Citizen.Wait(1000)
		end
	end)
end

function MakeBlipsPosition(blip_rotas,position)
	if DoesBlipExist(blip) then
		RemoveBlip(blip)
		blip = nil
	end

	if not DoesBlipExist(blip) then
		blip = AddBlipForCoord(blip_rotas[position][1],blip_rotas[position][2],blip_rotas[position][3],50.0)
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