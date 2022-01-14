ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('akira:locationpay')
AddEventHandler('akira:locationpay', function(price)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local money = xPlayer.getInventoryItem('money')["count"]
    if money >= price then
        xPlayer.removeInventoryItem("money", price)
        TriggerClientEvent('esx:showNotification', source, "~g~Vous venez de louer un véhicule pour ".. price .." $")
    end
end)