local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")
emP = {}
Tunnel.bindInterface("lavagem",emP)
-----------------------------------------------------------------------------------------------------------------------------------
--[ FUNÇÕES ]----------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------
local webhook = module("creative","config")
--[[ local webhooklavagem = "https://discord.com/api/webhooks/859204942052458516/R5rdI2QyDJmCTdwa6vfxs_-pTq9aChdll04Y1tM8yy4Vq2zvKsSl-QJcMeQZiaxy80dX"

function SendWebhookMessage(webhook,message)
	if webhook ~= nil and webhook ~= "" then
		PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({content = message}), { ['Content-Type'] = 'application/json' })
	end
end
 ]]
-----------------------------------------------------------------------------------------------------------------------------------
--[ FUNÇÕES ]----------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------
local partes = {
    { parte = "contardinheiro" },
}
-----------------------------------------------------------------------------------------------------------------------------------
--[ EVENTOS ]----------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("lavar-dinheiro")
AddEventHandler("lavar-dinheiro",function(parte)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		for k,v in pairs(partes) do
            if parte == v.parte then
                if parte == "contardinheiro" then
					TriggerClientEvent("progress",source,50000,"EMBALANDO NOTAS FALSAS")
					vRPclient._playAnim(source,true,{"amb@prop_human_parking_meter@female@idle_a","idle_a_female"},true)
					SetTimeout(10000,function()
						vRPclient._DeletarObjeto(source)
                        vRPclient._stopAnim(source,false)
                        --TriggerClientEvent("Notify",source,"sucesso","Você embalou <b>R$50.000,00</b> em <b>Notas Falsas</b>.")
                    end)
                end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHECAR DINHEIRO SUJO
-----------------------------------------------------------------------------------------------------------------------------------------
--[[ function emP.checkDinheiro()
    local source = source
    local user_id = vRP.getUserId(source)
    local quantidade = vRP.getInventoryItemAmount(user_id, "dollars2")
    if user_id then
        if vRP.tryGetInventoryItem(user_id,"dollars2",quantidade,false) then -- Retirar dinheiro sujo do inventario
            return true
        else
            TriggerClientEvent("Notify",source,"negado","Dinheiro sujo <b>insuficiente</b>.")
            return false
        end
    end
end ]]

function emP.checkPayment()
    local source = source
    local user_id = vRP.getUserId(source)
    local quantidade = vRP.getInventoryItemAmount(user_id, "dollars2")
	local identity = vRP.getUserIdentity(parseInt(user_id))
    if user_id then
        vRP.tryGetInventoryItem(user_id,"dollars2",quantidade)
        vRP.giveInventoryItem(user_id,"dollars",quantidade) -- Item que recebe ao lavar o dinheiro sujo
        --vRP.giveMoney(user_id,50000) -- Caso queira que receba dinheiro, ative essa linha e desative a de cima
        TriggerClientEvent("Notify",source,"sucesso","Você embalou <b>"..quantidade.."</b> em <b>Notas Falsas</b>.")

        PerformHttpRequest(webhook.Lavagem, function(err, text, headers) end, 'POST', json.encode({
            username = "Player Lavagem",
            avatar_url = webhook.Avatar,
            embeds = {
                { 	------------------------------------------------------------
                    title = "Registro - Lavagem",
                    fields = {
                        { 
                            name = "Usuário:", 
                            value = ""..identity.name.." "..identity.name2.." [**"..user_id.."**] "
                        },
                        --[[ {
                            name = "Coordenadas:", 
                            value = coords
                        }, ]]
                        --[[ {
                            name = "Motivo do quit:", 
                            value = ""..reason..""
                        }, ]]
                        --[[ {
                            name = "Grupos:", 
                            value = " "..groups..""
                        }, ]]
                        {
                            name = "Lavou:", 
                            value = ""..quantidade..""
                        },
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


        --[[ local identity = vRP.getUserIdentity(user_id)
        SendWebhookMessage(webhooklavagem,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.name2.." \n[Lavou]:"..quantidade.."\n"..os.date("[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```") ]]
    end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- PERMISSÃO
-----------------------------------------------------------------------------------------------------------------------------------------
function emP.checkPermissao()
    local source = source
    local user_id = vRP.getUserId(source)
    if vRP.hasPermission(user_id,"Bahamas")  or vRP.hasPermission(user_id,"BahamasMaster") then -- PERMISSÃO
        return true
    end
end