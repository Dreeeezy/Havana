-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONNECTION
-----------------------------------------------------------------------------------------------------------------------------------------
cRP = {}
Tunnel.bindInterface("crafting",cRP)
vSERVER = Tunnel.getInterface("crafting")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CLOSE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("close",function(data)
	SetNuiFocus(false,false)
	SendNUIMessage({ action = "hideNUI" })
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- REQUESTCRAFTING
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("requestCrafting",function(data,cb)
	local inventoryCraft,inventoryUser,weight,maxweight,infos = vSERVER.requestCrafting(data.craft)
	if inventoryCraft then
		cb({ inventoryCraft = inventoryCraft, inventoryUser = inventoryUser, weight = weight, maxweight = maxweight, infos = infos })
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- FUNCTIONCRAFT
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("functionCraft",function(data,cb)
	vSERVER.functionCrafting(data.index,data.craft,data.amount,data.slot)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- FUNCTIONDESTROY
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("functionDestroy",function(data,cb)
	vSERVER.functionDestroy(data.index,data.craft,data.amount,data.slot)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- POPULATESLOT
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("populateSlot",function(data,cb)
	TriggerServerEvent("crafting:populateSlot",data.item,data.slot,data.target,data.amount)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- UPDATESLOT
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("updateSlot",function(data,cb)
	TriggerServerEvent("crafting:updateSlot",data.item,data.slot,data.target,data.amount)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- UPDATECRAFTING
-----------------------------------------------------------------------------------------------------------------------------------------
function cRP.updateCrafting(action)
	SendNUIMessage({ action = action })
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- CRAFTING:UPDATE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("crafting:Update")
AddEventHandler("crafting:Update",function(action)
	SendNUIMessage({ action = action })
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CRAFTLIST
-----------------------------------------------------------------------------------------------------------------------------------------
local craftList = {
    { -883.07,-436.57,39.6,"fueltechCrafting" },
	{ 977.43,47.85,116.18,"BahamasCrafting" },
    { 546.24,-166.76,54.5,"mecanicoCrafting" },
    --{ 1593.14,6455.61,26.02,"avalanchesCrafting" },
	{ -428.56,-1728.31,19.79,"lixeiroShop" },
	{ 94.76,-1507.05,29.26,"tradefood" },
	{ 169.56,-1634.05,29.28,"foodMarket" },
	{ 94.88,-1295.0,29.27,"boateCrafting2" },
	{ -227.27,-1314.08,30.89,"craftBennys","mesa de trabalho" },
	{ 1109.29,-2007.65,31.03,"forja","ABRIR"},
	{ 963.42,24.0,77.0,"fichascraft","Troca de Fichas" },
	--{ 251.71,221.67,106.29,"centralgold","ABRIR"},
	--{ 5404.6,-5172.02,31.45,"farmpublic1","farm" },
	{ 1405.91,1137.83,109.75,"triadeCrafting","mesa de trabalho" },
	{ 606.7,-3092.58,6.07,"medellinCrafting","mesa de trabalho" },
	{ 390.75,269.78,95.0,"lavagemCrafting2","abrir a deepweb" },
	{ 1550.34,3513.39,36.01,"desmanche","ABRIR"},
	{ 1272.73,-1711.87,54.78,"lesterCrafting","TROCA ILEGAL" },
	{ -1870.53,2061.71,135.44,"yakuzaCrafting","mesa de trabalho" }, -- Yakuza / Vinhedos
	{ -1522.02,111.52,50.03,"catedralCrafting","mesa de trabalho" } -- Triade / Mansão Playboy
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADTARGET
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	SetNuiFocus(false,false)

	for k,v in pairs(craftList) do
		exports["target"]:AddCircleZone("crafting:"..k,vector3(v[1],v[2],v[3]),1.0,{
			name = "crafting:"..k,
			heading = v[4]
		},{
			shop = k,
			distance = 1.0,
			options = {
				{
					event = "crafting:openSystem",
					label = "Abrir",
					tunnel = "shop"
				}
			}
		})
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CRAFTING:OPENSYSTEM
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("crafting:openSystem",function(shopId)
	if vSERVER.requestPerm(craftList[shopId][4]) then
		SetNuiFocus(true,true)
		SendNUIMessage({ action = "showNUI", name = craftList[shopId][4] })
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CRAFTING:FUELSHOP
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("crafting:fuelShop",function()
	SetNuiFocus(true,true)
	SendNUIMessage({ action = "showNUI", name = "fuelShop" })
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CRAFTING:OPENSOURCE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("crafting:openSource")
AddEventHandler("crafting:openSource",function()
	SetNuiFocus(true,true)
	SendNUIMessage({ action = "showNUI", name = "craftShop" })
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- CRAFTING:MECHANICSTORE
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("crafting:mechanicCraft",function()
	if vSERVER.requestPerm("mechanicCraft") then
		SendNUIMessage({ action = "showNUI", name = tostring("mechanicCraft")})
		SetNuiFocus(true,true)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CRAFTING:FarmCrafting
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("crafting:FarmCrafting",function()
	if vSERVER.requestPerm("FarmCrafting") then
		SendNUIMessage({ action = "showNUI", name = tostring("FarmCrafting")})
		SetNuiFocus(true,true)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CRAFTING:housefood
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("crafting:housefood",function()
	if vSERVER.requestPerm("housefood") then
		SendNUIMessage({ action = "showNUI", name = tostring("housefood")})
		SetNuiFocus(true,true)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CRAFTING:lenhador
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("crafting:lenhador",function()
	if vSERVER.requestPerm("lenhador") then
		SendNUIMessage({ action = "showNUI", name = tostring("lenhador")})
		SetNuiFocus(true,true)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CRAFTING:incapsule
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("crafting:incapsule",function()
	if vSERVER.requestPerm("incapsule") then
		SendNUIMessage({ action = "showNUI", name = tostring("incapsule")})
		SetNuiFocus(true,true)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CRAFTING:waterlsc
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("crafting:waterlsc",function()
	if vSERVER.requestPerm("waterlsc") then
		SendNUIMessage({ action = "showNUI", name = tostring("waterlsc")})
		SetNuiFocus(true,true)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CRAFTING:triade
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("crafting:triade",function()
	if vSERVER.requestPerm("triade") then
		SendNUIMessage({ action = "showNUI", name = tostring("triade")})
		SetNuiFocus(true,true)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CRAFTING:hospital
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("crafting:paramedicocraft",function()
	if vSERVER.requestPerm("paramedicocraft") then
		SendNUIMessage({ action = "showNUI", name = tostring("paramedicocraft")})
		SetNuiFocus(true,true)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CRAFTING: digitaldenreparo
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("crafting:digitalreparo",function()
	if vSERVER.requestPerm("digitalreparo") then
		SendNUIMessage({ action = "showNUI", name = tostring("digitalreparo")})
		SetNuiFocus(true,true)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CRAFTING: bratva
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("crafting:catedralCrafting",function()
	if vSERVER.requestPerm("catedralCrafting") then
		SendNUIMessage({ action = "showNUI", name = tostring("catedralCrafting")})
		SetNuiFocus(true,true)
	end
end)