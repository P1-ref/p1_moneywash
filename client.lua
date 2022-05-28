ESX = exports["es_extended"]:getSharedObject()

local UIactive = false

RegisterNUICallback("EventManager", function(data)
    if (data.event == "Exit") then 
        UIactive = false
        SetNuiFocus(false)
        return
    end

    if (data.event == "WashMoney") then
        UIactive = false
        SetNuiFocus(false)
        TriggerServerEvent("p1_moneywash:WashMoney", data.data)
    elseif (data.event == "Error") then
        ESX.ShowNotification(data.data)
        UIactive = false
        SetNuiFocus(false)
    end
end)

Citizen.CreateThread(function()
    if (Config["Blip"]["Show"]) then
        local blip = AddBlipForCoord(Config["Locations"]["EnterMoneyWash"])
    
        SetBlipSprite(blip, Config["Blip"]["Icon"])
        SetBlipScale(blip, Config["Blip"]["Scale"])
        SetBlipColour(blip, Config["Blip"]["Color"])
        SetBlipAsShortRange(blip, true)
    
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(Config["Translation"][Config["Language"]]["BlipName"])
        EndTextCommandSetBlipName(blip)
    end

    while (UIactive) do
        Wait(0)
        DisableControlAction(0, 1)
        DisableControlAction(0, 2)
        DisableControlAction(0, 142)
        DisableControlAction(0, 18)
        DisableControlAction(0, 322)
        DisableControlAction(0, 106)
    end
end)

Citizen.CreateThread(function()
    while (true) do
        sleep = 500
        
	    local ped = PlayerPedId()
        local pedCoords = GetEntityCoords(ped)
        local enterWash = Config["Locations"]["EnterMoneyWash"]
        local leaveWash = Config["Locations"]["LeaveMoneyWash"]
        local dist = #(pedCoords.xy - enterWash.xy)
        local dist2 = #(pedCoords.xy - leaveWash.xy)

        if (dist <= Config["General"]["ShowTextDist"]) then
            sleep = 0
            FloatingText(enterWash, Config["Translation"][Config["Language"]]["EnterWash"])
            if (IsControlJustReleased(0, 51)) then
                Teleport(leaveWash)
            end
        end
        if (dist2 <= Config["General"]["ShowTextDist"]) then
            sleep = 0
            FloatingText(leaveWash, Config["Translation"][Config["Language"]]["LeaveWash"])
            if (IsControlJustReleased(0, 51)) then
                Teleport(enterWash)
            end
        end
        for i=1, #Config["Locations"]["WashMoney"] do
            local washSpot = Config["Locations"]["WashMoney"][i]
            local dist3 = #(pedCoords.xy - washSpot.xy)
            if (dist3 <= Config["General"]["ShowTextDist"]) then
                sleep = 0
                FloatingText(washSpot, Config["Translation"][Config["Language"]]["WashMoney"])
                if (IsControlJustReleased(0, 51)) then
                    UIactive = true
                    SetNuiFocus(true, true)
                    SendNUIMessage({
                        event = "OpenWindow"
                    })
                end
            end
        end
        Wait(sleep)
    end
end)

Teleport = function(x,y,z)
    local ped = PlayerPedId()
    DoScreenFadeOut(100)
    Wait(600)
    SetEntityCoords(ped, x,y,z)
    DoScreenFadeIn(100)
end

FloatingText = function(coords, msg) 
    AddTextEntry("p1string", msg) 
    SetFloatingHelpTextWorldPosition(1, coords) 
    SetFloatingHelpTextStyle(1, 1, 2, -1, 3, 0) 
    BeginTextCommandDisplayHelp("p1string") 
    EndTextCommandDisplayHelp(2, false, false, -1) 
end