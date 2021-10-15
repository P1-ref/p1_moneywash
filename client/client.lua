ESX = nil
local ped = PlayerPedId()

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

-- If you want to open the moneywash menu in another script. TriggerEvent("p1_moneywash:openWashMenu")
RegisterNetEvent("p1_moneywash:openWashMenu")
AddEventHandler("p1_moneywash:openWashMenu", function()
    WashDirtyMoney()
end)

Citizen.CreateThread(function()
    while true do
        sleep = 500
        local plyC = GetEntityCoords(ped, false)
        local enter = Config.EnterMoneyWash
        local leave = Config.InteriorLeave
        local wash = Config.WashMoney
        local dist = #(plyC.xy - enter.xy)
        local dist2 = #(plyC.xy - leave.xy)
        local dist3 = #(plyC.xy - wash.xy)
        if dist <= Config.ShowMarkerDist then
            sleep = 0
            DrawMarker(Config.MarkerType, enter.x, enter.y, enter.z-0.95, 0, 0, 0, 0, 0, 0, 1.001, 1.0001, 0.5001, 0, 0, 255, 200, 0, 0, 0, 0)
            if dist <= Config.ShowTextDist then
                if Config.Language == "en" then
                    ESX.ShowHelpNotification(Config.LangEN["enterWash"])
                else
                    ESX.ShowHelpNotification(Config.LangSV["enterWash"])
                end
                if IsControlJustReleased(0, 51) then
                    Teleport(leave)
                end
            end
        end
        if dist2 <= Config.ShowMarkerDist then
            sleep = 0
            DrawMarker(Config.MarkerType, leave.x, leave.y, leave.z-0.95, 0, 0, 0, 0, 0, 0, 1.001, 1.0001, 0.5001, 0, 0, 255, 200, 0, 0, 0, 0)
            if dist2 <= Config.ShowTextDist then
                if Config.Language == "en" then
                    ESX.ShowHelpNotification(Config.LangEN["leaveWash"])
                else
                    ESX.ShowHelpNotification(Config.LangSV["leaveWash"])
                end
                if IsControlJustReleased(0, 51) then
                    Teleport(enter)
                end
            end
        end
        if dist3 <= Config.ShowMarkerDist then
            sleep = 0
            DrawMarker(Config.MarkerType, wash.x, wash.y, wash.z-0.95, 0, 0, 0, 0, 0, 0, 1.001, 1.0001, 0.5001, 0, 0, 255, 200, 0, 0, 0, 0)
            if dist3 <= Config.ShowTextDist then
                if Config.Language == "en" then
                    ESX.ShowHelpNotification(Config.LangEN["washMoney"])
                else
                    ESX.ShowHelpNotification(Config.LangSV["washMoney"])
                end
                if IsControlJustReleased(0, 51) then
                    WashDirtyMoney()
                end
            end
        end
        Wait(sleep)
    end
end)

WashDirtyMoney = function()

    if Config.Language == "en" then
        title = Config.LangEN["washTitle"]
    else
        title = Config.LangSV["washTitle"]
    end

    ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'wash_amount', {
        title = title
    }, function(data, menu)
    
        local amount = tonumber(data.value)
        
        if amount == nil then
            if Config.Language == "en" then
                ESX.ShowNotification(Config.LangEN["invAmount"])
            else
                ESX.ShowNotification(Config.LangSV["invAmount"])
            end
        else
            menu.close()
            TriggerServerEvent('p1_moneywash:washMoney', amount)
        end
    end, function(data, menu)
        menu.close()
    end)
end

Teleport = function(x,y,z)
    DoScreenFadeOut(100)
    Wait(600)
    SetEntityCoords(ped, x,y,z)
    DoScreenFadeIn(100)
end

Citizen.CreateThread(function()

    if Config.Language == "en" then
        nameForBlip = Config.LangEN["blipName"]
    else
        nameForBlip = Config.LangSV["blipName"]
    end

    if Config.ShowBlip then
		local blip = AddBlipForCoord(Config.EnterMoneyWash)

		SetBlipSprite(blip, Config.Blip.Icon)
		SetBlipScale(blip, Config.Blip.Scale)
		SetBlipColour(blip, Config.Blip.Color)
		SetBlipAsShortRange(blip, true)

		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString(nameForBlip)
		EndTextCommandSetBlipName(blip)
    end
end)