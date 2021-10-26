Proxy = module("vrp", "lib/Proxy")
Tunnel = module("vrp", "lib/Tunnel")
vRP = Proxy.getInterface("vRP")
func = {}
Proxy.addInterface("nation_paintball", func)
Tunnel.bindInterface("nation_paintball", func)
fclient = Tunnel.getInterface("nation_paintball")

reward = 0 -- valor total da recompensa (soma de todos os valores pagos pelos players da partida)
matchJoinPrice = 0 -- preço para entrar na partida

config = {
    roundTime = 300, -- tempo de cada round (em segundos)
    startTime = 60, -- tempo de contagem do lobby para iniciar a partida (em segundos)
    readyTime = 20, -- tempo de compra (em segundos)
    numberOfRounds = 9, -- número máximo de rounds
    maxPlayers = 6, -- maxímo de players por time (scoreboard suporta até 10 por time)
    minPlayers = 1, -- quantidade mínima de players em cada time para iniciar a partida
    messages = { -- mensagens do jogo
        gameInProgress = "Já existe um jogo em andamento.",
        matchFull = "Partida cheia.",
        insufficientNumberOfPlayers = "Partida cancelada. Número insuficiente de jogadores.",
        lobbyNoAvailable = "Não há partida criada.",
        teamFull = "Time cheio.",
        playerAlreadyInTeam = "Você já está em um time.",
        firstTeam = "Time Azul",
        secondTeam = "Time Rosa",
        joinTeam = function(name, team) return "<b>"..name.."</b> entrou no <b>"..team.."</b>." end,
        leaveTeam = function(name, team) return "<b>"..name.."</b> saiu do <b>"..team.."</b>." end,
        startingMatch = "Iniciando partida.",
        go = "go",
        insufficientMoney = "Dinheiro Insuficiente.",
        buyWeapon = function(name) return "<b>"..name.."</b> comprado com sucesso." end,
    },

    getUserId = function(source) -- pegar id do player
        return vRP.getUserId(source)
    end,

    getUserSource = function(user_id) -- pegar source do player pelo id
        return vRP.getUserSource(user_id)
    end,

    getUserName = function(user_id) -- pegar o nome / sobrenome do player
        local identity = vRP.getUserIdentity(user_id)
        if identity then
            return identity.name.." "..identity.name2
        end
        return "none"
    end,

    notify = function(source, type, msg) -- função de notificação
        TriggerClientEvent("Notify", source, type, msg, 3000)
    end,

    spawns = { -- coordenadas de spawn de cada time
        firstTeam = {
            { coords = vec3(-148.72,-935.95,114.25), h = 169.71 },
            { coords = vec3(-144.72,-937.84,114.25), h = 157.29 },
            { coords = vec3(-140.7,-938.77,114.25), h = 159.41 },
            { coords = vec3(-137.3,-939.87,114.25), h = 159.54 },
            { coords = vec3(-133.42,-942.19,114.25), h = 162.28 },
        },

        secondTeam = {
            { coords = vec3(-180.48,-1010.58,114.14), h = 341.95 },
            { coords = vec3(-173.73,-1012.92,114.14), h = 336.13 },
            { coords = vec3(-169.13,-1013.53,114.14), h = 331.44 },
            { coords = vec3(-165.85,-1015.33,114.14), h = 335.31 },
            { coords = vec3(-160.58,-1018.04,114.14), h = 333.36 },
        }
    },

    score = { -- config de pontos (score)
        kill = 100, -- pontos por kill
        death = -50, -- pontos por morte
        killSameTeam = -100  -- pontor por matar alguém do mesmo time
    },

    money = { -- config de dinheiro
        roundWin = 3250, -- dinheiro ganho pela equipe vencedora do round
        roundLose = function(streak) -- dinheiro ganho pela equipe perdedora do round
            local limit = 3400
            local value = 1400 + (streak - 1) * 500
            if value > limit then value = limit end
            return value
        end,
        kill = 300, -- dinheiro ganho por cada kill
        start = 1000 -- dinheiro inicial de cada player

    },

    defaultWeapon = "WEAPON_PISTOL50",   -- arma default

    weaponStore = { -- loja de armas
        { name = "Sniper Rifle", price = 4750, weapon = "WEAPON_SNIPERRIFLE", ammo = 250, class = "sniper", img = "https://www.gtabase.com/images/gta-5/weapons/sniper-rifles/sniper-rifle.png" },
        { name = "SMG", price = 1500, weapon = "WEAPON_SMG", class = "sub", ammo = 250, img = "https://www.gtabase.com/images/gta-5/weapons/machine-guns/smg.png" },
        { name = "Pump Shotgun", price = 2000, weapon = "WEAPON_PUMPSHOTGUN", ammo = 250, class = "shotgun", img = "https://www.gtabase.com/images/gta-5/weapons/shotguns/pump-shotgun.png" },
        { name = "Unholy<br>Hellbringer", price = 5000, weapon = "WEAPON_RAYCARBINE", ammo = 250, class = "hellbringer", img = "https://www.gtabase.com/images/gta-5/weapons/machine-guns/unholy-hellbringer.png" },
        { name = "Granada de Fumaça", price = 300, weapon = "WEAPON_BZGAS", ammo = 1, class = "smoke", img = "https://www.gtabase.com/images/gta-5/weapons/thrown/tear-gas.png" },
        { name = "HE", price = 300, weapon = "WEAPON_GRENADE", ammo = 1, class = "he", img = "https://www.gtabase.com/images/gta-5/weapons/thrown/grenade.png" },
        { name = "Molotov", price = 400, weapon = "WEAPON_MOLOTOV", ammo = 1, class = "molotov", img = "https://www.gtabase.com/images/gta-5/weapons/thrown/molotov.png" },
        { name = "Assault Rifle", price = 3100, weapon = "WEAPON_ASSAULTRIFLE", ammo = 250, class = "rifle", img = "https://www.gtabase.com/images/gta-5/weapons/assault-rifles/assault-rifle.png" },
        { name = "Colete", price = 1500, weapon = "colete", class = "shield", ammo = 1, img = "https://cdn.discordapp.com/attachments/720123156160970754/833562254480769065/pngegg.png" },
    },

    setMatchJoinPrice = function(source) -- funcao executada para criar uma partida
        local value = parseInt(vRP.prompt(source, "Digite o valor da entrada: ", "1000"))
        if value and value >= 0 then
            matchJoinPrice = value
            return true
        end
        TriggerClientEvent("Notify", source, "negado", "Valor inválido.", 3000)
        return false
    end,

    checkJoinTeam = function(source) -- funcao executada quando o player tentar entrar em algum time
        local user_id = vRP.getUserId(source)
        if vRP.paymentBank(user_id, matchJoinPrice) then
            reward = reward + matchJoinPrice
            TriggerClientEvent("Notify", source, "importante", "Você pagou $ "..vRP.format(matchJoinPrice), 3000)
            return true
        end
        TriggerClientEvent("Notify", source, "negado", "Você não possui $ "..vRP.format(matchJoinPrice), 3000)
        return false
    end,

    startMatch = function(match)
        setPlayersSession(match, 100) -- setar sessão única
    end,

    resetMatch = function(match, cancel, winner) -- funcao executada quando a partida é finalizada (ou cancelada)
        if cancel or not winner then
            for i, v in ipairs(match.firstTeam) do
                vRP.addBank(v.user_id, matchJoinPrice)
                TriggerClientEvent("Notify", v.source, "importante", "$ "..vRP.format(matchJoinPrice).." recebido.", 3000)
            end
            for i, v in ipairs(match.secondTeam) do
                vRP.addBank(v.user_id, matchJoinPrice)
                TriggerClientEvent("Notify", v.source, "importante", "$ "..vRP.format(matchJoinPrice).." recebido.", 3000)
            end
        else
            local price = parseInt(reward / #match[winner])
            for i, v in ipairs(match[winner]) do
                vRP.addBank(v.user_id, price)
                TriggerClientEvent("Notify", v.source, "sucesso", "Recompensa de $ "..vRP.format(price).." recebida.", 3000)
            end
        end
        reward = 0
        matchJoinPrice = 0
        setPlayersSession(match, 0) -- resetar sessoes
    end,

    playerLeaveMatch = function(player)
        setPlayerSession(player, 0) -- volta o player que quitou da partida para a sessão principal
    end

}


setPlayersSession = function(match, session) -- funcao de setar a sessao de todos os players da partida
    for i, v in ipairs(match.firstTeam) do
        setPlayerSession(v.source, session)
    end
    for i, v in ipairs(match.secondTeam) do
        setPlayerSession(v.source, session)
    end
end


setPlayerSession = function(player, session) -- funcao de setar a sessao de um player específico
    SetPlayerRoutingBucket(player, session) 
end


func.getServerConfig = function() -- retorna a config para client
    return config
end




RegisterServerEvent('nation_paintball:setPermission')
AddEventHandler('nation_paintball:setPermission',function(bool)
    local source = source
    local user_id = vRP.getUserId(source)
    if bool then
        vRP.insertPermission(source,"paintball")
        vRP.execute("vRP/add_group",{ user_id = user_id, permiss = "paintball" })
    else
        vRP.removePermission(source,"paintball")
        vRP.execute("vRP/del_group",{ user_id = user_id, permiss = "paintball" })
    end
end)

