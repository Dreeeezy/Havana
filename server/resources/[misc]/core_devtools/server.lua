local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")
local Tools = module("vrp", "lib/Tools")
vRP = Proxy.getInterface("vRP")

func = {}
Tunnel.bindInterface("core_devtools", func)


function SendWebhookMessage(webhook,message)
	if webhook ~= nil and webhook ~= "" then
		PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({content = message}), { ['Content-Type'] = 'application/json' })
	end
end

local webhook = "https://discord.com/api/webhooks/890034590239055872/2wd0qob5L9L-UPMtFM_LOylnWqo-ucyX5o5W4jR7r96FN28Mty1CiVKoXxMgOh7aT48_"
function func.Punicao()
    local source = source
    local user_id = vRP.getUserId(source)
    if user_id then
        vRP.kick(source,'Você foi expulso por estar utilizando o Dev Tools, não abra isso!')
--        SendWebhookMessage(webhook, "```ini \nANTI DEVTOOLS     \n[ID]: "..user_id.."  \n[MOTIVO: ACESSANDO O DEVTOOLS]	")
        SendWebhookMessage(webhook,"```ini\n[ID]: "..user_id.." \n[MOTIVO: ACESSANDO O DEVTOOLS] \n"..os.date("[Data]: %d/%m/%Y [Hora]: %H:%M:%S  \r```"))
    end
end