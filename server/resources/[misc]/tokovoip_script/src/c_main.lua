local isRunning = false
local scriptVersion = "1.3.5"
local animStates = {}
local displayingPluginScreen = false
local radioVolume = 30
local userListPlayers = {}

RegisterNetEvent("vRP:updateList")
AddEventHandler("vRP:updateList",function(status)
	userListPlayers = status
end)

RegisterCommand("volume",function(source,args)
	if parseInt(args[1]) >= 1 and parseInt(args[1]) <= 100 then
		radioVolume = parseInt(args[1])
		TriggerEvent("Notify","sucesso","Você colocou no volume "..parseInt(args[1])..".",500)
	end
end)

local function setPlayerTalkingState(player,playerServerId)
	if player ~= -1 then
		local talking = parseInt(getPlayerData(playerServerId,"voip:talking"))

		if (animStates[playerServerId] == 0 and talking == 1) then
			PlayFacialAnim(GetPlayerPed(player),"mic_chatter","mp_facial")
		elseif (animStates[playerServerId] == 1 and talking == 0) then
			PlayFacialAnim(GetPlayerPed(player),"mood_normal_1","facials@gen_male@base")
		end

		animStates[playerServerId] = talking
	end
end

RegisterNUICallback("updatePluginData",function(data)
	local payload = data.payload

	if voip[payload.key] == payload.data then
		return
	end

	voip[payload.key] = payload.data
	setPlayerData(voip.serverId,"voip:"..payload.key,voip[payload.key],true)
	voip:updateConfig()
	voip:updateTokoVoipInfo(true)
end)

RegisterNUICallback("setPlayerTalking",function(data)
	voip.talking = parseInt(data.state)
	--TriggerEvent("nation_hud:updateTalking", voip.talking == 1)

	if voip.talking == 1 then
		TriggerEvent("hud:VoiceTalking",true)
		setPlayerData(voip.serverId,"voip:talking",1,true)
		PlayFacialAnim(GetPlayerPed(PlayerId()),"mic_chatter","mp_facial")
	else
		TriggerEvent("hud:VoiceTalking",false)
		setPlayerData(voip.serverId,"voip:talking",0,true)
		PlayFacialAnim(PlayerPedId(),"mood_normal_1","facials@gen_male@base")
	end
end)

