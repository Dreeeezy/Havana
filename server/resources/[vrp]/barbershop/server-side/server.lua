-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONNECTION
-----------------------------------------------------------------------------------------------------------------------------------------
cRP = {}
Tunnel.bindInterface("barbershop", cRP)
vCLIENT = Tunnel.getInterface("barbershop")
-----------------------------------------------------------------------------------------------------------------------------------------
-- BARBER
-----------------------------------------------------------------------------------------------------------------------------------------
function cRP.checkOpen()
    local source = source
    local user_id = vRP.getUserId(source)
    if user_id then
        if not vRP.wantedReturn(user_id) and not vRP.reposeReturn(user_id) then
            return true
        end
    end
    return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- UPDATESKIN
-----------------------------------------------------------------------------------------------------------------------------------------
function cRP.updateSkin(myClothes)
    local source = source
    local user_id = vRP.getUserId(source)    
    if user_id then
        vRP.setUData(user_id, "currentCharacterMode", json.encode(myClothes))
    end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- BVIDA
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("debug", function(source, args, rawCommand)
    local user_id = vRP.getUserId(source)
    if user_id then
        if not vRPclient.inVehicle(source) then
            local x, y, z = vRPclient.getPositions(source)
            local data = vRP.getUserDataTable(user_id)
            if data then
                TriggerClientEvent("syncarea", -1, x, y, z, 2)
                vRPclient._setCustomization(source, data.customization)
                local value = vRP.getUData(user_id, "currentCharacterMode")
                if value ~= "" then
                    local custom = json.decode(value) or {}            
                    TriggerClientEvent("barbershop:setCustomization", player, custom)
                end
            end
        end
    end
end)

RegisterCommand('bvida',function(source,rawCommand)
    local user_id = vRP.getUserId(source)
    vRPclient._setCustomization(source,vRPclient.getCustomization(source))
    vRP.removeCloak(source)
    local player = vRP.getUserSource(user_id)
    if player then
        local value = vRP.getUData(user_id, "currentCharacterMode")
        if value ~= "" then
            local custom = json.decode(value) or {}            
            TriggerClientEvent("barbershop:setCustomization", player, custom)
        end
    end
    local Tattodata = vRP.getUData(user_id,"Tattoos")
    if Tattodata then
        TriggerClientEvent("tattoos:setTattoos",source,json.decode(Tattodata))
    end
end)

function Dump(o)
    if type(o) == 'table' then
        local s = '{ '
        for k, v in pairs(o) do
            if type(k) ~= 'number' then k = '"' .. k .. '"' end
            s = s .. '[' .. k .. '] = ' .. Dump(v) .. ','
        end
        return s .. '} '
    else
        return tostring(o)
    end
  end

AddEventHandler("barbershop:init", function(user_id)
    local player = vRP.getUserSource(user_id)
    if player then
        local value = vRP.getUData(user_id, "currentCharacterMode")
        if value ~= "" then
            local custom = json.decode(value) or {}            
            TriggerClientEvent("barbershop:setCustomization", player, custom)
        end
    end
end)
