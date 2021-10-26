-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONNECTION
-----------------------------------------------------------------------------------------------------------------------------------------
cRP = {}
Tunnel.bindInterface("player",cRP)
vCLIENT = Tunnel.getInterface("player")
vTASKBAR = Tunnel.getInterface("taskbar")
vSKINSHOP = Tunnel.getInterface("skinshop")
vGARAGE = Tunnel.getInterface("garages")

local webhook = module("creative","config")
-----------------------------------------------------------------------------------------------------------------------------------------
-- ME
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("me",function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if user_id then
		if args[1] then
			TriggerClientEvent("player:showMe",-1,source,rawCommand)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- VEHMENU:DOORS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("vehmenu:doors")
AddEventHandler("vehmenu:doors",function(doors)
    local user_id = vRP.getUserId(source)
    if user_id then
        if vRPclient.getHealth(source) > 101 and not vCLIENT.getHandcuff(source) then
            local vehicle,vehNet = vRPclient.vehList(source,7)
            if vehicle then
                TriggerClientEvent("player:syncDoors",-1,vehNet,doors)
            end
        end
    end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- PLAYER:WINSFUNCTIONS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("player:winsFunctions")
AddEventHandler("player:winsFunctions",function(winsFunctions)
 	local user_id = vRP.getUserId(source)
 	if user_id then
 		if vRPclient.getHealth(source) > 101 and not vCLIENT.getHandcuff(source) then
 			local vehicle,vehNet = vRPclient.vehList(source,7)
 			if vehicle then
 				TriggerClientEvent("player:syncWins",-1,vehNet,winsFunctions)
 			end
 		end
 	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- PLAYER:OUTFITFUNCTIONS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("player:outfitFunctions")
AddEventHandler("player:outfitFunctions",function(outfitFunctions)
	local user_id = vRP.getUserId(source)
	if user_id then
	    if vRPclient.getHealth(source) > 101 and not vCLIENT.getHandcuff(source) then
			vCLIENT.setRemoveoutfit(source)
	    end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- PLAYER:IDENTITYFUNCTIONS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("player:identityFunctions")
AddEventHandler("player:identityFunctions",function(identityFunctions)
	local source = source
    local user_id = vRP.getUserId(source)
	if user_id then
		local identity = vRP.getUserIdentity(user_id)
		if identity then
		local infos = vRP.query("vRP/get_vrp_infos",{ steam = identity.steam })		
			TriggerClientEvent("Notify",source,"default","<b>Passaporte:</b> "..vRP.format(parseInt(identity.id)).."<br><b>RG:</b> "..identity.registration.."<br><b>Nome:</b> "..identity.name.." "..identity.name2.."<br><b>Bitcoins:</b> "..infos[1].gems.."<br><b>Máximo de Veículos:</b> "..identity.garage.."<br><b>Telefone:</b> "..identity.phone.."<br><b>Premium:</b> "..infos[1].predays.." Dias",10000)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- WECOLOR
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("wecolor",function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if user_id then
		if parseInt(args[1]) >= 0 and parseInt(args[1]) <= 7 then
			if vRP.getPremium(user_id) then
				vCLIENT.weColors(source,parseInt(args[1]))
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- WELUX
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("welux",function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.getPremium(user_id) then
			vCLIENT.weLux(source)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- EMOTES
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("e",function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if user_id then
		if not vCLIENT.getHandcuff(source) then
			if args[2] == "friend" then
				local identity = vRP.getUserIdentity(user_id)
				local nplayer = vRPclient.nearestPlayer(source,2)
				if nplayer then
					if vRPclient.getHealth(nplayer) > 101 and not vCLIENT.getHandcuff(nplayer) then
						local request = vRP.request(nplayer,"Você aceita o pedido de <b>"..identity.name.." da animação <b>"..args[1].."</b>?",30)
						if request then
							TriggerClientEvent("emotes",nplayer,args[1])
							TriggerClientEvent("emotes",source,args[1])
						end
					end
				end
			else
				TriggerClientEvent("emotes",source,args[1])
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- EMOTES2
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("e2",function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.hasPermission(user_id,"Paramedico") then
			if vRPclient.getHealth(source) > 101 and not vCLIENT.getHandcuff(source) then
				local nplayer = vRPclient.nearestPlayer(source,2)
				if nplayer then
					TriggerClientEvent("emotes",nplayer,args[1])
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- PREMIUM
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("premium",function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if user_id then
		local identity = vRP.getUserIdentity(user_id)
		if identity then
			local consult = vRP.getInfos(identity.steam)
			if consult[1] and parseInt(os.time()) <= parseInt(consult[1].premium+24*consult[1].predays*60*60) then
				TriggerClientEvent("Notify",source,"importante","Você ainda tem "..vRP.getTimers(parseInt(86400*consult[1].predays-(os.time()-consult[1].premium))).." de benefícios <b>Premium</b>.",5000)
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- HOOD
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("hood",function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRPclient.getHealth(source) > 101 then
			local vehicle,vehNet = vRPclient.vehList(source,7)
			if vehicle then
				TriggerClientEvent("player:syncHood",-1,vehNet)
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- RECEIVESALARY
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("player:salary")
AddEventHandler("player:salary",function()
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		--[[ if vRP.getPremium(parseInt(user_id)) then
			vRP.setSalary(parseInt(user_id),200)
			TriggerClientEvent("Notify",source,"sucesso","Você recebeu <b>$200 dólares</b> de benefício.",5000)
		end ]]

		--[[if vRP.hasPermission(parseInt(user_id),"VipPlus") then
			vRP.addBank(parseInt(user_id),100)
			TriggerClientEvent("Notify",source,"sucesso","Voce recebeu seu salário.",5000)
		end]]
	
		if vRP.hasPermission(parseInt(user_id),"VipSilver") then
			vRP.addBank(parseInt(user_id),100)
			TriggerClientEvent("Notify",source,"sucesso","Voce recebeu seu salário.",5000)
		end

		if vRP.hasPermission(parseInt(user_id),"VipGold") then
			vRP.addBank(parseInt(user_id),200)
			TriggerClientEvent("Notify",source,"sucesso","Voce recebeu seu salário.",5000)
		end

		if vRP.hasPermission(parseInt(user_id),"VipPlatinum") then
			vRP.addBank(parseInt(user_id),300)
			TriggerClientEvent("Notify",source,"sucesso","Voce recebeu seu salário.",5000)
		end

		if vRP.hasPermission(parseInt(user_id),"VipDiamond") then
			vRP.addBank(parseInt(user_id),400)
			TriggerClientEvent("Notify",source,"sucesso","Voce recebeu seu salário.",5000)
		end

		if vRP.hasPermission(parseInt(user_id),"Policia") then
			vRP.addBank(parseInt(user_id),1600)
			TriggerClientEvent("Notify",source,"sucesso","Você recebeu <b>$1600 dólares</b> de salário.",5000)
		end

		if vRP.hasPermission(parseInt(user_id),"Fib") then
			vRP.addBank(parseInt(user_id),2100)
			TriggerClientEvent("Notify",source,"sucesso","Você recebeu <b>$2100 dólares</b> de salário.",5000)
		end

		--[[if vRP.hasPermission(parseInt(user_id),"Mecanico") then
			vRP.setSalary(parseInt(user_id),1)
			TriggerClientEvent("Notify",source,"sucesso","Você recebeu <b>$1125 dólares</b> de salário.",5000)
		end]]

		if vRP.hasPermission(parseInt(user_id),"Paramedico") then
			vRP.addBank(parseInt(user_id),1500)
			TriggerClientEvent("Notify",source,"sucesso","Você recebeu <b>$1845 dólares</b> de salário.",5000)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- DELETECHAR
-----------------------------------------------------------------------------------------------------------------------------------------
function cRP.deleteChar()
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		vRP.execute("vRP/remove_characters",{ id = parseInt(user_id) })
		Citizen.Wait(1000)
		vRP.rejoinServer(source)
		Citizen.Wait(1000)
		TriggerClientEvent("spawn:setupChars",source)
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- CALL
-----------------------------------------------------------------------------------------------------------------------------------------
--[[ RegisterCommand("call",function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if user_id then
		if not vCLIENT.getHandcuff(source) then
			local service = vRP.prompt(source,"911: Polícia     |     112: Paramédico     |     443: Mecânico","")
			if service == "" or (parseInt(service) ~= 911 and parseInt(service) ~= 112 and parseInt(service) ~= 443) then
				return
			end

			local description = vRP.prompt(source,"Descrição do ocorrido:","")
			if description == "" then
				return
			end

			local players = {}
			local answered = false
			if parseInt(service) == 911 then
				players = vRP.numPermission("Policia")
			elseif parseInt(service) == 112 then
				players = vRP.numPermission("Paramedico")
			elseif parseInt(service) == 443 then
				players = vRP.numPermission("Mecanico")
			end

			TriggerClientEvent("Notify",source,"sucesso","Chamado efetuado com sucesso, aguarde no local.",5000)

			local x,y,z = vRPclient.getPositions(source)
			local identity = vRP.getUserIdentity(user_id)

			for k,v in pairs(players) do
				local nuser_id = vRP.getUserId(v)
				local identitys = vRP.getUserIdentity(nuser_id)
				if v and v ~= source then
					async(function()
						TriggerClientEvent("NotifyPush",v,{ code = 20, title = "Chamado", x = x, y = y, z = z, name = identity.name.." "..identity.name2, phone = identity.phone, rgba = {69,115,41} })
						local request = vRP.request(v,"Aceitar o chamado de <b>"..identity.name.." "..identity.name2.."</b>?",30)
						if request then
							if not answered then
								answered = true
								vRPclient.playSound(source,"Event_Message_Purple","GTAO_FM_Events_Soundset")
								TriggerClientEvent("Notify",source,"importante","Chamado atendido por <b>"..identitys.name.." "..identitys.name2.."</b>, aguarde no local.",10000)
							else
								TriggerClientEvent("Notify",v,"negado","Chamado já foi atendido por outra pessoa.",5000)
								vRPclient.playSound(v,"CHECKPOINT_MISSED","HUD_MINI_GAME_SOUNDSET")
							end
						end
					end)
				end
			end
		end
	end
end) ]]
-----------------------------------------------------------------------------------------------------------------------------------------
-- PR
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("pr",function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if user_id and args[1] then
		if vRP.hasPermission(user_id,"Policia") then
			if vRPclient.getHealth(source) > 101 and not vCLIENT.getHandcuff(source) then
				local identity = vRP.getUserIdentity(user_id)
				local police = vRP.numPermission("Policia")
				for k,v in pairs(police) do
					async(function()
						TriggerClientEvent("chatMessage",v,identity.name.." "..identity.name2,{255,175,175},rawCommand:sub(3))
					end)
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- HR
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("hr",function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if user_id and args[1] then
		if vRP.hasPermission(user_id,"Paramedico") then
			if vRPclient.getHealth(source) > 101 and not vCLIENT.getHandcuff(source) then
				local identity = vRP.getUserIdentity(user_id)
				local police = vRP.numPermission("Paramedico")
				for k,v in pairs(police) do
					async(function()
						TriggerClientEvent("chatMessage",v,identity.name.." "..identity.name2,{255,175,175},rawCommand:sub(3))
					end)
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- EXTRAS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("extras",function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if user_id and args[1] then
		if vRP.hasPermission(user_id,"Policia") and vRP.hasPermission("Paramedico") then
			if vRPclient.getHealth(source) > 101 and not vCLIENT.getHandcuff(source) then
				vCLIENT.extraVehicle(args[1],source)
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- PLATENAME
-----------------------------------------------------------------------------------------------------------------------------------------
local plateName = { "James","John","Robert","Michael","William","David","Richard","Charles","Joseph","Thomas","Christopher","Daniel","Paul","Mark","Donald","George","Kenneth","Steven","Edward","Brian","Ronald","Anthony","Kevin","Jason","Matthew","Gary","Timothy","Jose","Larry","Jeffrey","Frank","Scott","Eric","Stephen","Andrew","Raymond","Gregory","Joshua","Jerry","Dennis","Walter","Patrick","Peter","Harold","Douglas","Henry","Carl","Arthur","Ryan","Roger","Joe","Juan","Jack","Albert","Jonathan","Justin","Terry","Gerald","Keith","Samuel","Willie","Ralph","Lawrence","Nicholas","Roy","Benjamin","Bruce","Brandon","Adam","Harry","Fred","Wayne","Billy","Steve","Louis","Jeremy","Aaron","Randy","Howard","Eugene","Carlos","Russell","Bobby","Victor","Martin","Ernest","Phillip","Todd","Jesse","Craig","Alan","Shawn","Clarence","Sean","Philip","Chris","Johnny","Earl","Jimmy","Antonio","Mary","Patricia","Linda","Barbara","Elizabeth","Jennifer","Maria","Susan","Margaret","Dorothy","Lisa","Nancy","Karen","Betty","Helen","Sandra","Donna","Carol","Ruth","Sharon","Michelle","Laura","Sarah","Kimberly","Deborah","Jessica","Shirley","Cynthia","Angela","Melissa","Brenda","Amy","Anna","Rebecca","Virginia","Kathleen","Pamela","Martha","Debra","Amanda","Stephanie","Carolyn","Christine","Marie","Janet","Catherine","Frances","Ann","Joyce","Diane","Alice","Julie","Heather","Teresa","Doris","Gloria","Evelyn","Jean","Cheryl","Mildred","Katherine","Joan","Ashley","Judith","Rose","Janice","Kelly","Nicole","Judy","Christina","Kathy","Theresa","Beverly","Denise","Tammy","Irene","Jane","Lori","Rachel","Marilyn","Andrea","Kathryn","Louise","Sara","Anne","Jacqueline","Wanda","Bonnie","Julia","Ruby","Lois","Tina","Phyllis","Norma","Paula","Diana","Annie","Lillian","Emily","Robin" }
local plateName2 = { "Smith","Johnson","Williams","Jones","Brown","Davis","Miller","Wilson","Moore","Taylor","Anderson","Thomas","Jackson","White","Harris","Martin","Thompson","Garcia","Martinez","Robinson","Clark","Rodriguez","Lewis","Lee","Walker","Hall","Allen","Young","Hernandez","King","Wright","Lopez","Hill","Scott","Green","Adams","Baker","Gonzalez","Nelson","Carter","Mitchell","Perez","Roberts","Turner","Phillips","Campbell","Parker","Evans","Edwards","Collins","Stewart","Sanchez","Morris","Rogers","Reed","Cook","Morgan","Bell","Murphy","Bailey","Rivera","Cooper","Richardson","Cox","Howard","Ward","Torres","Peterson","Gray","Ramirez","James","Watson","Brooks","Kelly","Sanders","Price","Bennett","Wood","Barnes","Ross","Henderson","Coleman","Jenkins","Perry","Powell","Long","Patterson","Hughes","Flores","Washington","Butler","Simmons","Foster","Gonzales","Bryant","Alexander","Russell","Griffin","Diaz","Hayes" }
local plateSave = {}
-----------------------------------------------------------------------------------------------------------------------------------------
-- PLATE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("placa",function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.hasPermission(user_id,"Policia") then
			if vRPclient.getHealth(source) > 101 then
				if args[1] then
					local plateUser = vRP.getVehiclePlate(tostring(args[1]))
					if plateUser then
						local identity = vRP.getUserIdentity(plateUser)
						if identity then
							vRPclient.playSound(source,"Event_Message_Purple","GTAO_FM_Events_Soundset")
							TriggerClientEvent("Notify",source,"importante","<b>Passaporte:</b> "..identity.id.."<br><b>RG:</b> "..identity.registration.."<br><b>Nome:</b> "..identity.name.." "..identity.name2.."<br><b>Telefone:</b> "..identity.phone,25000)
						end
					else
						if not plateSave[string.upper(args[1])] then
							plateSave[string.upper(args[1])] = { math.random(5000,9999),plateName[math.random(#plateName)].." "..plateName2[math.random(#plateName2)],vRP.generatePhoneNumber() }
						end

						vRPclient.playSound(source,"Event_Message_Purple","GTAO_FM_Events_Soundset")
						TriggerClientEvent("Notify",source,"importante","<b>Passaporte:</b> "..plateSave[args[1]][1].."<br><b>RG:</b> "..string.upper(args[1]).."<br><b>Nome:</b> "..plateSave[args[1]][2].."<br><b>Telefone:</b> "..plateSave[args[1]][3],25000)
					end
				else
					local vehicle,vehNet,vehPlate = vRPclient.vehList(source,7)
					if vehicle then
						local plateUser = vRP.getVehiclePlate(vehPlate)
						if plateUser then
							local identity = vRP.getUserIdentity(plateUser)
							if identity then
								vRPclient.playSound(source,"Event_Message_Purple","GTAO_FM_Events_Soundset")
								TriggerClientEvent("Notify",source,"importante","<b>Passaporte:</b> "..identity.id.."<br><b>RG:</b> "..identity.registration.."<br><b>Nome:</b> "..identity.name.." "..identity.name2.."<br><b>Telefone:</b> "..identity.phone,25000)
							end
						else
							if not plateSave[vehPlate] then
								plateSave[vehPlate] = { math.random(5000,9999),plateName[math.random(#plateName)].." "..plateName2[math.random(#plateName2)],vRP.generatePhoneNumber() }
							end

							vRPclient.playSound(source,"Event_Message_Purple","GTAO_FM_Events_Soundset")
							TriggerClientEvent("Notify",source,"importante","<b>Passaporte:</b> "..plateSave[vehPlate][1].."<br><b>RG:</b> "..vehPlate.."<br><b>Nome:</b> "..plateSave[vehPlate][2].."<br><b>Telefone:</b> "..plateSave[vehPlate][3],25000)
						end
					end
				end
			end
		end
	end
end)
RegisterNetEvent("police:runPlate")
AddEventHandler("police:runPlate", function(source,rawCommand)
local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.hasPermission(user_id,"Policia") then
			local vehicle,vehNet,vehPlate = vRPclient.vehList(user_id,7)
			if vehicle then
				local plateUser = vRP.getVehiclePlate(vehPlate)
				if plateUser then
					local identity = vRP.getUserIdentity(plateUser)
					if identity then
						vRPclient.playSound(source,"Event_Message_Purple","GTAO_FM_Events_Soundset")
						TriggerClientEvent("Notify",source,"importante","<b>Passaporte:</b> "..identity.id.."<br><b>RG:</b> "..identity.registration.."<br><b>Nome:</b> "..identity.name.." "..identity.name2.."<br><b>Telefone:</b> "..identity.phone,25000)
					end
				else
					if not plateSave[vehPlate] then
						plateSave[vehPlate] = { math.random(5000,9999),plateName[math.random(#plateName)].." "..plateName2[math.random(#plateName2)],vRP.generatePhoneNumber() }
					end
					
					vRPclient.playSound(user_id,"Event_Message_Purple","GTAO_FM_Events_Soundset")
					TriggerClientEvent("Notify",user_id,"importante","<b>Passaporte:</b> "..plateSave[vehPlate][1].."<br><b>RG:</b> "..vehPlate.."<br><b>Nome:</b> "..plateSave[vehPlate][2].."<br><b>Telefone:</b> "..plateSave[vehPlate][3],25000)
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- DETIDO
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("detido",function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.hasPermission(user_id,"Policia") then
			if vRPclient.getHealth(source) > 101 and not vCLIENT.getHandcuff(source) then
				local vehicle,vehNet,vehPlate,vehName = vRPclient.vehList(source,7)
				if vehicle then
					local plateUser = vRP.getVehiclePlate(vehPlate)
					local inVehicle = vRP.query("vRP/get_vehicles",{ user_id = parseInt(plateUser), vehicle = vehName })
					if inVehicle[1] then
						if inVehicle[1].arrest <= 0 then
							vRP.execute("vRP/set_arrest",{ user_id = parseInt(plateUser), vehicle = vehName, arrest = 1, time = parseInt(os.time()) })
							vGARAGE.deleteVehicle(source,vehicle)
							TriggerClientEvent("Notify",source,"aviso","Veículo <b>apreendido</b>.",3000)
							TriggerClientEvent("Notify",plateUser,"aviso","Veículo <b>"..vRP.vehicleName(vehName).."</b> foi conduzido para o <b>DMV</b>.",7000)
						else
							TriggerClientEvent("Notify",source,"importante","O veículo está no galpão da polícia.",5000)
						end
					end
				end
			end
		end
	end
end)
RegisterNetEvent("police:runArrest")
AddEventHandler("police:runArrest", function(source,rawCommand)
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.hasPermission(user_id,"Policia") then
			if vRPclient.getHealth(user_id) > 101 and not vCLIENT.getHandcuff(user_id) then
				local vehicle,vehNet,vehPlate,vehName = vRPclient.vehList(user_id,7)
				if vehicle then
					local plateUser = vRP.getVehiclePlate(vehPlate)
					local inVehicle = vRP.query("vRP/get_vehicles",{ user_id = parseInt(plateUser), vehicle = vehName })
					if inVehicle[1] then
						if inVehicle[1].arrest <= 0 then
							vRP.execute("vRP/set_arrest",{ user_id = parseInt(plateUser), vehicle = vehName, arrest = 1, time = parseInt(os.time()) })
							vGARAGE.deleteVehicle(source,vehicle)
							TriggerClientEvent("Notify",user_id,"aviso","Veículo <b>apreendido</b>.",3000)
							TriggerClientEvent("Notify",plateUser,"aviso","Veículo <b>"..vRP.vehicleName(vehName).."</b> foi conduzido para o <b>DMV</b>.",7000)
						else
							TriggerClientEvent("Notify",user_id,"importante","O veículo está no galpão da polícia.",5000)
						end
					end
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SERVICE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("service",function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if user_id then
		if not vCLIENT.getHandcuff(source) then
			local distanceService,service = vCLIENT.distanceService(source)
			if distanceService then
				if service == "Policia" then
					if vRP.hasPermission(user_id,"Policia") then
						vRP.removePermission(source,"Policia")
						TriggerEvent("blipsystem:serviceExit",source)
						TriggerClientEvent("tencode:StatusService",source,false)
						TriggerClientEvent("police:updateService",source,false)
						TriggerClientEvent("Notify",source,"importante","Você saiu de serviço.",5000)
						vRP.execute("vRP/upd_group",{ user_id = user_id, permiss = "Policia", newpermiss = "waitPolice" })
					elseif vRP.hasPermission(user_id,"waitPolice") then
						vRP.insertPermission(source,"Policia")
						TriggerClientEvent("tencode:StatusService",source,true)
						TriggerClientEvent("police:updateService",source,true)
						TriggerEvent("blipsystem:serviceEnter",source,"Policia",77)
						TriggerClientEvent("Notify",source,"importante","Você entrou em serviço.",5000)
						vRP.execute("vRP/upd_group",{ user_id = user_id, permiss = "waitPolice", newpermiss = "Policia" })
					end
				end

				if service == "Paramedico" then
					if vRP.hasPermission(user_id,"Paramedico") then
						vRP.removePermission(source,"Paramedico")
						--TriggerEvent("blipsystem:serviceExit",source)
						TriggerClientEvent("paramedic:updateService",source,false)
						TriggerClientEvent("Notify",source,"importante","Você saiu de serviço.",5000)
						vRP.execute("vRP/upd_group",{ user_id = user_id, permiss = "Paramedico", newpermiss = "waitParamedic" })
					elseif vRP.hasPermission(user_id,"waitParamedic") then
						vRP.insertPermission(source,"Paramedico")
						--TriggerEvent("blipsystem:serviceEnter",source,"Paramedico",83)
						TriggerClientEvent("paramedic:updateService",source,true)
						TriggerClientEvent("Notify",source,"importante","Você entrou em serviço.",5000)
						vRP.execute("vRP/upd_group",{ user_id = user_id, permiss = "waitParamedic", newpermiss = "Paramedico" })
					end
				end

				if service == "Mecanico" then
					if vRP.hasPermission(user_id,"Mecanico") then
						vRP.removePermission(source,"Mecanico")
						--TriggerEvent("blipsystem:serviceExit",source)
						TriggerClientEvent("Notify",source,"importante","Você saiu de serviço.",5000)
						vRP.execute("vRP/upd_group",{ user_id = user_id, permiss = "Mecanico", newpermiss = "waitMechanic" })
					elseif vRP.hasPermission(user_id,"waitMechanic") then
						vRP.insertPermission(source,"Mecanico")
						--TriggerEvent("blipsystem:serviceEnter",source,"Mecanico",77)
						TriggerClientEvent("Notify",source,"importante","Você entrou em serviço.",5000)
						vRP.execute("vRP/upd_group",{ user_id = user_id, permiss = "waitMechanic", newpermiss = "Mecanico" })
					end
				end

				if service == "Fib" then
					if vRP.hasPermission(user_id,"Fib") then
						vRP.removePermission(source,"Fib")
						--TriggerEvent("blipsystem:serviceExit",source)
						--TriggerClientEvent("tencode:StatusService",source,false)
						TriggerClientEvent("Notify",source,"importante","Você saiu de serviço.",5000)
						vRP.execute("vRP/upd_group",{ user_id = user_id, permiss = "Fib", newpermiss = "waitFib" })
					elseif vRP.hasPermission(user_id,"waitFib") then
						vRP.insertPermission(source,"Fib")
						--TriggerClientEvent("tencode:StatusService",source,true)
						--TriggerEvent("blipsystem:serviceEnter",source,"Mecanico",77)
						TriggerClientEvent("Notify",source,"importante","Você entrou em serviço.",5000)
						vRP.execute("vRP/upd_group",{ user_id = user_id, permiss = "waitFib", newpermiss = "Fib" })
					end
				end
	
			else
				TriggerClientEvent("Notify",source,"importante","Você esta lonje de sua sede.",5000)
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CUFF
-----------------------------------------------------------------------------------------------------------------------------------------
local poCuff = {}
function cRP.cuffToggle()
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.hasPermission(user_id,"Policia") then
			if vRPclient.getHealth(source) > 101 and not vCLIENT.getHandcuff(source) and poCuff[user_id] == nil then
				if not vRPclient.inVehicle(source) then
					local nplayer = vRPclient.nearestPlayer(source,2)
					if nplayer then
						if vCLIENT.getHandcuff(nplayer) then
							vCLIENT.toggleHandcuff(nplayer)
							vRPclient._stopAnim(nplayer,false)
							TriggerClientEvent("sound:source",source,"uncuff",0.5)
							TriggerClientEvent("sound:source",nplayer,"uncuff",0.5)
						else
							poCuff[user_id] = true
							local taskResult = vTASKBAR.taskHandcuff(nplayer)
							if not taskResult then
								vCLIENT.toggleHandcuff(nplayer)
								TriggerClientEvent("sound:source",source,"cuff",0.5)
								TriggerClientEvent("sound:source",nplayer,"cuff",0.5)
								vRPclient._playAnim(nplayer,true,{"mp_arresting","idle"},true)
							end
							poCuff[user_id] = nil
						end
					end
				end
			end
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADFIRED
-----------------------------------------------------------------------------------------------------------------------------------------
local shotFired = {}
Citizen.CreateThread(function()
	while true do
		for k,v in pairs(shotFired) do
			if shotFired[k] > 0 then
				shotFired[k] = v - 10
				if shotFired[k] <= 0 then
					shotFired[k] = nil
				end
			end
		end
		Citizen.Wait(10000)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SHOTSFIRED
-----------------------------------------------------------------------------------------------------------------------------------------
function cRP.shotsFired()
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if shotFired[user_id] == nil then
			if not vRP.hasPermission(user_id,"Policia") or vRP.hasPermission(user_id,"Fib") then
				local distance = vCLIENT.shotDistance(source)

				if distance then
					shotFired[user_id] = 30
					local x,y,z = vRPclient.getPositions(source)
					local comAmount = vRP.numPermission("Policia") or vRP.hasPermission(user_id,"Fib")
					for k,v in pairs(comAmount) do
						async(function()
							TriggerClientEvent("NotifyPush",v,{ time = os.date("%H:%M:%S - %d/%m/%Y"), code = 10, title = "Confronto em andamento", x = x, y = y, z = z, criminal = "Disparos de arma de fogo", rgba = {105,52,136} })
						end)
					end
				end
			end
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- CARRY
-----------------------------------------------------------------------------------------------------------------------------------------
function cRP.carryToggle()
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.hasPermission(user_id,"Policia") or vRP.hasPermission(user_id,"Paramedico") or vRP.hasPermission(user_id,"Fib") then
			if vRPclient.getHealth(source) > 101 and not vCLIENT.getHandcuff(source) then
				local nplayer = vRPclient.nearestPlayer(source,2)
				if nplayer then
					vCLIENT.toggleCarry(nplayer,source)
				end
			end
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- CARRY
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("carregar2",function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if user_id then
		--if vRP.hasPermission(user_id,"Policia") or vRP.hasPermission(user_id,"Paramedico") then
			if vRPclient.getHealth(source) > 101 and not vCLIENT.getHandcuff(source) then
				local nplayer = vRPclient.nearestPlayer(source,2)
				if nplayer then
					TriggerClientEvent("rope:toggleRope",source,nplayer)
				end
			end
		end
	--end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- RV
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("rv",function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if user_id then
		--if vRP.hasPermission(user_id,"Policia") or vRP.hasPermission(user_id,"Paramedico") or vRP.getInventoryItemAmount(user_id,"rope") or vRP.getInventoryItemAmount(user_id,"handcuff") >= 1 then
			if vRPclient.getHealth(source) > 101 and not vCLIENT.getHandcuff(source) and not vRPclient.inVehicle(source) then
				local vehicle,vehNet,vehPlate,vehName,vehLock = vRPclient.vehList(source,11)
				if vehicle then
					if vehLock ~= 1 then
						local nplayer = vRPclient.nearestPlayer(source,11)
						if nplayer then
							vCLIENT.removeVehicle(nplayer)
						end
					end
				end
			end
		--end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CV
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("cv",function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if user_id then
		--if vRP.hasPermission(user_id,"Policia") or vRP.hasPermission(user_id,"Paramedico") or vRP.getInventoryItemAmount(user_id,"rope") or vRP.getInventoryItemAmount(user_id,"handcuff") >= 1 then
			if vRPclient.getHealth(source) > 101 and not vCLIENT.getHandcuff(source) and not vRPclient.inVehicle(source) then
				local vehicle,vehNet,vehPlate,vehName,vehLock = vRPclient.vehList(source,11)
				if vehicle then
					if vehLock ~= 1 then
						local nplayer = vRPclient.nearestPlayer(source,2)
						if nplayer then
							vCLIENT.putVehicle(nplayer,args[1])
						end
					end
				end
			end
		--end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHECK
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("check",function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.hasPermission(user_id,"Policia") or vRP.hasPermission(user_id,"Fib") or vRP.hasPermission(user_id,"Paramedico") then
			if parseInt(args[1]) > 0 then
				local nuser_id = parseInt(args[1])
				local identity = vRP.getUserIdentity(nuser_id)
				if identity then
					local fines = 0
					local consult = vRP.getFines(nuser_id)
					for k,v in pairs(consult) do
						fines = parseInt(fines) + parseInt(v.price)
					end

					TriggerClientEvent("Notify",source,"importante","<b>Passaporte:</b> "..identity.id.."<br><b>Nome:</b> "..identity.name.." "..identity.name2.."<br><b>RG:</b> "..identity.registration.."<br><b>Telefone:</b> "..identity.phone.."<br><b>Multas Pendentes:</b> $"..vRP.format(parseInt(fines)),20000)
				end
			else
				local nplayer = vRPclient.nearestPlayer(source,2)
				if nplayer then
					local nuser_id = vRP.getUserId(nplayer)
					if nuser_id then
						local identity = vRP.getUserIdentity(nuser_id)
						if identity then
							local fines = 0
							local consult = vRP.getFines(nuser_id)
							for k,v in pairs(consult) do
								fines = parseInt(fines) + parseInt(v.price)
							end

							TriggerClientEvent("Notify",source,"importante","<b>Passaporte:</b> "..identity.id.."<br><b>Nome:</b> "..identity.name.." "..identity.name2.."<br><b>RG:</b> "..identity.registration.."<br><b>Telefone:</b> "..identity.phone.."<br><b>Multas Pendentes:</b> $"..vRP.format(parseInt(fines)),20000)
						end
					end
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- PRESET
-----------------------------------------------------------------------------------------------------------------------------------------
local preset = {
	["Policia"] = {
		["1"] = {
			["homem"] = {
				["hat"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 },
				["pants"] = { item = 25, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["vest"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["bracelet"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 },
				["decals"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["mask"] = { item = 121, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["shoes"] = { item = 25, texture = 0, defaultItem = 1, defaultTexture = 0 },
				["t-shirt"] = { item = 56, texture = 0, defaultItem = 1, defaultTexture = 0 },
				["bag"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["torso2"] = { item = 149, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["accessory"] = { item = 1, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["watch"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 },
				["arms"] = { item = 19, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["glass"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["ear"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 }
			},
			["mulher"] = {
				["hat"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 },
				["pants"] = { item = 31, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["vest"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["bracelet"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 },
				["decals"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["mask"] = { item = 121, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["shoes"] = { item = 9, texture = 0, defaultItem = 1, defaultTexture = 0 },
				["t-shirt"] = { item = 27, texture = 0, defaultItem = 1, defaultTexture = 0 },
				["bag"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["torso2"] = { item = 144, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["accessory"] = { item = 1, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["watch"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 },
				["arms"] = { item = 31, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["glass"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["ear"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 }
			}
		},
		["2"] = {
			["homem"] = {
				["hat"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 },
				["pants"] = { item = 25, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["vest"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["bracelet"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 },
				["decals"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["mask"] = { item = 121, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["shoes"] = { item = 25, texture = 0, defaultItem = 1, defaultTexture = 0 },
				["t-shirt"] = { item = 56, texture = 0, defaultItem = 1, defaultTexture = 0 },
				["bag"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["torso2"] = { item = 143, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["accessory"] = { item = 1, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["watch"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 },
				["arms"] = { item = 20, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["glass"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["ear"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 }
			},
			["mulher"] = {
				["hat"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 },
				["pants"] = { item = 31, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["vest"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["bracelet"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 },
				["decals"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["mask"] = { item = 121, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["shoes"] = { item = 9, texture = 0, defaultItem = 1, defaultTexture = 0 },
				["t-shirt"] = { item = 27, texture = 0, defaultItem = 1, defaultTexture = 0 },
				["bag"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["torso2"] = { item = 143, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["accessory"] = { item = 1, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["watch"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 },
				["arms"] = { item = 23, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["glass"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["ear"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 }
			}
		},
		["3"] = {
			["homem"] = {
				["hat"] = { item = 13, texture = 0, defaultItem = -1, defaultTexture = 0 },
				["pants"] = { item = 25, texture = 1, defaultItem = 0, defaultTexture = 0 },
				["vest"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["bracelet"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 },
				["decals"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["mask"] = { item = 121, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["shoes"] = { item = 25, texture = 0, defaultItem = 1, defaultTexture = 0 },
				["t-shirt"] = { item = 56, texture = 0, defaultItem = 1, defaultTexture = 0 },
				["bag"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["torso2"] = { item = 74, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["accessory"] = { item = 1, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["watch"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 },
				["arms"] = { item = 19, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["glass"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["ear"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 }
			},
			["mulher"] = {
				["hat"] = { item = 13, texture = 0, defaultItem = -1, defaultTexture = 0 },
				["pants"] = { item = 31, texture = 1, defaultItem = 0, defaultTexture = 0 },
				["vest"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["bracelet"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 },
				["decals"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["mask"] = { item = 121, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["shoes"] = { item = 9, texture = 0, defaultItem = 1, defaultTexture = 0 },
				["t-shirt"] = { item = 27, texture = 0, defaultItem = 1, defaultTexture = 0 },
				["bag"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["torso2"] = { item = 110, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["accessory"] = { item = 1, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["watch"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 },
				["arms"] = { item = 31, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["glass"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["ear"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 }
			}
		},
		["4"] = {
			["homem"] = {
				["hat"] = { item = 13, texture = 0, defaultItem = -1, defaultTexture = 0 },
				["pants"] = { item = 25, texture = 1, defaultItem = 0, defaultTexture = 0 },
				["vest"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["bracelet"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 },
				["decals"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["mask"] = { item = 121, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["shoes"] = { item = 25, texture = 0, defaultItem = 1, defaultTexture = 0 },
				["t-shirt"] = { item = 56, texture = 0, defaultItem = 1, defaultTexture = 0 },
				["bag"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["torso2"] = { item = 24, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["accessory"] = { item = 1, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["watch"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 },
				["arms"] = { item = 20, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["glass"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["ear"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 }
			},
			["mulher"] = {
				["hat"] = { item = 13, texture = 0, defaultItem = -1, defaultTexture = 0 },
				["pants"] = { item = 31, texture = 1, defaultItem = 0, defaultTexture = 0 },
				["vest"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["bracelet"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 },
				["decals"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["mask"] = { item = 121, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["shoes"] = { item = 9, texture = 0, defaultItem = 1, defaultTexture = 0 },
				["t-shirt"] = { item = 27, texture = 0, defaultItem = 1, defaultTexture = 0 },
				["bag"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["torso2"] = { item = 146, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["accessory"] = { item = 1, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["watch"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 },
				["arms"] = { item = 23, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["glass"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["ear"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 }
			}
		},
		["5"] = {
			["homem"] = {
				["hat"] = { item = 13, texture = 2, defaultItem = -1, defaultTexture = 0 },
				["pants"] = { item = 25, texture = 2, defaultItem = 0, defaultTexture = 0 },
				["vest"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["bracelet"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 },
				["decals"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["mask"] = { item = 121, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["shoes"] = { item = 25, texture = 0, defaultItem = 1, defaultTexture = 0 },
				["t-shirt"] = { item = 56, texture = 0, defaultItem = 1, defaultTexture = 0 },
				["bag"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["torso2"] = { item = 200, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["accessory"] = { item = 1, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["watch"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 },
				["arms"] = { item = 20, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["glass"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["ear"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 }
			},
			["mulher"] = {
				["hat"] = { item = 13, texture = 2, defaultItem = -1, defaultTexture = 0 },
				["pants"] = { item = 31, texture = 2, defaultItem = 0, defaultTexture = 0 },
				["vest"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["bracelet"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 },
				["decals"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["mask"] = { item = 121, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["shoes"] = { item = 9, texture = 0, defaultItem = 1, defaultTexture = 0 },
				["t-shirt"] = { item = 27, texture = 0, defaultItem = 1, defaultTexture = 0 },
				["bag"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["torso2"] = { item = 202, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["accessory"] = { item = 1, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["watch"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 },
				["arms"] = { item = 23, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["glass"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["ear"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 }
			}
		}
	},
	["Paramedico"] = {
		["1"] = {
			["homem"] = {
				["hat"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 },
				["pants"] = { item = 20, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["vest"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["bracelet"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 },
				["decals"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["mask"] = { item = 121, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["shoes"] = { item = 7, texture = 0, defaultItem = 1, defaultTexture = 0 },
				["t-shirt"] = { item = 96, texture = 1, defaultItem = 1, defaultTexture = 0 },
				["bag"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["torso2"] = { item = 32, texture = 7, defaultItem = 0, defaultTexture = 0 },
				["accessory"] = { item = 126, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["watch"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 },
				["arms"] = { item = 79, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["glass"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["ear"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 }
			},
			["mulher"] = {
				["hat"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 },
				["pants"] = { item = 23, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["vest"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["bracelet"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 },
				["decals"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["mask"] = { item = 121, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["shoes"] = { item = 7, texture = 3, defaultItem = 1, defaultTexture = 0 },
				["t-shirt"] = { item = 101, texture = 1, defaultItem = 1, defaultTexture = 0 },
				["bag"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["torso2"] = { item = 58, texture = 7, defaultItem = 0, defaultTexture = 0 },
				["accessory"] = { item = 96, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["watch"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 },
				["arms"] = { item = 91, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["glass"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["ear"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 }
			}
		}
	}
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- PRESET
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("preset",function(source,args,rawCommand)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if parseInt(args[1]) > 0 then
			if vRPclient.getHealth(source) > 101 and not vCLIENT.getHandcuff(source) then
				local model = vRPclient.getModelPlayer(source)
				if vRP.hasPermission(user_id,"Paramedico") and preset["Paramedico"][tostring(args[1])] then
					if model == "mp_m_freemode_01" then
						TriggerClientEvent("updateRoupas",source,preset["Paramedico"][tostring(args[1])]["homem"])
					elseif model == "mp_f_freemode_01" then
						TriggerClientEvent("updateRoupas",source,preset["Paramedico"][tostring(args[1])]["mulher"])
					end
				elseif vRP.hasPermission(user_id,"Policia") and preset["Policia"][tostring(args[1])] then
					if model == "mp_m_freemode_01" then
						TriggerClientEvent("updateRoupas",source,preset["Policia"][tostring(args[1])]["homem"])
					elseif model == "mp_f_freemode_01" then
						TriggerClientEvent("updateRoupas",source,preset["Policia"][tostring(args[1])]["mulher"])
					end
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- OUTFIT
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("outfit",function(source,args,rawCommand)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if not vRP.wantedReturn(user_id) and not vRP.reposeReturn(user_id) then
			if args[1] then
				if args[1] == "save" then
					local custom = vSKINSHOP.getCustomization(source)
					if custom then
						vRP.setSData("saveClothes:"..parseInt(user_id),json.encode(custom))
						TriggerClientEvent("Notify",source,"sucesso","Outfit salvo com sucesso.",3000)
					end
				end
			else
				local consult = vRP.getSData("saveClothes:"..parseInt(user_id))
				local result = json.decode(consult)
				if result then
					TriggerClientEvent("updateRoupas",source,result)
					TriggerClientEvent("Notify",source,"sucesso","Outfit aplicado com sucesso.",3000)
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- PREMIUMFIT
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("premiumfit",function(source,args,rawCommand)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if not vRP.wantedReturn(user_id) and not vRP.reposeReturn(user_id) and vRP.getPremium(user_id) then
			if args[1] then
				if args[1] == "save" then
					local custom = vSKINSHOP.getCustomization(source)
					if custom then
						vRP.setSData("premClothes:"..parseInt(user_id),json.encode(custom))
						TriggerClientEvent("Notify",source,"sucesso","Premiumfit salvo com sucesso.",3000)
					end
				end
			else
				local consult = vRP.getSData("premClothes:"..parseInt(user_id))
				local result = json.decode(consult)
				if result then
					TriggerClientEvent("updateRoupas",source,result)
					TriggerClientEvent("Notify",source,"sucesso","Premiumfit aplicado com sucesso.",3000)
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SETREPOSE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("setrepouso",function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"Paramedico") then
		local nplayer = vRPclient.nearestPlayer(source,2)
		if nplayer then
			local nuser_id = vRP.getUserId(nplayer)
			if nuser_id then
				local identity = vRP.getUserIdentity(parseInt(nuser_id))
				if vRP.request(source,"Deseja aplicar <b>"..parseInt(args[1]).." minutos</b>.",30) then
					vRP.reposeTimer(nuser_id,parseInt(args[1]))
					TriggerClientEvent("Notify",source,"sucesso","Você aplicou <b>"..parseInt(args[1]).." minutos</b> de repouso.",10000)
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- WALKING
-----------------------------------------------------------------------------------------------------------------------------------------
local walking = {
	{ "move_m@alien" },
	{ "anim_group_move_ballistic" },
	{ "move_f@arrogant@a" },
	{ "move_m@brave" },
	{ "move_m@casual@a" },
	{ "move_m@casual@b" },
	{ "move_m@casual@c" },
	{ "move_m@casual@d" },
	{ "move_m@casual@e" },
	{ "move_m@casual@f" },
	{ "move_f@chichi" },
	{ "move_m@confident" },
	{ "move_m@business@a" },
	{ "move_m@business@b" },
	{ "move_m@business@c" },
	{ "move_m@drunk@a" },
	{ "move_m@drunk@slightlydrunk" },
	{ "move_m@buzzed" },
	{ "move_m@drunk@verydrunk" },
	{ "move_f@femme@" },
	{ "move_characters@franklin@fire" },
	{ "move_characters@michael@fire" },
	{ "move_m@fire" },
	{ "move_f@flee@a" },
	{ "move_p_m_one" },
	{ "move_m@gangster@generic" },
	{ "move_m@gangster@ng" },
	{ "move_m@gangster@var_e" },
	{ "move_m@gangster@var_f" },
	{ "move_m@gangster@var_i" },
	{ "anim@move_m@grooving@" },
	{ "move_f@heels@c" },
	{ "move_m@hipster@a" },
	{ "move_m@hobo@a" },
	{ "move_f@hurry@a" },
	{ "move_p_m_zero_janitor" },
	{ "move_p_m_zero_slow" },
	{ "move_m@jog@" },
	{ "anim_group_move_lemar_alley" },
	{ "move_heist_lester" },
	{ "move_f@maneater" },
	{ "move_m@money" },
	{ "move_m@posh@" },
	{ "move_f@posh@" },
	{ "move_m@quick" },
	{ "female_fast_runner" },
	{ "move_m@sad@a" },
	{ "move_m@sassy" },
	{ "move_f@sassy" },
	{ "move_f@scared" },
	{ "move_f@sexy@a" },
	{ "move_m@shadyped@a" },
	{ "move_characters@jimmy@slow@" },
	{ "move_m@swagger" },
	{ "move_m@tough_guy@" },
	{ "move_f@tough_guy@" },
	{ "move_p_m_two" },
	{ "move_m@bag" },
	{ "move_m@injured" }
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- ANDAR
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("andar",function(source,args,rawCommand)
	if args[1] then
		if not vCLIENT.getHandcuff(source) then
			vCLIENT.movementClip(source,walking[parseInt(args[1])][1])
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- FATURAS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("faturas",function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if user_id then
		local nuser_id = vRP.prompt(source,"Passaporte:","")
		if nuser_id == "" or parseInt(nuser_id) <= 0 then
			return
		end

		local price = vRP.prompt(source,"Valor da fatura:","")
		if price == "" or parseInt(price) <= 0 then
			return
		end

		local reason = vRP.prompt(source,"Descrição da fatura:","")
		if reason == "" then
			return
		end

		local nplayer = vRP.getUserSource(parseInt(nuser_id))
		if nplayer then
			local identity = vRP.getUserIdentity(user_id)
			local answered = vRP.request(nplayer,"Deseja aceitar a fatura no valor de <b>$"..vRP.format(parseInt(price)).." dólares</b>?",60)
			if answered then
				vRP.setInvoice(parseInt(nuser_id),parseInt(price),parseInt(user_id),tostring(reason))
				TriggerClientEvent("Notify",source,"verde","A sua fatura foi aceita.",5000)
			else
				TriggerClientEvent("Notify",source,"vermelho","A sua fatura foi rejeitada.",5000)
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- LIVERY
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("extras",function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if user_id then
		if (vRP.hasPermission(user_id,"Policia") or vRP.hasPermission(user_id,"Paramedico")) and parseInt(args[1]) > 0 then
			vCLIENT.toggleLivery(source,parseInt(args[1]))
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- ADD
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("add",function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if user_id then
		if parseInt(args[2]) > 0 then
			if args[1] == "Policia" then
				if vRP.hasPermission(user_id,"PolMaster") then
					--vRP.execute("vRP/cle_group",{ user_id = parseInt(args[2]) })
					vRP.execute("vRP/add_group",{ user_id = parseInt(args[2]), permiss = tostring("waitPolice") })
					TriggerClientEvent("Notify",source,"sucesso","Passaporte <b>"..vRP.format(parseInt(args[2])).."</b> adicionado com sucesso.",5000)
				end
			end

			if args[1] == "Paramedico" then
				if vRP.hasPermission(user_id,"ParMaster") then
					--vRP.execute("vRP/cle_group",{ user_id = parseInt(args[2]) })
					vRP.execute("vRP/add_group",{ user_id = parseInt(args[2]), permiss = tostring("waitParamedic") })
					TriggerClientEvent("Notify",source,"sucesso","Passaporte <b>"..vRP.format(parseInt(args[2])).."</b> adicionado com sucesso.",5000)
				end
			end

			if args[1] == "Mecanico" then
				if vRP.hasPermission(user_id,"MecMaster") then
					--vRP.execute("vRP/cle_group",{ user_id = parseInt(args[2]) })
					vRP.execute("vRP/add_group",{ user_id = parseInt(args[2]), permiss = tostring("waitMecanico") })
					TriggerClientEvent("Notify",source,"sucesso","Passaporte <b>"..vRP.format(parseInt(args[2])).."</b> adicionado com sucesso.",5000)
				end
			end

			if args[1] == "Ballas" then
				if vRP.hasPermission(user_id,"BallasMaster") then
					--vRP.execute("vRP/cle_group",{ user_id = parseInt(args[2]) })
					vRP.execute("vRP/add_group",{ user_id = parseInt(args[2]), permiss = tostring("Ballas") })
					TriggerClientEvent("Notify",source,"sucesso","Passaporte <b>"..vRP.format(parseInt(args[2])).."</b> adicionado com sucesso.",5000)
				end
			end

			if args[1] == "Groove" then
				if vRP.hasPermission(user_id,"GrooveMaster") then
					--vRP.execute("vRP/cle_group",{ user_id = parseInt(args[2]) })
					vRP.execute("vRP/add_group",{ user_id = parseInt(args[2]), permiss = tostring("Groove") })
					TriggerClientEvent("Notify",source,"sucesso","Passaporte <b>"..vRP.format(parseInt(args[2])).."</b> adicionado com sucesso.",5000)
				end
			end

			if args[1] == "Vagos" then
				if vRP.hasPermission(user_id,"VagosMaster") then
					--vRP.execute("vRP/cle_group",{ user_id = parseInt(args[2]) })
					vRP.execute("vRP/add_group",{ user_id = parseInt(args[2]), permiss = tostring("Vagos") })
					TriggerClientEvent("Notify",source,"sucesso","Passaporte <b>"..vRP.format(parseInt(args[2])).."</b> adicionado com sucesso.",5000)
				end
			end

			if args[1] == "Bratva" then
				if vRP.hasPermission(user_id,"BratvaMaster") then
					--vRP.execute("vRP/cle_group",{ user_id = parseInt(args[2]) })
					vRP.execute("vRP/add_group",{ user_id = parseInt(args[2]), permiss = tostring("Bratva") })
					TriggerClientEvent("Notify",source,"sucesso","Passaporte <b>"..vRP.format(parseInt(args[2])).."</b> adicionado com sucesso.",5000)
				end
			end

			if args[1] == "Yakuza" then
				if vRP.hasPermission(user_id,"YakuzaMaster") then
					--vRP.execute("vRP/cle_group",{ user_id = parseInt(args[2]) })
					vRP.execute("vRP/add_group",{ user_id = parseInt(args[2]), permiss = tostring("Yakuza") })
					TriggerClientEvent("Notify",source,"sucesso","Passaporte <b>"..vRP.format(parseInt(args[2])).."</b> adicionado com sucesso.",5000)
				end
			end

			if args[1] == "Cosanostra" then
				if vRP.hasPermission(user_id,"CosanostraMaster") then
					--vRP.execute("vRP/cle_group",{ user_id = parseInt(args[2]) })
					vRP.execute("vRP/add_group",{ user_id = parseInt(args[2]), permiss = tostring("Cosanostra") })
					TriggerClientEvent("Notify",source,"sucesso","Passaporte <b>"..vRP.format(parseInt(args[2])).."</b> adicionado com sucesso.",5000)
				end
			end

			if args[1] == "Elcapone" then
				if vRP.hasPermission(user_id,"ElcaponeMaster") then
					--vRP.execute("vRP/cle_group",{ user_id = parseInt(args[2]) })
					vRP.execute("vRP/add_group",{ user_id = parseInt(args[2]), permiss = tostring("Elcapone") })
					TriggerClientEvent("Notify",source,"sucesso","Passaporte <b>"..vRP.format(parseInt(args[2])).."</b> adicionado com sucesso.",5000)
				end
			end

			if args[1] == "Vanilla" then
				if vRP.hasPermission(user_id,"VanillaMaster") then
					--vRP.execute("vRP/cle_group",{ user_id = parseInt(args[2]) })
					vRP.execute("vRP/add_group",{ user_id = parseInt(args[2]), permiss = tostring("Vanilla") })
					TriggerClientEvent("Notify",source,"sucesso","Passaporte <b>"..vRP.format(parseInt(args[2])).."</b> adicionado com sucesso.",5000)
				end
			end

			if args[1] == "Burgershot" then
				if vRP.hasPermission(user_id,"BurgershotMaster") then
					--vRP.execute("vRP/cle_group",{ user_id = parseInt(args[2]) })
					vRP.execute("vRP/add_group",{ user_id = parseInt(args[2]), permiss = tostring("Burgershot") })
					TriggerClientEvent("Notify",source,"sucesso","Passaporte <b>"..vRP.format(parseInt(args[2])).."</b> adicionado com sucesso.",5000)
				end
			end

			if args[1] == "Cassino" then
				if vRP.hasPermission(user_id,"CassinoMaster") then
					--vRP.execute("vRP/cle_group",{ user_id = parseInt(args[2]) })
					vRP.execute("vRP/add_group",{ user_id = parseInt(args[2]), permiss = tostring("Cassino") })
					TriggerClientEvent("Notify",source,"sucesso","Passaporte <b>"..vRP.format(parseInt(args[2])).."</b> adicionado com sucesso.",5000)
				end
			end

			if args[1] == "Bahamas" then
				if vRP.hasPermission(user_id,"BahamasMaster") then
					--vRP.execute("vRP/cle_group",{ user_id = parseInt(args[2]) })
					vRP.execute("vRP/add_group",{ user_id = parseInt(args[2]), permiss = tostring("Bahamas") })
					TriggerClientEvent("Notify",source,"sucesso","Passaporte <b>"..vRP.format(parseInt(args[2])).."</b> adicionado com sucesso.",5000)
				end
			end

			if args[1] == "Desmanche" then
				if vRP.hasPermission(user_id,"DesmancheMaster") then
					--vRP.execute("vRP/cle_group",{ user_id = parseInt(args[2]) })
					vRP.execute("vRP/add_group",{ user_id = parseInt(args[2]), permiss = tostring("Desmanche") })
					TriggerClientEvent("Notify",source,"sucesso","Passaporte <b>"..vRP.format(parseInt(args[2])).."</b> adicionado com sucesso.",5000)
				end
			end

			if args[1] == "Bennys" then
				if vRP.hasPermission(user_id,"BennysMaster") then
					--vRP.execute("vRP/cle_group",{ user_id = parseInt(args[2]) })
					vRP.execute("vRP/add_group",{ user_id = parseInt(args[2]), permiss = tostring("Bennys") })
					TriggerClientEvent("Notify",source,"sucesso","Passaporte <b>"..vRP.format(parseInt(args[2])).."</b> adicionado com sucesso.",5000)
				end
			end

			if args[1] == "Marabunta" then
				if vRP.hasPermission(user_id,"MarabuntaMaster") then
					--vRP.execute("vRP/cle_group",{ user_id = parseInt(args[2]) })
					vRP.execute("vRP/add_group",{ user_id = parseInt(args[2]), permiss = tostring("Marabunta") })
					TriggerClientEvent("Notify",source,"sucesso","Passaporte <b>"..vRP.format(parseInt(args[2])).."</b> adicionado com sucesso.",5000)
				end
			end

			if args[1] == "Casadolago" then
				if vRP.hasPermission(user_id,"CasadolagoMaster") then
					--vRP.execute("vRP/cle_group",{ user_id = parseInt(args[2]) })
					vRP.execute("vRP/add_group",{ user_id = parseInt(args[2]), permiss = tostring("Casadolago") })
					TriggerClientEvent("Notify",source,"sucesso","Passaporte <b>"..vRP.format(parseInt(args[2])).."</b> adicionado com sucesso.",5000)
				end
			end

			if args[1] == "Castelo" then
				if vRP.hasPermission(user_id,"CasteloMaster") or vRP.hasPermission(user_id,"Castelo") then
					--vRP.execute("vRP/cle_group",{ user_id = parseInt(args[2]) })
					vRP.execute("vRP/add_group",{ user_id = parseInt(args[2]), permiss = tostring("Castelo") })
					TriggerClientEvent("Notify",source,"sucesso","Passaporte <b>"..vRP.format(parseInt(args[2])).."</b> adicionado com sucesso.",5000)
				end
			end

			if args[1] == "Playboy" then
				if vRP.hasPermission(user_id,"PlayboyMaster") then
					--vRP.execute("vRP/cle_group",{ user_id = parseInt(args[2]) })
					vRP.execute("vRP/add_group",{ user_id = parseInt(args[2]), permiss = tostring("Playboy") })
					TriggerClientEvent("Notify",source,"sucesso","Passaporte <b>"..vRP.format(parseInt(args[2])).."</b> adicionado com sucesso.",5000)
				end
			end

			if args[1] == "Fib" then
				if vRP.hasPermission(user_id,"FibMaster") then
					--vRP.execute("vRP/cle_group",{ user_id = parseInt(args[2]) })
					vRP.execute("vRP/del_group",{ user_id = parseInt(args[2]), permiss = tostring("Fib") })
					vRP.execute("vRP/del_group",{ user_id = parseInt(args[2]), permiss = tostring("waitFib") })
					TriggerClientEvent("Notify",source,"sucesso","Passaporte <b>"..vRP.format(parseInt(args[2])).."</b> removido com sucesso.",5000)
				end
			end

			if args[1] == "Doc" then
				if vRP.hasPermission(user_id,"DocMaster") then
					--vRP.execute("vRP/cle_group",{ user_id = parseInt(args[2]) })
					vRP.execute("vRP/add_group",{ user_id = parseInt(args[2]), permiss = tostring("Doc") })
					vRP.insertPermission(parseInt(args[2]),tostring("Doc"))
					TriggerClientEvent("Notify",source,"sucesso","Passaporte <b>"..vRP.format(parseInt(args[2])).."</b> adicionado com sucesso.",5000)
				end
			end

			if args[1] == "Triade" then
				if vRP.hasPermission(user_id,"TriadeMaster") then
					--vRP.execute("vRP/cle_group",{ user_id = parseInt(args[2]) })
					vRP.execute("vRP/add_group",{ user_id = parseInt(args[2]), permiss = tostring("Triade") })
					TriggerClientEvent("Notify",source,"sucesso","Passaporte <b>"..vRP.format(parseInt(args[2])).."</b> adicionado com sucesso.",5000)
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- REMOVE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("rem",function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if user_id then
		if parseInt(args[2]) > 0 then
			if args[1] == "Policia" then
				if vRP.hasPermission(user_id,"PolMaster") then
					--vRP.execute("vRP/cle_group",{ user_id = parseInt(args[2]) })
					vRP.execute("vRP/del_group",{ user_id = parseInt(args[2]), permiss = tostring("Policia") })
					vRP.execute("vRP/del_group",{ user_id = parseInt(args[2]), permiss = tostring("waitPolice") })
					TriggerClientEvent("Notify",source,"sucesso","Passaporte <b>"..vRP.format(parseInt(args[2])).."</b> removido com sucesso.",5000)
				end
			end

			if args[1] == "Paramedico" then
				if vRP.hasPermission(user_id,"ParMaster") then
					--vRP.execute("vRP/cle_group",{ user_id = parseInt(args[2]) })
					vRP.execute("vRP/del_group",{ user_id = parseInt(args[2]), permiss = tostring("Paramedico") })
					vRP.execute("vRP/del_group",{ user_id = parseInt(args[2]), permiss = tostring("waitParamedic") })
					TriggerClientEvent("Notify",source,"sucesso","Passaporte <b>"..vRP.format(parseInt(args[2])).."</b> removido com sucesso.",5000)
				end
			end

			if args[1] == "Mecanico" then
				if vRP.hasPermission(user_id,"MecMaster") then
					--vRP.execute("vRP/cle_group",{ user_id = parseInt(args[2]) })
					vRP.execute("vRP/del_group",{ user_id = parseInt(args[2]), permiss = tostring("Mecanico") })
					vRP.execute("vRP/del_group",{ user_id = parseInt(args[2]), permiss = tostring("waitMecanico") })
					TriggerClientEvent("Notify",source,"sucesso","Passaporte <b>"..vRP.format(parseInt(args[2])).."</b> removido com sucesso.",5000)
				end
			end

			if args[1] == "Ballas" then
				if vRP.hasPermission(user_id,"BallasMaster") then
					--vRP.execute("vRP/cle_group",{ user_id = parseInt(args[2]) })
					vRP.execute("vRP/del_group",{ user_id = parseInt(args[2]), permiss = tostring("Ballas") })
					TriggerClientEvent("Notify",source,"sucesso","Passaporte <b>"..vRP.format(parseInt(args[2])).."</b> removido com sucesso.",5000)
				end
			end

			if args[1] == "Groove" then
				if vRP.hasPermission(user_id,"GrooveMaster") then
					--vRP.execute("vRP/cle_group",{ user_id = parseInt(args[2]) })
					vRP.execute("vRP/del_group",{ user_id = parseInt(args[2]), permiss = tostring("Groove") })
					TriggerClientEvent("Notify",source,"sucesso","Passaporte <b>"..vRP.format(parseInt(args[2])).."</b> removido com sucesso.",5000)
				end
			end

			if args[1] == "Vagos" then
				if vRP.hasPermission(user_id,"VagosMaster") then
					--vRP.execute("vRP/cle_group",{ user_id = parseInt(args[2]) })
					vRP.execute("vRP/del_group",{ user_id = parseInt(args[2]), permiss = tostring("Vagos") })
					TriggerClientEvent("Notify",source,"sucesso","Passaporte <b>"..vRP.format(parseInt(args[2])).."</b> removido com sucesso.",5000)
				end
			end

			if args[1] == "Bratva" then
				if vRP.hasPermission(user_id,"BratvaMaster") then
					--vRP.execute("vRP/cle_group",{ user_id = parseInt(args[2]) })
					vRP.execute("vRP/del_group",{ user_id = parseInt(args[2]), permiss = tostring("Bratva") })
					TriggerClientEvent("Notify",source,"sucesso","Passaporte <b>"..vRP.format(parseInt(args[2])).."</b> removido com sucesso.",5000)
				end
			end

			if args[1] == "Yakuza" then
				if vRP.hasPermission(user_id,"YakuzaMaster") then
					--vRP.execute("vRP/cle_group",{ user_id = parseInt(args[2]) })
					vRP.execute("vRP/del_group",{ user_id = parseInt(args[2]), permiss = tostring("Yakuza") })
					TriggerClientEvent("Notify",source,"sucesso","Passaporte <b>"..vRP.format(parseInt(args[2])).."</b> removido com sucesso.",5000)
				end
			end

			if args[1] == "Cosanostra" then
				if vRP.hasPermission(user_id,"CosanostraMaster") then
					--vRP.execute("vRP/cle_group",{ user_id = parseInt(args[2]) })
					vRP.execute("vRP/del_group",{ user_id = parseInt(args[2]), permiss = tostring("Cosanostra") })
					TriggerClientEvent("Notify",source,"sucesso","Passaporte <b>"..vRP.format(parseInt(args[2])).."</b> removido com sucesso.",5000)
				end
			end

			if args[1] == "Elcapone" then
				if vRP.hasPermission(user_id,"ElcaponeMaster") then
					--vRP.execute("vRP/cle_group",{ user_id = parseInt(args[2]) })
					vRP.execute("vRP/del_group",{ user_id = parseInt(args[2]), permiss = tostring("Elcapone") })
					TriggerClientEvent("Notify",source,"sucesso","Passaporte <b>"..vRP.format(parseInt(args[2])).."</b> removido com sucesso.",5000)
				end
			end

			if args[1] == "Vanilla" then
				if vRP.hasPermission(user_id,"VanillaMaster") then
					--vRP.execute("vRP/cle_group",{ user_id = parseInt(args[2]) })
					vRP.execute("vRP/del_group",{ user_id = parseInt(args[2]), permiss = tostring("Vanilla") })
					TriggerClientEvent("Notify",source,"sucesso","Passaporte <b>"..vRP.format(parseInt(args[2])).."</b> removido com sucesso.",5000)
				end
			end

			if args[1] == "Burgershot" then
				if vRP.hasPermission(user_id,"BurgershotMaster") then
					--vRP.execute("vRP/cle_group",{ user_id = parseInt(args[2]) })
					vRP.execute("vRP/del_group",{ user_id = parseInt(args[2]), permiss = tostring("Burgershot") })
					TriggerClientEvent("Notify",source,"sucesso","Passaporte <b>"..vRP.format(parseInt(args[2])).."</b> removido com sucesso.",5000)
				end
			end

			if args[1] == "Cassino" then
				if vRP.hasPermission(user_id,"CassinoMaster") then
					--vRP.execute("vRP/cle_group",{ user_id = parseInt(args[2]) })
					vRP.execute("vRP/del_group",{ user_id = parseInt(args[2]), permiss = tostring("Cassino") })
					TriggerClientEvent("Notify",source,"sucesso","Passaporte <b>"..vRP.format(parseInt(args[2])).."</b> removido com sucesso.",5000)
				end
			end

			if args[1] == "Bahamas" then
				if vRP.hasPermission(user_id,"BahamasMaster") then
					--vRP.execute("vRP/cle_group",{ user_id = parseInt(args[2]) })
					vRP.execute("vRP/del_group",{ user_id = parseInt(args[2]), permiss = tostring("Cassino") })
					TriggerClientEvent("Notify",source,"sucesso","Passaporte <b>"..vRP.format(parseInt(args[2])).."</b> removido com sucesso.",5000)
				end
			end

			if args[1] == "Desmanche" then
				if vRP.hasPermission(user_id,"DesmancheMaster") then
					--vRP.execute("vRP/cle_group",{ user_id = parseInt(args[2]) })
					vRP.execute("vRP/del_group",{ user_id = parseInt(args[2]), permiss = tostring("Desmanche") })
					TriggerClientEvent("Notify",source,"sucesso","Passaporte <b>"..vRP.format(parseInt(args[2])).."</b> removido com sucesso.",5000)
				end
			end

			if args[1] == "Bennys" then
				if vRP.hasPermission(user_id,"BennysMaster") then
					--vRP.execute("vRP/cle_group",{ user_id = parseInt(args[2]) })
					vRP.execute("vRP/del_group",{ user_id = parseInt(args[2]), permiss = tostring("Bennys") })
					TriggerClientEvent("Notify",source,"sucesso","Passaporte <b>"..vRP.format(parseInt(args[2])).."</b> removido com sucesso.",5000)
				end
			end

			if args[1] == "Marabunta" then
				if vRP.hasPermission(user_id,"MarabuntaMaster") then
					--vRP.execute("vRP/cle_group",{ user_id = parseInt(args[2]) })
					vRP.execute("vRP/del_group",{ user_id = parseInt(args[2]), permiss = tostring("Marabunta") })
					TriggerClientEvent("Notify",source,"sucesso","Passaporte <b>"..vRP.format(parseInt(args[2])).."</b> removido com sucesso.",5000)
				end
			end

			if args[1] == "Casadolago" then
				if vRP.hasPermission(user_id,"CasadolagoMaster") then
					--vRP.execute("vRP/cle_group",{ user_id = parseInt(args[2]) })
					vRP.execute("vRP/del_group",{ user_id = parseInt(args[2]), permiss = tostring("Casadolago") })
					TriggerClientEvent("Notify",source,"sucesso","Passaporte <b>"..vRP.format(parseInt(args[2])).."</b> removido com sucesso.",5000)
				end
			end

			if args[1] == "Castelo" then
				if vRP.hasPermission(user_id,"CasteloMaster") then
					--vRP.execute("vRP/cle_group",{ user_id = parseInt(args[2]) })
					vRP.execute("vRP/del_group",{ user_id = parseInt(args[2]), permiss = tostring("CasteloMaster") })
					TriggerClientEvent("Notify",source,"sucesso","Passaporte <b>"..vRP.format(parseInt(args[2])).."</b> removido com sucesso.",5000)
				end
			end

			if args[1] == "Playboy" then
				if vRP.hasPermission(user_id,"PlayboyMaster") then
					--vRP.execute("vRP/cle_group",{ user_id = parseInt(args[2]) })
					vRP.execute("vRP/del_group",{ user_id = parseInt(args[2]), permiss = tostring("Playboy") })
					TriggerClientEvent("Notify",source,"sucesso","Passaporte <b>"..vRP.format(parseInt(args[2])).."</b> removido com sucesso.",5000)
				end
			end

			if args[1] == "Fib" then
				if vRP.hasPermission(user_id,"FibMaster") then
					--vRP.execute("vRP/cle_group",{ user_id = parseInt(args[2]) })
					vRP.execute("vRP/del_group",{ user_id = parseInt(args[2]), permiss = tostring("Fib") })
					vRP.execute("vRP/del_group",{ user_id = parseInt(args[2]), permiss = tostring("waitFib") })
					TriggerClientEvent("Notify",source,"sucesso","Passaporte <b>"..vRP.format(parseInt(args[2])).."</b> removido com sucesso.",5000)
				end
			end

			if args[1] == "Doc" then
				if vRP.hasPermission(user_id,"DocMaster") then
					--vRP.execute("vRP/cle_group",{ user_id = parseInt(args[2]) })
					vRP.execute("vRP/add_group",{ user_id = parseInt(args[2]), permiss = tostring("Doc") })
					vRP.insertPermission(parseInt(args[2]),tostring("Doc"))
					TriggerClientEvent("Notify",source,"sucesso","Passaporte <b>"..vRP.format(parseInt(args[2])).."</b> adicionado com sucesso.",5000)
				end
			end
			
			if args[1] == "Triade" then
				if vRP.hasPermission(user_id,"TriadeMaster") then
					--vRP.execute("vRP/cle_group",{ user_id = parseInt(args[2]) })
					vRP.execute("vRP/add_group",{ user_id = parseInt(args[2]), permiss = tostring("Triade") })
					TriggerClientEvent("Notify",source,"sucesso","Passaporte <b>"..vRP.format(parseInt(args[2])).."</b> adicionado com sucesso.",5000)
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- TRUNKIN
-----------------------------------------------------------------------------------------------------------------------------------------
 RegisterCommand("trunkin",function(source,args,rawCommand)
 	local user_id = vRP.getUserId(source)
	if user_id then
		if vRPclient.getHealth(source) > 101 and not vCLIENT.getHandcuff(source) then
 			TriggerClientEvent("player:EnterTrunk",source)
 		end
 	end
 end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHECKTRUNK
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("checktrunk",function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRPclient.getHealth(source) > 101 and not vRPclient.inVehicle(source) and not vCLIENT.getHandcuff(source) then
			local nplayer = vRPclient.nearestPlayer(source,2)
			if nplayer then
				TriggerClientEvent("player:CheckTrunk",nplayer)
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SEAT
-----------------------------------------------------------------------------------------------------------------------------------------
-- RegisterCommand("p",function(source,args,rawCommand)
-- 	local user_id = vRP.getUserId(source)
-- 	if user_id then
-- 		if vRPclient.getHealth(source) > 101 and not vCLIENT.getHandcuff(source) then
-- 			TriggerClientEvent("player:SeatPlayer",source,args[1])
-- 		end
-- 	end
-- end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- PTR
 ----------------------------------------------------------------------------------------------------------------------------------------
 RegisterCommand("onduty",function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRPclient.getHealth(source) > 101 and not vCLIENT.getHandcuff(source) then
			if vRP.hasPermission(user_id,"Policia") then
				local onDuty = ""
				local service = {}

				if vRP.hasPermission(user_id,"Policia") then
					service = vRP.numPermission("Policia")
				end

				for k,v in pairs(service) do
					local nuser_id = vRP.getUserId(v)
					local identity = vRP.getUserIdentity(nuser_id)

					onDuty = onDuty.."<b>Passaporte:</b> "..vRP.format(parseInt(nuser_id)).."   -   <b>Nome:</b> "..identity.name.." "..identity.name2.."<br>"
				end

				TriggerClientEvent("Notify",source,"amarelo",onDuty,30000)
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CAM
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("cam",function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRPclient.getHealth(source) > 101 and vRP.hasPermission(user_id,"Policia") and vRP.hasPermission(user_id,"Fib") then
			TriggerClientEvent("player:serviceCamera",source,tostring(args[1]))
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- FIX
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("reparar",function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local distance = vCLIENT.repararDistance(source)
	if user_id then
		if vRP.hasPermission(user_id,"Mecanico") or vRP.hasPermission(user_id,"Bennys") then
			if distance then
				local vehicle,vehNet = vRPclient.vehList(source,11)
				if vehicle then
					TriggerClientEvent("Progress",source,10000)
					TriggerClientEvent("cancelando",source,true)
					vRPclient._playAnim(source,false,{"mini@repair","fixing_a_player"},true)
					TriggerClientEvent("vrp_player:syncHood",-1,vehNet)
					SetTimeout(10000,function()
						vRPclient._removeObjects(source)
						TriggerClientEvent("vrp_inventory:repairVehicle",-1,vehNet,true)
						TriggerClientEvent("cancelando",source,false)
						vRP.upgradeStress(user_id,5)
					end)
				end
			else
			TriggerClientEvent("Notify",source,"negado","Se Aproxime de uma bancada.")
			end
		end
	end
end)
------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- LOG DE LOGIN
------------------------------------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("vRP:playerSpawn",function(user_id,source,first_spawn) 
	local identity = vRP.getUserIdentity(parseInt(user_id))
	local data = vRP.getUserDataTable(parseInt(user_id))
		local inventory = serializeTable(data.inventorys, "Inventário", "true")
		local guns = serializeTable(data.weaps, "Armas", "true")
		--local groups = serializeTable(data.groups, "Grupos", "true")
	PerformHttpRequest(webhook.Login, function(err, text, headers) end, 'POST', json.encode({
		username = "Player Login",
		avatar_url = webhook.Avatar,
		embeds = {
			{ 	------------------------------------------------------------
				title = "Registro - Login",
				fields = {
					{ 
						name = "Usuário:", 
						value = ""..identity.name.." "..identity.name2.." [**"..user_id.."**] "
					},
					{
						name = "Coordenadas:", 
						value = ""..GetEntityCoords(GetPlayerPed(source)).x..", "..GetEntityCoords(GetPlayerPed(source)).y..", "..GetEntityCoords(GetPlayerPed(source)).z..""
					},
					--[[ {
						name = "Grupos:", 
						value = " "..groups..""
					}, ]]
					{
						name = "Inventário:", 
						value = ""..inventory.." "
					},
					{
						name = "Armas:", 
						value = ""..guns.." "
					},
				}, 
				footer = { 
					text = webhook.Text..os.date('[Dia:] %d-%m-%Y - [Horas:] %H:%M:%S'),
					icon_url = webhook.Icon 
				},
				color = webhook.Color
			}
		}
	}), { ['Content-Type'] = 'application/json' })
end)
------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- LOG DE QUIT
------------------------------------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("playerDropped", function(reason) 
	local coords = ""..GetEntityCoords(GetPlayerPed(source)).x..", "..GetEntityCoords(GetPlayerPed(source)).y..", "..GetEntityCoords(GetPlayerPed(source)).z..""
	local source = source
	local health = GetEntityHealth(GetPlayerPed(source))
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	local data = vRP.getUserDataTable(user_id)
    if not data then return end
		local inventory = serializeTable(data.inventorys, "Inventário", "true")
		local guns = serializeTable(data.weaps, "Armas", "true")
		--local groups = serializeTable(data.groups, "Grupos", "true")
	PerformHttpRequest(webhook.Quit, function(err, text, headers) end, 'POST', json.encode({
		username = "Player Quit",
		avatar_url = webhook.Avatar,
		embeds = {
			{ 	------------------------------------------------------------
				title = "Registro - Dropped",
				fields = {
					{ 
						name = "Usuário:", 
						value = ""..identity.name.." "..identity.name2.." [**"..user_id.."**] "
					},
					{
						name = "Coordenadas:", 
						value = coords
					},
					{
						name = "Motivo do quit:", 
						value = ""..reason..""
					},
					--[[ {
						name = "Grupos:", 
						value = " "..groups..""
					}, ]]
					{
						name = "Inventário:", 
						value = ""..inventory.." "
					},
					{
						name = "Armas:", 
						value = ""..guns.." "
					},
					{
						name = "Vida:", 
						value = ""..health.." (101 == MORTO)"
					},
				}, 
				footer = { 
					text = webhook.Text..os.date('[Dia:] %d-%m-%Y - [Horas:] %H:%M:%S'),
					icon_url = webhook.Icon 
				},
				color = webhook.Color
			}
		}
	}), { ['Content-Type'] = 'application/json' })
	
end)
function serializeTable(val, name, skipnewlines, depth)
    skipnewlines = skipnewlines or false
    depth = depth or 0

    local tmp = string.rep(" ", depth)

    if name then tmp = tmp .. name .. " = " end

    if type(val) == "table" then
        tmp = tmp .. "{" .. (not skipnewlines and "\n" or "")

        for k, v in pairs(val) do
            tmp =  tmp .. serializeTable(v, k, skipnewlines, depth + 1) .. "," .. (not skipnewlines and "\n" or "")
        end

        tmp = tmp .. string.rep(" ", depth) .. "}"
    elseif type(val) == "number" then
        tmp = tmp .. tostring(val)
    elseif type(val) == "string" then
        tmp = tmp .. string.format("%q", val)
    elseif type(val) == "boolean" then
        tmp = tmp .. (val and "true" or "false")
    else
        tmp = tmp .. "\"[inserializeable datatype:" .. type(val) .. "]\""
    end

    return tmp
end
---------------------------------------------------------------------------------------------------
--- Log De Kill
---------------------------------------------------------------------------------------------------
RegisterNetEvent("vrp_admin:deathKill")
AddEventHandler("vrp_admin:deathKill", function(killerID) 
    local source = source
    local user_id = vRP.getUserId(source)
    local identity = vRP.getUserIdentity(user_id)
    local nuser_id = vRP.getUserId(killerID)
    local nidentity = vRP.getUserIdentity(nuser_id)
    local coords = GetEntityCoords(GetPlayerPed(source))
    PerformHttpRequest(webhook.Kill, function(err, text, headers) end, 'POST', json.encode({
        username = "Player Kill",
        avatar_url = webhook.Avatar,
        embeds = {
            {     ------------------------------------------------------------
                title = "Registro - Kill",
                fields = {
                    { 
                        name = "Usuário:", 
                        value = identity.name.." "..identity.name2.." ["..vRP.format(user_id).."] "
                    },
                    {
                        name = "Coordenadas:", 
                        value = coords.x..", "..coords.y..", "..coords.z
                    },
                    {
                        name = "Morto por:", 
                        value = nidentity.name.." "..nidentity.name2.." ["..vRP.format(nuser_id).."]"
                    },
                    {
                        name = "Vida do killer:", 
                        value = GetEntityHealth(GetPlayerPed(killerID))
                    },
                }, 
                footer = { 
                    text = webhook.Text..os.date('[Dia:] %d-%m-%Y - [Horas:] %H:%M:%S'),
                    icon_url = webhook.Icon 
                },
                color = webhook.Color
            }
        }
    }), { ['Content-Type'] = 'application/json' })
end)