local function clientProcessing()
	local usersdata = {}
	local ped = PlayerPedId()

	local localPos = GetPedBoneCoords(ped,0x796e)
	local localHeading = math.rad(GetGameplayCamRot().z % 360)

	for k,v in pairs(userListPlayers) do
		local playerServerId = k
		local player = GetPlayerFromServerId(k)
		local playerPed = GetPlayerPed(player)

		local playerPos = GetPedBoneCoords(playerPed,0x796e)
		local dist = #(localPos - playerPos)

		if not getPlayerData(playerServerId,"voip:mode") then
			setPlayerData(playerServerId,"voip:mode",1)
		end

		local mode = parseInt(getPlayerData(playerServerId,"voip:mode"))
		local volume = -30 + (30 - dist / voip.distance[mode] * 30)
		if volume >= 0 then
			volume = 0
		end

		local angleToTarget = localHeading - math.atan(playerPos.y - localPos.y,playerPos.x - localPos.x)
		local userData = {
			uuid = getPlayerData(playerServerId,"voip:pluginUUID"),
			volume = volume,
			muted = 0,
			radioEffect = false,
			posX = voip.plugin_data.enableStereoAudio and math.cos(angleToTarget) * dist or 0.0,
			posY = voip.plugin_data.enableStereoAudio and math.sin(angleToTarget) * dist or 0.0,
			posZ = voip.plugin_data.enableStereoAudio and playerPos.z or 0.0
		}

		if (dist >= voip.distance[mode] or player == -1) then
			userData.muted = 1
		end

		setPlayerTalkingState(player,playerServerId)
		usersdata[#usersdata + 1] = userData
	end

	for _,channel in pairs(voip.myChannels) do
		for _,subscriber in pairs(channel.subscribers) do
			if (subscriber == voip.serverId) then
				goto channelContinue
			end

			local remotePlayerUsingRadio = getPlayerData(subscriber,"radio:talking")
			local remotePlayerChannel = getPlayerData(subscriber, "radio:channel")
			if (not remotePlayerUsingRadio or remotePlayerChannel ~= channel.id) then
				goto channelContinue
			end

			local remotePlayerUuid = getPlayerData(subscriber,"voip:pluginUUID")

			local userData = {
				uuid = remotePlayerUuid,
				radioEffect = false,
				muted = false,
				volume = radioVolume - 30,
				posX = 0.0,
				posY = 0.0,
				posZ = voip.plugin_data.enableStereoAudio and localPos.z or 0.0
			}

			if ((type(remotePlayerChannel) == "number" and remotePlayerChannel <= 1000) or channel.radio) then
				userData.radioEffect = true
			end

			for k,v in pairs(usersdata) do
				if (v.uuid == remotePlayerUuid) then
					usersdata[k] = userData
					goto channelContinue
				end
			end

			usersdata[#usersdata + 1] = userData
			::channelContinue::
		end
	end

	voip.plugin_data.Users = usersdata
	voip.plugin_data.posX = 0.0
	voip.plugin_data.posY = 0.0
	voip.plugin_data.posZ = voip.plugin_data.enableStereoAudio and localPos.z or 0.0
end

RegisterNetEvent("initializeVoip")
AddEventHandler("initializeVoip",function()
	Citizen.Wait(1000)

	if (isRunning) then return end

	isRunning = true
	voip = TokoVoip:init(TokoVoipConfig)
	voip.plugin_data.Users = {}
	voip.plugin_data.radioTalking = false
	voip.plugin_data.radioChannel = -1
	voip.plugin_data.localRadioClicks = false
	voip.mode = 2
	voip.talking = false
	voip.pluginStatus = -1
	voip.pluginVersion = "0"
	voip.serverId = GetPlayerServerId(PlayerId())
	voip.myChannels = {}

	TriggerEvent("hud:VoiceMode",voip.mode)
	setPlayerData(voip.serverId,"voip:mode",voip.mode,true)
	setPlayerData(voip.serverId,"voip:talking",voip.talking,true)
	setPlayerData(voip.serverId,"radio:channel",voip.plugin_data.radioChannel,true)
	setPlayerData(voip.serverId,"radio:talking",voip.plugin_data.radioTalking,true)
	setPlayerData(voip.serverId,"voip:pluginStatus",voip.pluginStatus,true)
	setPlayerData(voip.serverId,"voip:pluginVersion",voip.pluginVersion,true)
	refreshAllPlayerData()

	RequestAnimDict("mp_facial")
	while not HasAnimDictLoaded("mp_facial") do
		RequestAnimDict("mp_facial")
		Citizen.Wait(10)
	end

	RequestAnimDict("facials@gen_male@base")
	while not HasAnimDictLoaded("facials@gen_male@base") do
		RequestAnimDict("facials@gen_male@base")
		Citizen.Wait(10)
	end

	Citizen.CreateThread(function()
		voip.processFunction = clientProcessing
		voip:initialize()
		voip:loop()
	end)
end)

function addPlayerToRadio(channel)
	TriggerServerEvent("TokoVoip:addPlayerToRadio",channel,voip.serverId)
end
RegisterNetEvent("TokoVoip:addPlayerToRadio")
AddEventHandler("TokoVoip:addPlayerToRadio",addPlayerToRadio)

function removePlayerFromRadio(channel)
	TriggerServerEvent("TokoVoip:removePlayerFromRadio",channel,voip.serverId)
end
RegisterNetEvent("TokoVoip:removePlayerFromRadio")
AddEventHandler("TokoVoip:removePlayerFromRadio",removePlayerFromRadio)

RegisterNetEvent("TokoVoip:onPlayerLeaveChannel")
AddEventHandler("TokoVoip:onPlayerLeaveChannel",function(channelId,playerServerId)
	if (playerServerId == voip.serverId and voip.myChannels[channelId]) then
		local previousChannel = voip.plugin_data.radioChannel
		voip.myChannels[channelId] = nil

		if voip.plugin_data.radioChannel == channelId then
			if tablelength(voip.myChannels) > 0 then
				for channelId,_ in pairs(voip.myChannels) do
					voip.plugin_data.radioChannel = channelId
					break
				end
			else
				voip.plugin_data.radioChannel = -1
			end
		end

		if previousChannel ~= voip.plugin_data.radioChannel then
			setPlayerData(voip.serverId,"radio:channel",voip.plugin_data.radioChannel,true)
		end
	elseif voip.myChannels[channelId] then
		voip.myChannels[channelId].subscribers[playerServerId] = nil
	end
end)

RegisterNetEvent("TokoVoip:onPlayerJoinChannel")
AddEventHandler("TokoVoip:onPlayerJoinChannel",function(channelId,playerServerId,channelData)
	if (playerServerId == voip.serverId and channelData) then
		local previousChannel = voip.plugin_data.radioChannel

		voip.plugin_data.radioChannel = channelData.id
		voip.myChannels[channelData.id] = channelData

		if (previousChannel ~= voip.plugin_data.radioChannel) then
			setPlayerData(voip.serverId,"radio:channel",voip.plugin_data.radioChannel,true)
		end
	elseif voip.myChannels[channelId] then
		voip.myChannels[channelId].subscribers[playerServerId] = playerServerId
	end
end)

function isPlayerInChannel(channel)
	if voip.myChannels[channel] then
		return true
	else
		return false
	end
end

function displayPluginScreen(toggle)
	if displayingPluginScreen ~= toggle then
		SendNUIMessage({ type = "displayPluginScreen", data = toggle })
		displayingPluginScreen = toggle
	end
end

exports("addPlayerToRadio",addPlayerToRadio)
exports("removePlayerFromRadio",removePlayerFromRadio)
exports("isPlayerInChannel",isPlayerInChannel)