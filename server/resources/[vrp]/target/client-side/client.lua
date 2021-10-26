-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
local Zones = {}
local Models = {}
local success = false
local innerEntity = {}
local dismantleList = {}
local setDistance = 10.0
local playerActive = true
local targetActive = false
local adminService = false
local policeService = false
local paramedicService = false
-----------------------------------------------------------------------------------------------------------------------------------------
-- POLICE:UPDATESERVICE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("police:updateService")
AddEventHandler("police:updateService",function(status)
	policeService = status
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- PARAMEDIC:UPDATESERVICE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("paramedic:updateService")
AddEventHandler("paramedic:updateService",function(status)
	paramedicService = status
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP:PLAYERACTIVE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("vrp:playerActive")
AddEventHandler("vrp:playerActive",function()
	playerActive = true
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- TARGET:TOGGLEADMIN
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("target:toggleAdmin")
AddEventHandler("target:toggleAdmin",function()
	if adminService then
		setDistance = 10.0
		adminService = false
		TriggerEvent("Notify","amarelo","Sistema desativado.",5000)
	else
		setDistance = 99.0
		adminService = true
		TriggerEvent("Notify","verde","Sistema ativado.",5000)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADSYSTEM
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	RegisterCommand("+entityTarget",playerTargetEnable)
	RegisterCommand("-entityTarget",playerTargetDisable)
	RegisterKeyMapping("+entityTarget","Target","keyboard","LMENU")

	AddBoxZone("stockadeHacker",vector3(1209.22,-3115.16,5.54),0.2,0.4,{
		name = "stockadeHacker",
		heading = 272.13,
		debugPoly = false,
		minZ = 5.44,
		maxZ = 5.84
	},{
		distance = 0.75,
		options = {
			{
				event = "stockade:initHacker",
				label = "Hackear",
				tunnel = "client"
			}
		}
	})

	AddBoxZone("servicePolice01",vector3(441.79,-982.07,30.69),0.4,0.4,{
		name = "servicePolice01",
		heading = 91,
		debugPoly = false,
		minZ = 30.79,
		maxZ = 30.99
	},{
		distance = 0.75,
		options = {
			{
				event = "player:service",
				label = "Entrar/Sair de serviço",
				tunnel = "server"
			}
		}
	})

	AddTargetModel({ 1631638868,2117668672,-1498379115,-1519439119,-289946279, -1182962909 },{
		options = {
			{
				event = "target:animDeitar",
				label = "Deitar",
				tunnel = "client"
			}
		},
		distance = 1.00
	})

	AddTargetModel({ -171943901,-109356459,1805980844,-99500382,1262298127,1737474779,2040839490,1037469683,867556671,-1521264200,-741944541,-591349326,-293380809,-628719744,-1317098115,1630899471,38932324,-523951410,725259233,764848282,2064599526,536071214,589738836,146905321,47332588,-1118419705,538002882,-377849416,96868307 },{
		options = {
			{
				event = "target:animSentar",
				label = "Sentar",
				tunnel = "client"
			}
		},
		distance = 1.00
	})

	AddTargetModel({ 690372739,-170500011 },{
		options = {
			{
				event = "shops:coffeeMachine",
				label = "Comprar",
				tunnel = "client"
			}
		},
		distance = 0.75
	})

	AddTargetModel({ -654402915,-1034034125 },{
		options = {
			{
				event = "shops:donutMachine",
				label = "Comprar",
				tunnel = "client"
			}
		},
		distance = 0.75
	})

	AddTargetModel({ 992069095 },{
		options = {
			{
				event = "shops:colaMachine",
				label = "Comprar",
				tunnel = "client"
			}
		},
		distance = 0.75
	})
	
	AddTargetModel({ 1114264700 },{
		options = {
			{
				event = "shops:sodaMachine",
				label = "Comprar",
				tunnel = "client"
			}
		},
		distance = 0.75
	})

	AddTargetModel({ 1129053052 },{
		options = {
			{
				event = "shops:burgerMachine",
				label = "Comprar",
				tunnel = "client"
			}
		},
		distance = 0.75
	})

	AddTargetModel({ -1581502570 },{
		options = {
			{
				event = "shops:hotdogMachine",
				label = "Comprar",
				tunnel = "client"
			}
		},
		distance = 0.75
	})

--	AddTargetModel({ 1099892058 },{
--		options = {
--			{
--				event = "shops:waterMachine",
--				label = "Máquina de Água",
--				tunnel = "client"
--			}
--		},
--		distance = 0.75
--	})

	AddTargetModel({ 0x18CE57D0 },{ -- Departament store
		options = {
			{
				event = "shops:departamentStore",
				label = "Comprar",
				tunnel = "client"
			}
		},
		distance = 1.50
	})

	AddTargetModel({ 0x467415E9 },{ -- Ammunation store
		options = {
			{
				event = "shops:ammunationStore",
				label = "Comprar",
				tunnel = "client"
			}
		},
		distance = 1.50
	})

	AddTargetModel({ 0x5244247D },{ -- Pharmacy Store
		options = {
			{
				event = "shops:normalpharmacyStore",
				label = "Comprar",
				tunnel = "client"
			}
		},
		distance = 1.50
	})
	
	AddTargetModel({ -1286380898 },{ -- Hospital Pharmacy
		options = {
			{
				event = "shops:hospitalpharmacyStore",
				label = "Abrir",
				tunnel = "client"
			}
		},
		distance = 1.50
	})
	
	AddTargetModel({ -429715051 },{ -- Mega mall store
		options = {
			{
				event = "shops:megaMallStore",
				label = "Comprar",
				tunnel = "client"
			}
		},
		distance = 1.50
	})
	
	AddTargetModel({ 1644266841 },{ -- Recycling sell
		options = {
			{
				event = "shops:recyclingSell",
				label = "Reciclar",
				tunnel = "client"
			}
		},
		distance = 1.50
	})
	
	AddTargetModel({ 2014052797,-518348876,759654580,808778210 },{ -- Bar store
		options = {
			{
				event = "shops:barsStore",
				label = "Comprar",
				tunnel = "client"
			}
		},
		distance = 4.00
	})
	
	AddTargetModel({ 797459875 },{ -- premiumStore
		options = {
			{
				event = "shops:premiumStore",
				label = "Comprar",
				tunnel = "client"
			}
		},
		distance = 2.00
	})
	
	AddTargetModel({ -1022036185 },{ -- Jewelry store
		options = {
			{
				event = "shops:jewelryStore",
				label = "Vender",
				tunnel = "client"
			}
		},
		distance = 2.00
	})
	
	AddTargetModel({ -837606178 },{ -- hunting store
		options = {
			{
				event = "shops:huntingStore",
				label = "Comprar",
				tunnel = "client"
			}
		},
		distance = 1.50
	})
	
	AddTargetModel({ 0x459762CA },{ -- fishingSell
		options = {
			{
				event = "shops:fishingSell",
				label = "Vender",
				tunnel = "client"
			}
		},
		distance = 1.50
	})
	
	AddTargetModel({ 0x0F9513F1 },{ -- registryStore
		options = {
			{
				event = "shops:registryStore",
				label = "Comprar",
				tunnel = "client"
			}
		},
		distance = 1.50
	})
	
	AddTargetModel({ 0x49EA5685 },{ -- recyclingSell
		options = {
			{
				event = "shops:recyclingSell",
				label = "Vender",
				tunnel = "client"
			}
		},
		distance = 1.50
	})
	
	AddTargetModel({ 0x3521A8D2 },{ -- garagem
		options = {
			{
				event = "shops:garagem",
				label = "Comprar",
				tunnel = "client"
			}
		},
		distance = 1.50
	})

	AddTargetModel({ -1054459573 },{ -- cassinobar
		options = {
			{
				event = "shops:cassinobar",
				label = "Comprar",
				tunnel = "client"
			}
		},
		distance = 2.50
	})

	AddTargetModel({ -1922568579 },{ -- FichaS
		options = {
			{
				event = "shops:FichaS",
				label = "Vender",
				tunnel = "client"
			}
		},
		distance = 2.50
	})

	AddTargetModel({ 999748158 },{ -- FichaB
		options = {
			{
				event = "shops:FichaB",
				label = "Comprar",
				tunnel = "client"
			}
		},
		distance = 2.50
	})

	AddTargetModel({ 0x5B44892C },{ -- HuntingS
		options = {
			{
				event = "shops:HuntingS",
				label = "Vender",
				tunnel = "client"
			}
		},
		distance = 2.50
	})

	AddTargetModel({ 0x342333D3 },{ -- Porte
		options = {
			{
				event = "shops:Porte",
				label = "Comprar",
				tunnel = "client"
			}
		},
		distance = 2.50
	})

	AddTargetModel({ -610530921 },{ -- FruitS
		options = {
			{
				event = "shops:FruitS",
				label = "Vender",
				tunnel = "client"
			}
		},
		distance = 2.50
	})

	AddTargetModel({ -442429178 },{ -- BahamasB
		options = {
			{
				event = "shops:BahamasB",
				label = "Comprar",
				tunnel = "client"
			}
		},
		distance = 2.50
	})

	AddTargetModel({ -619494093 },{ -- Galaxybar
		options = {
			{
				event = "shops:Galaxybar",
				label = "Comprar",
				tunnel = "client"
			}
		},
		distance = 2.50
	})

	AddTargetModel({ 0x6C9DD7C9 },{ -- Pinturas
		options = {
			{
				event = "shops:Pinturas",
				label = "Vender",
				tunnel = "client"
			}
		},
		distance = 2.50
	})
	
	AddTargetModel({ 506770882,-870868698,-1364697528,-1126237515 },{ -- Open ATM
		options = {
			{
				event = "atm:openATM",
				label = "Abrir",
				tunnel = "client"
			}
		},
		distance = 1.50
	})

	AddTargetModel({ -664053099,1682622302,307287994,-1323586730,-417505688,-832573324,1457690978 },{ -- Hunting job
		options = {
			{
				event = "hunting:animalCutting",
				label = "Esfolar",
				tunnel = "client"
			}
		},
		distance = 1.50
	})

	AddTargetModel({ -205311355 },{ -- Remove objects
		options = {
			{
				event = "tryDeleteObject",
				label = "Remover",
				tunnel = "objects"
			}
		},
		distance = 1.50
	})
	
	--[[ AddTargetModel({ 829413118 },{ -- Open benefactor
		options = {
			{
				event = "benefactor:openBenefactor",
				label = "Abrir",
				tunnel = "client"
			}
		},
		distance = 1.50
	}) ]]
	
	AddTargetModel({ -1674314660 },{ -- Mechanic craft
		options = {
			{
				event = "crafting:mechanicCraft",
				label = "Criar",
				tunnel = "client"
			}
		},
		distance = 1.50
	})
	
--[[	AddTargetModel({ -573669520 },{ -- Mechanic store
		options = {
			{
				event = "benefactor:openBenefactor",
				label = "Comprar",
				tunnel = "client"
			}
		},
		distance = 1.50
	})]]
	
	AddTargetModel({ 1211559620,1363150739,-1186769817,261193082,-756152956,-1383056703 },{
		options = {
			{
				event = "garbageman:verifyBox",
				label = "Vasculhar",
				tunnel = "client"
			}
		},
		distance = 0.75
	})
	
	AddTargetModel({ 1939545845,0x47E4EEA0 },{ -- policeStore
		options = {
			{
				event = "shops:policeStore",
				label = "Comprar",
				tunnel = "client"
			}
		},
		distance = 3.0
	})
	
	AddTargetModel({ -1313761614 },{ -- FarmCrafting
		options = {
			{
				event = "crafting:FarmCrafting",
				label = "Negociar",
				tunnel = "client"
			}
		},
		distance = 3.0
	})
	
	AddTargetModel({ 0x5389A93C },{ -- digitalden
		options = {
			{
				event = "shops:digitalden",
				label = "Comprar",
				tunnel = "client"
			}
		},
		distance = 3.0
	})

	AddTargetModel({ -1931689897 },{ -- burguershot
		options = {
			{
				event = "shops:burguershot",
				label = "Comprar",
				tunnel = "client"
			}
		},
		distance = 3.0
	})

	AddTargetModel({ 0x457C64FB },{ -- academia
		options = {
			{
				event = "shops:academy",
				label = "Comprar",
				tunnel = "client"
			}
		},
		distance = 3.0  
	})

	AddTargetModel({ 2073775040 },{ -- cadeia
		options = {
			{
				event = "shops:jailshop",
				label = "Comprar",
				tunnel = "client"
			}
		},
		distance = 3.0
	})

	AddTargetModel({ -1131233579 },{ -- cassino teste
		options = {
			{
				event = "luckywheel:targetRoll",
				label = "Girar",
				tunnel = "client"
			}
		},
		distance = 3.0
	})

	AddTargetModel({ 1821439213 },{ --housefood
		options = {
			{
				event = "crafting:housefood",
				label = "Cozinhar",
				tunnel = "client"
			}
		},
		distance = 3.0
	})

	AddTargetModel({ 0x72C0CAD2 },{ -- Doc
		options = {
			{
				event = "shops:docstore",
				label = "Comprar",
				tunnel = "client"
			}
		},
		distance = 3.0  
	})

	AddTargetModel({ 0x1A021B83 },{ -- Lenhador
		options = {
			{
				event = "crafting:lenhador",
				label = "Trocar",
				tunnel = "client"
			}
		},
		distance = 3.0  
	})

	AddTargetModel({ -2078561997 },{ -- Weedshops
		options = {
			{
				event = "shops:weedstore",
				label = "Comprar",
				tunnel = "client"
			}
		},
		distance = 3.0  
	})

	AddTargetModel({ -1766954369 },{ -- lscustom
		options = {
			{
				event = "shops:lscustom",
				label = "Comprar",
				tunnel = "client"
			}
		},
		distance = 3.0  
	})

	AddTargetModel({ -1643617475 },{ -- Departament store
		options = {
			{
				event = "dismantle:lista",
				label = "Pegar Lista",
				tunnel = "client"
			}
		},
		distance = 1.50
	})

	AddTargetModel({ -163714847 },{ -- capsulas
		options = {
			{
				event = "crafting:incapsule", 
				label = "Trocar",
				tunnel = "client"
			}
		},
		distance = 3.0  
	})

	AddTargetModel({ -261389155 },{ -- waterlsc
		options = {
			{
				event = "crafting:waterlsc", 
				label = "Trocar",
				tunnel = "client"
			}
		},
		distance = 3.0  
	})

	AddTargetModel({ 1726113796 },{ -- triade
		options = {
			{
				event = "crafting:triade", 
				label = "Trocar",
				tunnel = "client"
			}
		},
		distance = 3.0  
	})

	AddTargetModel({ -1022961931 },{ -- cartaobanco
		options = {
			{
				event = "shops:cartaobanco",
				label = "Pegue seu cartão de débito",
				tunnel = "client"
			}
		},
		distance = 3.0  
	})

	AddTargetModel({ 0x62018559 },{ --reciclagem2
		options = {
			{
				event = "shops:reciclagem2", 
				label = "Vender",
				tunnel = "client"
			}
		},
		distance = 3.0  
	})

	AddTargetModel({ -1218668262 },{ --hospital craft
		options = {
			{
				event = "crafting:paramedicocraft", 
				label = "Manipular",
				tunnel = "client"
			}
		},
		distance = 3.0  
	})

	AddTargetModel({ -570394627 },{ --digitaldenreparo
		options = {
			{
				event = "crafting:digitalreparo", 
				label = "Trocar",
				tunnel = "client"
			}
		},
		distance = 3.0  
	})

	AddTargetModel({ -1774732668 },{ --bratva
		options = {
			{
				event = "crafting:catedralCrafting", 
				label = "Fabricar",
				tunnel = "client"
			}
		},
		distance = 3.0  
	})

--	AddTargetModel({ 666561306,218085040,-58485588,1511880420,682791951 },{
--		options = {
--			{
--				event = "inventory:verifyObjects",
--				event = "inventory:garbageVerify", -
--				label = "Vasculhar",
--				tunnel = "client"
--			}
--		},
--		distance = 0.75
--	})
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- PARAMEDICMENU
-----------------------------------------------------------------------------------------------------------------------------------------
local paramedicMenu = {
	{
		event = "hospital:reanimar",
		label = "Reanimar",
		tunnel = "Policia2"
	},
	{
		event = "hospital:diagnostico",
		label = "Diagnóstico",
		tunnel = "Policia2"
	},
	{
		event = "hospital:tratamento",
		label = "Tratamento",
		tunnel = "Policia2"
	},
	{
		event = "hospital:sangramento",
		label = "Sangramento",
		tunnel = "Policia2"
	},
	--[[ {
		event = "paramedico:maca",
		label = "Deitar Paciente",
		tunnel = "Policia2"
	} ]]
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- POLICEVEH
-----------------------------------------------------------------------------------------------------------------------------------------
local policeVeh = {
	{
		event = "police:runPlate",
		label = "Verificar Placa",
		tunnel = "Policia3"
	},
	--[[ {
		event = "police:impound",
		label = "Registrar Veículo",
		tunnel = "Policia"
	}, ]]
	{
		event = "police:runArrest",
		label = "Detenção do Veículo",
		tunnel = "Policia3"
	}
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- POLICEPED --
-----------------------------------------------------------------------------------------------------------------------------------------
local policePed = {
	{
		event = "inspect:revistar",
		label = "Revistar",
		tunnel = "Server"
	},
	--[[ {
		event = "police:prisonClothes",
		label = "Uniforme do Presídio",
		tunnel = "Policia2"
	} ]]
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- playerped
-----------------------------------------------------------------------------------------------------------------------------------------
local playerped = {
	{
		event = "inspect:runInspect",
		label = "Revistar",
		tunnel = "Policia2"
	},
	--[[ {
		event = "police:prisonClothes",
		label = "Uniforme do Presídio",
		tunnel = "Policia2"
	} ]]
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- ADMINMENU
-----------------------------------------------------------------------------------------------------------------------------------------
local adminMenu = {
	{
		event = "tryDeleteObject",
		label = "Deletar Objeto",
		tunnel = "admin"
	},
	{
		event = "garages:deleteVehicle",
		label = "Deletar Veículo",
		tunnel = "admin"
	}
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- PLAYERTARGETENABLE
-----------------------------------------------------------------------------------------------------------------------------------------
function playerTargetEnable()
--	print(playerActive)
	if playerActive then
		if success or IsPedArmed(PlayerPedId(),6) or IsPedInAnyVehicle(PlayerPedId()) then
			return
		end

		innerEntity = {}
		targetActive = true

		SendNUIMessage({ response = "openTarget" })

		while targetActive do
			local ped = PlayerPedId()
			local coords = GetEntityCoords(ped)
			local hit,entCoords,entity = RayCastGamePlayCamera(setDistance)

			if hit == 1 then
				if GetEntityType(entity) ~= 0 then
					if adminService then
						if DoesEntityExist(entity) then
							if #(coords - entCoords) <= setDistance then
								success = true

								NetworkRegisterEntityAsNetworked(entity)
								while not NetworkGetEntityIsNetworked(entity) do
									NetworkRegisterEntityAsNetworked(entity)
									Citizen.Wait(1)
								end

								local netObjects = NetworkGetNetworkIdFromEntity(entity)
								SetNetworkIdCanMigrate(netObjects,true)
								NetworkSetNetworkIdDynamic(netObjects,false)
								SetNetworkIdExistsOnAllMachines(netObjects,true)

								if IsEntityAVehicle(entity) then
									innerEntity = { netObjects,GetVehicleNumberPlateText(entity) }
								else
									innerEntity = { netObjects }
								end

								SendNUIMessage({ response = "validTarget", data = adminMenu })

								while success and targetActive do
									local ped = PlayerPedId()
									local coords = GetEntityCoords(ped)
									local hit,entCoords,entity = RayCastGamePlayCamera(setDistance)

									DisablePlayerFiring(ped,true)

									if (IsControlJustReleased(1,24) or IsDisabledControlJustReleased(1,24)) then
										SetCursorLocation(0.5,0.5)
										SetNuiFocus(true,true)
									end

									if GetEntityType(entity) == 0 or #(coords - entCoords) > setDistance then
										success = false
									end

									Citizen.Wait(1)
								end

								SendNUIMessage({ response = "leftTarget" })
							end
						end
					elseif IsEntityAVehicle(entity) then
						if #(coords - entCoords) <= 1.0 then
							success = true

							innerEntity = { GetVehicleNumberPlateText(entity),vRP.vehicleModel(GetEntityModel(entity)),entity,VehToNet(entity) }

							if policeService then
								SendNUIMessage({ response = "validTarget", data = policeVeh })
							else
								local distance = #(coords - vector3(-85.3,-2223.71,7.8))
								if distance > 20 then
									local varMenu = playerVeh

									if GetEntityModel(entity) == 1747439474 then
										varMenu = stockadeVeh
									end

									SendNUIMessage({ response = "validTarget", data = varMenu })
								else
									SendNUIMessage({ response = "validTarget", data = dismantleVeh })
								end
							end

							while success and targetActive do
								local ped = PlayerPedId()
								local coords = GetEntityCoords(ped)
								local hit,entCoords,entity = RayCastGamePlayCamera(setDistance)

								DisablePlayerFiring(ped,true)

								if (IsControlJustReleased(1,24) or IsDisabledControlJustReleased(1,24)) then
									SetCursorLocation(0.5,0.5)
									SetNuiFocus(true,true)
								end

								if GetEntityType(entity) == 0 or #(coords - entCoords) > 1.0 then
									success = false
								end

								Citizen.Wait(1)
							end

							SendNUIMessage({ response = "leftTarget" })
						end
					elseif IsPedAPlayer(entity) and policeService then
						if #(coords - entCoords) <= 1.0 then
							local index = NetworkGetPlayerIndexFromPed(entity)
							local source = GetPlayerServerId(index)
							local index2 = NetworkGetPlayerIndexFromPed(ped)
							local source2 = GetPlayerServerId(index2)

							success = true
							innerEntity = { source,source2 }
							SendNUIMessage({ response = "validTarget", data = policePed })

							while success and targetActive do
								local ped = PlayerPedId()
								local coords = GetEntityCoords(ped)
								local hit,entCoords,entity = RayCastGamePlayCamera(setDistance)

								DisablePlayerFiring(ped,true)

								if (IsControlJustReleased(1,24) or IsDisabledControlJustReleased(1,24)) then
									SetCursorLocation(0.5,0.5)
									SetNuiFocus(true,true)
								end

								if GetEntityType(entity) == 0 or #(coords - entCoords) > 1.0 then
									success = false
								end

								Citizen.Wait(1)
							end

							SendNUIMessage({ response = "leftTarget" })
						end
					elseif IsPedAPlayer(entity) and paramedicService then
						if #(coords - entCoords) <= 1.0 then
							local index = NetworkGetPlayerIndexFromPed(entity)
							local source = GetPlayerServerId(index)
							local index2 = NetworkGetPlayerIndexFromPed(ped)
							local source2 = GetPlayerServerId(index2)

							success = true
							innerEntity = { source,source2 }
							SendNUIMessage({ response = "validTarget", data = paramedicMenu })

							while success and targetActive do
								local ped = PlayerPedId()
								local coords = GetEntityCoords(ped)
								local hit,entCoords,entity = RayCastGamePlayCamera(setDistance)

								DisablePlayerFiring(ped,true)

								if (IsControlJustReleased(1,24) or IsDisabledControlJustReleased(1,24)) then
									SetCursorLocation(0.5,0.5)
									SetNuiFocus(true,true)
								end

								if GetEntityType(entity) == 0 or #(coords - entCoords) > 1.0 then
									success = false
								end

								Citizen.Wait(1)
							end

							SendNUIMessage({ response = "leftTarget" })
						end
					else
						for k,v in pairs(Models) do
							if k == GetEntityModel(entity) then
								if #(coords - entCoords) <= Models[k]["distance"] then

									if Models[k]["desmanche"] then
										local distance = #(coords - vector3(2413.07,3139.35,48.19))
										if distance > 10 then
											goto scapeModel
										end
									end

									success = true

									NetworkRegisterEntityAsNetworked(entity)
									while not NetworkGetEntityIsNetworked(entity) do
										NetworkRegisterEntityAsNetworked(entity)
										Citizen.Wait(1)
									end

									local netObjects = NetworkGetNetworkIdFromEntity(entity)
									SetNetworkIdCanMigrate(netObjects,true)
									NetworkSetNetworkIdDynamic(netObjects,false)
									SetNetworkIdExistsOnAllMachines(netObjects,true)

									innerEntity = { entity,k,netObjects,GetEntityCoords(entity),GetEntityHeading(entity) }
									SendNUIMessage({ response = "validTarget", data = Models[k]["options"] })

									while success and targetActive do
										local ped = PlayerPedId()
										local coords = GetEntityCoords(ped)
										local hit,entCoords,entity = RayCastGamePlayCamera(setDistance)

										DisablePlayerFiring(ped,true)

										if (IsControlJustReleased(1,24) or IsDisabledControlJustReleased(1,24)) then
											SetCursorLocation(0.5,0.5)
											SetNuiFocus(true,true)
										end

										if GetEntityType(entity) == 0 or #(coords - entCoords) > Models[k]["distance"] then
											success = false
										end

										Citizen.Wait(1)
									end

									SendNUIMessage({ response = "leftTarget" })
								end
							end
						end

						::scapeModel::
					end
				end

				for k,v in pairs(Zones) do
					if Zones[k]:isPointInside(entCoords) then
						if #(coords - Zones[k]["center"]) <= v["targetoptions"]["distance"] then
							success = true

							SendNUIMessage({ response = "validTarget", data = Zones[k]["targetoptions"]["options"] })

							if v["targetoptions"]["shop"] ~= nil then
								innerEntity = { v["targetoptions"]["shop"] }
							end

							while success and targetActive do
								local ped = PlayerPedId()
								local coords = GetEntityCoords(ped)
								local hit,entCoords,entity = RayCastGamePlayCamera(setDistance)

								DisablePlayerFiring(ped,true)

								if (IsControlJustReleased(1,24) or IsDisabledControlJustReleased(1,24)) then
									SetCursorLocation(0.5,0.5)
									SetNuiFocus(true,true)
								end

								if not Zones[k]:isPointInside(entCoords) or #(coords - Zones[k]["center"]) > v["targetoptions"]["distance"] then
									success = false
								end

								Citizen.Wait(1)
							end

							SendNUIMessage({ response = "leftTarget" })
						end
					end
				end
			end

			Citizen.Wait(250)
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- TARGET:ANIMDEITAR
-----------------------------------------------------------------------------------------------------------------------------------------
local beds = {
	[1631638868] = { 0.0,0.0 },
	[2117668672] = { 0.0,0.0 },
	[-1498379115] = { 1.0,90.0 },
	[-1519439119] = { 1.0,0.0 },
	[-289946279] = { 1.0,0.0 }
}

RegisterNetEvent("target:animDeitar")
AddEventHandler("target:animDeitar",function()
	if not exports["player"]:blockCommands() and not exports["player"]:handCuff() then
		local ped = PlayerPedId()
		if GetEntityHealth(ped) > 101 then
			local objCoords = GetEntityCoords(innerEntity[1])

			SetEntityCoords(ped,objCoords["x"],objCoords["y"],objCoords["z"] + beds[innerEntity[2]][1],1,0,0,0)
			SetEntityHeading(ped,GetEntityHeading(innerEntity[1]) + beds[innerEntity[2]][2] - 180.0)

			vRP.playAnim(false,{"anim@gangops@morgue@table@","body_search"},true)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- TARGET:PACIENTEDEITAR
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("target:pacienteDeitar")
AddEventHandler("target:pacienteDeitar",function()
	local ped = PlayerPedId()
	local coords = GetEntityCoords(ped)

	for k,v in pairs(beds) do
		local object = GetClosestObjectOfType(coords["x"],coords["y"],coords["z"],0.9,k,0,0,0)
		if DoesEntityExist(object) then
			local objCoords = GetEntityCoords(object)

			SetEntityCoords(ped,objCoords["x"],objCoords["y"],objCoords["z"] + v[1],1,0,0,0)
			SetEntityHeading(ped,GetEntityHeading(object) + v[2] - 180.0)

			vRP.playAnim(false,{"anim@gangops@morgue@table@","body_search"},true)
			break
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- TARGET:DISMANTLELIST
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("target:dismantleList")
AddEventHandler("target:dismantleList",function(tableList)
	RemoveTargetModel(dismantleList)

	AddTargetModel(tableList,{
		options = {
			{
				event = "dismantle:checkVehicle",
				label = "Desmanchar",
				tunnel = "client"
			}
		},
		distance = 0.75,
		desmanche = true
	})

	dismantleList = tableList
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- TARGET:DISMANTLELIST
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("target:dismantleClear")
AddEventHandler("target:dismantleClear",function(model)
	if Models[model] then
		Models[model] = nil
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- REMOVETARGETMODEL
-----------------------------------------------------------------------------------------------------------------------------------------
function RemoveTargetModel(models)
	for k,v in pairs(models) do
		if Models[v] then
			Models[v] = nil
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- TARGET:SENTAR
-----------------------------------------------------------------------------------------------------------------------------------------
local chairs = {
	[-171943901] = 0.0,
	[-109356459] = 0.5,
	[1805980844] = 0.5,
	[-99500382] = 0.3,
	[1262298127] = 0.0,
	[1737474779] = 0.5,
	[2040839490] = 0.0,
	[1037469683] = 0.4,
	[867556671] = 0.4,
	[-1521264200] = 0.0,
	[-741944541] = 0.4,
	[-591349326] = 0.5,
	[-293380809] = 0.5,
	[-628719744] = 0.5,
	[-1317098115] = 0.5,
	[1630899471] = 0.5,
	[38932324] = 0.5,
	[-523951410] = 0.5,
	[725259233] = 0.5,
	[764848282] = 0.5,
	[2064599526] = 0.5,
	[536071214] = 0.5,
	[589738836] = 0.5,
	[146905321] = 0.5,
	[47332588] = 0.5,
	[-1118419705] = 0.5,
	[538002882] = -0.1,
	[-377849416] = 0.5,
	[96868307] = 0.5
}

RegisterNetEvent("target:animSentar")
AddEventHandler("target:animSentar",function()
	if not exports["player"]:blockCommands() and not exports["player"]:handCuff() then
		local ped = PlayerPedId()
		if GetEntityHealth(ped) > 101 then
			local objCoords = GetEntityCoords(innerEntity[1])

			FreezeEntityPosition(innerEntity[1],true)
			SetEntityCoords(ped,objCoords["x"],objCoords["y"],objCoords["z"] + chairs[innerEntity[2]],1,0,0,0)
			SetEntityHeading(ped,GetEntityHeading(innerEntity[1]) - 180.0)

			vRP.playAnim(false,{ task = "PROP_HUMAN_SEAT_CHAIR_MP_PLAYER" },false)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- PLAYERTARGETDISABLE
-----------------------------------------------------------------------------------------------------------------------------------------
function playerTargetDisable()
	if success or not targetActive then
		return
	end

	if targetActive then
		targetActive = false
		SendNUIMessage({ response = "closeTarget" })
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- SELECTTARGET
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("selectTarget",function(data,cb)
	success = false
	targetActive = false
	SetNuiFocus(false,false)
	SendNUIMessage({ response = "closeTarget" })

	if data["tunnel"] == "client" then
		TriggerEvent(data["event"],innerEntity)
	elseif data["tunnel"] == "server" then
		TriggerServerEvent(data["event"],innerEntity)
	elseif data["tunnel"] == "shop" then
		TriggerEvent(data["event"],innerEntity[1])
	elseif data["tunnel"] == "paramedic" then
		TriggerServerEvent(data["event"],innerEntity[1])
	elseif data["tunnel"] == "police" then
		TriggerServerEvent(data["event"],innerEntity,data["service"])
	elseif data["tunnel"] == "Policia2" then
		TriggerServerEvent(data["event"],innerEntity[2])
	elseif data["tunnel"] == "Policia3" then
		TriggerServerEvent(data["event"],innerEntity[1])
	elseif data["tunnel"] == "objects" then
		TriggerServerEvent(data["event"],innerEntity[3])
	elseif data["tunnel"] == "admin" then
		TriggerServerEvent(data["event"],innerEntity[1],innerEntity[2])
	else
		TriggerServerEvent(data["event"])
	end
end)
--[[ RegisterNUICallback("selectTarget",function(data,cb)
	success = false
	targetActive = false
	SetNuiFocus(false,false)
	local ped = PlayerPedId()
	SendNUIMessage({ response = "closeTarget" })

	if data["tunnel"] == "client" then
		TriggerEvent(data["event"],innerEntity)
	elseif data["tunnel"] == "Paramedico" then
		TriggerServerEvent(data["event"],innerEntity[1])
	elseif data["tunnel"] == "Policia" then
		TriggerServerEvent(data["event"],innerEntity,data["service"])

		if data["service"] then
			SetEntityHeading(ped,innerEntity[5])
		end
	elseif data["tunnel"] == "objects" then
		TriggerServerEvent(data["event"],innerEntity[3])
	elseif data["tunnel"] == "Policia2" then
		TriggerServerEvent(data["event"],innerEntity[2])
	elseif data["tunnel"] == "admin" then
		TriggerServerEvent(data["event"],innerEntity[1],innerEntity[2])
	else
		TriggerServerEvent(data["event"])
	end
end) ]]
-----------------------------------------------------------------------------------------------------------------------------------------
-- CLOSETARGET
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("closeTarget",function(data,cb)
	success = false
	targetActive = false
	SetNuiFocus(false,false)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- ROTATIONTODIRECTION
-----------------------------------------------------------------------------------------------------------------------------------------
function RotationToDirection(rotation)
	local adjustedRotation = {
		x = (math.pi / 180) * rotation["x"],
		y = (math.pi / 180) * rotation["y"],
		z = (math.pi / 180) * rotation["z"]
	}

	local direction = {
		x = -math.sin(adjustedRotation["z"]) * math.abs(math.cos(adjustedRotation["x"])),
		y = math.cos(adjustedRotation["z"]) * math.abs(math.cos(adjustedRotation["x"])),
		z = math.sin(adjustedRotation["x"])
	}

	return direction
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- RAYCASTGAMEPLAYCAMERA
-----------------------------------------------------------------------------------------------------------------------------------------
function RayCastGamePlayCamera(distance)
	local cameraCoord = GetGameplayCamCoord()
	local cameraRotation = GetGameplayCamRot()
	local direction = RotationToDirection(cameraRotation)

	local destination = {
		x = cameraCoord["x"] + direction["x"] * distance,
		y = cameraCoord["y"] + direction["y"] * distance,
		z = cameraCoord["z"] + direction["z"] * distance
	}

	local a,b,c,d,e = GetShapeTestResult(StartShapeTestRay(cameraCoord["x"],cameraCoord["y"],cameraCoord["z"],destination["x"],destination["y"],destination["z"],-1,PlayerPedId(),0))

	return b,c,e
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- ADDCIRCLEZONE
-----------------------------------------------------------------------------------------------------------------------------------------
function AddCircleZone(name,center,radius,options,targetoptions)
	Zones[name] = CircleZone:Create(center,radius,options)
	Zones[name]["targetoptions"] = targetoptions
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- ADDBOXZONE
-----------------------------------------------------------------------------------------------------------------------------------------
function AddBoxZone(name,center,length,width,options,targetoptions)
	Zones[name] = BoxZone:Create(center,length,width,options)
	Zones[name]["targetoptions"] = targetoptions
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- ADDPOLYZONE
-----------------------------------------------------------------------------------------------------------------------------------------
function AddPolyzone(name,points,options,targetoptions)
	Zones[name] = PolyZone:Create(points,options)
	Zones[name]["targetoptions"] = targetoptions
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- ADDTARGETMODEL
-----------------------------------------------------------------------------------------------------------------------------------------
function AddTargetModel(models,parameteres)
	for k,v in pairs(models) do
		Models[v] = parameteres
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- EXPORTS
-----------------------------------------------------------------------------------------------------------------------------------------
exports("AddBoxZone",AddBoxZone)
exports("AddPolyzone",AddPolyzone)
exports("AddCircleZone",AddCircleZone)
exports("AddTargetModel",AddTargetModel)