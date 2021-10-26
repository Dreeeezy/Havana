local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")

blzrAC = {}
Tunnel.bindInterface("desmanche",blzrAC)

function blzrAC.ChecarCartaoAcesso() 
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id, "TheLost") then		
		return true
	else
		return false
	end
end


function blzrAC.checkVehicle()
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		local vehicle,vnetid,placa,vehName,lock,banned,work = vRPclient.vehList(source,7)
		print(vehicle,vnedid,placa,vehName,lock,banned,work)
		if vehicle and placa then
			local plateUser = vRP.getUserByRegistration(placa)
			print(plateUser)
			if plateUser then
				local vehicle = vRP.query("vRP/get_vehicles",{ user_id = parseInt(plateUser), vehicle = vehName })
				if #vehicle <= 0 then
					TriggerClientEvent("Notify",source,"importante","Veículo não encontrado na lista do proprietário.",8000)
					return
				end
				if parseInt(vehicle[1].arrest) == 1 then
					TriggerClientEvent("Notify",source,"aviso","Veículo encontra-se apreendido na seguradora.",8000)
					return
				end
				if banned then
					TriggerClientEvent("Notify",source,"negado","Veículos de serviço ou alugados não podem ser desmanchados.",8000)
					return
				end
			end
			return true
		end
	end
end

function blzrAC.setSearchTimer()
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		vRP.searchTimer(user_id,parseInt(900))
	end
end