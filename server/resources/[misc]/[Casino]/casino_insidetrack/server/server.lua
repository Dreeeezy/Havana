local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
local Tools = module("vrp","lib/Tools")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")

src = {}
Tunnel.bindInterface("insidetrack",src)

function src.getPlayerChips()
    local source = source
	local user_id = vRP.getUserId(source)
	if user_id ~= nil then
	balance = vRP.getInventoryItemAmount(user_id,"fichas")
	return balance
	end
end

RegisterServerEvent("insidetrack:server:winnings")
AddEventHandler("insidetrack:server:winnings", function(amount)
    local source = source
	local user_id = vRP.getUserId(source)
    vRP.giveInventoryItem(user_id,"fichas",amount,false)
end)

RegisterServerEvent("insidetrack:server:placebet")
AddEventHandler("insidetrack:server:placebet", function(bet)
    local source = source
	local user_id = vRP.getUserId(source)
        if vRP.tryGetInventoryItem(user_id,"fichas",bet,false) then
	return true
	end
end)