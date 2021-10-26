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
cnVRP = {}
Tunnel.bindInterface("survival",cnVRP)
vCLIENT = Tunnel.getInterface("survival")
local webhook = module("creative","config")
-----------------------------------------------------------------------------------------------------------------------------------------
-- GOD
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("god",function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if user_id then
		if vRP.hasPermission(user_id,"Admin") then
			if args[1] then
				local nplayer = vRP.getUserSource(parseInt(args[1]))
				if nplayer then
					vCLIENT._revivePlayer(nplayer,200)
					vRP.upgradeThirst(parseInt(args[1]),100)
					vRP.upgradeHunger(parseInt(args[1]),100)
					vRP.downgradeStress(parseInt(args[1]),100)
					TriggerClientEvent("resetBleeding",nplayer)
					TriggerClientEvent("resetDiagnostic",nplayer)

					PerformHttpRequest(webhook.God, function(err, text, headers) end, 'POST', json.encode({
						username = "Admin GOD",
						avatar_url = webhook.Avatar,
						embeds = {
							{ 	------------------------------------------------------------
								title = "Registro - GOD",
								fields = {
									{ 
										name = "Staff:", 
										value = ""..identity.name.." "..identity.name2.." [**"..user_id.."**] "
									},
									{
										name = "Curou:", 
										value = "[**"..parseInt(args[1]).."**] "
									},
									--[[ {
										name = "Cargo:", 
										value = ""..args[2]..""
									}, ]]
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

				end
			else
				vRP.upgradeThirst(user_id,100)
				vRP.upgradeHunger(user_id,100)
				vRPclient.setArmour(source,100)
				vRP.downgradeStress(user_id,100)
				vCLIENT._revivePlayer(source,200)
				TriggerClientEvent("resetBleeding",source)
				TriggerClientEvent("resetDiagnostic",source)

				PerformHttpRequest(webhook.God, function(err, text, headers) end, 'POST', json.encode({
					username = "Admin GOD",
					avatar_url = webhook.Avatar,
					embeds = {
						{ 	------------------------------------------------------------
							title = "Registro - GOD",
							fields = {
								{ 
									name = "Staff:", 
									value = ""..identity.name.." "..identity.name2.." [**"..user_id.."**] "
								},
								{
									name = "Se curou.", 
									value = "Se Curou."
								},
								--[[ {
									name = "Cargo:", 
									value = ""..args[2]..""
								}, ]]
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

			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- GOOD
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("good",function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if user_id then
		if vRP.hasPermission(user_id,"Admin") then
			if args[1] then
				local nplayer = vRP.getUserSource(parseInt(args[1]))
				if nplayer then
					vRP.upgradeThirst(parseInt(args[1]),100)
					vRP.upgradeHunger(parseInt(args[1]),100)
					vRP.downgradeStress(parseInt(args[1]),100)
					TriggerClientEvent("resetBleeding",nplayer)
					TriggerClientEvent("resetDiagnostic",nplayer)

					PerformHttpRequest(webhook.God, function(err, text, headers) end, 'POST', json.encode({
						username = "Admin GOD",
						avatar_url = webhook.Avatar,
						embeds = {
							{ 	------------------------------------------------------------
								title = "Registro - good",
								fields = {
									{ 
										name = "Staff:", 
										value = ""..identity.name.." "..identity.name2.." [**"..user_id.."**] "
									},
									{
										name = "Usou /good:", 
										value = "[**"..parseInt(args[1]).."**] "
									},
									--[[ {
										name = "Cargo:", 
										value = ""..args[2]..""
									}, ]]
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

				end
			else
				vRP.upgradeThirst(user_id,100)
				vRP.upgradeHunger(user_id,100)
				vRP.downgradeStress(user_id,100)
				TriggerClientEvent("resetBleeding",source)
				TriggerClientEvent("resetDiagnostic",source)
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- HEALTH
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("health",function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if user_id then
		if vRP.hasPermission(user_id,"Admin") then
			if args[1] then
				local nplayer = vRP.getUserSource(parseInt(args[1]))
				if nplayer then
					vCLIENT._revivePlayer(nplayer,200)
					TriggerClientEvent("resetBleeding",nplayer)
					TriggerClientEvent("resetDiagnostic",nplayer)

					PerformHttpRequest(webhook.God, function(err, text, headers) end, 'POST', json.encode({
						username = "Admin health",
						avatar_url = webhook.Avatar,
						embeds = {
							{ 	------------------------------------------------------------
								title = "Registro - health",
								fields = {
									{ 
										name = "Staff:", 
										value = ""..identity.name.." "..identity.name2.." [**"..user_id.."**] "
									},
									{
										name = "Usou /health:", 
										value = "[**"..parseInt(args[1]).."**] "
									},
									--[[ {
										name = "Cargo:", 
										value = ""..args[2]..""
									}, ]]
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

				end
			else
				vCLIENT._revivePlayer(source,200)
				TriggerClientEvent("resetBleeding",source)
				TriggerClientEvent("resetDiagnostic",source)
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- ARMOUR
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("armour",function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if user_id then
		if vRP.hasPermission(user_id,"Admin") then
			if args[1] then
				local nplayer = vRP.getUserSource(parseInt(args[1]))
				if nplayer then
					vRPclient.setArmour(nplayer,100)
					TriggerClientEvent("resetBleeding",nplayer)
					TriggerClientEvent("resetDiagnostic",nplayer)

					PerformHttpRequest(webhook.God, function(err, text, headers) end, 'POST', json.encode({
						username = "Admin armour",
						avatar_url = webhook.Avatar,
						embeds = {
							{ 	------------------------------------------------------------
								title = "Registro - armour",
								fields = {
									{ 
										name = "Staff:", 
										value = ""..identity.name.." "..identity.name2.." [**"..user_id.."**] "
									},
									{
										name = "Usou /armour:", 
										value = "[**"..parseInt(args[1]).."**] "
									},
									--[[ {
										name = "Cargo:", 
										value = ""..args[2]..""
									}, ]]
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

				end
			else
				vRPclient.setArmour(source,100)
				TriggerClientEvent("resetBleeding",source)
				TriggerClientEvent("resetDiagnostic",source)
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- UPGRADESTRESS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("upgradeStress")
AddEventHandler("upgradeStress",function(number)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		vRP.upgradeStress(user_id,parseInt(number))
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- RE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("re",function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if user_id then
		if vRP.hasPermission(user_id,"Paramedico") or vRP.hasPermission(user_id,"Policia") or vRP.hasPermission(user_id,"Fib") then
			local nplayer = vRPclient.nearestPlayer(source,2)
			if nplayer then
				if vCLIENT.deadPlayer(nplayer) then
					TriggerClientEvent("Progress",source,10000,"Revivendo...")
					TriggerClientEvent("cancelando",source,true)
					vRPclient._playAnim(source,false,{"mini@cpr@char_a@cpr_str","cpr_pumpchest"},true)
					SetTimeout(10000,function()
						vRPclient._removeObjects(source)
						vCLIENT._revivePlayer(nplayer,110)
						TriggerClientEvent("resetBleeding",nplayer)
						TriggerClientEvent("cancelando",source,false)

						PerformHttpRequest(webhook.God, function(err, text, headers) end, 'POST', json.encode({
							username = "Reanimar",
							avatar_url = webhook.Avatar,
							embeds = {
								{ 	------------------------------------------------------------
									title = "Registro - Reanimar",
									fields = {
										{ 
											name = "Jogador:", 
											value = ""..identity.name.." "..identity.name2.." [**"..user_id.."**] "
										},
										{
											name = "Reanimou:", 
											value = "[**"..nplayer.."**] "
										},
										--[[ {
											name = "Cargo:", 
											value = ""..args[2]..""
										}, ]]
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

					end)
				end
			end
		end
	end
end)
RegisterNetEvent("hospital:reanimar")
AddEventHandler("hospital:reanimar", function(source)
	TriggerClientEvent("Notify",source,"vermelho","Bitcoins Insuficientes.",5000)
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.hasPermission(user_id,"Paramedico") or vRP.hasPermission(user_id,"Policia") or vRP.hasPermission(user_id,"Fib") then
			local nplayer = vRPclient.nearestPlayer(source,2)
			if nplayer then
				if vCLIENT.deadPlayer(nplayer) then
					TriggerClientEvent("Progress",source,10000,"Revivendo...")
					TriggerClientEvent("cancelando",source,true)
					vRPclient._playAnim(source,false,{"mini@cpr@char_a@cpr_str","cpr_pumpchest"},true)
					SetTimeout(10000,function()
						vRPclient._removeObjects(source)
						vCLIENT._revivePlayer(nplayer,110)
						TriggerClientEvent("resetBleeding",nplayer)
						TriggerClientEvent("cancelando",source,false)
					end)
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- GG
-----------------------------------------------------------------------------------------------------------------------------------------
function cnVRP.ResetPedToHospital()
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if vCLIENT.deadPlayer(source) then
			vCLIENT.finishDeath(source)
			vRP.downgradeStress(user_id,100)
			TriggerClientEvent("resetHandcuff",source)
			TriggerClientEvent("resetBleeding",source)
			TriggerClientEvent("resetDiagnostic",source)
			TriggerClientEvent("survival:FadeOutIn",source)
			local clear = vRP.clearInventory(user_id)
			if clear then
				vRPclient._clearWeapons(source)
				Wait(2000)
				vRPclient.teleport(source,328.0,-600.68,43.29)
--				Wait(1000)
--				vCLIENT.SetPedInBed(source)
			end
		end
	end
end