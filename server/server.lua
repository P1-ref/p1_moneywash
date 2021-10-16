ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent("p1_moneywash:washMoney")
AddEventHandler("p1_moneywash:washMoney", function(amount)
    local xPlayer = ESX.GetPlayerFromId(source)
    local waitTime = (Config.TimeToWash * 1000)

    if amount > 0 and xPlayer.getAccount("black_money").money >= amount then
        xPlayer.removeAccountMoney("black_money", amount)
        if Config.EnableTimer then
            TriggerClientEvent("esx:showNotification", xPlayer.source, Config.Translation[Config.Language].waitTime:format(math.floor(Config.TimeToWash)))
            Citizen.Wait(waitTime)
            TriggerClientEvent("esx:showNotification", xPlayer.source, Config.Translation[Config.Language].youWashed:format(math.floor(amount)))
            xPlayer.addMoney(amount)
        else
            TriggerClientEvent("esx:showNotification", xPlayer.source, Config.Translation[Config.Language].youWashed:format(math.floor(amount)))
            xPlayer.addMoney(amount)
        end
    else
        TriggerClientEvent("esx:showNotification", xPlayer.source, Config.Translation[Config.Language].notEnough)
    end
end)
