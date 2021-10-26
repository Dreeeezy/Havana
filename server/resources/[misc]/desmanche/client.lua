local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")

blzrAC = Tunnel.getInterface("desmanche")
vRP = Proxy.getInterface("vRP")
vRPclient = Proxy.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONFIG
-----------------------------------------------------------------------------------------------------------------------------------------
local debug = false

-- ETAPA INICIAL

local FrenteDoPC = {78.77,3738.52,39.69}
local TextosInvasao = {
    'Recebendo informações...'
}

-- ETAPA 2
local NpcModel = 'mp_m_waremech_01'

-- ETAPA 4
local Desmanche = {83.1,3754.22,39.52}
local SpawnDesmanchador = {95.22,3761.86,39.47}


-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIÁVEIS
-----------------------------------------------------------------------------------------------------------------------------------------
local blip = false
local laptop = false
local etapa = 0
local criouNpc = false
local mochila = nil
local desmanchando = false
local CarroNoLugar = false

-----------------------------------------------------------------------------------------------------------------------------------------
-- CÓDIGO
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function() 
    
    while true do
        Wait(0)
        local ped = PlayerPedId()
        if etapa == 0 then
            local DistPc = GetDistanceBetweenCoords(GetEntityCoords(ped), FrenteDoPC[1], FrenteDoPC[2], FrenteDoPC[3], true)
            if DistPc <= 10 then
                DrawMarker(21,FrenteDoPC[1], FrenteDoPC[2], FrenteDoPC[3],0,0,0,0,0,0,0.5,0.5,0.5,255, 0, 0,15,1,0,0,1)	
                if DistPc <= 1.5 then
                    drawTxt('PRESSIONE ~r~[E] ~w~PARA SOLICITAR', 4,0.5,0.93,0.50,255,255,255,180)
                    if IsControlJustPressed(0, 38) then
                        if blzrAC.ChecarCartaoAcesso() then
                            for _, v in pairs(TextosInvasao) do
                                TriggerEvent('progress', 4000, v)
                                Wait(4200)
                            end
                            etapa = 4
                        else
                            TriggerEvent('Notify', 'negado', 'Você não possui um cartão de acesso.')
                        end
                    end
                end
            end
        end

        local carro = GetVehiclePedIsUsing(ped)
        if etapa == 4 then
            
            local DistPedDesm = GetDistanceBetweenCoords(GetEntityCoords(ped), Desmanche[1], Desmanche[2], Desmanche[3], true)
            blip = false
            if GetPedInVehicleSeat(carro, -1) == ped and DistPedDesm > 10 then
                drawTxt('LEVE O CARRO ATÉ O ~r~DESMANCHE', 4,0.5,0.93,0.50,255,255,255,180)
            elseif not IsPedInVehicle(ped, carro, false) then
                drawTxt('ENTRE NO CARRO E DIRIJA ATÉ O ~r~DESMANCHE', 4,0.5,0.93,0.50,255,255,255,180)
            end

            if DistPedDesm <= 10 then
                DrawMarker(25,Desmanche[1], Desmanche[2], Desmanche[3]-0.96,0,0,0,0,0,0,5.0,5.0,0.5,255, 0, 0,45,0,0,0,0)
                if DistPedDesm <= 1.5 and IsPedInVehicle(ped, carro, false) and GetPedInVehicleSeat(carro, -1) == ped then
                    if not desmanchando then    
                        drawTxt('PRESSIONE ~r~[E] ~w~PARA DESMANCHAR O VEÍCULO', 4,0.5,0.93,0.50,255,255,255,180)
                    end

                    if IsControlJustPressed(0, 38) then
                        FreezeEntityPosition(carro, true)
                        SetVehicleDoorsLocked(carro, 4)
                        local posCarro = GetEntityCoords(carro)
                        desmanchando = true
                        modelRequest(NpcModel)
                        mecanico = CreatePed(5, GetHashKey(NpcModel), SpawnDesmanchador[1], SpawnDesmanchador[2], SpawnDesmanchador[3]-0.96, 120.23, false, true)
                        Wait(500)
                        mecanico2 = CreatePed(5, GetHashKey(NpcModel), SpawnDesmanchador[1]+1.5, SpawnDesmanchador[2]+1.5, SpawnDesmanchador[3]-0.96, 120.23, false, true)
                        TaskGoToCoordAnyMeans(mecanico, posCarro[1]+2.6, posCarro[2], posCarro[3], 3.0, 0, 0, 786603, 1.0)
                        TaskGoToCoordAnyMeans(mecanico2, posCarro[1]-2.6, posCarro[2], posCarro[3], 3.0, 0, 0, 786603, 1.0)
                        Wait(6600)
                        SetEntityHeading(mecanico, 89.29)
                        SetEntityHeading(mecanico2, 266.48)
                        SetVehicleDoorOpen(carro, 4, false, false)
                        SetVehicleDoorOpen(carro, 5, false, false)
                        Wait(300)
                        loaddict("amb@prop_human_parking_meter@female@idle_a")
                        TaskPlayAnim(mecanico,"amb@prop_human_parking_meter@female@idle_a", "idle_a_female", 8.0, 0.0, 8, 1, 0, 1, 1, 1)
                        TaskPlayAnim(mecanico2,"amb@prop_human_parking_meter@female@idle_a", "idle_a_female", 8.0, 0.0, 8, 1, 0, 1, 1, 1)
                        Wait(8000)
                        ClearPedTasksImmediately(mecanico)
                        ClearPedTasksImmediately(mecanico2)
                        SetVehicleDoorBroken(carro, 4, true)
                        SetVehicleDoorBroken(carro, 5, true)
                        Wait(200)
                        TaskGoToCoordAnyMeans(mecanico, posCarro[1], posCarro[2]+1.3, posCarro[3], 3.0, 0, 0, 786603, 1.0)
                        TaskGoToCoordAnyMeans(mecanico2, posCarro[1], posCarro[2]-1.3, posCarro[3], 3.0, 0, 0, 786603, 1.0)
                        Wait(4000)
                        SetEntityHeading(mecanico, 177.28)
                        SetEntityHeading(mecanico2, 355.93)
                        for i = 0, 3 do
                            SetVehicleDoorOpen(carro, i, false, false)
                        end
                        Wait(200)
                        TaskPlayAnim(mecanico,"amb@prop_human_parking_meter@female@idle_a", "idle_a_female", 8.0, 0.0, 8, 1, 0, 1, 1, 1)
                        TaskPlayAnim(mecanico2,"amb@prop_human_parking_meter@female@idle_a", "idle_a_female", 8.0, 0.0, 8, 1, 0, 1, 1, 1)
                        Wait(8000)
                        for i = 0, 3 do
                            SetVehicleDoorBroken(carro, i, true)
                        end
                        ClearPedTasksImmediately(mecanico)
                        ClearPedTasksImmediately(mecanico2)
                        Wait(200)
                        TaskGoToCoordAnyMeans(mecanico, posCarro[1]+1.15, posCarro[2]+1.3, posCarro[3], 3.0, 0, 0, 786603, 1.0)
                        TaskGoToCoordAnyMeans(mecanico2, posCarro[1]-1.15, posCarro[2]-1.3, posCarro[3], 3.0, 0, 0, 786603, 1.0)
                        Wait(2500)
                        SetEntityHeading(mecanico, 177.28)
                        SetEntityHeading(mecanico2, 355.93)
                        loaddict("amb@medic@standing@tendtodead@idle_a")
                        TaskPlayAnim(mecanico,"amb@medic@standing@tendtodead@idle_a" , "idle_a", 8.0, 0.0, 8, 1, 0, 1, 1, 1)
                        TaskPlayAnim(mecanico2,"amb@medic@standing@tendtodead@idle_a" , "idle_a", 8.0, 0.0, 8, 1, 0, 1, 1, 1)
                        Wait(8000)
                        SetVehicleTyreBurst(carro, 0, true, 1000)
                        SetVehicleTyreBurst(carro, 5,true, 1000)
                        Wait(200)
                        ClearPedTasksImmediately(mecanico)
                        ClearPedTasksImmediately(mecanico2)
                        Wait(200)
                        TaskGoToCoordAnyMeans(mecanico, posCarro[1]-1.15, posCarro[2]+1.3, posCarro[3], 3.0, 0, 0, 786603, 1.0)
                        TaskGoToCoordAnyMeans(mecanico2, posCarro[1]+1.15, posCarro[2]-1.3, posCarro[3], 3.0, 0, 0, 786603, 1.0)
                        Wait(3000)
                        SetEntityHeading(mecanico, 177.28)
                        SetEntityHeading(mecanico2, 355.93)
                        Wait(200)
                        TaskPlayAnim(mecanico,"amb@medic@standing@tendtodead@idle_a" , "idle_a", 8.0, 0.0, 8, 1, 0, 1, 1, 1)
                        TaskPlayAnim(mecanico2,"amb@medic@standing@tendtodead@idle_a" , "idle_a", 8.0, 0.0, 8, 1, 0, 1, 1, 1)
                        Wait(8000)
                        SetVehicleTyreBurst(carro, 4, true, 1000)
                        SetVehicleTyreBurst(carro, 1,true, 1000)
                        ClearPedTasksImmediately(mecanico)
                        ClearPedTasksImmediately(mecanico2)
                        TaskGoToCoordAnyMeans(mecanico, SpawnDesmanchador[1], SpawnDesmanchador[2], SpawnDesmanchador[3], 3.0, 0, 0, 786603, 1.0)
                        TaskGoToCoordAnyMeans(mecanico2, SpawnDesmanchador[1], SpawnDesmanchador[2], SpawnDesmanchador[3], 3.0, 0, 0, 786603, 1.0)
                        FreezeEntityPosition(carro, false)
                        SetVehicleDoorsLocked(carro, 1)
                        SetPedAsNoLongerNeeded(mecanico)
                        SetPedAsNoLongerNeeded(mecanico2)
                        etapa = 5
                        CarroNoLugar = true
                    end
                end
            end
        end

        if etapa == 5 then
            if CarroNoLugar then
                drawTxt('PRESSIONE ~r~[E] ~w~PARA ANUNCIAR O CHASSI DO VEICULO', 4,0.5,0.90,0.50,255,255,255,180)
                if IsControlJustPressed(0,38) then
                    if blzrAC.checkVehicle() then
                        TriggerServerEvent("desmancheVehicles")
                        blzrAC.setSearchTimer()                                                
                        SetPedComponentVariation(ped, 5, 0, 0)
                        if blip then
                           RemoveBlip(blips)
                           blip = false
                        end                            
                        TriggerEvent("Notify","sucesso","Veiculo desmanchado com sucesso.")
                        etapa = 0
                        criouNpc = false                    
                        desmanchando = false
                        CarroNoLugar = false
                    end
                end
            end
        end
    end
