local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")
func = {}
Tunnel.bindInterface("york_municao",func)
-----------------------------------------------------------------------------------------------------------------------------------------
-- FUNÇÕES
-----------------------------------------------------------------------------------------------------------------------------------------
function func.checkPermission(perm)
	local source = source
	local user_id = vRP.getUserId(source)
	return vRP.hasPermission(user_id,perm)
end

local src = {

	[1] = { ['re'] = nil, ['reqtd'] = nil, ['item'] = "Salitre", ['itemqtd'] = 8 },
	[2] = { ['re'] = "Salitre", ['reqtd'] = 8, ['item'] = "carvao", ['itemqtd'] = 8 },
	[3] = { ['re'] = "carvao", ['reqtd'] = 8, ['item'] = "polvora", ['itemqtd'] = 16 },
}

function func.checkPayment(id)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if src[id].re ~= nil then
			if vRP.computeInvWeight(user_id)+vRP.itemWeightList(src[id].item)*src[id].itemqtd <= vRP.getBackpack(user_id) then
				if vRP.tryGetInventoryItem(user_id,src[id].re,src[id].reqtd,false) then
					vRP.giveInventoryItem(user_id,src[id].item,src[id].itemqtd,false)
					return true
				end
			end
		else
			if vRP.computeInvWeight(user_id)+vRP.itemWeightList(src[id].item)*src[id].itemqtd <= vRP.getBackpack(user_id) then
				vRP.giveInventoryItem(user_id,src[id].item,src[id].itemqtd,false)
				return true
			end
		end
	end
end
