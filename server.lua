ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


RegisterServerEvent('akira:locationpay')
AddEventHandler('akira:locationpay', function(price)
        
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local money = xPlayer.getMoney()
    if money >= price then
         xPlayer.removeMoney(price)
        TriggerClientEvent('esx:showNotification', source, "~g~Vous venez de louer un véhicule pour ".. price .." $")
    end
end)
