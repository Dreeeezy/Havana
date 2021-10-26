-- It does requires:
-- Updated artifacts: https://runtime.fivem.net/artifacts/fivem/build_server_windows/master/
-- Force b2189: server.cfg/set sv_enforceGameBuild 2189
Config = {}

Config.SetAudioFlag = false -- Activate the ambient sound
Config.OceanScaler = true -- Adjust the tide level

Config.BlipName = 'Island'
Config.CreateBlip = true -- Makes the area clickable on the map
Config.BlipSprite = 162 -- https://docs.fivem.net/docs/game-references/blips/#blips
Config.SetBlipColour = 0 -- https://docs.fivem.net/docs/game-references/blips/#blip-colors
Config.EnableRadar = true -- Display the island on the map

Config.Island = {
		{ name = 'h4_islandairstrip_doorsopen', enabled = true },
		{ name = 'h4_islandairstrip', enabled = true },
		{ name = 'h4_islandairstrip_hangar_props', enabled = true },
		{ name = 'h4_islandairstrip_props', enabled = true },
		{ name = 'h4_islandairstrip_propsb', enabled = true },
		{ name = 'h4_mph4_airstrip', enabled = true },
		{ name = 'h4_mph4_airstrip_interior_0_airstrip_hanger', enabled = true },
		
		{ name = 'h4_islandairstrip_doorsclosed', enabled = false },
		{ name = 'h4_islandx_disc_strandedshark', enabled = false },
		{ name = 'h4_islandx_disc_strandedwhale', enabled = false },
		{ name = 'h4_islandx_sea_mines', enabled = false },
		{ name = 'h4_mansion_gate_broken', enabled = false },
		{ name = 'h4_underwater_gate_closed', enabled = true },
		
		{ name = 'h4_mph4_terrain_01_grass_0', enabled = true },
		{ name = 'h4_mph4_terrain_01_grass_1', enabled = true },
		{ name = 'h4_mph4_terrain_02_grass_0', enabled = true },
		{ name = 'h4_mph4_terrain_02_grass_1', enabled = true },
		{ name = 'h4_mph4_terrain_02_grass_2', enabled = true },
		{ name = 'h4_mph4_terrain_02_grass_3', enabled = true },
		{ name = 'h4_mph4_terrain_04_grass_0', enabled = true },
		{ name = 'h4_mph4_terrain_04_grass_1', enabled = true },
		{ name = 'h4_mph4_terrain_05_grass_0', enabled = true },
		{ name = 'h4_mph4_terrain_06_grass_0', enabled = true },
		{ name = 'h4_islandx_terrain_01', enabled = true },
		{ name = 'h4_islandx_terrain_02', enabled = true },
		{ name = 'h4_islandx_terrain_03', enabled = true },
		{ name = 'h4_islandx_terrain_04', enabled = true },
		{ name = 'h4_islandx_terrain_05', enabled = true },
		{ name = 'h4_islandx_terrain_06', enabled = true },
		{ name = 'h4_islandx_terrain_props_05_a', enabled = true },
		{ name = 'h4_islandx_terrain_props_05_b', enabled = true },
		{ name = 'h4_islandx_terrain_props_05_c', enabled = true },
		{ name = 'h4_islandx_terrain_props_05_d', enabled = true },
		{ name = 'h4_islandx_terrain_props_05_e', enabled = true },
		{ name = 'h4_islandx_terrain_props_05_f', enabled = true },
		{ name = 'h4_islandx_terrain_props_06_a', enabled = true },
		{ name = 'h4_islandx_terrain_props_06_b', enabled = true },
		{ name = 'h4_islandx_terrain_props_06_c', enabled = true },
		{ name = 'h4_mph4_terrain_01', enabled = true },
		{ name = 'h4_mph4_terrain_01_long_0', enabled = true },
		{ name = 'h4_mph4_terrain_02', enabled = true },
		{ name = 'h4_mph4_terrain_03', enabled = true },
		{ name = 'h4_mph4_terrain_04', enabled = true },
		{ name = 'h4_mph4_terrain_05', enabled = true },
		{ name = 'h4_mph4_terrain_06', enabled = true },
		{ name = 'h4_mph4_terrain_06_strm_0', enabled = true },
		{ name = 'h4_mph4_terrain_occ_00', enabled = true },
		{ name = 'h4_mph4_terrain_occ_01', enabled = true },
		{ name = 'h4_mph4_terrain_occ_02', enabled = true },
		{ name = 'h4_mph4_terrain_occ_03', enabled = true },
		{ name = 'h4_mph4_terrain_occ_04', enabled = true },
		{ name = 'h4_mph4_terrain_occ_05', enabled = true },
		{ name = 'h4_mph4_terrain_occ_06', enabled = true },
		{ name = 'h4_mph4_terrain_occ_07', enabled = true },
		{ name = 'h4_mph4_terrain_occ_08', enabled = true },
		{ name = 'h4_mph4_terrain_occ_09', enabled = true },
		{ name = 'h4_boatblockers', enabled = true },
		{ name = 'h4_islandx', enabled = true },
		{ name = 'h4_islandx_props', enabled = true },
		{ name = 'h4_mph4_island', enabled = true },
		{ name = 'h4_mph4_island_long_0', enabled = true },
		{ name = 'h4_mph4_island_strm_0', enabled = true },
		{ name = 'h4_aa_guns', enabled = true },
		{ name = 'h4_beach', enabled = true },
		{ name = 'h4_beach_bar_props', enabled = true },
		{ name = 'h4_beach_party', enabled = true },
		{ name = 'h4_beach_props', enabled = true },
		{ name = 'h4_beach_props_party', enabled = true },
		{ name = 'h4_islandxcanal_props', enabled = true },
		{ name = 'h4_islandxdock', enabled = true },
		{ name = 'h4_islandxdock_props', enabled = true },
		{ name = 'h4_islandxdock_props_2', enabled = true },
		{ name = 'h4_islandxdock_water_hatch', enabled = true },
		{ name = 'h4_islandxtower', enabled = true },
		{ name = 'h4_islandxtower_veg', enabled = true },
		{ name = 'h4_islandx_barrack_hatch', enabled = true },
		{ name = 'h4_islandx_barrack_props', enabled = true },
		{ name = 'h4_islandx_checkpoint', enabled = true },
		{ name = 'h4_islandx_checkpoint_props', enabled = true },
		{ name = 'h4_islandx_maindock', enabled = true },
		{ name = 'h4_islandx_maindock_props', enabled = true },
		{ name = 'h4_islandx_maindock_props_2', enabled = true },
		{ name = 'h4_islandx_mansion', enabled = true },
		{ name = 'h4_islandx_mansion_b', enabled = true },
		{ name = 'h4_islandx_mansion_b_side_fence', enabled = true },
		{ name = 'h4_islandx_mansion_entrance_fence', enabled = true },
		{ name = 'h4_islandx_mansion_guardfence', enabled = true },
		{ name = 'h4_islandx_mansion_lights', enabled = true },
		{ name = 'h4_islandx_mansion_lockup_01', enabled = true },
		{ name = 'h4_islandx_mansion_lockup_02', enabled = true },
		{ name = 'h4_islandx_mansion_lockup_03', enabled = true },
		{ name = 'h4_islandx_mansion_office', enabled = true },
		{ name = 'h4_islandx_mansion_props', enabled = true },
		{ name = 'h4_islandx_mansion_vault', enabled = true },
		{ name = 'h4_mansion_gate_closed', enabled = true },
		{ name = 'h4_mansion_remains_cage', enabled = true },
		{ name = 'h4_mph4_beach', enabled = true },
		{ name = 'h4_mph4_dock', enabled = true },
		{ name = 'h4_mph4_island_ne_placement', enabled = true },
		{ name = 'h4_mph4_island_nw_placement', enabled = true },
		{ name = 'h4_mph4_island_se_placement', enabled = true },
		{ name = 'h4_mph4_island_sw_placement', enabled = true },
		{ name = 'h4_mph4_mansion', enabled = true },
		{ name = 'h4_mph4_mansion_b', enabled = true },
		{ name = 'h4_mph4_mansion_b_strm_0', enabled = true },
		{ name = 'h4_mph4_mansion_strm_0', enabled = true },
		{ name = 'h4_mph4_wtowers', enabled = true },
		{ name = 'h4_ne_ipl_00', enabled = true },
		{ name = 'h4_ne_ipl_01', enabled = true },
		{ name = 'h4_ne_ipl_02', enabled = true },
		{ name = 'h4_ne_ipl_03', enabled = true },
		{ name = 'h4_ne_ipl_04', enabled = true },
		{ name = 'h4_ne_ipl_05', enabled = true },
		{ name = 'h4_ne_ipl_06', enabled = true },
		{ name = 'h4_ne_ipl_07', enabled = true },
		{ name = 'h4_ne_ipl_08', enabled = true },
		{ name = 'h4_ne_ipl_09', enabled = true },
		{ name = 'h4_nw_ipl_00', enabled = true },
		{ name = 'h4_nw_ipl_01', enabled = true },
		{ name = 'h4_nw_ipl_02', enabled = true },
		{ name = 'h4_nw_ipl_03', enabled = true },
		{ name = 'h4_nw_ipl_04', enabled = true },
		{ name = 'h4_nw_ipl_05', enabled = true },
		{ name = 'h4_nw_ipl_06', enabled = true },
		{ name = 'h4_nw_ipl_07', enabled = true },
		{ name = 'h4_nw_ipl_08', enabled = true },
		{ name = 'h4_nw_ipl_09', enabled = true },
		{ name = 'h4_se_ipl_00', enabled = true },
		{ name = 'h4_se_ipl_01', enabled = true },
		{ name = 'h4_se_ipl_02', enabled = true },
		{ name = 'h4_se_ipl_03', enabled = true },
		{ name = 'h4_se_ipl_04', enabled = true },
		{ name = 'h4_se_ipl_05', enabled = true },
		{ name = 'h4_se_ipl_06', enabled = true },
		{ name = 'h4_se_ipl_07', enabled = true },
		{ name = 'h4_se_ipl_08', enabled = true },
		{ name = 'h4_se_ipl_09', enabled = true },
		{ name = 'h4_sw_ipl_00', enabled = true },
		{ name = 'h4_sw_ipl_01', enabled = true },
		{ name = 'h4_sw_ipl_02', enabled = true },
		{ name = 'h4_sw_ipl_03', enabled = true },
		{ name = 'h4_sw_ipl_04', enabled = true },
		{ name = 'h4_sw_ipl_05', enabled = true },
		{ name = 'h4_sw_ipl_06', enabled = true },
		{ name = 'h4_sw_ipl_07', enabled = true },
		{ name = 'h4_sw_ipl_08', enabled = true },
		{ name = 'h4_sw_ipl_09', enabled = true },
		{ name = 'h4_islandx_placement_01', enabled = true },
		{ name = 'h4_islandx_placement_02', enabled = true },
		{ name = 'h4_islandx_placement_03', enabled = true },
		{ name = 'h4_islandx_placement_04', enabled = true },
		{ name = 'h4_islandx_placement_05', enabled = true },
		{ name = 'h4_islandx_placement_06', enabled = true },
		{ name = 'h4_islandx_placement_07', enabled = true },
		{ name = 'h4_islandx_placement_08', enabled = true },
		{ name = 'h4_islandx_placement_09', enabled = true },
		{ name = 'h4_islandx_placement_10', enabled = true },
		{ name = 'h4_mph4_island_placement', enabled = true }
}

