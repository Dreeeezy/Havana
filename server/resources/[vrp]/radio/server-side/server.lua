-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONEXÃO
-----------------------------------------------------------------------------------------------------------------------------------------
cRP = {}
Tunnel.bindInterface("radio",cRP)
vCLIENT = Tunnel.getInterface("radio")
-----------------------------------------------------------------------------------------------------------------------------------------
-- ACTIVEFREQUENCY
-----------------------------------------------------------------------------------------------------------------------------------------
function cRP.activeFrequency(freq)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if parseInt(freq) >= 1 and parseInt(freq) <= 999 then
			if parseInt(freq) == 911 then
				if vRP.hasPermission(user_id,"Policia") then
					vCLIENT.startFrequency(source,911)
					TriggerClientEvent("hud:RadioDisplay",source,911)
					TriggerClientEvent("Notify",source,"sucesso","Rádio <b>"..parseInt(freq)..".0Mhz</b>.",5000)
				end
			elseif parseInt(freq) == 912 then
				if vRP.hasPermission(user_id,"Policia") then
					vCLIENT.startFrequency(source,912)
					TriggerClientEvent("hud:RadioDisplay",source,912)
					TriggerClientEvent("Notify",source,"sucesso","Rádio <b>"..parseInt(freq)..".0Mhz</b>.",5000)
				end
			elseif parseInt(freq) == 112 then
				if vRP.hasPermission(user_id,"Paramedico") then
					vCLIENT.startFrequency(source,112)
					TriggerClientEvent("hud:RadioDisplay",source,112)
					TriggerClientEvent("Notify",source,"sucesso","Rádio <b>"..parseInt(freq)..".0Mhz</b>.",5000)
				end
			elseif parseInt(freq) == 300 then
				if vRP.hasPermission(user_id,"Fib") then
					vCLIENT.startFrequency(source,300)
					TriggerClientEvent("hud:RadioDisplay",source,300)
					TriggerClientEvent("Notify",source,"sucesso","Rádio <b>"..parseInt(freq)..".0Mhz</b>.",5000)
				end
			elseif parseInt(freq) == 301 then
				if vRP.hasPermission(user_id,"Fib") then
					vCLIENT.startFrequency(source,301)
					TriggerClientEvent("hud:RadioDisplay",source,301)
					TriggerClientEvent("Notify",source,"sucesso","Rádio <b>"..parseInt(freq)..".0Mhz</b>.",5000)
				end
			else
				vCLIENT.startFrequency(source,parseInt(freq))
				TriggerClientEvent("hud:RadioDisplay",source,parseInt(freq))
				TriggerClientEvent("Notify",source,"sucesso","Rádio <b>"..parseInt(freq)..".0Mhz</b>.",5000)
			end
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHECKRADIO
-----------------------------------------------------------------------------------------------------------------------------------------
function cRP.checkRadio()
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.getInventoryItemAmount(user_id,"radio") < 1 then
			return true
		end
		return false
	end
end