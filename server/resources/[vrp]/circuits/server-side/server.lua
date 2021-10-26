-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")
vTASKBAR = Tunnel.getInterface("taskbar")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONNECTION
-----------------------------------------------------------------------------------------------------------------------------------------
cRP = {}
Tunnel.bindInterface("circuits",cRP)
vCLIENT = Tunnel.getInterface("circuits")
-----------------------------------------------------------------------------------------------------------------------------------------
-- ITEMLIST
-----------------------------------------------------------------------------------------------------------------------------------------
local itemList = {
	{ item = "raceticket" }
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHECKCONSUME
-----------------------------------------------------------------------------------------------------------------------------------------
function cRP.checkConsume()
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		for k,v in pairs(itemList) do
			if vRP.tryGetInventoryItem(user_id,v.item,parseInt(1)) then
			
			TriggerEvent("blipsystem:serviceEnter",source,"Corredor",75)
			vRP.upgradeStress(user_id,5)

				if v.item == "raceticket" then
				    local x,y,z = vRPclient.getPositions(source)
					local copAmount = vRP.numPermission("Policia")
					for k,v in pairs(copAmount) do
						async(function()
							TriggerClientEvent("NotifyPush",v,{ time = os.date("%H:%M:%S - %d/%m/%Y"), code = 20, title = "Denúncia de Corrida Ilegal", x = x, y = y, z = z, rgba = {41,76,119} })
						end)
					end
				end
				return true
			else
				TriggerClientEvent("Notify",source,"amarelo","Você precisa de uma <b>Credencial</b> para correr.",5000)
			end
		end
		return false
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- FINISHRACES
-----------------------------------------------------------------------------------------------------------------------------------------
function cRP.finishRaces()
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
	local identity = vRP.getUserIdentity(user_id)
		vRP.wantedTimer(user_id,600)
		TriggerEvent("blipsystem:serviceExit",source)
		vRP.giveInventoryItem(user_id,"dollars2",math.random(1000,2000),true)
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- FINISHRACES
-----------------------------------------------------------------------------------------------------------------------------------------
function cRP.finishRacesDatabase(Selected,inTimers)
    local source = source
    local user_id = vRP.getUserId(source)
    if user_id then
        local identity = vRP.getUserIdentity(user_id)
        local _,_,_,vname = vRPclient.vehList(source,7)
        Wait(5000)
        local rows = vRP.query("vRP/get_winrace",{ user_id = user_id , raceid = Selected })
        if #rows > 0 then
            vRP.execute("vRP/update_winrace", { user_id = user_id, vehicle = vname, raceid = Selected, points = inTimers} )
		else
            vRP.execute("vRP/insert_winrace", { user_id = user_id, vehicle = vname, raceid = Selected, points = inTimers} )
        end
    end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- GETCLOCK
-----------------------------------------------------------------------------------------------------------------------------------------
function cRP.getClock()
    return os.clock()
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- circuits:EXPLOSIVEPLAYERS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("circuits:explosivePlayers")
AddEventHandler("circuits:explosivePlayers",function()
	local source = source
	TriggerEvent("blipsystem:serviceExit",source)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- DEFUSAR
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("defusar",function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.hasPermission(user_id,"Policia") then
			local taskResult = vTASKBAR.taskLockpick(source)
			if taskResult then
				local nplayer = vRPclient.nearestPlayer(source,10)
				if nplayer then
					vCLIENT.defuseRace(nplayer)
					TriggerClientEvent("Notify",source,"verde","Bomba desarmada.",5000)
				end
			end
		else
			TriggerClientEvent("Notify",source,"amarelo","Falhou, tente novamente.",5000)
		end
	else
		TriggerClientEvent("Notify",source,"amarelo","Você não tem permissão.",5000)
	end
end)