local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")

oRP = {}
Tunnel.bindInterface(GetCurrentResourceName(),oRP)
vSERVER = Tunnel.getInterface(GetCurrentResourceName())

local blip = nil
local inService = nil
local Position = 1
local timeSeconds = 0
local BlipRotas = Config["Blip-Routes"]

RegisterCommand(Config["Commands"]["Rota"],function(source,args,rawCommand)
    local ped = PlayerPedId()
    local coords = GetEntityCoords(ped)
    if args[1] == Config["Commands"]["IniciarRota"] then
        if vSERVER.CheckPerm() then
            if not inService then
                for k,v in pairs(Config["Locates"]) do
                    local distance = #(coords - vector3(v[1],v[2],v[3]))
                    if distance <= Config["Distance"][1] then
                        StartThreadService()
                        StartThreadTimeSeconds()
                        inService = true
                        MakeBlipsPosition(BlipRotas,Position)
                        TriggerEvent("Notify","sucesso",Config["Notify"]["StartRoute"],5000)
                    end
                end
            else
                TriggerEvent("Notify","aviso",Config["Notify"]["InService"],5000)
            end
        else
            TriggerEvent("Notify","aviso",Config["Notify"]["NO-Permission"],5000)
        end
    end
    if args[1] == Config["Commands"]["SairRota"] then
        inService = false
        TriggerEvent("Notify","sucesso",Config["Notify"]["StopService"],5000)
		if DoesBlipExist(blip) then
			RemoveBlip(blip)
			blip = nil
		end
    end
end)

function StartThreadService()
	Citizen.CreateThread(function()
		while true do
			local timeDistance = 500
			if inService then
				local ped = PlayerPedId()
                local coordsPed = GetEntityCoords(ped)
                local distance = #(coordsPed - vector3(BlipRotas[Position][1],BlipRotas[Position][2],BlipRotas[Position][3]))
                if distance <= 10 then
                    timeDistance = 4
                    DrawMarker(21,BlipRotas[Position][1],BlipRotas[Position][2],BlipRotas[Position][3]-0.6,0,0,0,0.0,0,0,0.5,0.5,0.4,255,0,0,50,0,0,0,1)
                    if distance <= 15 then
                        if IsControlJustPressed(1,38) and timeSeconds <= 0 then
                            timeSeconds = 2
                            if Position == #BlipRotas then
                                Position = 1
                                vSERVER.paymentMethod(true)
                            else
                                Position = Position + 1
                                vSERVER.paymentMethod(false)
                            end
                            TriggerEvent("cancelando",true)
                            vRP._playAnim(false,{"amb@prop_human_parking_meter@female@idle_a","idle_a_female"},true)
                            Citizen.Wait(2000)
                            TriggerEvent("cancelando",false)
                            vRP.removeObjects()
                            MakeBlipsPosition(BlipRotas,Position)
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
			if timeSeconds > 0 then
				timeSeconds = timeSeconds - 1
			end
			Citizen.Wait(1000)
		end
	end)
end

function MakeBlipsPosition(BlipRotas,Position)
	if DoesBlipExist(blip) then
		RemoveBlip(blip)
		blip = nil
	end

	if not DoesBlipExist(blip) then
		blip = AddBlipForCoord(BlipRotas[Position][1],BlipRotas[Position][2],BlipRotas[Position][3],50.0)
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