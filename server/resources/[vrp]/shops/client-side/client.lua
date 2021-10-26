-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONNECTION
-----------------------------------------------------------------------------------------------------------------------------------------
cnVRP = {}
Tunnel.bindInterface("shops",cnVRP)
vSERVER = Tunnel.getInterface("shops")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CLOSE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("close",function(data)
	SetNuiFocus(false,false)
	SendNUIMessage({ action = "hideNUI" })
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- REQUESTSHOP
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("requestShop",function(data,cb)
	local inventoryShop,inventoryUser,weight,maxweight,infos = vSERVER.requestShop(data.shop)
	if inventoryShop then
		cb({ inventoryShop = inventoryShop, inventoryUser = inventoryUser, weight = weight, maxweight = maxweight, infos = infos })
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- REQUESTBUY
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("functionShops",function(data,cb)
	vSERVER.functionShops(data.shop,data.item,data.amount,data.slot)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- POPULATESLOT
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("populateSlot",function(data,cb)
	TriggerServerEvent("shops:populateSlot",data.item,data.slot,data.target,data.amount)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- UPDATESLOT
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("updateSlot",function(data,cb)
	TriggerServerEvent("shops:updateSlot",data.item,data.slot,data.target,data.amount)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SHOPS:UPDATE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("shops:Update")
AddEventHandler("shops:Update",function(action)
	SendNUIMessage({ action = action })
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SHOPS:DEPARTAMENTSTORE
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("shops:departamentStore",function()
--	if GetClockHours() >= 8 and GetClockHours() <= 23 then
		SendNUIMessage({ action = "showNUI", name = tostring("departamentStore"), type = vSERVER.getShopType("departamentStore") })
		SetNuiFocus(true,true)
		TriggerEvent("sounds:source","shop",0.5)
--	else
--		TriggerEvent("Notify","amarelo","Loja fechada, a mesma só funciona das <b>8</b> ás <b>23</b> horas.",3000)
--	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SHOPS:AMMUNATIONSTORE
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("shops:ammunationStore",function()
	SendNUIMessage({ action = "showNUI", name = tostring("ammunationStore"), type = vSERVER.getShopType("ammunationStore") })
	SetNuiFocus(true,true)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SHOPS:NORMALPHARMACYSTORE
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("shops:normalpharmacyStore",function()
		SendNUIMessage({ action = "showNUI", name = tostring("normalpharmacyStore"), type = vSERVER.getShopType("normalpharmacyStore") })
		SetNuiFocus(true,true)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SHOPS:HOSPITALPHARMACYSTORE
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("shops:hospitalpharmacyStore",function()
	if vSERVER.requestPerm("hospitalpharmacyStore") then
		SendNUIMessage({ action = "showNUI", name = tostring("hospitalpharmacyStore"), type = vSERVER.getShopType("hospitalpharmacyStore") })
		SetNuiFocus(true,true)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SHOPS:MEGAMALL
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("shops:megaMallStore",function()
		SendNUIMessage({ action = "showNUI", name = tostring("megaMallStore"), type = vSERVER.getShopType("megaMallStore") })
		SetNuiFocus(true,true)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SHOPS:RECYCLINGSELL
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("shops:recyclingSell",function()
		SendNUIMessage({ action = "showNUI", name = tostring("recyclingSell"), type = vSERVER.getShopType("recyclingSell") })
		SetNuiFocus(true,true)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SHOPS:BARSSTORE
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("shops:barsStore",function()
		SendNUIMessage({ action = "showNUI", name = tostring("barsStore"), type = vSERVER.getShopType("barsStore") })
		SetNuiFocus(true,true)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SHOPS:premiumStore
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("shops:premiumStore",function()
		SendNUIMessage({ action = "showNUI", name = tostring("premiumStore"), type = vSERVER.getShopType("premiumStore") })
		SetNuiFocus(true,true)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SHOPS:JEWELRYSTORE
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("shops:jewelryStore",function()
		SendNUIMessage({ action = "showNUI", name = tostring("jewelryStore"), type = vSERVER.getShopType("jewelryStore") })
		SetNuiFocus(true,true)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SHOPS:HUNTINGSTORE
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("shops:huntingStore",function()
		SendNUIMessage({ action = "showNUI", name = tostring("huntingStore"), type = vSERVER.getShopType("huntingStore") })
		SetNuiFocus(true,true)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SHOPS:COFFEEMACHINE
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("shops:coffeeMachine",function()
	SendNUIMessage({ action = "showNUI", name = tostring("coffeeMachine"), type = vSERVER.getShopType("coffeeMachine") })
	SetNuiFocus(true,true)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SHOPS:COLAMACHINE
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("shops:colaMachine",function()
	SendNUIMessage({ action = "showNUI", name = tostring("colaMachine"), type = vSERVER.getShopType("colaMachine") })
	SetNuiFocus(true,true)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SHOPS:SODAMACHINE
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("shops:sodaMachine",function()
	SendNUIMessage({ action = "showNUI", name = tostring("sodaMachine"), type = vSERVER.getShopType("sodaMachine") })
	SetNuiFocus(true,true)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SHOPS:DONUTMACHINE
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("shops:donutMachine",function()
	SendNUIMessage({ action = "showNUI", name = tostring("donutMachine"), type = vSERVER.getShopType("donutMachine") })
	SetNuiFocus(true,true)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SHOPS:BURGERMACHINE
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("shops:burgerMachine",function()
	SendNUIMessage({ action = "showNUI", name = tostring("burgerMachine"), type = vSERVER.getShopType("burgerMachine") })
	SetNuiFocus(true,true)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SHOPS:HOTDOGMACHINE
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("shops:hotdogMachine",function()
	SendNUIMessage({ action = "showNUI", name = tostring("hotdogMachine"), type = vSERVER.getShopType("hotdogMachine") })
	SetNuiFocus(true,true)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SHOPS:WATERMACHINE
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("shops:waterMachine",function()
	SendNUIMessage({ action = "showNUI", name = tostring("waterMachine"), type = vSERVER.getShopType("waterMachine") })
	SetNuiFocus(true,true)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SHOPS:fishingSell
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("shops:fishingSell",function()
	SendNUIMessage({ action = "showNUI", name = tostring("fishingSell"), type = vSERVER.getShopType("fishingSell") })
	SetNuiFocus(true,true)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SHOPS:fishingStore
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("shops:fishingStore",function()
	SendNUIMessage({ action = "showNUI", name = tostring("fishingStore"), type = vSERVER.getShopType("fishingStore") })
	SetNuiFocus(true,true)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SHOPS:registryStore
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("shops:registryStore",function()
	SendNUIMessage({ action = "showNUI", name = tostring("registryStore"), type = vSERVER.getShopType("registryStore") })
	SetNuiFocus(true,true)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SHOPS:garagem
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("shops:garagem",function()
	SendNUIMessage({ action = "showNUI", name = tostring("garagem"), type = vSERVER.getShopType("garagem") })
	SetNuiFocus(true,true)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SHOPS:cassinobar
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("shops:cassinobar",function()
	SendNUIMessage({ action = "showNUI", name = tostring("cassinobar"), type = vSERVER.getShopType("cassinobar") })
	SetNuiFocus(true,true)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SHOPS:FichaS
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("shops:FichaS",function()
	SendNUIMessage({ action = "showNUI", name = tostring("FichaS"), type = vSERVER.getShopType("FichaS") })
	SetNuiFocus(true,true)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SHOPS:FichaB
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("shops:FichaB",function()
	SendNUIMessage({ action = "showNUI", name = tostring("FichaB"), type = vSERVER.getShopType("FichaB") })
	SetNuiFocus(true,true)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SHOPS:HuntingS
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("shops:HuntingS",function()
	SendNUIMessage({ action = "showNUI", name = tostring("HuntingS"), type = vSERVER.getShopType("HuntingS") })
	SetNuiFocus(true,true)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SHOPS:Porte
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("shops:Porte",function()
	SendNUIMessage({ action = "showNUI", name = tostring("Porte"), type = vSERVER.getShopType("Porte") })
	SetNuiFocus(true,true)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SHOPS:FruitS
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("shops:FruitS",function()
	SendNUIMessage({ action = "showNUI", name = tostring("FruitS"), type = vSERVER.getShopType("FruitS") })
	SetNuiFocus(true,true)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SHOPS:BahamasB
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("shops:BahamasB",function()
	SendNUIMessage({ action = "showNUI", name = tostring("BahamasB"), type = vSERVER.getShopType("BahamasB") })
	SetNuiFocus(true,true)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SHOPS:Galaxybar
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("shops:Galaxybar",function()
	SendNUIMessage({ action = "showNUI", name = tostring("Galaxybar"), type = vSERVER.getShopType("Galaxybar") })
	SetNuiFocus(true,true)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SHOPS:Pinturas
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("shops:Pinturas",function()
	SendNUIMessage({ action = "showNUI", name = tostring("Pinturas"), type = vSERVER.getShopType("Pinturas") })
	SetNuiFocus(true,true)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SHOPS:police:policeStore
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("shops:policeStore",function()
	if vSERVER.requestPerm("policeStore") then
		SendNUIMessage({ action = "showNUI", name = tostring("policeStore"), type = vSERVER.getShopType("policeStore") })
		SetNuiFocus(true,true)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SHOPS:DIGITALDEN
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("shops:digitalden",function()
	SendNUIMessage({ action = "showNUI", name = tostring("digitalden"), type = vSERVER.getShopType("digitalden") })
	SetNuiFocus(true,true)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SHOPS:BURGUERSHOT
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("shops:burguershot",function()
	SendNUIMessage({ action = "showNUI", name = tostring("burguershot"), type = vSERVER.getShopType("burguershot") })
	SetNuiFocus(true,true)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SHOPS:LSCUSTOM
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("shops:lscustom",function()
	SendNUIMessage({ action = "showNUI", name = tostring("lscustom"), type = vSERVER.getShopType("lscustom") })
	SetNuiFocus(true,true)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SHOPS:BURGUERSHOT
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("shops:academy",function()
	SendNUIMessage({ action = "showNUI", name = tostring("academy"), type = vSERVER.getShopType("academy") })
	SetNuiFocus(true,true)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SHOPS:BURGUERSHOT
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("shops:jailshop",function()
	SendNUIMessage({ action = "showNUI", name = tostring("jailshop"), type = vSERVER.getShopType("jailshop") })
	SetNuiFocus(true,true)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SHOPS:doc
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("shops:docstore",function()
	if vSERVER.requestPerm("docstore") then
		SendNUIMessage({ action = "showNUI", name = tostring("docstore"), type = vSERVER.getShopType("docstore") })
		SetNuiFocus(true,true)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SHOPS: weedstore
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("shops:weedstore",function()
	SendNUIMessage({ action = "showNUI", name = tostring("weedstore"), type = vSERVER.getShopType("weedstore") })
	SetNuiFocus(true,true)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SHOPS:BURGUERSHOT
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("shops:cartaobanco",function()
	SendNUIMessage({ action = "showNUI", name = tostring("cartaobanco"), type = vSERVER.getShopType("cartaobanco") })
	SetNuiFocus(true,true)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SHOPS: reciclagem 2
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("shops:reciclagem2",function()
	SendNUIMessage({ action = "showNUI", name = tostring("reciclagem2"), type = vSERVER.getShopType("reciclagem2") })
	SetNuiFocus(true,true)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SHOPLIST
-----------------------------------------------------------------------------------------------------------------------------------------
local shopList = {
	--[[{ 1116.5,221.81,-49.43,"FichaS" },
	{ 1116.5,218.21,-49.43,"FichaB" }]]
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADHOVERFY
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	local innerTable = {}
	for k,v in pairs(shopList) do
		table.insert(innerTable,{ v[1],v[2],v[3],1,"E","Venda de Produtos","Pressione para abrir" })
	end

	TriggerEvent("hoverfy:insertTable",innerTable)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADOPEN
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	SetNuiFocus(false,false)

	while true do
		local timeDistance = 500
		local ped = PlayerPedId()
		if not IsPedInAnyVehicle(ped) then
			local coords = GetEntityCoords(ped)
			for k,v in pairs(shopList) do
				local distance = #(coords - vector3(v[1],v[2],v[3]))
				if distance <= 1 then
					timeDistance = 4

					if IsControlJustPressed(1,38) then
						if v[6] then
								SetNuiFocus(true,true)
								SendNUIMessage({ action = "showNUI", name = tostring(v[4]), type = vSERVER.getShopType(v[4]) })
						else
							if vSERVER.requestPerm(v[4]) then
								SetNuiFocus(true,true)
								SendNUIMessage({ action = "showNUI", name = tostring(v[4]), type = vSERVER.getShopType(v[4]) })
							end
						end
					end
				end
			end
		end

		Citizen.Wait(timeDistance)
	end
end)