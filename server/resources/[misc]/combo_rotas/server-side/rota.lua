local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")

--[ CONEXÃO ]----------------------------------------------------------------------------------------------------------------------------

cmB = {}
Tunnel.bindInterface("combo_rotas",cmB)

-----------------------------------------------------------------------------------------------------------------------------------------
--[ FUNCÕES ]
-----------------------------------------------------------------------------------------------------------------------------------------
local amount = {}

cmB.checkPerm = function(perm)
    local user_id = vRP.getUserId(source)
    return vRP.hasPermission(user_id,perm)
end

cmB.awardEntrega = function(item)
    local user_id = vRP.getUserId(source)
    local livre = vRP.getBackpack(user_id) - vRP.computeInvWeight(user_id)
    local pesoItem = 0
    for k,v in pairs(config.blipItem[item]) do
        if #v == 2 then
            amount[k] = math.random(v[1],v[2])
            local peso = vRP.itemWeightList(k)*amount[k]
            pesoItem = pesoItem + peso
        elseif #v == 1 then
            amount[k] = v[1]
            local peso = vRP.itemWeightList(k)*amount[k]
            pesoItem = pesoItem + peso
        else
            print('ERRO: VOCÊ COLOCOU A QUANTIDADE DO ITEM: ['..k..'] DE FORMA ERRADA, COLOQUE 2 NÚMEROS PARA SER UM VALOR RANDOM ENTRE ELES, OU UM NÚMERO PARA SER UM VALOR FIXO')
        end
    end
    if livre - pesoItem < 0 then
        TriggerClientEvent('Notify',source,"negado","Espaço insuficiente.")
        return false
    else
        SetTimeout(config.segundos*1000, function()
            for k,v in pairs(config.blipItem[item]) do
                vRP.giveInventoryItem(user_id,k,amount[k])
                amount[k] = nil
            end
        end)
        return true
    end
end
