ESX = nil

TriggerEvent("esx:getSharedObject", function(obj) ESX = obj end)

RegisterServerEvent("p1_moneywash:WashMoney")
AddEventHandler("p1_moneywash:WashMoney", function(amount)
    local xPlayer = ESX.GetPlayerFromId(source)
    local waitTime = (Config["General"]["TimeToWash"] * 1000)

    if (amount > 0 and xPlayer.getAccount("black_money").money) >= amount then
        xPlayer.removeAccountMoney("black_money", amount)
        if (Config["General"]["EnableTimer"]) then
            TriggerClientEvent("esx:showNotification", xPlayer.source, Config["Translation"][Config["Language"]]["WaitTime"]:format(math.floor(Config["General"]["TimeToWash"])))
            Citizen.Wait(waitTime)
            TriggerClientEvent("esx:showNotification", xPlayer.source, Config["Translation"][Config["Language"]]["YouWashed"]:format(math.floor(amount)))
            xPlayer.addMoney(amount)
        else
            TriggerClientEvent("esx:showNotification", xPlayer.source, Config["Translation"][Config["Language"]]["YouWashed"]:format(math.floor(amount)))
            xPlayer.addMoney(amount)
        end
    else
        TriggerClientEvent("esx:showNotification", xPlayer.source, Config["Translation"][Config["Language"]]["NotEnough"])
    end
end)
