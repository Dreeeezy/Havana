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
Tunnel.bindInterface("tablet",cRP)
vSERVER = Tunnel.getInterface("tablet")
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADFOCUS
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	SetNuiFocus(false,false)
end)

function closeNui()
	vRP.removeObjects("one")
	SetNuiFocus(false,false)
	SendNUIMessage({ action = "closeSystem" })
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- REQUESTRANKING
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("requestRanking",function(data,cb)
	local result = vSERVER.requestRanking(data.raceId)
	cb({ race = result })
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- REQUESTABOUT
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("requestAbout",function(data,cb)
	local inventario,peso,maxpeso,infos = vSERVER.requestAbout()
	if inventario then
		cb({ inventario = inventario, drop = dropItems, peso = peso, maxpeso = maxpeso, infos = infos })
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- /INV
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("tablet:openSystem")
AddEventHandler("tablet:openSystem",function()
	SetNuiFocus(true,true)
	SendNUIMessage({ action = "openSystem" })

	if not IsPedInAnyVehicle(PlayerPedId()) then
		vRP.createObjects("amb@code_human_in_bus_passenger_idles@female@tablet@base","base","prop_cs_tablet",50,28422)
	end
end)
--[[ -----------------------------------------------------------------------------------------------------------------------------------------
-- TABLET
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("cRtablet",function(source,args)
	SetNuiFocus(true,true)
	SendNUIMessage({ action = "openSystem" })

	if not IsPedInAnyVehicle(PlayerPedId()) then
		vRP.createObjects("amb@code_human_in_bus_passenger_idles@female@tablet@base","base","prop_cs_tablet",50,28422)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- TABLET
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterKeyMapping("cRtablet","Abrir o tablet","keyboard","f1") ]]
-----------------------------------------------------------------------------------------------------------------------------------------
-- CLOSESYSTEM
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("closeSystem",function(data)
	closeNui()
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- REQUESTCARROS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("requestCarros",function(data,cb)
	local veiculos = vSERVER.Carros()
	if veiculos then
		cb({ veiculos = veiculos })
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- REQUESTMOTOS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("requestMotos",function(data,cb)
	local veiculos = vSERVER.Motos()
	if veiculos then
		cb({ veiculos = veiculos })
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- REQUESTSERVICO
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("requestServicos",function(data,cb)
	local veiculos = vSERVER.Servicos()
	if veiculos then
		cb({ veiculos = veiculos })
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- REQUESTPOSSUIDOS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("requestPossuidos",function(data,cb)
	local veiculos = vSERVER.Possuidos()
	if veiculos then
		cb({ veiculos = veiculos })
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- BUYDEALER
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("buyDealer",function(data)
	if data.name ~= nil then
		vSERVER.buyDealer(data.name)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SELLDEALER
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("sellDealer",function(data)
	if data.name ~= nil then
		vSERVER.sellDealer(data.name)
	end
end)

RegisterNUICallback("RequestSell",function(data,cb)
	vSERVER.requestSell(data.name)
	cb("ok")
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- UPDATEMEDIA
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("tablet:updateMedia")
AddEventHandler("tablet:updateMedia",function(media,data)
	SendNUIMessage({ action = "messageMedia", media = media, data = data })
end)