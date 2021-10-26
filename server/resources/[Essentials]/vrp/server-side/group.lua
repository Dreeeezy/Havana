local permissions = {}
-----------------------------------------------------------------------------------------------------------------------------------------
-- SMARTPHONE
-----------------------------------------------------------------------------------------------------------------------------------------
vRP.prepare('creative/get_id_by_perm', 'SELECT user_id FROM vrp_permissions WHERE permiss=@perm')

function vRP.getUsersByPermission(perm)
  local users = {}
  for _,row in pairs(vRP.query('creative/get_id_by_perm', { perm=perm })) do
    if vRP.getUserSource(row.user_id) then
      table.insert(users, row.user_id)
    end
  end
  return users
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- HASPERMISSION
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.hasPermission(user_id,perm)
	local consult = vRP.query("vRP/get_group",{ user_id = user_id, permiss = tostring(perm) })
	if consult[1] then
		return true
	else
		return false
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- NUMPERMISSION
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.numPermission(perm)
	local users = {}
	for k,v in pairs(permissions) do
		if v == perm then
			table.insert(users,parseInt(k))
		end
	end
	return users
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- NUMPERMISSION
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.insertPermission(source,perm)
	permissions[tostring(source)] = tostring(perm)
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- NUMPERMISSION
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.removePermission(source,perm)
	if permissions[tostring(source)] then
		permissions[tostring(source)] = nil
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- PLAYERLEAVE
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("vRP:playerLeave",function(user_id,source)
	if permissions[tostring(source)] then
		permissions[tostring(source)] = nil
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- PLAYERSPAWN
-----------------------------------------------------------------------------------------------------------------------------------------
--[[ AddEventHandler("vRP:playerSpawn",function(user_id,source,first_spawn)
	if vRP.hasPermission(user_id,"Policia") then
		permissions[tostring(source)] = "Policia"
		TriggerClientEvent("tencode:StatusService",source,true)
		TriggerEvent("blipsystem:serviceEnter",source,"Policial",77)
	elseif vRP.hasPermission(user_id,"Paramedico") then
		permissions[tostring(source)] = "Paramedico"
		TriggerEvent("blipsystem:serviceEnter",source,"Paramedico",83)
	elseif vRP.hasPermission(user_id,"Mecanico") then
		permissions[tostring(source)] = "Mecanico"
		--TriggerEvent("blipsystem:serviceEnter",source,"Mecanico",69)
	elseif vRP.hasPermission(user_id,"Burgershot") then
		permissions[tostring(source)] = "Burgershot"
		--TriggerEvent("blipsystem:serviceEnter",source,"Burgershot",79)
	elseif vRP.hasPermission(user_id,"Santaceia") then
		permissions[tostring(source)] = "Santaceia"
		--TriggerEvent("blipsystem:serviceEnter",source,"Santaceia",46)
	elseif vRP.hasPermission(user_id,"Advogado") then
		permissions[tostring(source)] = "Advogado"
		--TriggerEvent("blipsystem:serviceEnter",source,"Advogado",64)
	elseif vRP.hasPermission(user_id,"Taxista") then
		permissions[tostring(source)] = "Taxista"
		--TriggerEvent("blipsystem:serviceEnter",source,"Advogado",64)
	end
end) ]]