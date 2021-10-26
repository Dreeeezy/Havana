local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
local Tools = module("vrp","lib/Tools")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")

func = {}
Tunnel.bindInterface("mito_autoreparo",func)



function func.checkmecanico()
    local source = source
    local user_id = vRP.getUserId(source)
    local mecanicooo = vRP.numPermission("Mecanico")
    if user_id then
        if parseInt(#mecanicooo) > 0 then
            TriggerClientEvent("Notify",source,"negado","Possui mecanico na cidade, procure-o.") 
            return false 
        else
            return true
        end
    end
end

function func.verdinheiro()
    local source = source
    local player = vRP.getUserSource(user_id)
    local user_id = vRP.getUserId(source)
    local custo = 400 -- ALTERE AKI O CUSTO
    if user_id then
        if vRP.havanaPay(user_id,custo) then
            TriggerClientEvent("Notify",source,"sucesso","Você pagou R$"..custo)
            return true
        else
            TriggerClientEvent("Notify",source,"negado","Dinheiro necessário R$"..custo)
            return false
        end   
    end
end



RegisterServerEvent("somzinhogostososopqclientenaofoi")
AddEventHandler("somzinhogostososopqclientenaofoi", function()
local source = source
local user_id = vRP.getUserId(source) 
local player = vRP.getUserSource(user_id)
local custo = 400 -- ALTERE AKI O CUSTO
    --TriggerClientEvent("vrp_sound:source",player,'car_repair',0.6)
end)

