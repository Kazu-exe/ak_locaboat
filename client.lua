ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)


Citizen.CreateThread(function ()
    while true do
            local timer = 500
            local plyCoords3 = GetEntityCoords(GetPlayerPed(-1), false)
            local dist3 = Vdist(plyCoords3.x, plyCoords3.y, plyCoords3.z, Config.pos.location.position.x, Config.pos.location.position.y, Config.pos.location.position.z)
            if dist3 <= 7 and Config.maker == true then
                    timer = 0
                    DrawMarker(35, Config.pos.location.position.x, Config.pos.location.position.y, Config.pos.location.position.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.3, 0, 0, 255, 255, 0, 1, 2, 0, nil, nil, 0)
            end
            if dist3 <= 2 then
                    timer = 0
                        RageUI.Text({ message = "~b~[E]~w~ pour parler a Marc", time_display = 1 })
                        if IsControlJustPressed(1, 51) then
                            menulocation()
                    end
            end
        Citizen.Wait(timer)
    end
end)


function menulocation()
    local location = RageUI.CreateMenu("Location de bateaux", "Véhicule")
    RageUI.Visible(location, not RageUI.Visible(location))
    while location do
        Citizen.Wait(0)
            RageUI.IsVisible(location, true, true, true, function()
            for k,v in pairs (Config.vehicule) do 
            RageUI.ButtonWithStyle(v.nom, nil, {RightLabel = "~g~" .. v.price .. " $"}, true, function(Hovered, Active, Selected)
                if (Selected) then
                    Citizen.Wait(0)
                    local price = v.price
                    local modele = v.modele
                    TriggerServerEvent('akira:locationpay', price)
                    RageUI.CloseAll()
                    ESX.Game.SpawnVehicle(modele, Config.pos.locationspawn.position, Config.pos.locationspawn.position.heading, function(vehicle)
                        TaskWarpPedIntoVehicle(PlayerPedId(), vehicle, -1)
                    end)
            end
        end)
    end
    end, function()
    end)
        if not RageUI.Visible(location) then
            location = RMenu:DeleteType("Location", true)
        end
    end
end


Citizen.CreateThread(function()
    local hash = GetHashKey(Config.ped.pedtype)
    while not HasModelLoaded(hash) do
    RequestModel(hash)
    Wait(20)
    end
    for k,v in pairs(Config.ped) do
    ped = CreatePed("PED_TYPE_CIVMALE", Config.ped.pedtype, v.x, v.y, v.z, v.a, false, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    FreezeEntityPosition(ped, true)
    SetEntityInvincible(ped, true)
    end
end)



Citizen.CreateThread(function()
    for k, v in pairs(Config.pos.location) do
        local blip = AddBlipForCoord(v.x, v.y, v.z)

        SetBlipSprite(blip, Config.blips.id)
        SetBlipScale (blip, Config.blips.scale)
        SetBlipColour(blip, Config.blips.colour)
        SetBlipAsShortRange(blip, true)

        BeginTextCommandSetBlipName('STRING')
        AddTextComponentSubstringPlayerName(Config.blips.name)
        EndTextCommandSetBlipName(blip)
    end
end)

