ESX = exports["es_extended"]:getSharedObject()

local playerLoaded = false
local APPID = 1253926008399335504  -- Tu ID de aplicación Discord

Citizen.CreateThread(function()

    SetDiscordAppId(APPID)
    SetDiscordRichPresenceAsset('logogrande')  -- Icono grande
    SetDiscordRichPresenceAssetText('Opening 17 of')  -- Texto al pasar el mouse sobre el icono grande
    SetDiscordRichPresenceAssetSmall('logochico')  -- Icono pequeño
    SetDiscordRichPresenceAssetSmallText('July/Julio')  -- Texto al pasar el mouse sobre el icono pequeño
    SetDiscordRichPresenceAction(0, "🚧Connect🚧", "fivem://connect/51.222.110.107:30120")
    SetDiscordRichPresenceAction(1, "🎤Discord🎤", "https://discord.com/invite/XPv9UjQrBN")

    UpdateDiscord()
end)

function UpdateDiscord()
    TriggerServerEvent('sp-rpc:requestPlayerCount')  -- Solicitar al servidor el número de jugadores
end

RegisterNetEvent('sp-rpc:updatePlayerCount')
AddEventHandler('sp-rpc:updatePlayerCount', function(playerCount)
    SetRichPresence(playerCount .. " Residents/Habitantes")  -- Actualizar el estado de Rich Presence con el número de jugadores recibido
end)

RegisterNetEvent("esx:playerLoaded")
AddEventHandler("esx:playerLoaded", function()
    playerLoaded = true
end)

Citizen.CreateThread(function()
    Citizen.Wait(100)
    while true do
        if playerLoaded then
            UpdateDiscord()
        end
        Citizen.Wait(5000)
    end
end)