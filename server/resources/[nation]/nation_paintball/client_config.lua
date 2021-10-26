Proxy = module("vrp", "lib/Proxy")
Tunnel = module("vrp", "lib/Tunnel")
vRP = Proxy.getInterface("vRP")
func = Tunnel.getInterface("nation_paintball")
fclient = {}
Proxy.addInterface("nation_paintball", fclient)
Tunnel.bindInterface("nation_paintball", fclient)

RegisterNetEvent("nation_paintball:updateSurvival") -- evento que é acionado quando o player entra / sai do paintball


AddEventHandler('nation_paintball:updateSurvival',function(bool)
    TriggerServerEvent('nation_paintball:setPermission', bool)
end)

sv_config = {}

config = {

    keys = { -- teclas (binds)
        scoreboard = 212, -- home
        cancel = 168, -- f7
        store = 38 -- e
    },
    
    startcoords = vec3(21.42,-1111.84,29.8), -- coordenada inicial (para começar uma partida)
    
    drawMarker = function(coords) -- função de marker
        if not HasStreamedTextureDictLoaded("w_pi_pistol50") then
            RequestStreamedTextureDict("w_pi_pistol50", true)
            while not HasStreamedTextureDictLoaded("w_pi_pistol50") do
                Wait(1)
            end
        else
            DrawMarker(9, coords, 0.0, 0.0, 0.0, 0.0, 90.0, 90.0, 0.8, 0.8, 0.8, 255, 255, 255, 255,false, false, 2, true, "w_pi_pistol50", "paintball-logo", false)
            DrawMarker(1,coords.x,coords.y,coords.z-0.97,0,0,0,0,0,0,1.0,1.0,0.9,138,91,255,155,0,0,0,1)
        end
    end,
    
    drawMessage = function(str) -- função de desenha o texto na tela
        SetTextComponentFormat("STRING")
        AddTextComponentString(str)
        DisplayHelpTextFromStringLabel(0, 0, 1, -1)
    end,
    
    messages = { -- mensagens
        createGame = "Pressione ~p~E~w~ para criar uma partida.",
        joinGame = "Pressione ~p~E~w~ para participar da partida."
    },

    notify = function(type, msg) -- função de notificação
        TriggerEvent("Notify", type, msg, 3000)
    end,

    customizations = { -- roupas
		firstTeam = { --azul
            [1885233650] = { -- masculino
                [1] = { 126,10,1 }, -- Mascara
                [3] = { 49,0,1 }, -- Maos
                [4] = { 87,10,1 }, -- Calça
                [6] = { 25,0,1 }, -- Sapato		
                [8] = { 15,0,2 }, -- Camisa
                [11] = { 209,10,1 }, -- Jaqueta
                ["p6"] = { 1,0 }, -- Braço Esquerdo
                ["p7"] = { -1,0 } -- Braço Direito
            },
            [-1667301416] = { -- feminino
                [1] = { 126, 4, 2 },
                [2] = { 61, 0, 0 },
                [3] = { 31, 0, 2 },
                [4] = { 90, 10, 2 },
                [5] = { -1, 0, 2 },
                [6] = { 25, 0, 2 },
                [7] = { -1, 0, 2 },
                [8] = { 17, 0, 2 },
                [9] = { -1, 0, 2 },
                [10] = { -1, 0, 2 },
                [11] = { 214, 10, 2 },
                [0] = { 0, 0, 0 },
            }
        },
        secondTeam = { --rosa
			[1885233650] = { -- masculino
				[1] = { 126,23,1 }, -- Mascara
				[3] = { 49,0,1 }, -- Maos
				[4] = { 87,23,1 }, -- Calça
				[6] = { 25,0,1 }, -- Sapato		
				[8] = { 15,0,2 }, -- Camisa
				[11] = { 209,23,1 }, -- Jaqueta
				["p6"] = { 1,0 }, -- Braço Esquerdo
				["p7"] = { -1,0 } -- Braço Direito
			},
			[-1667301416] = { -- feminino
				[1] = { 126, 17, 2 },
                [2] = { 61, 0, 0 },
                [3] = { 31, 0, 2 },
                [4] = { 90, 23, 2 },
                [5] = { -1, 0, 2 },
                [6] = { 25, 0, 2 },
                [7] = { -1, 0, 2 },
                [8] = { 17, 0, 2 },
                [9] = { -1, 0, 2 },
                [10] = { -1, 0, 2 },
                [11] = { 214, 23, 2 },
                [0] = { 0, 0, 0 },
			}
		},
	},

    getCustomization = function() -- função de pegar as customizações (roupas) do player
        local ped = PlayerPedId()
        local custom = {}
        custom.modelhash = GetEntityModel(ped)
        for i = 0,20 do
            custom[i] = { GetPedDrawableVariation(ped,i),GetPedTextureVariation(ped,i),GetPedPaletteVariation(ped,i) }
        end
        for i = 0,10 do
            custom["p"..i] = { GetPedPropIndex(ped,i),math.max(GetPedPropTextureIndex(ped,i),0) }
        end
        return custom
    end,

    setCustomization = function(custom) -- função de setar as customizações (roupas) do player
        vRP.setCustomization(custom)
        TriggerServerEvent("barbershop:init")
    end,

    dressUp = function(team) -- função de vestir o player com as roupas do time
        local ped = PlayerPedId()
        local myCustom = config.customizations[team]
        local custom = {}
        if myCustom then
            if not old_custom then
                old_custom = config.getCustomization() -- salvar custom antiga
            end
            custom = {table.unpack(old_custom)}
            custom.modelhash = nil
            local cloths = myCustom[old_custom.modelhash]
            if cloths then
                for l,w in pairs(cloths) do
                    custom[l] = w
                end
            end
        elseif old_custom then
            custom = old_custom
        end
        config.setCustomization(custom)
    end,

    playerDie = function() -- funcao de morte
        CreateThread(function()
            local ped = PlayerPedId()
            vRP._replaceWeapons({})
            SetEntityHealth(ped, 103)
            setInvincible(true)
            vRP._stopAnim(false)
            SetPedToRagdoll(ped,1000,1000,0,0,0,0)
            CreateThread(function()
                StartScreenEffect("DeathFailOut", 0, 0)
                PlaySoundFrontend(-1, "Bed", "WastedSounds", 1)
				ShakeGameplayCam("DEATH_FAIL_IN_EFFECT_SHAKE", 1.0)
				
				local scaleform = RequestScaleformMovie("MP_BIG_MESSAGE_FREEMODE")

                while not HasScaleformMovieLoaded(scaleform) do
                    scaleform = RequestScaleformMovie("MP_BIG_MESSAGE_FREEMODE")
                    Wait(0)
                end

				if HasScaleformMovieLoaded(scaleform) then
					Wait(0)
                    PushScaleformMovieFunction(scaleform, "SHOW_SHARD_WASTED_MP_MESSAGE")
                    BeginTextComponent("STRING")
                    AddTextComponentString("~r~você morreu")
                    EndTextComponent()
                    PopScaleformMovieFunctionVoid()
                    Wait(500)
                    PlaySoundFrontend(-1, "TextHit", "WastedSounds", 1)
                end
                while dead do
                    SetPedArmour(ped,0)   
                    SetEntityHealth(ped, 103)
                    setInvincible(true)
                    SetPedToRagdoll(ped,1000,1000,0,0,0,0)
                    if not spectating then
                        DrawScaleformMovieFullscreen(scaleform, 255, 255, 255, 255)
                    end
                    Wait(0)
                end
                spectating = false
                vRP._stopAnim(false)
                StopScreenEffect("DeathFailOut")
            end)
            Wait(3000)
            local getLivePlayers = function()
                local livePlayers = {}
                if match and match[myTeam] then
                    for i,v in ipairs(match[myTeam]) do
                        if not v.death and v.user_id ~= myId then
                            table.insert(livePlayers, v)
                        end
                    end
                end
                return livePlayers
            end
            local livePlayers = getLivePlayers()
            local spectedPlayer
            if #livePlayers > 0 then
                local i = #livePlayers
                local spectatePlayer = function(playerSrc) -- função de spectar o player
                    if playerSrc then
                        local playerPed = GetPlayerPed(GetPlayerFromServerId(playerSrc))
                        if playerPed and DoesEntityExist(playerPed) and GetEntityHealth(playerPed) > 103 then
                            if spectedPlayer and spectedPlayer == playerSrc then return end
                            NetworkSetInSpectatorMode(true, playerPed)
                            StopScreenEffect("DeathFailOut")
                            spectedPlayer = playerSrc
                        end
                    end
                end
                local goToNextPlayer = function()
                    livePlayers = getLivePlayers()
                    if #livePlayers > 0 then
                        i = i -1
                        while not livePlayers[i] do
                            i = i -1
                            if i < 1 then 
                                i = #livePlayers
                                break
                            end
                            Wait(1)
                        end
                        spectatePlayer(livePlayers[i].source)
                    else
                        spectating = false
                    end
                end
                spectatePlayer(livePlayers[i].source)
                spectating = true
                while spectating do
                    if IsControlJustPressed(0, 24) then
                        goToNextPlayer()
                    end
                    Wait(1)
                end
                NetworkSetInSpectatorMode(false)
                StopScreenEffect("DeathFailOut")
                spectedPlayer = false
            end
        end)
    end,

    startRound = function() -- funcao executada toda vez que o round é iniciado
        local ped = PlayerPedId()
        local weapon = vRP._giveInventoryItem(defaultWeapon)
        local weapons = {
            [weapon] = { ammo = 250 }
        }

        if not oldWeapons then
            oldWeapons = vRP.giveInventoryItem(weapons) or {} -- salvar armas antigas
            myArmour = GetPedArmour(ped) -- salvar colete
            vRP.setArmour(0)   -- remover colete
        else
            local myWeapons = vRP.getWeapons()
            for k,v in pairs(myWeapons) do
                v.ammo = 250 -- resetar munição
            end
            myWeapons[weapon] = { ammo = 250 }
            vRP._giveInventoryItem(myWeapons)
        end
        
        SetEntityHealth(ped, 400) -- setar vida do ped
        ClearPedBloodDamage(ped) -- tirar o sangue do ped
        TriggerEvent("resetBleeding") -- eventos de sangramento
		TriggerEvent("resetDiagnostic") -- -- eventos de sangramento
        vRP._stopAnim(false) -- parar animação

        local scaleform = RequestScaleformMovie("MP_BIG_MESSAGE_FREEMODE")
        while not HasScaleformMovieLoaded(scaleform) do
            scaleform = RequestScaleformMovie("MP_BIG_MESSAGE_FREEMODE")
            Wait(0)
        end
		if HasScaleformMovieLoaded(scaleform) then
			Wait(0)
            PushScaleformMovieFunction(scaleform, "SHOW_SHARD_WASTED_MP_MESSAGE")
            BeginTextComponent("STRING")
            AddTextComponentString("~g~pressione ~b~E~g~ para abrir a ~b~loja")
            EndTextComponent()
            PopScaleformMovieFunctionVoid()
        end
        Wait(2000)
        TriggerEvent("resetBleeding") -- eventos de sangramento
		TriggerEvent("resetDiagnostic") -- eventos de sangramento
        SetCurrentPedWeapon(ped, GetHashKey(weapon), true) -- setar a arma default como arma equipada na mão do ped
        RefillAmmoInstantly(ped) -- recarregar a arma automaticamente
        local count = 3000
        while count > 0 and not activeMenus.store and inGame do
            DrawScaleformMovieFullscreen(scaleform, 255, 255, 255, 255)
            count = count-10
            Wait(1)
        end
    end,

    giveWeapon = function(weapon, ammo) -- função de dar a arma comprada na loja para o player
        if weapon == "colete" then
            vRP.setArmour(100)
            return
        end
        local weapons = {
            [weapon] = { ammo = ammo }
        }
        vRP.giveWeapons(weapons,false) 
    end,


    reset = function() -- função de resetar a partida
        local ped = PlayerPedId()
        vRP.setArmour(myArmour or 0)  
        SetEntityHealth(ped, 400)
        setInvincible(false)
        ClearPedBloodDamage(ped)
        vRP._stopAnim(false)
        vRP.giveInventoryItem(oldWeapons or {})
        oldWeapons = false
        TriggerEvent("nation_paintball:updateSurvival", false) -- evento que é acionado quando o player entra / sai do paintball
        TriggerEvent("resetBleeding")
		TriggerEvent("resetDiagnostic")
        SetEntityCoords(ped, myCoords)
        fclient.updateReadyTimer(0, false, true)
    end,

    getMyWeapons = function() -- pegar armas do player
        local weapons = vRP.getWeapons()
        weapons["colete"] = GetPedArmour(PlayerPedId()) == 100
        return weapons
    end

}

CreateThread(function()
    sv_config = func.getServerConfig() -- pegar config do server
    config.defaultWeapon = vRP._giveInventoryItem(defaultWeapon)
    config.weaponStore = sv_config.weaponStore
    NetworkSetInSpectatorMode(false)
    StopScreenEffect("DeathFailOut")
    StopScreenEffect("SwitchHUDMichaelIn")
    TriggerEvent("nation_paintball:updateSurvival", false) -- evento que é acionado quando o player entra / sai do paintball
end)



setInvincible = function(bool) -- funcao de setar o player como invencível
    local ped = PlayerPedId()
    SetEntityInvincible(ped, bool)
end

RegisterCommand('leave',function() -- comando de sair de uma partida em andamento
    if inGame then
        func.quitMatch()
    end
end)

function fclient.isInPaintball() -- retorna se o player está em um jogo
    return inGame or inLobby
end


