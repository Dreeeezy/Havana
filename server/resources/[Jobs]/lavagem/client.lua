local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
emP = Tunnel.getInterface("lavagem")
vRP = Proxy.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIAVEIS --
-----------------------------------------------------------------------------------------------------------------------------------------
local papel = false
local colocarpapel = false
local pegarnota = false
local colocarnota = false
local embalando = false
-------------------------------------------------------------------------------------------------
--[ AÇÃO ]---------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------
Citizen.CreateThread(function() -- PEGAR PAPEL
	while true do
		local sleep = 0

		if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()),1049.93,-1906.03,31.4, true ) <= 2 and not papel then
			DrawText3D(1049.93,-1906.03,31.4, "[~r~E~w~] Para coletar o ~r~PAPEL~w~.")
			if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()),1049.93,-1906.03,31.4, true ) <= 2 and not papel then
				if IsControlJustPressed(0,38) then
					sleep = 5
					local ped = PlayerPedId()
					papel = true
					vRP._playAnim(true,{"anim@heists@box_carry@","idle"},true)
					vRP._createObjects("anim@heists@box_carry@","idle","bkr_prop_prtmachine_paperream",50,28422,0.0,-0.35,-0.05,0.0,180.0,0.0)
				end
			end
		end
		Citizen.Wait(sleep)
	end
end)

Citizen.CreateThread(function() -- COLOCAR PAPEL
	while true do
		local sleep = 0

		if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()),1050.55,-1908.73,31.4, true ) <= 2 and papel and not colocarpapel then
			DrawText3D(1050.55,-1908.73,31.4, "[~r~E~w~] Para colocar o ~r~PAPEL~w~.")
			if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()),1050.55,-1908.73,31.4, true ) <= 2 and papel and not colocarpapel then
				if IsControlJustPressed(0,38) and emP.checkPermissao() then
					sleep = 5
					local ped = PlayerPedId()
					colocarpapel = true
					vRP._removeObjects(source)
					vRP._stopAnim(source,false)
					notasfalsa = CreateObject(GetHashKey("bkr_prop_prtmachine_moneyream"),25.95,-1402.15,30.06-1.1,true,true,true)
				end
			end
		end
		Citizen.Wait(sleep)
	end
end)

Citizen.CreateThread(function() -- PEGAR NOTAS FALSAS
	while true do
		local sleep = 0

		if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()),1050.74,-1917.85,31.4, true ) <= 2 and colocarpapel and not pegarnota then
			DrawText3D(1050.74,-1917.85,31.4, "[~r~E~w~] Para pegar as ~r~NOTAS FALSAS~w~.")
			if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()),1050.74,-1917.85,31.4, true ) <= 2 and colocarpapel and not pegarnota then
				if IsControlJustPressed(0,38) and emP.checkPermissao() then
					sleep = 5
					local ped = PlayerPedId()
					pegarnota = true
					vRP._playAnim(true,{"anim@heists@box_carry@","idle"},true)
					vRP._createObjects("anim@heists@box_carry@","idle","bkr_prop_prtmachine_moneyream",50,28422,0.0,-0.35,-0.05,0.0,180.0,0.0)
					DeleteObject(notasfalsa)
				end
			end
		end	
		Citizen.Wait(sleep)
	end
end)

Citizen.CreateThread(function() -- COLOCAR NOTAS FALSAS
	while true do
		local sleep = 0

		if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()),1051.5,-1921.37,30.67, true ) <= 2 and pegarnota and not colocarnota then
			DrawText3D(1051.5,-1921.37,30.67, "[~r~E~w~] Para colocar na mesa as ~r~NOTAS FALSAS~w~.")
			if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()),1051.5,-1921.37,30.67, true ) <= 2 and pegarnota and not colocarnota then
				if IsControlJustPressed(0,38) and emP.checkPermissao() then
					sleep = 5
					local ped = PlayerPedId()
					colocarnota = true
					vRP._removeObjects(source)
					vRP._stopAnim(source,false)
					notasfalsa1 = CreateObject(GetHashKey("bkr_prop_prtmachine_moneyream"),23.09,-1402.34,29.55-1.1,true,true,true)
					DeleteObject(notasfalsa1)
				end
			end
		end
		Citizen.Wait(sleep)
	end
end)

Citizen.CreateThread(function() -- EMBALAR NOTAS FALSAS
	while true do
		local sleep = 0

		if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), 1049.23,-1927.5,30.66, true ) <= 2 and colocarnota and not embalando then
			DrawText3D(1049.23,-1927.5,30.66, "[~r~E~w~] Para embalas as ~r~NOTAS FALSAS~w~.")
			if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), 1049.23,-1927.5,30.66, true ) <= 2 and colocarnota and not embalando then
				if IsControlJustPressed(0,38) and emP.checkPermissao() then
					sleep = 5
					local ped = PlayerPedId()
					TriggerServerEvent("lavar-dinheiro","contardinheiro")
					SetEntityHeading(ped,96.24)
					--SetEntityCoords(ped,16.43,-1400.08,28.0-0,7,false,false,false,false)
					embalando = true
					colocarnota = false
					pegarnota = false
					colocarpapel = false
					papel = false
					SetTimeout(10000,function()
						embalando = false
						emP.checkPayment()
					end)
				end
			end
		end
		Citizen.Wait(sleep)
	end
end)
-------------------------------------------------------------------------------------------------
--[ ANTI-BUG ]-----------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(5)
		if papel then
			DisableControlAction(0,167,true)
			DisableControlAction(0,21,true)
			DisableControlAction(0,22,true)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- FUNÇÕES --
-----------------------------------------------------------------------------------------------------------------------------------------
function DrawText3D(x, y, z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    
    SetTextScale(0.28, 0.28)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
    local factor = (string.len(text)) / 370
    DrawRect(_x,_y+0.0125, 0.005+ factor, 0.03, 41, 11, 41, 68)
end