end)


Citizen.CreateThread(function() 
    while true do
        Wait(0)
        local ped = PlayerPedId()
        local carro = GetVehiclePedIsUsing(ped)
        if etapa > 0 then
            if IsControlJustPressed(0,167) then
                ClearPedTasksImmediately(ped)
                if DoesEntityExist(carro) then                                
                    SetEntityAsMissionEntity(carro, true, true)
                    vCLIENT.deleteVehicle(carro)
                end
                SetPedComponentVariation(ped, 5, 0, 0)
                if blip then
                    RemoveBlip(blips)
                    blip = false
                end
                etapa = 0
                criouNpc = false
                mochila = nil
                desmanchando = false
                CarroNoLugar = false
                TriggerEvent('Notify', 'sucesso', 'Você cancelou o trabalho.')
            end
        end
    end
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- FUNÇÕES
-----------------------------------------------------------------------------------------------------------------------------------------
function RandomVar(length)
	local res = ""
	for i = 1, length do
		res = res .. string.char(math.random(97, 122))
    end
    res = string.upper(res)
	return res
end

function RandomNmb(length)
	local res = ""
	for i = 1, length do
		res = res .. math.random(0,9)
	end
	return res
end

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

function modelRequest(model)
	RequestModel(GetHashKey(model))
	while not HasModelLoaded(GetHashKey(model)) do
		Citizen.Wait(10)
	end
end

function loaddict(dict)
    while not HasAnimDictLoaded(dict) do
        RequestAnimDict(dict)
        Wait(10)
    end
end

function deleteCar( entity )
    Citizen.InvokeNative( 0xEA386986E786A54F, Citizen.PointerValueIntInitialized( entity ) )
end

function CriandoBlip(x,y,z)
	blips = AddBlipForCoord(x,y,z)
	SetBlipSprite(blips,1)
	SetBlipColour(blips,5)
	SetBlipScale(blips,0.4)
	SetBlipAsShortRange(blips,false)
	SetBlipRoute(blips,true)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString("Destino")
	EndTextCommandSetBlipName(blips)
end