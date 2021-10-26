local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")

--[ CONEXÃO ]----------------------------------------------------------------------------------------------------------------------------

config = {}
Proxy.addInterface("config:combo_rotas",config)

-----------------------------------------------------------------------------------------------------------------------------------------
--[ PERSONALIZAÇÃO DAS ROTAS ]
-----------------------------------------------------------------------------------------------------------------------------------------

config.segundos = 5    -- SEGUNDOS QUE A PESSOA FICARÁ COLETANDO

config.blipCoords = { -- PODE MUDAR O NOME DA FAC, PERMISSÃO, COORDS DO BLIP DE INICIAR ROTA
    ['Yakuza'] = { ['perm'] = "Yakuza", ['coords'] = vector3(-93.56,821.26,227.89) }, 
    ['Bratva'] = { ['perm'] = "Bratva", ['coords'] = vector3(-482.72,12.46,34.62) },
	['Triade'] = { ['perm'] = "Triade", ['coords'] = vector3(-1529.15,117.53,50.06) },
	['Paramedico'] = { ['perm'] = "Paramedico", ['coords'] = vector3(305.56,-597.12,43.29) }
}

config.blipItem = { -- PODE MUDAR OS ITENS / QUANTIDADE QUE SERÁ ENTREGUE QUANDO COLETAR (obs: item deve existir na base, e o nome da fac deve ser igual ao nome da fac indicado no config.blipCoords)
	['Yakuza'] = { -- SE COLOCAR 2 NÚMEROS NA QUANTIDADE, ELE FARÁ UM CALCULO RANDOMICO CADA VEZ QUE ENTREGAR OS ITENS, ENTRE O PRIMEIRO E SEGUNDO NÚMERO, SE COLOCAR 1 NÚMERO SÓ, ELE FICARA FIXO NA ENTREGA.
		['corpo-ak47'] = {0,1},
		['corpo-five'] = {0,1},
		['corpo-tec'] = {0,1},
		['corpo-miniak'] = {0,1},
		['corpo-mtar'] = {0,1},
		['corpo-g36'] = {0,1},
		['corpo-desert'] = {0,1},
		['corpo-uzi'] = {0,1},
		['corpo-sig'] = {0,1},
		['corpo-skorpion'] = {0,1},
		['molas'] = {8,14},
		['gatilho'] = {8,14}	
	},
	['Bratva'] = {
		['corpo-ak47'] = {0,1},
		['corpo-five'] = {0,1},
		['corpo-tec'] = {0,1},
		['corpo-miniak'] = {0,1},
		['corpo-mtar'] = {0,1},
		['corpo-g36'] = {0,1},
		['corpo-desert'] = {0,1},
		['corpo-uzi'] = {0,1},
		['corpo-sig'] = {0,1},
		['corpo-skorpion'] = {0,1},
		['molas'] = {8,14},
		['gatilho'] = {8,14}
	},
	['Triade'] = {
		['corpo-ak47'] = {0,1},
		['corpo-five'] = {0,1},
		['corpo-tec'] = {0,1},
		['corpo-miniak'] = {0,1},
		['corpo-mtar'] = {0,1},
		['corpo-g36'] = {0,1},
		['corpo-desert'] = {0,1},
		['corpo-uzi'] = {0,1},
		['corpo-sig'] = {0,1},
		['corpo-skorpion'] = {0,1},
		['molas'] = {8,14},
		['gatilho'] = {8,14}
	},
	['Paramedico'] = {
		['paracetamol'] = {3,6},
		['benzoato'] = {3,6},
		['dioxido'] = {3,6}
	}
}

config.entregaCoords = { -- PODE MUDAR OS BLIPS DE COLETA
	vector3(22.22,-1103.51,38.16),
	vector3(809.31,-2222.57,29.65), 
	vector3(857.46,-1038.54,33.14), 
	vector3(-216.53,-1674.28,34.47), 
	vector3(-1314.93,-406.88,36.43), 
	vector3(245.8,-16.81,73.78), 
	vector3(-679.97,-924.24,23.08), 
	vector3(-3179.21,1093.41,20.85), 
	vector3(-342.36,6097.81,31.32),
	vector3(1687.68,3755.8,34.58),
	vector3(2591.68,4669.26,34.08),
	vector3(2531.08,4114.24,38.75),
	vector3(1194.26,2721.53,38.82),
	vector3(569.18,2796.6,42.02),
	vector3(201.57,2462.43,55.9),
	vector3(1243.17,1869.42,78.97),
	vector3(252.41,374.66,105.62),
	vector3(-613.11,323.8,82.27), 
	vector3(-1585.1,-838.48,9.96), 
	vector3(313.41,-174.47,58.12),
	vector3(-13.56,-83.86,56.9),
	vector3(-348.88,-47.22,54.43),
	vector3(-591.43,342.84,85.45),
	vector3(-622.6,304.43,82.25),
	vector3(-809.56,355.49,88.34),
	vector3(-1344.83,-211.84,43.69),
	vector3(-1245.12,-680.52,26.0),
	vector3(-1115.26,-967.16,2.16),
	vector3(-1178.32,-1403.16,4.65),
	vector3(-635.03,-1226.39,11.98),
	vector3(-332.98,98.8,71.22), 
	vector3(-705.81,-1036.31,16.41), 
	vector3(-601.91,-1030.65,22.55), 
	vector3(-1218.87,-1051.64,8.42), 
	vector3(-850.71,-252.02,39.66), 
	vector3(-1613.12,-1028.17,13.16),
	vector3(-1327.1,-189.47,47.89), 
	vector3(-1816.63,-1193.6,14.31), 
	vector3(442.56,-1969.44,24.41), 
	vector3(-1565.66,-231.46,49.47), 
	vector3(-1472.95,-193.1,48.85), 
	vector3(-1546.9,-561.12,33.73), 
	vector3(-1142.7,-1993.51,13.17), 
	vector3(-1361.25,-758.26,22.49)
}