Citizen.CreateThread(
function()
	for k,v in pairs(Config.Island) do
		if v.enabled then
			RequestIpl(v.name)
		else
			if IsIplActive(v.name) then
				RemoveIpl(v.name)
			end
		end
	end
	loadHangar()
	while true do
			nearIsland()
		Wait(2500)
	end
end)

Citizen.CreateThread(
function()
	if Config.CreateBlip then
		createBlip()
	end
	while true do
		if Config.EnableRadar then
		enableRadar()
	else
		break
	end
		Wait(10)
	end
end)

function loadHangar()
	if IsIplActive('h4_islandairstrip') and IsIplActive('h4_mph4_airstrip_interior_0_airstrip_hanger') then
	local interiorId = GetInteriorAtCoordsWithType(4439.823, -4461.717, 4.7,'h4_airstrip_hanger')
		ActivateInteriorEntitySet(interiorId,'island_hanger_padlock_props') 
			if IsValidInterior(interiorId) and IsInteriorEntitySetActive(interiorId,'island_hanger_padlock_props') then
			ActivateInteriorEntitySet(interiorId,'h4_island_padlock_props')	
			PinInteriorInMemory(interiorId)
			RefreshInterior(interiorId)
		end
	end
end

function nearIsland()
	local nearIsland = false
	local distanceTo = vector3(4840.571, -5174.425, 2.0)
	local Player = GetEntityCoords(PlayerPedId())
		if #(Player - distanceTo) < 2000 then
		nearIsland = true
				SetScenarioGroupEnabled('Heist_Island_Peds', true)
					SetScenarioGroupEnabled('Heist_Island_Peds', true)
					SetAmbientZoneListStatePersistent('AZL_DLC_Hei4_Island_Zones', true, true)
				SetAmbientZoneListStatePersistent('AZL_DLC_Hei4_Island_Disabled_Zones', false, true)
			SetAiGlobalPathNodesType(1)
		else
         nearIsland = false
			SetScenarioGroupEnabled('Heist_Island_Peds', false)
						SetAmbientZoneListStatePersistent('AZL_DLC_Hei4_Island_Zones', false, false)
					SetAmbientZoneListStatePersistent('AZL_DLC_Hei4_Island_Disabled_Zones', false, false)
				SetAiGlobalPathNodesType(0)
		end
			if nearIsland and Config.SetAudioFlag then
		SetAudioFlag('PlayerOnDLCHeist4Island', true)
	else
		ResetPedAudioFlags(GetPlayerPed())
		SetAudioFlag('PlayerOnDLCHeist4Island', false)
	end
		if nearIsland and Config.OceanScaler then
		SetDeepOceanScaler(0.1)
	else
		ResetDeepOceanScaler()
	end
end

function enableRadar()
		SetRadarAsExteriorThisFrame()
	SetRadarAsInteriorThisFrame('h4_fake_islandx', vec(4700.0, -5145.0), 0, 0)
end

function createBlip()
	if Config.CreateBlip then
		local blip = AddBlipForCoord(5943.5, -6272.1,2)
			SetBlipSprite(blip,Config.BlipSprite)
				SetBlipColour(Config.SetBlipColour)
				SetBlipAsShortRange(blip,false)
				SetBlipScale(blip,0)
			BeginTextCommandSetBlipName('STRING')
			AddTextComponentString(Config.BlipName)
		EndTextCommandSetBlipName(blip)
	else
		RemoveBlip(blip)
	end
end
