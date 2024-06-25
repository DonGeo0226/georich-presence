ESX = exports["es_extended"]:getSharedObject()

RegisterServerEvent('sp-rpc:requestPlayerCount')
AddEventHandler('sp-rpc:requestPlayerCount', function()
    local playerCount = GetPlayersCount()
    TriggerClientEvent('sp-rpc:updatePlayerCount', source, playerCount)
end)

function GetPlayersCount()
    local players = ESX.GetPlayers()
    return #players
end