local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
local Tools = module("vrp","lib/Tools")
vRP = Proxy.getInterface("vRP")
Check = {}
Tunnel.bindInterface("alta_carmusic",Check)

TriggerEvent('altamusic:GetMusic', function(source,cb)
    return Config.Zones
end)

--[[ if Config.Permission then
    local source = source
    local user_id = vRP.getUserId(source)
print("aq1")
   if user_id then
 print("aq2")
         if vRP.hasPermission(user_id,"VipDiamond") then
             print("aq")
             TriggerClientEvent("altamusic:ShowNui",user_id )
          end
    end
end ]]

function Check.checkPermissao()
    local source = source
    local user_id = vRP.getUserId(source)
    if vRP.hasPermission(user_id, "Owner") then
        return true
    elseif vRP.hasPermission(user_id, "VipPlus") then
        return true
    elseif vRP.hasPermission(user_id, "VipSilver") then
        return true
    elseif vRP.hasPermission(user_id, "VipGold") then
        return true
    elseif vRP.hasPermission(user_id, "VipPlatinum") then
        return true
	elseif vRP.hasPermission(user_id, "VipDiamond") then
        return true
    elseif vRP.hasPermission(user_id, "VipStreamer") then
        return true
    end
end

local xSound = exports.xsound

RegisterServerEvent("altamusic:ChangeVolume")
AddEventHandler("altamusic:ChangeVolume", function(vol, nome)
    local somafter = false
    local rangeafter = false
    for i = 1, #Config.Zones do
        local v = Config.Zones[i]
        if nome == v.name then
            local vadi = v.volume + vol
            if vadi <= 1.01 and vadi >= -0.001 then
				if vadi < 0.005 then
					vadi = 0.0
				end
                if v.popo then
                    v.range = (v.volume*Config.DistanceToVolume)
                else
					if vadi >= 0.05 then
						v.range = (vadi*v.range)/v.volume
					end
                end
                v.volume = vadi
                somafter = v.volume
                rangeafter = v.range
            end
        end
    end
    if somafter and rangeafter then
        TriggerClientEvent("altamusic:ChangeVolume",-1,somafter,rangeafter, nome)
    end
end)

RegisterServerEvent("altamusic:ChangeLoop")
AddEventHandler("altamusic:ChangeLoop", function(nome,tip)
	local loopstate
	for i = 1, #Config.Zones do
		local v = Config.Zones[i]
		if nome == v.name then
			v.loop = tip
			loopstate = v.loop
		end
	end
	if loopstate ~= nil then
		TriggerClientEvent("altamusic:ChangeLoop",-1,loopstate, nome)
	end
end)

RegisterServerEvent("altamusic:ChangeState")
AddEventHandler("altamusic:ChangeState", function(type, nome)
	for i = 1, #Config.Zones do
		local v = Config.Zones[i]
		if nome == v.name then
			v.isplaying = type
		end
	end
	TriggerClientEvent("altamusic:ChangeState",-1,type, nome)
end)

RegisterServerEvent("altamusic:ChangePosition")
AddEventHandler("altamusic:ChangePosition", function(quanti, nome)
	for i = 1, #Config.Zones do
		local v = Config.Zones[i]
		if nome == v.name then
			v.deftime = v.deftime+quanti
			if v.deftime < 0 then
				v.deftime = 0
			end
		end
	end
	TriggerClientEvent("altamusic:ChangePosition",-1,quanti, nome)
end)

RegisterServerEvent("altamusic:ModifyURL")
AddEventHandler("altamusic:ModifyURL", function(data)
	local _data = data
	local zena = false
	for i = 1, #Config.Zones do
		local v = Config.Zones[i]
		if _data.name == v.name then
			v.deflink = _data.link
			if _data.popo then
				v.popo = _data.popo
			end
			v.deftime = 0
			v.isplaying = true
			v.loop = _data.loop
			zena = v
		end
	end
	if zena then
		TriggerClientEvent("altamusic:ModifyURL",-1,zena)
	end
end)

function countTime()
    SetTimeout(1000, countTime)
    for i = 1, #Config.Zones do
		local v = Config.Zones[i]
        if v.isplaying then
            v.deftime = v.deftime + 1
        end
    end
end

SetTimeout(1000, countTime)

RegisterServerEvent('altamusic:AddVehicle')
AddEventHandler("altamusic:AddVehicle", function(vehdata)
    local Data = {}
    Data.name = vehdata.plate
    Data.coords = vehdata.coords
    Data.range = vehdata.volume * Config.DistanceToVolume
    Data.volume = vehdata.volume
    Data.deflink = vehdata.link
    Data.isplaying = true
    Data.loop = vehdata.loop
    Data.deftime = 0
    Data.popo = vehdata.popo
    table.insert(Config.Zones, Data)
    TriggerClientEvent('altamusic:AddVehicle', math.floor(-1), Config.Zones[#Config.Zones])
end)

RegisterServerEvent('altamusic:GetDate')
AddEventHandler('altamusic:GetDate', function()
    TriggerClientEvent('altamusic:SendData', math.floor(-1), Config.Zones)
end)