-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONNECTION
-----------------------------------------------------------------------------------------------------------------------------------------
cnVRP = {}
Tunnel.bindInterface("products",cnVRP)
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
local amount = {}
-----------------------------------------------------------------------------------------------------------------------------------------
-- ITEMLIST
-----------------------------------------------------------------------------------------------------------------------------------------
local itemList = {
	{ item = "cocainepin", priceMin = 150, priceMax = 250, randMin = 5, randMax = 7 },
	{ item = "joint", priceMin = 150, priceMax = 250, randMin = 5, randMax = 7 },
	{ item = "meth", priceMin = 150, priceMax = 250, randMin = 5, randMax = 7 },
	{ item = "ecstasy", priceMin = 150, priceMax = 250, randMin = 5, randMax = 7 },
	{ item = "lean", priceMin = 150, priceMax = 250, randMin = 5, randMax = 7 },
	{ item = "keyboard", priceMin = 6, priceMax = 12, randMin = 1, randMax = 3 },
	{ item = "mouse", priceMin = 6, priceMax = 12, randMin = 1, randMax = 3 },
	{ item = "ring", priceMin = 120, priceMax = 160, randMin = 2, randMax = 4 },
	{ item = "watch", priceMin = 160, priceMax = 180, randMin = 3, randMax = 6 },
	{ item = "goldbar", priceMin = 1100, priceMax = 1500, randMin = 2, randMax = 4 },
	{ item = "playstation", priceMin = 120, priceMax = 140, randMin = 1, randMax = 1 },
	{ item = "xbox", priceMin = 120, priceMax = 140, randMin = 1, randMax = 1 },
	{ item = "legos", priceMin = 6, priceMax = 10, randMin = 1, randMax = 1 },
	{ item = "ominitrix", priceMin = 16, priceMax = 18, randMin = 1, randMax = 1 },
	{ item = "bracelet", priceMin = 70, priceMax = 90, randMin = 1, randMax = 1 },
	{ item = "dildo", priceMin = 12, priceMax = 16, randMin = 1, randMax = 1 }
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHECKAMOUNT
-----------------------------------------------------------------------------------------------------------------------------------------
function cnVRP.checkAmount()
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		for k,v in pairs(itemList) do
			local rand = math.random(v.randMin,v.randMax)
			local price = math.random(v.priceMin,v.priceMax)
			if vRP.getInventoryItemAmount(user_id,v.item) >= parseInt(rand) then
				amount[user_id] = { v.item,rand,price }

				TriggerClientEvent("products:lastItem",source,v.item)

				if (v.item == "joint" or v.item == "lean" or v.item == "meth" or v.item == "ecstasy" or v.item == "cocainepin") and math.random(100) >= 75 then
					local x,y,z = vRPclient.getPositions(source)
					local copAmount = vRP.numPermission("Policia")
					for k,v in pairs(copAmount) do
						async(function()
							TriggerClientEvent("NotifyPush",v,{ time = os.date("%H:%M:%S - %d/%m/%Y"), code = 20, title = "Denúncia de Venda de Drogas", x = x, y = y, z = z, rgba = {41,76,119} })
						end)
					end
				end

				return true
			-- else
			-- 	TriggerClientEvent("Notify",source,"negado","Voce nao possui nada que me interesse",5000)
			end
		end
		return false
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- PAYMENTMETHOD
-----------------------------------------------------------------------------------------------------------------------------------------
function cnVRP.paymentMethod()
	local source = source
	local user_id = vRP.getUserId(source)
	local policia = vRP.numPermission("Policia")
	local bonus = 0

	if #policia >= 2 and #policia <= 3 then
        bonus = 25
    elseif #policia >= 4 and #policia <= 6 then
        bonus = 50
    elseif #policia >= 7 and #policia <= 10 then
        bonus = 150
    elseif #policia > 10 then
        bonus = 200
    end

	if user_id then
		if vRP.tryGetInventoryItem(user_id,amount[user_id][1],amount[user_id][2],true) then
			vRP.upgradeStress(user_id,2)
			local value = amount[user_id][3] * amount[user_id][2] + bonus
			vRP.giveInventoryItem(user_id,"dollars2",parseInt(value),true)
			TriggerClientEvent("sound:source",source,"coin",0.5)
		end
	end
end