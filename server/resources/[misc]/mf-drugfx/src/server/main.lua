-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
local Proxy  = module("vrp","lib/Proxy")
local Config = module("mf-drugfx","config")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONEXÃO
-----------------------------------------------------------------------------------------------------------------------------------------
Drugs = {}
Tunnel.bindInterface("mf-drugfx",Drugs)
vSERVER = Tunnel.getInterface("mf-drugfx")
vCLIENT = Tunnel.getInterface("vrp_inventory")
vPLAYER = Tunnel.getInterface("vrp_player")
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
error = function(...) end
print = (print or function(...) end)
Drugs = (Drugs or {})
Drugs.Resource = GetCurrentResourceName()
Drugs.Consumed = {}
-----------------------------------------------------------------------------------------------------------------------------------------
-- exports function GetTableItem
-----------------------------------------------------------------------------------------------------------------------------------------
exports("GetTableItem", function(item)
    return Config.Items[item]
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- Event GetTableItem
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("Drugs:GetTableItem")
AddEventHandler("Drugs:GetTableItem", function(item)
    return Config.Items[item]
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- Event Drugs:Consume
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("Drugs:Consume", function(source, item)
    if type(source) == "number" and type(item) == "table" and type(Config) == "table" and type(Config.Items) == "table" and
        type(item.type) == "string" then
        Drugs.Consumed[source] = (Drugs.Consumed[source] or {})

        local id = #Drugs.Consumed[source] + 1
        Drugs.Consumed[source][id] = item.type
        TriggerClientEvent("Drugs:Consume", source, item, id)
    end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- Event Drugs:Create
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("Drugs:Create", function(callback, opts)
    callback({
        name    = (opts and opts.name or 'Weed'),
        type    = (opts and opts.type or 'herb'),
        quality = (opts and opts.quality or 1.0),
        instant = (opts and opts.instant or false),
        sober   = (opts and opts.sober or false),
        effects = {
            move_speed   = (opts and opts.effects and opts.effects.move_speed or false),
            add_armor    = (opts and opts.effects and opts.effects.add_armor or false),
            add_health   = (opts and opts.effects and opts.effects.add_health or false),
            take_armor   = (opts and opts.effects and opts.effects.take_armor or false),
            take_health  = (opts and opts.effects and opts.effects.take_health or false),
            health_regen = (opts and opts.effects and opts.effects.health_regen or false)
        },
        animation = (opts and opts.animation and {
            type      = (opts.animation.type or 'animation'),
            dict      = (opts.animation.dict or 'amb@world_human_smoking_pot@male@base'),
            anim      = (opts.animation.anim or 'base'),
            blend_in  = (opts.animation.blend_in or 8.0),
            blend_out = (opts.animation.blend_out or -8.0),
            flag      = (opts.animation.flag or 48),
            start     = (opts.animation.start or 0.0),
            prop      = (opts.animation.prop or 'p_cs_joint_01'),
            bone      = (opts.animation.bone or 18905),
            wait      = (opts.animation.wait or true),
            duration  = (opts.animation.duration or false),
            pos       = (opts.animation.pos or false),
            rot       = (opts.animation.rot or false)
        } or false)
    })
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- Event Drugs:Consumed
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("Drugs:Consumed")
AddEventHandler("Drugs:Consumed", function(item, id)
    if type(item) ~= "table" or type(item.type) ~= "string" or type(id) ~= "number" or type(source) ~= "number" then
        print(string.format("[%s] Error with player consumption, player %s.", Drugs.Resource,
            tostring((source or 'ERROR'))))
    else
        if Drugs.Consumed[source] then
            if Drugs.Consumed[source][id] then
                if Drugs.Consumed[source][id] ~= item.type then
                    print(string.format("[%s] Error with player consumption, player %s.", Drugs.Resource,
                        tostring((source or 'ERROR'))))
                end
            else
                print(string.format("[%s] Error with player consumption, player %s.", Drugs.Resource,
                    tostring((source or 'ERROR'))))
            end
        else
            print(string.format("[%s] Error with player consumption, player %s.", Drugs.Resource,
                tostring((source or 'ERROR'))))
        end
    end
end)
