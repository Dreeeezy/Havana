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
vCLIENT = Tunnel.getInterface("shops")
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
local shops = {
	["departamentStore"] = {
		["mode"] = "Buy",
		["type"] = "Cash",
		["list"] = {
		    ["absolut"] = 40,
			["coffee"] = 10,
			["chandon"] = 120,
			["chocolate"] = 4,
			["cigarette"] = 10,
			["cola"] = 4,
			["dewars"] = 120,
			["energetic"] = 10,
			["hamburger"] = 6,
			["hennessy"] = 120,
			["lighter"] = 10,
			["bread"] = 5,
			["sandwich"] = 3,
			["soda"] = 4,
			["tacos"] = 4,
			["backpack"] = 400,
			["farinha"] = 2,
			["milk"] = 1,
			["macarrao"] = 2,
			["molho"] = 2
		}
	},
	["ammunationStore"] = {
		["mode"] = "Buy",
		["type"] = "Cash",
		["list"] = {
			["WEAPON_BAT"] = 340,
			["WEAPON_MACHETE"] = 400,
			["WEAPON_FLASHLIGHT"] = 40,
			["WEAPON_HATCHET"] = 400,
			["WEAPON_BATTLEAXE"] = 400,
			["WEAPON_STONE_HATCHET"] = 400,
			["WEAPON_HAMMER"] = 200,
			["GADGET_PARACHUTE"] = 800,
			["WEAPON_KNUCKLE"] = 450,
			["WEAPON_GOLFCLUB"] = 250,
			["WEAPON_POOLCUE"] = 120
		}
	},
	["normalpharmacyStore"] = {
		["mode"] = "Buy",
		["type"] = "Cash",
		["list"] = {
			["adrenaline"] = 500,
			["analgesic"] = 40,
			["bandage"] = 80,
			["gauze"] = 40,
			["warfarin"] = 300,
			["ritmoneury"] = 90,
			["sinkalmy"] = 90
		}
	},
	["hospitalpharmacyStore"] = {
		["mode"] = "Buy",
		["type"] = "Cash",
		["perm"] = "Paramedico",
		["list"] = {
			["adrenaline"] = 300,
			["analgesic"] = 20,
			["bandage"] = 40,
			["gauze"] = 20,
			["warfarin"] = 120,
			["ritmoneury"] = 40,
			["sinkalmy"] = 45
		}
	},
	["premiumStore"] = {
		["mode"] = "Buy",
		["type"] = "Premium",
		["list"] = {
			["premium01"] = 40,
			["premium02"] = 60,
			["premium03"] = 80,
			["premium04"] = 100,
			["premiumplate"] = 25,
			["namechange"] = 25,
			["newgarage"] = 15,
			["newchars"] = 25,
			["gemstone"] = 1
		}
	},
	["jewelryStore"] = {
		["mode"] = "Sell",
		["type"] = "Cash",
		["list"] = {
			["ametista"] = 10,
			["esmeralda"] = 6,
			["safira"] = 8,
			["turquesa"] = 6,
			["ambar"] = 4
		}
	},
	["huntingStore"] = {
		["mode"] = "Buy",
		["type"] = "Cash",
		["list"] = {
			["WEAPON_SWITCHBLADE"] = 350,
			["WEAPON_MUSKET_AMMO"] = 2,
			["WEAPON_MUSKET"] = 2500,
			["bait"] = 3,
			["fishingrod"] = 1000
		}
	},
	["fishingSell"] = { 
		["mode"] = "Sell",
		["type"] = "Cash",
		["list"] = {
			["goldenfish"] = 3,
			["horsefish"] = 5,
			["pirarucu"] = 7,
			["tilapia"] = 3,
			["catfish"] = 6,
			["codfish"] = 5,
			["carp"] = 4
		}
	},
	["recyclingSell"] = {
		["mode"] = "Sell",
		["type"] = "Cash",
		["list"] = {
			["lighter"] = 7,
			["bucket"] = 3,
			["divingsuit"] = 120,
			["teddy"] = 6,
			["fishingrod"] = 130,
			["identity"] = 4,
			["radio"] = 7,
			["tablet"] = 35,
			["cellphone"] = 30,
			["notebook"] = 30,
			["binoculars"] = 8,
			["camera"] = 20,
			["vape"] = 30,
			["pager"] = 20,
			["keyboard"] = 10,
			["mouse"] = 10,
			["ring"] = 100,
			["watch"] = 150,
			["goldbar"] = 1000,
			["playstation"] = 100,
			["xbox"] = 100,
			["legos"] = 5,
			["bracelet"] = 50,
			["dildo"] = 12,
			["ominitrix"] = 15
		}
	},
	["registryStore"] = {
		["mode"] = "Buy",
		["type"] = "Cash",
		["list"] = {
			["identity"] = 100
		}
	},
	["megaMallStore"] = {
		["mode"] = "Buy",
		["type"] = "Cash",
		["list"] = {
			["notepad"] = 10,
			["glue"] = 3,
			["teddy"] = 4,
			["rose"] = 8,
			["paperbag"] = 2,
			["firecracker"] = 30
		}
	},
	["barsStore"] = {
		["mode"] = "Buy",
		["type"] = "Cash",
		["list"] = {
			["energetic"] = 15,
			["cola"] = 2,
			["soda"] = 2,
			["absolut"] = 70,
			["chandon"] = 75,
			["dewars"] = 70,
			["hennessy"] = 70
		}
	},
	["coffeeMachine"] = {
		["mode"] = "Buy",
		["type"] = "Cash",
		["list"] = {
			["coffee"] = 13
		}
	},
	["sodaMachine"] = {
		["mode"] = "Buy",
		["type"] = "Cash",
		["list"] = {
			["soda"] = 5
		}
	},
	["colaMachine"] = {
		["mode"] = "Buy",
		["type"] = "Cash",
		["list"] = {
			["cola"] = 5
		}
	},
	["donutMachine"] = {
		["mode"] = "Buy",
		["type"] = "Cash",
		["list"] = {
			["donut"] = 4,
			["chocolate"] = 5
		}
	},
	["burgerMachine"] = {
		["mode"] = "Buy",
		["type"] = "Cash",
		["list"] = {
			["hamburger"] = 8,
			["soda"] = 7,
			["cola"] = 7
		}
	},
	["hotdogMachine"] = {
		["mode"] = "Buy",
		["type"] = "Cash",
		["list"] = {
			["hotdog"] = 10,
			["soda"] = 7,
			["cola"] = 7
		}
	},
	["waterMachine"] = {
		["mode"] = "Buy",
		["type"] = "Cash",
		["list"] = {
			["water"] = 2
		}
	},
	--[[ ["drugsSelling"] = {
		["mode"] = "Buy",
		["type"] = "Consume",
		["item"] = "dollars2",
		["list"] = {
			["meth"] = 500,
			["lean"] = 500,
			["ecstasy"] = 500
		}
	},
	["robberysSelling"] = {
		["mode"] = "Sell",
		["type"] = "Cash",
		["list"] = {
			["meth"] = 500,
			["lean"] = 500,
			["ecstasy"] = 500
		}
	} ]]
	["garagem"] = {
		["mode"] = "Buy",
		["type"] = "Cash",
		["list"] = {
			["newgarage"] = 10000
		}
	},
	["cassinobar"] = {
		["mode"] = "Buy",
		["type"] = "Cash",
		["list"] = {
			["donut"] = 9,
			["chocolate"] = 50,
			["water"] = 50,
			["coffee"] = 50,
			["fries"] = 10,
			["hamburger"] = 100
		}
	},
	["FichaS"] = {
		["mode"] = "Sell",
		["type"] = "Cash",
		["list"] = {
			["fichas"] = 5,
		}
	},
	["FichaB"] = {
		["mode"] = "Buy",
		["type"] = "Cash",
		["list"] = {
			["fichas"] = 5,
		}
	},
	["BahamasB"] = {
		["mode"] = "Buy",
		["type"] = "Cash",
		["perm"] = "Bahamas",
		["list"] = {
			["absolut"] = 1,
			["chandon"] = 1,
			["dewars"] = 1,
			["hennessy"] = 1,
			["energetic"] = 1,
			["cola"] = 1,
			["soda"] = 1,
			["water"] = 1,
			["grapejuice"] = 1,
			["orangejuice"] = 1,
			["passionjuice"] = 1,
			["strawberryjuice"] = 1,
			["tangejuice"] = 1
		}
	},
	["Galaxybar"] = {
		["mode"] = "Buy",
		["type"] = "Cash",
		["perm"] = "Galaxy",
		["list"] = {
			["absolut"] = 1,
			["chandon"] = 1,
			["dewars"] = 1,
			["hennessy"] = 1,
			["energetic"] = 1,
			["cola"] = 1,
			["soda"] = 1,
			["water"] = 1,
			["grapejuice"] = 1,
			["orangejuice"] = 1,
			["passionjuice"] = 1,
			["strawberryjuice"] = 1,
			["tangejuice"] = 1
		}
	},
	["FruitS"] = {
		["mode"] = "Sell",
		["type"] = "Cash",
		["list"] = {
			["passion"] = 9,
			["orange"] = 9,
			["strawberry"] = 9,
			["banana"] = 9,
			["grape"] = 9,
			["tange"] = 9,
			["tomato"] = 9
		}
	},
	["HuntingS"] = {
		["mode"] = "Sell",
		["type"] = "Cash",
		["list"] = {
			["animalpelt"] = 35,
			["meatA"] = 12,
			["meatB"] = 14,
			["meatC"] = 19,
			["meatS"] = 24
		}
	},
	["Pinturas"] = {
		["mode"] = "Sell",
		["type"] = "Cash",
		["list"] = {
			["painting1"] = 32900,
			["painting2"] = 36500,
			["painting3"] = 39900,
			["painting4"] = 26000
		}
	},
	["Porte"] = {
		["mode"] = "Buy",
		["type"] = "Cash",
		["perm"] = "Policia",
		["list"] = {
			["portec"] = 1000,
			["portef"] = 1000,
			["portes"] = 300,
			["WEAPON_VINTAGEPISTOL"] = 1200,
			["WEAPON_VINTAGEPISTOL_AMMO"] = 5
		}
	},
	["policeStore"] = {
		["mode"] = "Buy",
		["type"] = "Cash",
		["perm"] = "Policia",
		["list"] = {
			["vest"] = 20,
			["handcuff"] = 15,
			["gsrkit"] = 10,
			["gdtkit"] = 10,
			["WEAPON_SMG"] = 800,
			["WEAPON_CARBINERIFLE"] = 1300,
			["WEAPON_FIREEXTINGUISHER"] = 30,
			["WEAPON_STUNGUN"] = 20,
			["WEAPON_NIGHTSTICK"] = 15,
			["WEAPON_COMBATPISTOL"] = 450,
			["WEAPON_APPISTOL"] = 600,
			["WEAPON_SMG_AMMO"] = 1,
			["WEAPON_CARBINERIFLE_AMMO"] = 1,
			["WEAPON_COMBATPISTOL_AMMO"] = 1,
			["WEAPON_APPISTOL_AMMO"] = 1
		}
	},
	["digitalden"] = {   
		["mode"] = "Buy",
		["type"] = "Cash",
		["list"] = {
			["cellphone"] = 300,
			["cellbattery"] = 30,
			["descartavel1"] = 100,
			["radio"] = 120,
			["radiobattery"] = 12,
			["tablet"] = 450,
			["tabletbattery"] = 45,
			["vape"] = 40
		}
	},
	["burguershot"] = {  
		["mode"] = "Buy",
		["type"] = "Cash",
		["list"] = {
			["xblender"] = 30,
			["xsalada"] = 20,
			["xtorpedo"] = 40,
			["xmoneyshot"] = 10,
			["passionjuice"] = 10,
			["strawberryjuice"] = 10,
			["grapejuice"] = 10,
			["orangejuice"] = 10
		}
	},
	["academy"] = {   
		["mode"] = "Buy",
		["type"] = "Cash",
		["list"] = {
			["pretreino"] = 15
		}
	},
	["jailshop"] = {   
		["mode"] = "Buy",
		["type"] = "Cash",
		["list"] = {
			["mistureba"] = 3,
			["cola"] = 2
		}
	},
	["docstore"] = {
		["mode"] = "Buy",
		["type"] = "Cash",
		["perm"] = "Doc",
		["list"] = {
			["vest"] = 20,
			["handcuff"] = 15,
			["gsrkit"] = 10,
			["gdtkit"] = 10,
			["WEAPON_SMG"] = 800,
			["WEAPON_CARBINERIFLE"] = 1300,
			["WEAPON_FIREEXTINGUISHER"] = 30,
			["WEAPON_STUNGUN"] = 20,
			["WEAPON_NIGHTSTICK"] = 15,
			["WEAPON_COMBATPISTOL"] = 450,
			["WEAPON_APPISTOL"] = 600,
			["WEAPON_SMG_AMMO"] = 1,
			["WEAPON_CARBINERIFLE_AMMO"] = 1,
			["WEAPON_COMBATPISTOL_AMMO"] = 1,
			["WEAPON_APPISTOL_AMMO"] = 1
		}
	},
	["lscustom"] = {  
		["mode"] = "Buy",
		["type"] = "Cash",
		["list"] = {
			["bananajuice"] = 15,
			["cola"] = 15,
			["grapejuice"] = 15,
			["milk"] = 12,
			["passionjuice"] = 15,
			["water"] = 15,
			["chandon"] = 50,
			["orangejuice"] = 15
		}
	},
	["weedstore"] = {   
		["mode"] = "Buy",
		["type"] = "Cash",
		["list"] = {
			["cannabisseed"] = 20,
			["compost"] = 20,
			["bucket"] = 45
		}
	},
	["cartaobanco"] = {   
		["mode"] = "Buy",
		["type"] = "Cash",
		["list"] = {
			["cartaodebito"] = 10,
		}
	},
	["reciclagem2"] = {   
		["mode"] = "Sell",
		["type"] = "Cash",
		["list"] = {
			["aluminum"] = 6,
			["copper"] = 6,
			["plastic"] = 6,
			["glass"] = 6,
			["rubber"] = 6
		}
	}
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- REQUESTPERM
-----------------------------------------------------------------------------------------------------------------------------------------
function cnVRP.requestPerm(shopType)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.wantedReturn(user_id) then
			return false
		end

		if shops[shopType]["perm"] ~= nil then
			if not vRP.hasPermission(user_id,shops[shopType]["perm"]) then
				return false
			end
		end
		
		return true
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- REQUESTSHOP
-----------------------------------------------------------------------------------------------------------------------------------------
function cnVRP.requestShop(name)
	local source = source
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if user_id then
		local inventoryShop = {}
		for k,v in pairs(shops[name]["list"]) do
			table.insert(inventoryShop,{ price = parseInt(v), name = vRP.itemNameList(k), desc = vRP.itemDescList(k), tipo = vRP.itemTipoList(k), unity = vRP.itemUnityList(k), economy = vRP.itemEconomyList(k), index = vRP.itemIndexList(k), key = k, weight = vRP.itemWeightList(k) })
		end

		local inventoryUser = {}
		local inv = vRP.getInventory(user_id)
		if inv then
			for k,v in pairs(inv) do
				if string.sub(v.item,1,9) == "toolboxes" then
					local advFile = LoadResourceFile("logsystem","toolboxes.json")
					local advDecode = json.decode(advFile)

					v.durability = advDecode[v.item]
				end
				if v.item and v.timestamp then
						local actualTime = os.time()
						local finalTime = v.timestamp
						local durabilityInSeconds = vRP.itemDurabilityList(v.item)
						local startTime = (v.timestamp - durabilityInSeconds)
						
						local actualTimeInSeconds = (actualTime - startTime)
						local porcentage = (actualTimeInSeconds/durabilityInSeconds)-1
						if porcentage < 0 then porcentage = porcentage*-1 end
						if porcentage <= 0.0 then
							porcentage = 0.0
						elseif porcentage >= 100.0 then
							porcentage = 100.0
						end
						if porcentage then
							v.durability = porcentage
						end
					end

				v.amount = parseInt(v.amount)
				v.name = vRP.itemNameList(v.item)
				v.desc = vRP.itemDescList(v.item)
				v.tipo = vRP.itemTipoList(v.item)
				v.unity = vRP.itemUnityList(v.item)
				v.economy = vRP.itemEconomyList(v.item)
				v.peso = vRP.itemWeightList(v.item)
				v.index = vRP.itemIndexList(v.item)
				v.key = v.item
				v.slot = k

				inventoryUser[k] = v
			end
		end

		return inventoryShop,inventoryUser,vRP.computeInvWeight(user_id),vRP.getBackpack(user_id),{ identity.name.." "..identity.name2,parseInt(user_id),parseInt(identity.bank),parseInt(vRP.getGmsId(user_id)),identity.phone,identity.registration }
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- GETSHOPTYPE
-----------------------------------------------------------------------------------------------------------------------------------------
function cnVRP.getShopType(name)
    return shops[name].mode
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- FUNCTIONSHOP
-----------------------------------------------------------------------------------------------------------------------------------------
function cnVRP.functionShops(shopType,shopItem,shopAmount,slot)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if shopAmount == nil then shopAmount = 1 end
		if shopAmount <= 0 then shopAmount = 1 end
		local inv = vRP.getInventory(user_id)
		if inv then
			if shops[shopType]["mode"] == "Buy" then
				if vRP.computeInvWeight(parseInt(user_id)) + vRP.itemWeightList(shopItem) * parseInt(shopAmount) <= vRP.getBackpack(parseInt(user_id)) then
					if shops[shopType]["type"] == "Cash" then
						if shops[shopType]["list"][shopItem] then

							if vRP.itemSubTypeList(shopItem) then
								if (vRP.getInventoryItemAmount(user_id,shopItem) + shopAmount) > vRP.itemMaxAmount(shopItem) then
									TriggerClientEvent("Notify",source,"vermelho","Você já possui esse tipo de item ou atingiu o limite.",5000) return
								end
							end
							if vRP.havanaPay(parseInt(user_id),parseInt(shops[shopType]["list"][shopItem]*shopAmount)) then
								if inv[tostring(slot)] then
									vRP.giveInventoryItem(parseInt(user_id),shopItem,parseInt(shopAmount),false)
								else
									vRP.giveInventoryItem(parseInt(user_id),shopItem,parseInt(shopAmount),false,slot)
								end						
							else
								TriggerClientEvent("Notify",source,"vermelho","Dólares insuficientes.",5000)
							end
						end
					elseif shops[shopType]["type"] == "Consume" then
						if vRP.tryGetInventoryItem(parseInt(user_id),shops[shopType]["item"],parseInt(shops[shopType]["list"][shopItem]*shopAmount)) then
							if inv[tostring(slot)] then
								vRP.giveInventoryItem(parseInt(user_id),shopItem,parseInt(shopAmount),false)
							else
								vRP.giveInventoryItem(parseInt(user_id),shopItem,parseInt(shopAmount),false,slot)
							end
						else
							TriggerClientEvent("Notify",source,"vermelho","Insuficiente "..vRP.itemNameList(shops[shopType]["item"])..".",5000)
						end
					elseif shops[shopType]["type"] == "Premium" then
						local identity = vRP.getUserIdentity(parseInt(user_id))
						local consult = vRP.getInfos(identity.steam)
						if parseInt(consult[1].gems) >= parseInt(shops[shopType]["list"][shopItem]*shopAmount) then
							if inv[tostring(slot)] then
								vRP.giveInventoryItem(parseInt(user_id),shopItem,parseInt(shopAmount),false)
							else
								vRP.giveInventoryItem(parseInt(user_id),shopItem,parseInt(shopAmount),false,slot)
							end							vRP.remGmsId(user_id,parseInt(shops[shopType]["list"][shopItem]*shopAmount))
							TriggerClientEvent("Notify",source,"sucesso","Você comprou <b>"..vRP.format(parseInt(shopAmount)).."x "..vRP.itemNameList(shopItem).."</b> por <b>"..vRP.format(parseInt(shops[shopType]["list"][shopItem]*shopAmount)).." coins</b>.",5000)
						else
							TriggerClientEvent("Notify",source,"vermelho","Bitcoins Insuficientes.",5000)
						end
					end
				else
					TriggerClientEvent("Notify",source,"vermelho","Mochila cheia.",5000)
				end
			elseif shops[shopType]["mode"] == "Sell" then
				if shops[shopType]["list"][shopItem] then
					if shops[shopType]["type"] == "Cash" then

						if vRP.tryGetInventoryItem(parseInt(user_id),shopItem,parseInt(shopAmount),true,slot) then	
							vRP.giveInventoryItem(parseInt(user_id),"dollars",parseInt(shops[shopType]["list"][shopItem]*shopAmount),false)
							TriggerClientEvent("Notify",source,"amarelo","Você recebeu $"..shops[shopType]["list"][shopItem]*shopAmount.." Dólares.",5000)
						end
					elseif shops[shopType]["type"] == "Consume" then
						if vRP.tryGetInventoryItem(parseInt(user_id),shopItem,parseInt(shopAmount),true,slot) then

							vRP.giveInventoryItem(parseInt(user_id),shops[shopType]["item"],parseInt(shops[shopType]["list"][shopItem]*shopAmount),false)
						end
					end
				end
			end
		end

		TriggerClientEvent("shops:Update",source,"requestShop")
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- POPULATESLOT
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("shops:populateSlot")
AddEventHandler("shops:populateSlot",function(itemName,slot,target,amount)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if amount == nil then amount = 1 end
		if amount <= 0 then amount = 1 end

		if vRP.tryGetInventoryItem(user_id,itemName,amount,false,slot) then
			vRP.giveInventoryItem(user_id,itemName,amount,false,target)
			TriggerClientEvent("shops:Update",source,"requestShop")
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- POPULATESLOT
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("shops:updateSlot")
AddEventHandler("shops:updateSlot",function(itemName,slot,target,amount)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if amount == nil then amount = 1 end
		if amount <= 0 then amount = 1 end

		local inv = vRP.getInventory(user_id)
		if inv then
			if inv[tostring(slot)] and inv[tostring(target)] and inv[tostring(slot)].item == inv[tostring(target)].item then
				if vRP.tryGetInventoryItem(user_id,itemName,amount,false,slot) then
					vRP.giveInventoryItem(user_id,itemName,amount,false,target)
				end
			else
				vRP.swapSlot(user_id,slot,target)
			end
		end

		TriggerClientEvent("shops:Update",source,"requestShop")
	end
end)