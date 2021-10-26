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
local webhook = module("creative","config")
vRP.prepare("vRP/show_winrace2","SELECT * FROM vrp_races WHERE raceid = @id ORDER BY points ASC LIMIT 13")
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
local motos = {}
local carros = {}
local bichoSelect = "1"
local registerGames = {}
local lockReq = {}

Citizen.CreateThread(function()
	local vehicles = vRP.vehicleGlobal()
	for k,v in pairs(vehicles) do
		if v[4] == "cars" then
			table.insert(carros,{ k = k, name = v[1], price = v[3], chest = parseInt(v[2]) })
		elseif v[4] == "bikes" then
			table.insert(motos,{ k = k, name = v[1], price = v[3], chest = parseInt(v[2]) })
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- REQUESTABOUT
-----------------------------------------------------------------------------------------------------------------------------------------
function cRP.requestAbout()
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		local inv = vRP.getInventory(user_id)
		if inv then
			local inventory = {}
			for k,v in pairs(inv) do
					inventory[k] = v
				end

			local identity = vRP.getUserIdentity(user_id)
			return inventory,vRP.computeInvWeight(user_id),vRP.getBackpack(user_id),{ identity.name.." "..identity.name2,parseInt(user_id),parseInt(identity.bank),parseInt(vRP.getGmsId(user_id)),identity.phone,identity.registration }
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- WEBHOOK
-----------------------------------------------------------------------------------------------------------------------------------------
local webhookdealership = ""
function creativelogs(webhook,message)
	if webhook ~= nil and webhook ~= "" then
		PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({content = message}), { ['Content-Type'] = 'application/json' })
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- CARROS
-----------------------------------------------------------------------------------------------------------------------------------------
function cRP.Carros()
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		return carros
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- MOTOS
-----------------------------------------------------------------------------------------------------------------------------------------
function cRP.Motos()
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		return motos
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- SERVICOS
-----------------------------------------------------------------------------------------------------------------------------------------
function cRP.Servicos()
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		return servicos
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- POSSUIDOS
-----------------------------------------------------------------------------------------------------------------------------------------
function cRP.Possuidos()
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		local vehList = {}
		local vehicles = vRP.query("vRP/get_vehicle",{ user_id = parseInt(user_id) })
		for k,v in pairs(vehicles) do
			if v.work == "false" then
				table.insert(vehList,{ k = v.vehicle, work = v.work, name = vRP.vehicleName(v.vehicle), price = parseInt(vRP.vehiclePrice(v.vehicle)*0.7), chest = parseInt(vRP.vehicleChest(v.vehicle)) })
			end
		end
		return vehList
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- BUYDEALER
-----------------------------------------------------------------------------------------------------------------------------------------
function cRP.buyDealer(name)
	local source = source
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if user_id then
		local vehName = tostring(name)
		local maxVehs = vRP.query("vRP/con_maxvehs",{ user_id = parseInt(user_id) })
		local myGarages = vRP.getInformation(user_id)
		if vRP.getPremium(user_id) then
			if parseInt(maxVehs[1].qtd) >= parseInt(myGarages[1].garage) then
				TriggerClientEvent("Notify",source,"amarelo","Você atingiu o máximo de veículos em sua garagem.",3000)
				return
			end
		else
			if parseInt(maxVehs[1].qtd) >= parseInt(myGarages[1].garage) then
				TriggerClientEvent("Notify",source,"amarelo","Você atingiu o máximo de veículos em sua garagem.",3000)
				return
			end
		end

		local vehicle = vRP.query("vRP/get_vehicles",{ user_id = parseInt(user_id), vehicle = vehName })
		if vehicle[1] then
			TriggerClientEvent("Notify",source,"amarelo","Você já possui um <b>"..vRP.vehicleName(vehName).."</b>.",3000)
			return
		else
			if vRP.havanaPay(user_id,parseInt(vRP.vehiclePrice(vehName))) then
				vRP.execute("vRP/add_vehicle",{ user_id = parseInt(user_id), vehicle = vehName, plate = vRP.generatePlateNumber(), phone = vRP.getPhone(user_id), work = tostring(false) })
				TriggerClientEvent("Notify",source,"verde","A compra foi concluída com sucesso.",5000)
				creativelogs(webhookdealership,"```[NOME]: "..identity.name.." "..identity.name2.." \n[ID]: "..user_id.." \n[COMPROU]: "..vRP.vehicleName(name).." [POR]: R$ "..vRP.format(parseInt(vRP.vehiclePrice(name)*0.75)).." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
			else
				TriggerClientEvent("Notify",source,"vermelho","Dinheiro insuficiente na sua conta bancária.",5000)
			end
		end
	end
end

-----------------------------------------------------------------------------------------------------------------------------------------
-- SELLDEALER
-----------------------------------------------------------------------------------------------------------------------------------------
function cRP.sellDealer(name)
	local source = source
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)	
	if user_id then
		if not lockReq[user_id] or lockReq[user_id] <= os.time() then
			lockReq[user_id] = os.time() + 300
			local vehName = tostring(name)
			if vRP.vehicleType(tostring(name)) == "donate" then
				TriggerClientEvent("Notify",source,"vermelho","Voce nao pode vender este veiculo.",7000)
			else
				vRP.execute("vRP/rem_srv_data",{ dkey = "custom:"..parseInt(user_id)..":"..vehName })
				vRP.execute("vRP/rem_srv_data",{ dkey = "chest:"..parseInt(user_id)..":"..vehName })
				vRP.execute("vRP/rem_vehicle",{ user_id = parseInt(user_id), vehicle = vehName })
				vRP.addBank(user_id,parseInt(vRP.vehiclePrice(name)*0.75))
				TriggerClientEvent("Notify",source,"verde","Venda concluida com sucesso.",7000)

				PerformHttpRequest(webhook.Conce, function(err, text, headers) end, 'POST', json.encode({
					username = "Venda Concessionaria",
					avatar_url = webhook.Avatar,
					embeds = {
						{ 	------------------------------------------------------------
							title = "Registro - Venda de veículos",
							fields = {
								{ 
									name = "Usuário:", 
									value = ""..identity.name.." "..identity.name2.." [**"..user_id.."**] "
								},
								{
									name = "Vendeu:", 
									value = ""..vRP.vehicleName(name)..""
								},
								{
									name = "Por:", 
									value = ""..vRP.format(parseInt(vRP.vehiclePrice(name)*0.75))..""
								},
								--[[ {
									name = "Grupos:", 
									value = " "..groups..""
								}, ]]
								--[[ {
									name = "Usou:", 
									value = "/fix"
								}, ]]
								--[[ {
									name = "Armas:", 
									value = ""..guns.." "
								}, ]]
							}, 
							footer = {
								text = webhook.Text..os.date('[Dia:] %d-%m-%Y - [Horas:] %H:%M:%S'),
								icon_url = webhook.Icon
							},
							color = webhook.Color
						}
					}
				}), { ['Content-Type'] = 'application/json' })

				--creativelogs(webhookdealership,"```[NOME]: "..identity.name.." "..identity.name2.." \n[ID]: "..user_id.." \n[VENDEU]: "..vRP.vehicleName(name).." [POR]: R$ "..vRP.format(parseInt(vRP.vehiclePrice(name)*0.75)).." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
			end
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- REQUESTRACES
-----------------------------------------------------------------------------------------------------------------------------------------
--vRP.execute("vRP/show_winrace", { raceId = id } )

function cRP.requestRanking(raceId)
	local source = source
	--local result = MySQL.Sync.fetchAll("SELECT * FROM vrp_races WHERE raceid = @raceId",{ ['@raceId'] = raceId })
	if raceId then
		local race = {}
		local result = vRP.query("vRP/show_winrace2", { id = raceId } )
		if result then
			for k,v in pairs(result) do
				local identity = vRP.getUserIdentity(parseInt(v.user_id))
				local uname = identity.name.." "..identity.name2
				table.insert(race,{ id = v.id, name = uname, car = v.vehicle, raceid = v.raceid, pontos = v.points })
			end
			return race
		end
	end
	return nil
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- IDENTIFY PLAYER
-----------------------------------------------------------------------------------------------------------------------------------------
function cRP.playerIdentify()
	local source = source
	local user_id = vRP.getUserId(source)
	local steam = vRP.getSteam(source)
	if user_id then
		local myGarages = vRP.getInformation(user_id)
		local identity = vRP.getUserIdentity(user_id)
		local maxWeight = vRP.computeInvWeight(user_id)
		local backpack = vRP.getBackpack(user_id)
		local gems = vRP.getUserGems(user_id)
		local fullName = identity.name..' '..identity.name2
		local premium = vRP.getPremium2(steam)
		local garageMax = 2

		if vRP.hasPermission(user_id, 'Gold') then
			garageMax = 4
		end

		return 
		{
			user_id, -- 0
			fullName, -- 1
			identity.phone, -- 2
			identity.registration, -- 3
			identity.bank, -- 4
			gems, -- 5
			premium, -- 6
			garageMax, -- 7
			myGarages[1].garage -- 8
		}
	end	
end