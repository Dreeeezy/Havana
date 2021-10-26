Config = {}
Translation = {}

Translation = {
    ['br'] = {
        ['DJ_interact'] = 'Aperte ~g~E~s~, para acessar a mesa do DJ',
        ['title_does_not_exist'] = '~r~Este título não existe!',
    }
}

Config.Locale = 'br'


Config.enableMarker = false -- Ative com true caso queria blipmarker

Config.DJPositions = {
    {
        name = 'bahamas',
        pos = vector3(-1378.68,-628.93,30.63),
        requiredJob = nil, 
        range = 25.0, 
        volume = 1.0  -- - [[não toque no volume! -]]
    },
    {
        name = 'vanilla',
        pos = vector3(120.7,-1281.11,29.49),
        requiredJob = nil, 
        range = 35.0, 
        volume = 1.0  -- - [[não toque no volume! -]]
    },
    {
        name = 'ballas',
        pos = vector3(110.09,-2004.06,18.31),
        requiredJob = nil, 
        range = 45.0, 
        volume = 1.0  -- - [[não toque no volume! -]]
    },
    {
        name = 'vagos',
        pos = vector3(-123.01,6377.46,32.38),
        requiredJob = nil, 
        range = 25.0, 
        volume = 1.0  -- - [[não toque no volume! -]]
    }
}