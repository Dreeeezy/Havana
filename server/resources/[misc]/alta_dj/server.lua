local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
local Tools = module("vrp","lib/Tools")
vRP = Proxy.getInterface("vRP")
Check = {}
Tunnel.bindInterface("alta_dj",Check)
TriggerEvent('myDJ:requestPlaylistsAndSongs', function(source, cb)

    local playlists = {}
    local songs = {}

    MySQL.Async.fetchAll('SELECT * from playlists', {},
    function(result)
        playlists = result

        MySQL.Async.fetchAll('SELECT * from playlist_songs', {},
        function(result)
            songs = result
            cb(playlists, songs)
        end
        )
    end
    )
end)

TriggerEvent('myDJ:requestPlaylistById', function(source, cb, playlistId)

	MySQL.Async.fetchAll('SELECT * from playlist_songs WHERE playlist = @playlistId', {
		['@playlistId'] = playlistId,
	},
	function(result)
		cb(result)
	end
	)
end)

TriggerEvent('myDJ:requestPlaylists', function(source, cb)
    MySQL.Async.fetchAll('SELECT id, label from playlists', {},
    function(result)
        cb(result)
    end
    )
end)

TriggerEvent('myDJ:requestPlaylistSongs', function(source, cb, playlistId)
    MySQL.Async.fetchAll('SELECT * from playlist_songs WHERE playlist = @playlist', {
        ['@playlistId'] = playlistId,
    },
    function(result)
        cb(result)
    end
    )
end)

TriggerEvent('myDJ:receiveRunningSongs', function(source, cb)
    cb(Config.DJPositions)
end)

RegisterServerEvent('myDJ:addPlaylist')
AddEventHandler('myDJ:addPlaylist', function(label)
    MySQL.Async.execute(
    'INSERT INTO playlists (label) VALUES (@label)', {
        ['@label'] = label,
    })
end)

RegisterServerEvent('myDJ:addSongToPlaylist')
AddEventHandler('myDJ:addSongToPlaylist', function(playlistId, videoLink)
    --print(tostring(playlistId) .. ' link ' .. tostring(videoLink))
    MySQL.Async.execute(
    'INSERT INTO playlist_songs (playlist, link) VALUES (@playlist, @link)', {
        ['@playlist'] = playlistId,
        --['@label'] = label,
        ['@link'] = videoLink,
    })
end)

RegisterServerEvent('myDJ:removeSongFromPlaylist')
AddEventHandler('myDJ:removeSongFromPlaylist', function(songId, link)
    MySQL.Async.execute(
    'DELETE FROM playlist_songs WHERE id = @id', {
        ['@id'] = songId,
    })
end)


RegisterServerEvent('myDJ:removePlaylist')
AddEventHandler('myDJ:removePlaylist', function(playlistId)
    MySQL.Async.execute(
    'DELETE FROM playlists WHERE id = @id', {
        ['@id'] = playlistId,
    })
end)

-- SYNC

RegisterServerEvent('myDj:syncPlaySong')
AddEventHandler('myDj:syncPlaySong', function(currentDJ, DJPos, DJRange, link)
    --print('got event trigger: ' .. currentDJ .. ' . ' .. tostring(DJPos) .. ' and play ' .. link)
    TriggerClientEvent('myDj:clientPlaySong', -1, currentDJ, DJPos, DJRange, link)

    for k, v in pairs(Config.DJPositions) do
        if v.name == currentDJ then
            Config.DJPositions[k].currentData = {
                titleFromPlaylist = false,
                currentlyPlaying = true,
                currentLink = link,
                currentTime = 0,
            }

            break
        end
    end
    --print('trigger event for client')
end)

RegisterServerEvent('myDj:syncPlaySongFromPlaylist')
AddEventHandler('myDj:syncPlaySongFromPlaylist', function(currentDJ, DJPos, DJRange, link, playlistId)
    TriggerClientEvent('myDj:clientPlaySongFromPlaylist', -1, currentDJ, DJPos, DJRange, link, playlistId)
    for k, v in pairs(Config.DJPositions) do
        if v.name == currentDJ then
            Config.DJPositions[k].currentData = {
                titleFromPlaylist = true,
                currentPlaylist = playlistId,
                currentlyPlaying = true,
                currentLink = link,
                currentTime = 0,
            }

            break
        end
    end
end)

-- Sync TimeStamps
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1000)
        for k, v in pairs(Config.DJPositions) do
            if v.currentData ~= nil and v.currentData.currentlyPlaying then
                v.currentData.currentTime = v.currentData.currentTime + 1
            end
        end
    end
end)

RegisterServerEvent('myDj:syncStartStop')
AddEventHandler('myDj:syncStartStop', function(currentDJ)
    --print('sync start stop: ' .. currentDJ)
    TriggerClientEvent('myDj:clientStartStop', -1, currentDJ)

    for k, v in pairs(Config.DJPositions) do
        if v.name == currentDJ then
            if v.currentData ~= nil and v.currentData.currentlyPlaying then
                Config.DJPositions[k].currentData.currentlyPlaying = false
            elseif v.currentData ~= nil and not v.currentData.currentlyPlaying then
                Config.DJPositions[k].currentData.currentlyPlaying = true
            end 
            break
        end
    end
end)

RegisterServerEvent('myDj:syncForward')
AddEventHandler('myDj:syncForward', function(currentDJ)
    TriggerClientEvent('myDj:clientForward', -1, currentDJ)
end)

RegisterServerEvent('myDj:syncRewind')
AddEventHandler('myDj:syncRewind', function(currentDJ)
    TriggerClientEvent('myDj:clientRewind', -1, currentDJ)
end)

RegisterServerEvent('myDj:syncVolumeUp')
AddEventHandler('myDj:syncVolumeUp', function(currentDJ)
    TriggerClientEvent('myDj:clientVolumeUp', -1, currentDJ)
end)

RegisterServerEvent('myDj:syncVolumeDown')
AddEventHandler('myDj:syncVolumeDown', function(currentDJ)
    TriggerClientEvent('myDj:clientVolumeDown', -1, currentDJ)
end)

function Check.checkPermissao()
    local source = source
    local user_id = vRP.getUserId(source)
    if vRP.hasPermission(user_id,"Bahamas") or vRP.hasPermission(user_id,"Vanilla") or vRP.hasPermission(user_id,"Ballas") or vRP.hasPermission(user_id,"Vagos")  then -- PERMISSÃO
        return true
    end
end