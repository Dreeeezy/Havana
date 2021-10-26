Utils = {
    Scaleform = -1,
    ChooseHorseVisible = false,
    BetVisible = false,
    PlayerBalance = 500,
    CurrentHorse = -1,
    CurrentBet = 100,
    CurrentGain = 200,
    HorsesPositions = {},
    CurrentWiner = -1,
    EnableBigScreen = true, -- Set it to false if you don't need the big screen,
    CurrentSoundId = -1,
    InsideTrackActive = false
}

local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")

src = Tunnel.getInterface("insidetrack")

Citizen.CreateThread(function()
  while true do
    local sleep = 1000
        Utils.PlayerBalance = src.getPlayerChips()
		Citizen.Wait(sleep)
	end
end)

function Utils:GetMouseClickedButton()
    local returnValue = -1

    CallScaleformMovieMethodWithNumber(self.Scaleform, 'SET_INPUT_EVENT', 237.0, -1082130432, -1082130432, -1082130432, -1082130432)
    BeginScaleformMovieMethod(self.Scaleform, 'GET_CURRENT_SELECTION')

    returnValue = EndScaleformMovieMethodReturnValue()

    while not IsScaleformMovieMethodReturnValueReady(returnValue) do
        Wait(0)
    end

    return GetScaleformMovieMethodReturnValueInt(returnValue)
end

function Utils.GetRandomHorseName()
    local random = math.random(0, 99)
    local randomName = (random < 10) and ('ITH_NAME_00'..random) or ('ITH_NAME_0'..random)

    return randomName
end