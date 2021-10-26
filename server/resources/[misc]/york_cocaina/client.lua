local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
func = Tunnel.getInterface("york_cocaina")
vRP = Proxy.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIAVEIS
-----------------------------------------------------------------------------------------------------------------------------------------
local processo = false
-----------------------------------------------------------------------------------------------------------------------------------------
-- LOCAIS
-----------------------------------------------------------------------------------------------------------------------------------------
local locais = { 

	{ ['id'] = 1, ['x'] = 1967.43, ['y'] = 4824.57, ['z'] = 44.61, ['text'] = "colher folha de coca", ['perm'] = "Ballas" }, 
	{ ['id'] = 2, ['x'] = -1106.4, ['y'] = 4951.23, ['z'] = 218.68, ['text'] = "espalhar a cocaína", ['perm'] = "Ballas" }, 
	{ ['id'] = 3, ['x'] = -1111.81, ['y'] = 4942.2, ['z'] = 218.65, ['text'] = "embalar cocaína", ['perm'] = "Ballas" },
}

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		for k,v in pairs(locais) do
			local ped = PlayerPedId()
			local x,y,z = table.unpack(GetEntityCoords(ped))
			local bowz,cdz = GetGroundZFor_3dCoord(v.x,v.y,v.z)
			local distance = GetDistanceBetweenCoords(v.x,v.y,cdz,x,y,z,true)
			if distance <= 1.2 and not processo then
				drawTxt("Pressione  ~r~E~w~  para "..v.text,4,0.5,0.93,0.50,255,255,255,180)
				if IsControlJustPressed(0,38) and func.checkPermission(v.perm) then
					if v.id == 1 then
						if func.checkPayment(v.id) then
							TriggerEvent("Progress", 7000, "Coletando...")
							processo = true
							SetEntityHeading(ped, 22.48)
							vRP._playAnim(false,{"amb@prop_human_parking_meter@female@idle_a","idle_a_female"},false)
							vRP.setStandBY(source,parseInt(Citizen.Wait(GetAnimDuration(animDict, "amb@prop_human_parking_meter@female@idle_a") * 770)))
							TriggerEvent("cancelando",true)
							Citizen.Wait(7000)
							TriggerEvent("cancelando",false)
							processo = false
						end
					elseif v.id == 2 then
						if func.checkPayment(v.id) then
							TriggerEvent("Progress", 7000, "Coletando...")
							processo = true
							SetEntityHeading(ped, 253.21)
							vRP._playAnim(false,{"amb@prop_human_parking_meter@female@idle_a","idle_a_female"},false)
							vRP.setStandBY(source,parseInt(Citizen.Wait(GetAnimDuration(animDict, "amb@prop_human_parking_meter@female@idle_a") * 770)))
							TriggerEvent("cancelando",true)
							Citizen.Wait(7000)
							TriggerEvent("cancelando",false)
							processo = false
						end
					elseif v.id == 3 then
						if func.checkPayment(v.id) then
							TriggerEvent("Progress", 7000, "Coletando...")
							processo = true
							SetEntityHeading(ped, 67.48)
							vRP._playAnim(false,{"amb@prop_human_parking_meter@female@idle_a","idle_a_female"},false)
							vRP.setStandBY(source,parseInt(Citizen.Wait(GetAnimDuration(animDict, "amb@prop_human_parking_meter@female@idle_a") * 770)))
							TriggerEvent("cancelando",true)
							Citizen.Wait(7000)
							TriggerEvent("cancelando",false)
							processo = false
						end
					end
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- FUNÇÕES
-----------------------------------------------------------------------------------------------------------------------------------------
function drawTxt(text,font,x,y,scale,r,g,b,a)
	SetTextFont(font)
	SetTextScale(scale,scale)
	SetTextColour(r,g,b,a)
	SetTextOutline()
	SetTextCentre(1)
	SetTextEntry("STRING")
	AddTextComponentString(text)
	DrawText(x,y)
end

