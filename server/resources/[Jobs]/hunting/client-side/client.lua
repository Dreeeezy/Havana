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
Tunnel.bindInterface("hunting",cRP)
vSERVER = Tunnel.getInterface("hunting")
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
local blipHunting = {}
local inHunting = false
local animalHunting = {}
local huntCoords = { -672.76,5837.39,17.32 }
local animalHahs = { "a_c_deer","a_c_coyote","a_c_mtlion","a_c_pig","a_c_panther","a_c_boar" }
-----------------------------------------------------------------------------------------------------------------------------------------
-- ANIMALCOORDS
-----------------------------------------------------------------------------------------------------------------------------------------
local animalCoords = {
	{ -688.55,5462.42,47.13 },
	{ -642.4,5529.69,42.57 },
	{ -577.27,5579.89,46.83 },
	{ -567.57,5523.5,56.01 },
	{ -573.44,5460.66,60.69 },
	{ -590.52,5422.36,55.63 },
	{ -523.4,5414.76,62.52 },
	{ -479.8,5430.49,70.16 },
	{ -473.6,5471.8,85.67 },
	{ -510.16,5521.99,71.82 },
	{ -514.76,5569.33,68.5 },
	{ -524.53,5622.21,56.09 },
	{ -463.28,5673.26,68.2 },
	{ -495.49,5662.98,55.27 },
	{ -478.34,5723.95,65.2 },
	{ -479.18,5751.48,54.91 },
	{ -455.88,5806.36,49.17 },
	{ -453.61,5831.97,43.37 },
	{ -405.23,5837.71,52.68 },
	{ -415.26,5865.29,45.59 },
	{ -382.83,5875.46,49.07 },
	{ -366.03,5924.18,44.0 },
	{ -432.0,5880.2,40.34 },
	{ -502.94,5933.83,33.92 },
	{ -521.48,5871.53,33.43 },
	{ -538.21,5844.51,34.75 },
	{ -547.06,5895.62,32.93 },
	{ -543.06,5926.2,25.56 },
	{ -588.73,5925.05,27.51 },
	{ -575.11,5878.4,28.71 },
	{ -604.14,5853.29,24.35 },
	{ -586.87,5822.01,31.34 },
	{ -565.02,5786.45,39.29 },
	{ -581.82,5756.28,38.37 },
	{ -608.12,5760.25,33.18 },
	{ -636.63,5753.76,28.49 },
	{ -654.4,5714.44,23.15 },
	{ -690.95,5695.57,27.4 },
	{ -676.15,5668.82,32.42 },
	{ -695.02,5627.43,32.23 },
	{ -687.11,5603.65,32.01 },
	{ -695.02,5627.43,32.23 },
	{ -812.33,5688.96,21.08 },
	{ -843.37,5660.79,18.95 },
	{ -827.22,5588.91,26.93 },
	{ -804.19,5516.98,26.33 }
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADSYSTEM
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		local timeDistance = 500
		local ped = PlayerPedId()
		if not IsPedInAnyVehicle(ped) then
			local coords = GetEntityCoords(ped)
			local distance = #(coords - vector3(huntCoords[1],huntCoords[2],huntCoords[3]))

			if distance <= 1.5 then
				timeDistance = 4

				if inHunting then
					DrawText3D(huntCoords[1],huntCoords[2],huntCoords[3],"~g~E~w~  FINALIZAR")
				else
					DrawText3D(huntCoords[1],huntCoords[2],huntCoords[3],"~g~E~w~  INICIAR")
				end

				if IsControlJustPressed(1,38) and distance <= 1 then
					for k,v in pairs(blipHunting) do
						if DoesBlipExist(blipHunting[k]) then
							RemoveBlip(blipHunting[k])
							blipHunting[k] = nil
						end
					end

					for k,v in pairs(animalHunting) do
						if DoesEntityExist(animalHunting[k]) then
							DeleteEntity(animalHunting[k])
							animalHunting[k] = nil
						end
					end

					if inHunting then
						inHunting = false
						TriggerEvent("Notify","amarelo","O serviço de <b>Caçador</b> foi finalizado.",3000)
					else
						inHunting = true
						TriggerEvent("Notify","amarelo","O serviço de <b>Caçador</b> foi iniciado.",3000)

						for i = 1,25 do
							newHunting(i)
						end
					end
				end
			end
		end

		Citizen.Wait(timeDistance)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- HUNTING:ANIMALCUTING
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		local timeDistance = 500
		local ped = PlayerPedId()
		if not IsPedInAnyVehicle(ped) then
			if inHunting and animalHunting then
				local coords = GetEntityCoords(ped)
				for k,v in pairs(animalHunting) do
					local deerCoords = GetEntityCoords(animalHunting[k])
					local distance = #(coords - deerCoords)

					if distance <= 1 then
						if IsPedDeadOrDying(animalHunting[k]) and not IsPedAPlayer(animalHunting[k]) then
							timeDistance = 4

							DrawText3D(deerCoords["x"],deerCoords["y"],deerCoords["z"],"~g~E~w~   ESFOLAR")

							if IsControlJustPressed(1,38) and GetSelectedPedWeapon(ped) == GetHashKey("WEAPON_SWITCHBLADE") then
								TaskTurnPedToFaceEntity(ped,animalHunting[k],-1)

								Citizen.Wait(1000)

								TriggerEvent("Progress", 15000, "Esfolando...")
								vRP._playAnim(true,{"anim@gangops@facility@servers@bodysearch@","player_search"},true)
								vRP._playAnim(false,{"amb@medic@standing@kneel@base","base"},true)
								TriggerEvent("cancelando",true)

								Citizen.Wait(15000)

								TriggerEvent("cancelando",false)
								vSERVER.animalPayment()
								vRP._removeObjects()

								if DoesBlipExist(blipHunting[k]) then
									RemoveBlip(blipHunting[k])
									blipHunting[k] = nil
								end

								if DoesEntityExist(animalHunting[k]) then
									DeleteEntity(animalHunting[k])
									animalHunting[k] = nil
								end

								newHunting(k)
							end
						end
					end
				end
			end
		end

		Citizen.Wait(timeDistance)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- NEWHUNTING
-----------------------------------------------------------------------------------------------------------------------------------------
function newHunting(i)
	local rand = math.random(#animalHahs)
	local mHash = GetHashKey(animalHahs[rand])

	RequestModel(mHash)
	while not HasModelLoaded(mHash) do
		Citizen.Wait(1)
	end

	if HasModelLoaded(mHash) then
		local inLocate = math.random(#animalCoords)

		animalHunting[i] = CreatePed(28,mHash,animalCoords[inLocate][1],animalCoords[inLocate][2],animalCoords[inLocate][3] - 1,false,false,false)

		PlaceObjectOnGroundProperly(animalHunting[i])
		SetModelAsNoLongerNeeded(mHash)

		local spawnX = math.random(-100,100)
		local spawnY = math.random(-100,100)
		TaskGoStraightToCoord(animalHunting[i],animalCoords[inLocate][1] + spawnX,animalCoords[inLocate][2] + spawnY,animalCoords[inLocate][3],0.5,-1,0.0,0.0)

		blipAnimal(i)
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- BLIPANIMAL
-----------------------------------------------------------------------------------------------------------------------------------------
function blipAnimal(i)
	if DoesBlipExist(blipHunting[i]) then
		RemoveBlip(blipHunting[i])
		blipHunting[i] = nil
	end

	blipHunting[i] = AddBlipForEntity(animalHunting[i])
	SetBlipSprite(blipHunting[i],141)
	SetBlipColour(blipHunting[i],41)
	SetBlipScale(blipHunting[i],0.8)
	SetBlipAsShortRange(blipHunting[i],true)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString("Animal")
	EndTextCommandSetBlipName(blipHunting[i])
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- DRAWTEXT3D
-----------------------------------------------------------------------------------------------------------------------------------------
function DrawText3D(x,y,z,text)
	local onScreen,_x,_y = GetScreenCoordFromWorldCoord(x,y,z)

	if onScreen then
		BeginTextCommandDisplayText("STRING")
		AddTextComponentSubstringKeyboardDisplay(text)
		SetTextColour(255,255,255,150)
		SetTextScale(0.35,0.35)
		SetTextFont(4)
		SetTextCentre(1)
		EndTextCommandDisplayText(_x,_y)

		local width = string.len(text) / 160 * 0.45
		DrawRect(_x,_y + 0.0125,width,0.03,38,42,56,200)
	end
end