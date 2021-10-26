TokoVoipConfig = {
	refreshRate = 500,
	networkRefreshRate = 2000,
	playerListRefreshRate = 5000,
	minVersion = "1.2.4",
	distance = { 2,10,25 },
	radioKey = Keys["CAPS"],
	keySwitchChannels = Keys["PAGEUP"],
	keySwitchChannelsSecondary = Keys["PAGEDOWN"],
	keyProximity = Keys["HOME"],
	plugin_data = {
		TSChannel = "Jogando",
		TSPassword = "tsspace",
		TSChannelWait = "Aguardando",
		local_click_on = true,
		local_click_off = true,
		remote_click_on = false,
		remote_click_off = false,
		enableStereoAudio = true,
		localName = "",
		localNamePrefix = "#"..GetPlayerServerId(PlayerId()).." "
	}
}

AddEventHandler("onClientResourceStart",function(resource)
	if (resource == GetCurrentResourceName()) then
		Citizen.CreateThread(function()
			TokoVoipConfig.plugin_data.localName = "Havana City"
		end)
		TriggerEvent("initializeVoip")
	end
end)

function SetTokoProperty(key,value)
	if TokoVoipConfig[key] ~= nil and TokoVoipConfig[key] ~= "plugin_data" then
		TokoVoipConfig[key] = value
		if voip then
			if voip.config then
				if voip.config[key] ~= nil then
					voip.config[key] = value
				end
			end
		end
	end
end

exports("SetTokoProperty",SetTokoProperty)