function separando()
	Citizen.CreateThread(function()
		while true do
			Citizen.Wait(10)
			local ped = PlayerPedId() 
			local  targetRotation = vec3(180.0, 180.0, 300.0)
			local x,y,z = table.unpack(vec3(1967.17,4824.33,43.83)) 

			local animDict = "anim@amb@business@weed@weed_sorting_seated@"
    
			RequestAnimDict(animDict)
			RequestModel("bkr_prop_weed_bag_01a")
			RequestModel("bkr_prop_weed_bag_pile_01a")
			RequestModel("bkr_prop_weed_bud_02b")
			RequestModel("bkr_prop_weed_leaf_01a")
			RequestModel("bkr_prop_weed_dry_01a")
			RequestModel("bkr_prop_weed_bucket_open_01a")

			while not HasAnimDictLoaded(animDict) and
				not HasModelLoaded("bkr_prop_weed_bag_01a") and 
				not HasModelLoaded("bkr_prop_weed_bag_pile_01a") and 
				not HasModelLoaded("bkr_prop_weed_bud_02b") and 
				not HasModelLoaded("bkr_prop_weed_leaf_01a") and
				not HasModelLoaded("bkr_prop_weed_dry_01a") and 
				not HasModeLoaded("bkr_prop_weed_bucket_open_01a") do 
				Citizen.Wait(100)
			end

			plastico_vazio = CreateObject(GetHashKey('bkr_prop_weed_bag_01a'), x, y, z, 1, 0, 1)
			pilha_plasticos = CreateObject(GetHashKey('bkr_prop_weed_bag_pile_01a'), x, y, z, 1, 0, 1)
			bud = CreateObject(GetHashKey('bkr_prop_weed_bud_02b'), x, y, z, 1, 0, 1)
			folha = CreateObject(GetHashKey('bkr_prop_weed_leaf_01a'), x, y, z, 1, 0, 1)
			maconha_seca = CreateObject(GetHashKey('bkr_prop_weed_dry_01a'), x, y, z, 1, 0, 1)
			balde = CreateObject(GetHashKey('bkr_prop_weed_bucket_open_01a'), x, y, z, 1, 0, 1)


			local netScene = NetworkCreateSynchronisedScene(x + 5.5,y + 3.1, z - 1.0, targetRotation, 2, false, false, 1148846080, 0, 1.3)
			local netScene2 = NetworkCreateSynchronisedScene(x + 5.5 ,y + 3.1, z - 1.0, targetRotation, 2, false, false, 1148846080, 0, 1.3)
			NetworkAddPedToSynchronisedScene(ped, netScene, animDict, "sorter_left_sort_v1_sorter01", 1.5, -4.0, 1, 16, 1148846080, 0)
			NetworkAddEntityToSynchronisedScene(plastico_vazio, netScene, animDict, "sorter_left_sort_v1_weedbag01a", 4.0, -8.0, 1)
			NetworkAddEntityToSynchronisedScene(pilha_plasticos, netScene, animDict, "sorter_left_sort_v1_weedbagpile01a", 4.0, -8.0, 1)
			NetworkAddEntityToSynchronisedScene(bud, netScene, animDict, "sorter_left_sort_v1_weedbud02b^3", 4.0, -8.0, 1)


			NetworkAddPedToSynchronisedScene(ped, netScene2, animDict, "sorter_left_sort_v1_sorter01", 1.5, -4.0, 1, 16, 1148846080, 0)
			NetworkAddEntityToSynchronisedScene(maconha_seca, netScene2, animDict, "sorter_left_sort_v1_weeddry01a", 4.0, -8.0, 1)
			NetworkAddEntityToSynchronisedScene(folha, netScene2, animDict, "sorter_left_sort_v1_weedleaf01a^1", 4.0, -8.0, 1)
			NetworkAddEntityToSynchronisedScene(balde, netScene2, animDict, "sorter_left_sort_v1_bucket01a", 4.0, -8.0, 1)

			Citizen.Wait(150)
			NetworkStartSynchronisedScene(netScene)
			Citizen.Wait(150)
			NetworkStartSynchronisedScene(netScene2)


			
			Citizen.Wait(GetAnimDuration(animDict, "sorter_left_sort_v1_sorter01") * 770)
			TriggerEvent('Notify', 'sucesso', 'Você separou a bucha.')
			DeleteObject(plastico_vazio)
			DeleteObject(pilha_plasticos)
			DeleteObject(bud)
			DeleteObject(folha)
			DeleteObject(maconha_seca)
			DeleteObject(balde)

			processo = false
			break
		end
	end)
end

