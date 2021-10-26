local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
local Tools = module("vrp","lib/Tools")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")

isRoll = false
amount = 1

RegisterServerEvent('casino_luckywheel:getLucky')
AddEventHandler('casino_luckywheel:getLucky', function()
    local source = source
    local user_id = vRP.getUserId(source)
	local player = vRP.getUserSource(user_id)
	local ticket = vRP.getInventoryItemAmount(user_id,"casino_ticket")
	TriggerClientEvent("invarte", player)
    if not isRoll then
        if user_id ~= nil then
            if ticket >= amount then
                vRP.tryGetInventoryItem(user_id,"casino_ticket",amount)
				-- spin the wheel
                isRoll = true
                local _randomPrice = math.random(1,100)
				
				if _randomPrice == 1 then
				local _subRan = math.random(1,2)
                    if _subRan == 1 then
                        _priceIndex = 1 -- win car
                    else
                        _priceIndex = 11 -- loose
                end
				
				elseif _randomPrice > 1 and _randomPrice <= 6 then
				local _subRan = math.random(1,2)
                    if _subRan == 1 then
                        _priceIndex = 2 -- win
                    else
                        _priceIndex = 11 -- loose
                end
				
				elseif _randomPrice > 6 and _randomPrice <= 15 then
				local _subRan = math.random(1,3)
                    if _subRan == 1 then
                        _priceIndex = 3 -- win
                    else
                        _priceIndex = 11 -- loose
                end
                
				elseif _randomPrice > 15 and _randomPrice <= 25 then
				local _subRan = math.random(1,3)
                    if _subRan == 1 then
                        _priceIndex = 4 -- win
                    else
                        _priceIndex = 11 -- loose
                end
                
				elseif _randomPrice > 25 and _randomPrice <= 40 then
				local _subRan = math.random(1,3)
                    if _subRan == 1 then
                        _priceIndex = 5 -- win
                    else
                        _priceIndex = 11 -- loose
                end
                
				elseif _randomPrice > 40 and _randomPrice <= 60 then
				local _subRan = math.random(1,3)
                    if _subRan == 1 then
                        _priceIndex = 6 -- win
                    else
                        _priceIndex = 11 -- loose
                end
                
				elseif _randomPrice > 60 and _randomPrice <= 100 then
				local _subRan = math.random(1,3)
                    if _subRan == 1 then
                        _priceIndex = 7 -- win
                    else
                        _priceIndex = 11 -- loose
                end
				
				elseif _randomPrice > 60 and _randomPrice <= 100 then
				local _subRan = math.random(1,3)
                    if _subRan == 1 then
                        _priceIndex = 8 -- win
                    else
                        _priceIndex = 11 -- loose
                end
				
				elseif _randomPrice > 60 and _randomPrice <= 100 then
				local _subRan = math.random(1,3)
                    if _subRan == 1 then
                        _priceIndex = 9 -- win
                    else
                        _priceIndex = 11 -- loose
                end
				
				elseif _randomPrice > 60 and _randomPrice <= 100 then
				local _subRan = math.random(1,3)
                    if _subRan == 1 then
                        _priceIndex = 10 -- win
                    else
                        _priceIndex = 11 -- loose
                end
				end
                
				-- prize index
                SetTimeout(2000, function()
                    isRoll = false
                    if _priceIndex == 1 then
                    local source = source
	                local user_id = vRP.getUserId(source)
					local vehicle = "adder"
					local sql = [[INSERT IGNORE INTO vrp_user_vehicles(user_id,vehicle,ipva) VALUES(@user_id,@vehicle,@ipva)]]
                    MySQL.Sync.execute(sql, {['@user_id'] = user_id, ['vehicle'] = vehicle, ['ipva'] = parseInt(os.time())});
					TriggerClientEvent('t-notify:client:Custom', source, {
						style = 'success',
						message = 'Você ganhou: Parabéns você ganhou um CARRO!',
						duration = 5500,
						sound  =  false
					})
					TriggerClientEvent('InteractSound_CL:PlayOnOne', source, 'LUCKY_WHEEL_WIN_WIN_CAR', 0.1)
                    elseif _priceIndex == 2 then
					vRP.giveInventoryItem(user_id,"fichas",100)
					TriggerClientEvent('t-notify:client:Custom', source, {
						style = 'success',
						message = 'Você ganhou: Parabéns você ganhou 100 fichas!',
						duration = 5500,
						sound  =  false
					})
                    TriggerClientEvent('InteractSound_CL:PlayOnOne', source, 'LUCKY_WHEEL_WIN_WIN_CHIPS', 0.1)					
					elseif _priceIndex == 3 then
					vRP.giveInventoryItem(user_id,"fichas",200)
					TriggerClientEvent('t-notify:client:Custom', source, {
						style = 'success',
						message = 'Você ganhou: Parabéns você ganhou 200 fichas!',
						duration = 5500,
						sound  =  false
					})
                    TriggerClientEvent('InteractSound_CL:PlayOnOne', source, 'LUCKY_WHEEL_WIN_WIN_CHIPS', 0.1)					
					elseif _priceIndex == 4 then
					vRP.giveInventoryItem(user_id,"fichas",500)
					TriggerClientEvent('t-notify:client:Custom', source, {
						style = 'success',
						message = 'Você ganhou: Parabéns você ganhou 500 fichas!',
						duration = 5500,
						sound  =  false
					})				
					TriggerClientEvent('InteractSound_CL:PlayOnOne', source, 'LUCKY_WHEEL_WIN_WIN_CHIPS', 0.1)
					elseif _priceIndex == 5 then
					vRP.giveInventoryItem(user_id,"fichas",1000)
					TriggerClientEvent('t-notify:client:Custom', source, {
						style = 'success',
						message = 'Você ganhou: Parabéns você ganhou 1,000 fichas!',
						duration = 5500,
						sound  =  false
					})					
					TriggerClientEvent('InteractSound_CL:PlayOnOne', source, 'LUCKY_WHEEL_WIN_WIN_CHIPS', 0.1)
					elseif _priceIndex == 6 then
					vRP.giveInventoryItem(user_id,"fichas",2000)
					TriggerClientEvent('t-notify:client:Custom', source, {
						style = 'success',
						message = 'Você ganhou: Parabéns você ganhou 2,000 fichas!',
						duration = 5500,
						sound  =  false
					})				
					TriggerClientEvent('InteractSound_CL:PlayOnOne', source, 'LUCKY_WHEEL_WIN_WIN_CHIPS', 0.1)
					elseif _priceIndex == 7 then
					vRP.giveInventoryItem(user_id,"fichas",500)
					TriggerClientEvent('t-notify:client:Custom', source, {
						style = 'success',
						message = 'Você ganhou: Parabéns você ganhou 500 fichas!',
						duration = 5500,
						sound  =  false
					})					
					TriggerClientEvent('InteractSound_CL:PlayOnOne', source, 'LUCKY_WHEEL_WIN_WIN_CASH', 0.1)
					elseif _priceIndex == 8 then
					vRP.giveInventoryItem(user_id,"fichas",2500)
					TriggerClientEvent('t-notify:client:Custom', source, {
						style = 'success',
						message = 'Você ganhou: Parabéns você ganhou 2,500 fichas!',
						duration = 5500,
						sound  =  false
					})					
					TriggerClientEvent('InteractSound_CL:PlayOnOne', source, 'LUCKY_WHEEL_WIN_WIN_CASH', 0.1)
					elseif _priceIndex == 9 then
					vRP.giveInventoryItem(user_id,"fichas",3000)
					TriggerClientEvent('t-notify:client:Custom', source, {
						style = 'success',
						message = 'Você ganhou: Parabéns você ganhou 3,000 fichas!',
						duration = 5500,
						sound  =  false
					})					
					TriggerClientEvent('InteractSound_CL:PlayOnOne', source, 'LUCKY_WHEEL_WIN_WIN_CASH', 0.1)
					elseif _priceIndex == 10 then
					vRP.giveInventoryItem(user_id,"casino_ticket",3)
					TriggerClientEvent('t-notify:client:Custom', source, {
						style = 'success',
						message = 'Você ganhou: Parabéns você ganhou 3 Tickets!',
						duration = 5500,
						sound  =  false
					})
					TriggerClientEvent('InteractSound_CL:PlayOnOne', source, 'LUCKY_WHEEL_WIN_STEREO_WIN_STINGER_GENERAL', 0.1)
					elseif _priceIndex == 11 then
					TriggerClientEvent('t-notify:client:Custom', source, {
						style = 'error',
						message = 'Você perdeu: Por favor, tente novamente!',
						duration = 5500,
						sound  =  false
					})				
					TriggerClientEvent('InteractSound_CL:PlayOnOne', source, 'TD_NO_WIN_03', 0.1)
                    end
                    TriggerClientEvent("casino_luckywheel:rollFinished", -1)
                end)
                TriggerClientEvent("casino_luckywheel:doRoll", -1, _priceIndex)
            else
                TriggerClientEvent("casino_luckywheel:rollFinished", -1)
				TriggerClientEvent('t-notify:client:Custom', source, {
					style = 'error',
					message = 'Infelizmente você não tem mais Ticket!',
					duration = 5500,
					sound  =  true
				})
            end
        end
    end
end)