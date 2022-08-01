local oRP = {}
Tunnel.bindInterface("RKG_Main:Rotas",oRP)
local vSERVER = Tunnel.getInterface("RKG_Main:Rotas")
--------------------------------
-- Variables
--------------------------------
local blip = nil
local in_service = false
local route_name = nil
local time_seconds = 0
local position = 1
local ped_loaded = {}
--------------------------------
-- Ped Thread
--------------------------------
Citizen.CreateThread(function()
    while true do
        local RKG = 1000
        local ped = PlayerPedId()
        local coords = GetEntityCoords(ped)
        for k,v in pairs(Config.Orgs) do
            local distance = #(coords - v.Ped.coords)
            if distance <= 15.0 then
                if ped_loaded[k] == nil then
                    local ped_hash = GetHashKey(v.Ped.Hash[2])

                    RequestModel(ped_hash)
                    while not HasModelLoaded(ped_hash) do
                        Citizen.Wait(10)
                    end

                    ped_loaded[k] = CreatePed(4,v.Ped.Hash[1],v.Ped.coords.x,v.Ped.coords.y,v.Ped.coords.z - 1,v.Ped.heading,false,true)

                    FreezeEntityPosition(ped_loaded[k],true)
                    SetEntityInvincible(ped_loaded[k],true)
                    SetBlockingOfNonTemporaryEvents(ped_loaded[k],true)
                    SetModelAsNoLongerNeeded(ped_hash)
                end
            else
                if ped_loaded[k] then
                    DeleteEntity(ped_loaded[k])
                    ped_loaded[k] = nil
                end
            end
        end
        Citizen.Wait(RKG)
    end
end)
--------------------------------
-- Init Thread
--------------------------------
Citizen.CreateThread(function()
    while true do
        local RKG = 1000
        local ped = PlayerPedId()
        local coords = GetEntityCoords(ped)
        if not in_service then
            for k,v in pairs(Config.Orgs) do
                local distance = #(coords - v.Ped.coords)
                if distance <= 10.0 then
                    RKG = 0
                    DrawText3DRotas(v.Ped.coords.x,v.Ped.coords.y,v.Ped.coords.z + 1,v.Ped.Text)
                    if distance <= 2.0 then
                        if IsControlJustPressed(1,38) and vSERVER.checkPermission(v.Perms) and not IsPedInAnyVehicle(ped) and GetEntityHealth(ped) > 101 then
                            in_service = true
                            blip_rotas = v.BlipRoutes
                            route_name = k
                            setNextPositionBlip()
                            createBlipsPosition(blip_rotas,position)
                            TriggerEvent("Notify","sucesso",Config.Notify.StartRoute)
                        end
                    end
                end
            end
        end
        Citizen.Wait(RKG)
    end
end)
--------------------------------
-- Route Thread
--------------------------------
Citizen.CreateThread(function()
    while true do
        local RKG = 1000
        if in_service then
            local ped = PlayerPedId()
            local coords = GetEntityCoords(ped)
            local distance = #(coords - blip_rotas[position])
            if distance <= 20.0 then
                RKG = 0
                DrawMarker(21,blip_rotas[position],0,0,0,0.0,0,0,0.5,0.5,0.4,255,0,0,50,0,0,0,1)
                if distance <= 2.0 then
                    if IsControlJustPressed(1,38) and time_seconds <= 0 and not IsPedInAnyVehicle(ped) and GetEntityHealth(ped) > 101 then
                        time_seconds = 2
                        setNextPositionBlip()
                        animRoute()
                        vSERVER.receiveItems(route_name)
                        createBlipsPosition(blip_rotas,position)
                    end
                end
            end
        end
        Citizen.Wait(RKG)
    end
end)
--------------------------------
-- Set Next Blip
--------------------------------
function animRoute()
    local ped = PlayerPedId()
    TriggerEvent("cancelando",true)
    CL_Config.animRoute()
    Wait(5000)
    TriggerEvent("cancelando",false)
    ClearPedTasks(ped)
end
--------------------------------
-- Set Next Blip
--------------------------------
function setNextPositionBlip()
    if Config.RandomRoutes then
        position = math.random(#blip_rotas)
    else
        if position == #blip_rotas then
            position = 1
        else
            position = position + 1
        end
    end
end
--------------------------------
-- Create Blips
--------------------------------
function createBlipsPosition(blip_rotas,position)
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
--------------------------------
-- Draw Text
--------------------------------
function DrawText3DRotas(x,y,z,text)
    local onScreen,_x,_y = World3dToScreen2d(x,y,z)
    if onScreen then
        SetTextScale(0.39, 0.39)
        SetTextFont(4)
        SetTextProportional(1)
        SetTextColour(255, 255, 255, 235)
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(_x,_y)
        
        local factor = (string.len(text)) / 270
        DrawRect(_x,_y + 0.0125,0.005 + factor,0.04,0,0,0,145)
    end
end
--------------------------------
-- Command Leave Route
--------------------------------
RegisterKeyMapping("RKG_Store:LeaveRoute","Cancelar rota","keyboard",Config.BindCancelRoute)
RegisterCommand("RKG_Store:LeaveRoute",function()
    if in_service then
        in_service = false
        route_name = nil
        TriggerEvent("Notify","sucesso",Config.Notify.StopService,5000)
        if DoesBlipExist(blip) then
            RemoveBlip(blip)
            blip = nil
        end 
    end
end)
--------------------------------
-- Time Thread
--------------------------------
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