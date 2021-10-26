-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONNECTION
-----------------------------------------------------------------------------------------------------------------------------------------
cRP = {}
Tunnel.bindInterface("doors",cRP)
-----------------------------------------------------------------------------------------------------------------------------------------
-- DOORS
-----------------------------------------------------------------------------------------------------------------------------------------
local doors = {
	---- GUETO POLICIA
	[1] = { ["x"] = 447.14, ["y"] = -979.91, ["z"] = 30.69, ["hash"] = -1320876379, ["lock"] = true, ["text"] = true, ["distance"] = 5, ["press"] = 1.5, ["perm"] = "Policia", ["sound"] = true},
	[2] = { ["x"] = 450.33, ["y"] = -986.34, ["z"] = 30.69, ["hash"] = 1557126584, ["lock"] = true, ["text"] = true, ["distance"] = 5, ["press"] = 1.5, ["perm"] = "Policia", ["sound"] = true},
	[3] = { ["x"] = 452.7, ["y"] = -982.37, ["z"] = 29.69, ["hash"] = 749848321, ["lock"] = true, ["text"] = true, ["distance"] = 5, ["press"] = 1.5, ["perm"] = "Policia", ["sound"] = true},
	[4] = { ["x"] = 445.12, ["y"] = -989.42, ["z"] = 30.69, ["hash"] = 185711165, ["lock"] = true, ["text"] = true, ["distance"] = 5, ["press"] = 1.5, ["perm"] = "Policia", ["other"] = 5, ["sound"] = true },
	[5] = { ["x"] = 444.49, ["y"] = -989.58, ["z"] = 30.69, ["hash"] = 185711165, ["lock"] = true, ["text"] = true, ["distance"] = 5, ["press"] = 1.5, ["perm"] = "Policia", ["other"] = 4, ["sound"] = true },
	[6] = { ["x"] = 463.94, ["y"] = -992.74, ["z"] = 24.92, ["hash"] = 631614199, ["lock"] = true, ["text"] = true, ["distance"] = 5, ["press"] = 1.5, ["perm"] = "Policia", ["sound"] = true },
	[7] = { ["x"] = 461.76, ["y"] = -993.85, ["z"] = 24.92, ["hash"] = 631614199, ["lock"] = true, ["text"] = true, ["distance"] = 5, ["press"] = 1.5, ["perm"] = "Policia", ["sound"] = true },
	[8] = { ["x"] = 461.73, ["y"] = -998.47, ["z"] = 24.92, ["hash"] = 631614199, ["lock"] = true, ["text"] = true, ["distance"] = 5, ["press"] = 1.5, ["perm"] = "Policia", ["sound"] = true },
	[9] = { ["x"] = 461.71, ["y"] = -1002.24, ["z"] = 24.92, ["hash"] = 631614199, ["lock"] = true, ["text"] = true, ["distance"] = 5, ["press"] = 1.5, ["perm"] = "Policia", ["sound"] = true },
	[10] = { ["x"] = 464.45, ["y"] = -1003.52, ["z"] = 24.92, ["hash"] = -1033001619, ["lock"] = true, ["text"] = true, ["distance"] = 6, ["press"] = 1.5, ["perm"] = "Policia", ["sound"] = true },
	[11] = { ["x"] = 469.33, ["y"] = -1014.61, ["z"] = 26.39, ["hash"] = -2023754432, ["lock"] = true, ["text"] = true, ["distance"] = 6, ["press"] = 1.5, ["perm"] = "Policia", ["sound"] = true },
	[12] = { ["x"] = 468.24, ["y"] = -1014.46, ["z"] = 26.39, ["hash"] = -2023754432, ["lock"] = true, ["text"] = true, ["distance"] = 6, ["press"] = 1.5, ["perm"] = "Policia", ["sound"] = true },
	
	--- Vanilla
	[13] = { ["x"] = 95.57, ["y"] = -1285.2, ["z"] = 29.28, ["hash"] = 668467214, ["lock"] = true, ["text"] = true, ["distance"] = 8, ["press"] = 1.5, ["perm"] = "Vanilla", ["sound"] = true},
	[14] = { ["x"] = 113.71, ["y"] = -1296.69, ["z"] = 29.27, ["hash"] = -495720969, ["lock"] = true, ["text"] = true, ["distance"] = 8, ["press"] = 1.5, ["perm"] = "Vanilla", ["sound"] = true},
	
	--- MAFIA ELCAPONE
	[15] = { ["x"] = 585.52, ["y"] = -3118.29, ["z"] = 18.77, ["hash"] = 1388116908, ["lock"] = true, ["text"] = true, ["distance"] = 8, ["press"] = 1.5, ["perm"] = "Elcapone", ["sound"] = true},
	[16] = { ["x"] = 552.22, ["y"] = -3118.29, ["z"] = 18.77, ["hash"] = 1388116908, ["lock"] = true, ["text"] = true, ["distance"] = 8, ["press"] = 1.5, ["perm"] = "Elcapone", ["sound"] = true},
	
	-- TheLost 
	[17] = { ["x"] = 982.43, ["y"] = -125.36, ["z"] = 74.06, ["hash"] = -197537718, ["lock"] = true, ["text"] = true, ["distance"] = 10, ["press"] = 10.0, ["perm"] = "TheLost", ["sound"] = true},
	[18] = { ["x"] = 981.44, ["y"] = -102.69, ["z"] = 74.85, ["hash"] = 190770132, ["lock"] = true, ["text"] = true, ["distance"] = 5, ["press"] = 1.5, ["perm"] = "TheLost", ["sound"] = true},
	[19] = { ["x"] = 957.75, ["y"] = -138.64, ["z"] = 74.49, ["hash"] = -930593859, ["lock"] = true, ["text"] = true, ["distance"] = 10, ["press"] = 10, ["perm"] = "TheLost", ["sound"] = true},
	
	----- TRIADE
	[20] = { ["x"] = -1465.69, ["y"] = -34.55, ["z"] = 55.07, ["hash"] = -1017013428, ["lock"] = true, ["text"] = true, ["distance"] = 8, ["press"] = 1.5, ["perm"] = "Triade", ["sound"] = true},
	[21] = { ["x"] = -1486.36, ["y"] = -22.59, ["z"] = 54.66, ["hash"] = -1017013428, ["lock"] = true, ["text"] = true, ["distance"] = 8, ["press"] = 1.5, ["perm"] = "Triade", ["sound"] = true},
	[22] = { ["x"] = -1480.36, ["y"] = -41.19, ["z"] = 56.85, ["hash"] = -1017013428, ["lock"] = true, ["text"] = true, ["distance"] = 8, ["press"] = 1.5, ["perm"] = "Triade", ["sound"] = true},
	[23] = { ["x"] = -1482.46, ["y"] = -49.21, ["z"] = 54.65, ["hash"] = -1017013428, ["lock"] = true, ["text"] = true, ["distance"] = 8, ["press"] = 1.5, ["perm"] = "Triade", ["sound"] = true},
	[24] = { ["x"] = -1472.03, ["y"] = -49.32, ["z"] = 54.64, ["hash"] = -1017013428, ["lock"] = true, ["text"] = true, ["distance"] = 8, ["press"] = 1.5, ["perm"] = "Triade", ["sound"] = true},
	[25] = { ["x"] = -1472.9, ["y"] = -58.14, ["z"] = 54.64, ["hash"] = -1017013428, ["lock"] = true, ["text"] = true, ["distance"] = 8, ["press"] = 1.5, ["perm"] = "Triade", ["sound"] = true},
	[26] = { ["x"] = -1468.94, ["y"] = -59.16, ["z"] = 54.64, ["hash"] = -1017013428, ["lock"] = true, ["text"] = true, ["distance"] = 8, ["press"] = 1.5, ["perm"] = "Triade", ["sound"] = true},
	[27] = { ["x"] = -1465.39, ["y"] = -47.29, ["z"] = 54.65, ["hash"] = -1017013428, ["lock"] = true, ["text"] = true, ["distance"] = 8, ["press"] = 1.5, ["perm"] = "Triade", ["sound"] = true},
	
	--- Vinhedo 
	[28] = { ["x"] = -1864.25, ["y"] = 2060.31, ["z"] = 141.14, ["hash"] = -1141522158, ["lock"] = true, ["text"] = true, ["distance"] = 5, ["press"] = 1.5, ["perm"] = "Yakuza", ["sound"] = true},
	[29] = { ["x"] = -1864.08, ["y"] = 2060.92, ["z"] = 141.14, ["hash"] = 988364535, ["lock"] = true, ["text"] = true, ["distance"] = 5, ["press"] = 1.5, ["perm"] = "Yakuza", ["sound"] = true},

	--- Paramedico
	[30] = { ["x"] = -442.99, ["y"] = -316.27, ["z"] = 34.92, ["hash"] = 493136920, ["lock"] = true, ["text"] = true, ["distance"] = 5, ["press"] = 1.5, ["perm"] = "Paramedico", ["sound"] = true},
	[31] = { ["x"] = -451.77, ["y"] = -308.07, ["z"] = 34.92, ["hash"] = 493136920, ["lock"] = true, ["text"] = true, ["distance"] = 5, ["press"] = 1.5, ["perm"] = "Paramedico", ["sound"] = true},
	[32] = { ["x"] = -449.56, ["y"] = -300.64, ["z"] = 34.92, ["hash"] = 493136920, ["lock"] = true, ["text"] = true, ["distance"] = 5, ["press"] = 1.5, ["perm"] = "Paramedico", ["sound"] = true},
	[33] = { ["x"] = -452.89, ["y"] = -292.45, ["z"] = 34.92, ["hash"] = 493136920, ["lock"] = true, ["text"] = true, ["distance"] = 5, ["press"] = 1.5, ["perm"] = "Paramedico", ["sound"] = true},
	
	-- BENNYS
	[34] = { ["x"] = -228.45, ["y"] = -1338.32, ["z"] = 30.89, ["hash"] = -300630877, ["lock"] = true, ["text"] = true, ["distance"] = 5, ["press"] = 1.5, ["perm"] = "Bennys", ["sound"] = true},
	[35] = { ["x"] = 4982.02, ["y"] = -5711.11, ["z"] = 19.89, ["hash"] = -1574151574, ["lock"] = true, ["text"] = true, ["distance"] = 8, ["press"] = 1.5, ["perm"] = "Bennys", ["sound"] = true},
	[36] = { ["x"] = 4982.62, ["y"] = -5710.49, ["z"] = 19.89, ["hash"] = 1215477734, ["lock"] = true, ["text"] = true, ["distance"] = 8, ["press"] = 1.5, ["perm"] = "Bennys", ["sound"] = true},

	-- MANSAO CASA DO LAGO
	[37] = { ["x"] = -51.39, ["y"] = 827.91, ["z"] = 231.34, ["hash"] = -1119680854, ["lock"] = true, ["text"] = true, ["distance"] = 5, ["press"] = 1.5, ["perm"] = "Casadolago", ["sound"] = true},
	[38] = { ["x"] = -70.23, ["y"] = 823.94, ["z"] = 231.34, ["hash"] = -1119680854, ["lock"] = true, ["text"] = true, ["distance"] = 5, ["press"] = 1.5, ["perm"] = "Casadolago", ["sound"] = true},
	[39] = { ["x"] = -90.96, ["y"] = 822.09, ["z"] = 240.21, ["hash"] = -1186396713, ["lock"] = true, ["text"] = true, ["distance"] = 5, ["press"] = 1.5, ["perm"] = "Casadolago", ["sound"] = true},
	[40] = { ["x"] = -78.14, ["y"] = 822.76, ["z"] = 227.76, ["hash"] = -1119680854, ["lock"] = true, ["text"] = true, ["distance"] = 5, ["press"] = 1.5, ["perm"] = "Casadolago", ["sound"] = true},
	[41] = { ["x"] = -90.02, ["y"] = 818.88, ["z"] = 227.6, ["hash"] = 631614199, ["lock"] = true, ["text"] = true, ["distance"] = 5, ["press"] = 1.5, ["perm"] = "Casadolago", ["sound"] = true},
	[42] = { ["x"] = -85.53, ["y"] = 835.16, ["z"] = 235.93, ["hash"] = 110411286, ["lock"] = true, ["text"] = true, ["distance"] = 5, ["press"] = 1.5, ["perm"] = "Casadolago", ["sound"] = true},
	[43] = { ["x"] = -68.88, ["y"] = 824.02, ["z"] = 235.74, ["hash"] = -1119680854, ["lock"] = true, ["text"] = true, ["distance"] = 5, ["press"] = 1.5, ["perm"] = "Casadolago", ["sound"] = true},
	[44] = { ["x"] = -49.25, ["y"] = 830.15, ["z"] = 235.73, ["hash"] = -1119680854, ["lock"] = true, ["text"] = true, ["distance"] = 5, ["press"] = 1.5, ["perm"] = "Casadolago", ["sound"] = true},
	[45] = { ["x"] = -97.21, ["y"] = 816.16, ["z"] = 235.76, ["hash"] = -1119680854, ["lock"] = true, ["text"] = true, ["distance"] = 5, ["press"] = 1.5, ["perm"] = "Casadolago", ["sound"] = true},

	-- MANSAO CASTELO 
	[46] = { ["x"] = -1793.21, ["y"] = 426.55, ["z"] = 125.22, ["hash"] = -610054759, ["lock"] = true, ["text"] = true, ["distance"] = 5, ["press"] = 1.5, ["perm"] = "Castelo", ["sound"] = true},
	[47] = { ["x"] = -1794.85, ["y"] = 424.4, ["z"] = 125.22, ["hash"] = -610054759, ["lock"] = true, ["text"] = true, ["distance"] = 5, ["press"] = 1.5, ["perm"] = "Castelo", ["sound"] = true},
	
	-- BENNYS
	[48] = { ["x"] = -229.73, ["y"] =  -1317.47, ["z"] = 30.89, ["hash"] = -560968100, ["lock"] = true, ["text"] = true, ["distance"] = 10, ["press"] = 1.5, ["perm"] = "Bennys", ["sound"] = true},
	[49] = { ["x"] = 971.69, ["y"] =  8.63, ["z"] = 81.05, ["hash"] = 117341179, ["lock"] = true, ["text"] = true, ["distance"] = 10, ["press"] = 1.5, ["perm"] = "Bennys", ["sound"] = true},
	
	---- CASSINO
	[50] = { ["x"] = 940.68, ["y"] =  5.24, ["z"] = 75.5, ["hash"] = -264728216, ["lock"] = true, ["text"] = true, ["distance"] = 10, ["press"] = 1.5, ["perm"] = "Cassino", ["sound"] = true},
	[51] = { ["x"] = 943.99, ["y"] =  5.06, ["z"] = 75.75, ["hash"] = 1901183774, ["lock"] = true, ["text"] = true, ["distance"] = 10, ["press"] = 1.5, ["perm"] = "Cassino", ["sound"] = true},
	[52] = { ["x"] = 955.53, ["y"] =  15.33, ["z"] = 75.75, ["hash"] = 1901183774, ["lock"] = true, ["text"] = true, ["distance"] = 10, ["press"] = 1.5, ["perm"] = "Cassino", ["sound"] = true},

	---- MECANICO
	[53] = { ["x"] = 550.37, ["y"] = -179.48, ["z"] = 54.5, ["hash"] = -733661186, ["lock"] = true, ["text"] = true, ["distance"] = 5, ["press"] = 1.5, ["perm"] = "Mecanico", ["sound"] = true},
	[54] = { ["x"] = 534.66, ["y"] = -167.33, ["z"] = 54.5, ["hash"] = 141631573, ["lock"] = true, ["text"] = true, ["distance"] = 5, ["press"] = 1.5, ["perm"] = "Mecanico", ["sound"] = true},
	[55] = { ["x"] = 544.46, ["y"] = -193.85, ["z"] = 54.5, ["hash"] = 1497823487, ["lock"] = true, ["text"] = true, ["distance"] = 10, ["press"] = 1.5, ["perm"] = "Mecanico", ["sound"] = true},
	[56] = { ["x"] = 541.11, ["y"] =  -197.05, ["z"] = 54.5, ["hash"] = -1309543596, ["lock"] = true, ["text"] = true, ["distance"] = 10, ["press"] = 1.5, ["perm"] = "Mecanico", ["sound"] = true},

	---- GUETO ROXOS
	[57] = { ["x"] = 109.54, ["y"] =  -2015.54, ["z"] = 18.5, ["hash"] = -2023754432, ["lock"] = true, ["text"] = true, ["distance"] = 10, ["press"] = 1.5, ["perm"] = "Ballas", ["sound"] = true},
	[58] = { ["x"] = 112.74, ["y"] =  -2001.28, ["z"] = 18.31, ["hash"] = -2023754432, ["lock"] = true, ["text"] = true, ["distance"] = 10, ["press"] = 1.5, ["perm"] = "Ballas", ["sound"] = true},

	---- GUETO VERDES
	[59] = { ["x"] = -140.75, ["y"] =  -1599.81, ["z"] = 35.04, ["hash"] = 852775515, ["lock"] = true, ["text"] = true, ["distance"] = 10, ["press"] = 1.5, ["perm"] = "Groove", ["sound"] = true},
	[60] = { ["x"] = -136.4, ["y"] =  -1603.45, ["z"] = 35.04, ["hash"] = 486670049, ["lock"] = true, ["text"] = true, ["distance"] = 10, ["press"] = 1.5, ["perm"] = "Groove", ["sound"] = true},
	[61] = { ["x"] = -148.23, ["y"] =  -1596.09, ["z"] = 35.04, ["hash"] = 852775515, ["lock"] = true, ["text"] = true, ["distance"] = 10, ["press"] = 1.5, ["perm"] = "Groove", ["sound"] = true},
	[62] = { ["x"] = -157.12, ["y"] =  -1596.02, ["z"] = 35.04, ["hash"] = 1150875108, ["lock"] = true, ["text"] = true, ["distance"] = 10, ["press"] = 1.5, ["perm"] = "Groove", ["sound"] = true},
	
	---- GUETO AMARELOS
	[63] = { ["x"] = 332.83, ["y"] =  -2018.11, ["z"] = 22.4, ["hash"] = 1349340477, ["lock"] = true, ["text"] = true, ["distance"] = 10, ["press"] = 1.5, ["perm"] = "Vagos", ["sound"] = true},
	[64] = { ["x"] = 336.21, ["y"] =  -2021.57, ["z"] = 22.36, ["hash"] = 1349340477, ["lock"] = true, ["text"] = true, ["distance"] = 10, ["press"] = 1.5, ["perm"] = "Vagos", ["sound"] = true},
	[65] = { ["x"] = 335.92, ["y"] =  -2011.12, ["z"] = 22.34, ["hash"] = 1349340477, ["lock"] = true, ["text"] = true, ["distance"] = 10, ["press"] = 1.5, ["perm"] = "Vagos", ["sound"] = true},
	[66] = { ["x"] = 343.4, ["y"] =  -2027.24, ["z"] = 22.4, ["hash"] = 1349340477, ["lock"] = true, ["text"] = true, ["distance"] = 10, ["press"] = 1.5, ["perm"] = "Vagos", ["sound"] = true},
	[67] = { ["x"] = 345.51, ["y"] =  -2028.35, ["z"] = 22.41, ["hash"] = 1349340477, ["lock"] = true, ["text"] = true, ["distance"] = 10, ["press"] = 1.5, ["perm"] = "Vagos", ["sound"] = true},
	[68] = { ["x"] = 352.18, ["y"] =  -2034.52, ["z"] = 22.4, ["hash"] = 1349340477, ["lock"] = true, ["text"] = true, ["distance"] = 10, ["press"] = 1.5, ["perm"] = "Vagos", ["sound"] = true},
	[69] = { ["x"] = 354.0, ["y"] =  -2035.91, ["z"] = 22.4, ["hash"] = 1349340477, ["lock"] = true, ["text"] = true, ["distance"] = 10, ["press"] = 1.5, ["perm"] = "Vagos", ["sound"] = true},
	[70] = { ["x"] = 361.13, ["y"] =  -2042.16, ["z"] = 22.4, ["hash"] = 1349340477, ["lock"] = true, ["text"] = true, ["distance"] = 10, ["press"] = 1.5, ["perm"] = "Vagos", ["sound"] = true},
	[71] = { ["x"] = 364.93, ["y"] =  -2044.87, ["z"] = 22.4, ["hash"] = 1349340477, ["lock"] = true, ["text"] = true, ["distance"] = 10, ["press"] = 1.5, ["perm"] = "Vagos", ["sound"] = true},
	[72] = { ["x"] = 371.08, ["y"] =  -2040.65, ["z"] = 22.39, ["hash"] = 1349340477, ["lock"] = true, ["text"] = true, ["distance"] = 10, ["press"] = 1.5, ["perm"] = "Vagos", ["sound"] = true},
	[73] = { ["x"] = 1483.92, ["y"] =  6392.34, ["z"] = 23.34, ["hash"] = -147325430, ["lock"] = true, ["text"] = true, ["distance"] = 10, ["press"] = 1.5, ["perm"] = "Vagos", ["sound"] = true},

	---- FIB
	[74] = { ["x"] = 106.23, ["y"] = -743.47, ["z"] = 45.76, ["hash"] = -1517873911, ["lock"] = true, ["text"] = true, ["distance"] = 8, ["press"] = 1.5, ["perm"] = "Fib", ["sound"] = true},
	[75] = { ["x"] = -34.11, ["y"] = -621.69, ["z"] = 35.04, ["hash"] = 1652829067, ["lock"] = true, ["text"] = true, ["distance"] = 8, ["press"] = 1.5, ["perm"] = "Fib", ["sound"] = true},

	---- BAHAMAS
	[76] = { ["x"] = 1122.48, ["y"] = 264.12, ["z"] = -51.04, ["hash"] = 680601509, ["lock"] = true, ["text"] = true, ["distance"] = 8, ["press"] = 1.5, ["perm"] = "Bahamas", ["sound"] = true},
	[77] = { ["x"] = 1122.13, ["y"] = 264.92, ["z"] = -51.04, ["hash"] = 680601509, ["lock"] = true, ["text"] = true, ["distance"] = 8, ["press"] = 1.5, ["perm"] = "Bahamas", ["sound"] = true},
	--[78] = { ["x"] = -1392.0, ["y"] = -639.76, ["z"] = 28.7, ["hash"] = -2003105485, ["lock"] = true, ["text"] = true, ["distance"] = 8, ["press"] = 1.5, ["perm"] = "Bahamas", ["sound"] = true},
	--[79] = { ["x"] = -1394.62, ["y"] = -635.96, ["z"] = 28.68, ["hash"] = -822900180, ["lock"] = true, ["text"] = true, ["distance"] = 8, ["press"] = 1.5, ["perm"] = "Bahamas", ["sound"] = true},
	--[80] = { ["x"] = -1387.54, ["y"] = -586.73, ["z"] = 30.32, ["hash"] = -1119680854, ["lock"] = true, ["text"] = true, ["distance"] = 8, ["press"] = 1.5, ["perm"] = "Bahamas", ["sound"] = true},
	--[81] = { ["x"] = -1388.67, ["y"] = -587.9, ["z"] = 30.32, ["hash"] = -1119680854, ["lock"] = true, ["text"] = true, ["distance"] = 8, ["press"] = 1.5, ["perm"] = "Bahamas", ["sound"] = true},
	--[82] = { ["x"] = 1052.95, ["y"] = -1906.02, ["z"] = 31.41, ["hash"] = -147325430, ["lock"] = false, ["text"] = true, ["distance"] = 5, ["press"] = 1.5, ["perm"] = "Bahamas", ["sound"] = true},
	--[83] = { ["x"] = -1055.34, ["y"] =  -235.82, ["z"] = 44.03, ["hash"] = -495720969, ["lock"] = true, ["text"] = true, ["distance"] = 10, ["press"] = 1.5, ["perm"] = "Bahamas", ["sound"] = true},

	---- FARM MACONHA
	[84] = { ["x"] = 97.81, ["y"] = 6328.09, ["z"] = 31.38, ["hash"] = -147325430, ["lock"] = true, ["text"] = true, ["distance"] = 8, ["press"] = 1.5, ["perm"] = "Groove", ["sound"] = true},

	--- MAFIA COSANOSTRA
	[85] = { ["x"] = 1406.91, ["y"] = 1128.31, ["z"] = 114.34, ["hash"] = 262671971, ["lock"] = true, ["text"] = true, ["distance"] = 8, ["press"] = 1.5, ["perm"] = "Cosanostra", ["sound"] = true},
		
	-- FIB
	[86] = { ["x"] = 105.87, ["y"] = -745.54, ["z"] = 45.76, ["hash"] = -90456267, ["lock"] = true, ["text"] = true, ["distance"] = 8, ["press"] = 1.5, ["perm"] = "Fib", ["sound"] = true},
	
	--- Porta Marabunta (norte)
	[87] = { ["x"] = 1387.53, ["y"] = 3614.54, ["z"] = 38.95, ["hash"] = 1804626822, ["lock"] = true, ["text"] = true, ["distance"] = 8, ["press"] = 1.5, ["perm"] = "Marabunta", ["sound"] = true},
	[88] = { ["x"] = 1399.47, ["y"] = 3608.67, ["z"] = 39.01, ["hash"] = 1804626822, ["lock"] = true, ["text"] = true, ["distance"] = 8, ["press"] = 1.5, ["perm"] = "Marabunta", ["sound"] = true},
	[89] = { ["x"] = 1395.21, ["y"] = 3610.3, ["z"] = 34.99, ["hash"] = 1173348778, ["lock"] = true, ["text"] = true, ["distance"] = 8, ["press"] = 1.5, ["perm"] = "Marabunta", ["sound"] = true},

	[90] = { ["x"] = -446.13, ["y"] = -26.37, ["z"] = 44.53, ["hash"] = 1221385821, ["lock"] = true, ["text"] = true, ["distance"] = 8, ["press"] = 1.5, ["perm"] = "Bratva", ["sound"] = true},
	
	--- Castelo 
	[91] = { ["x"] = -1805.07, ["y"] = 429.08, ["z"] = 128.73, ["hash"] = -1527723153, ["lock"] = true, ["text"] = true, ["distance"] = 8, ["press"] = 1.5, ["perm"] = "Castelo", ["sound"] = true},
	[92] = { ["x"] = -1804.6, ["y"] = 436.22, ["z"] = 128.84, ["hash"] = -1527723153, ["lock"] = true, ["text"] = true, ["distance"] = 8, ["press"] = 1.5, ["perm"] = "Castelo", ["sound"] = true},
	
	----Ballas
	[93] = { ["x"] = -76.14, ["y"] = -1817.41, ["z"] = 26.83, ["hash"] = 270330101, ["lock"] = true, ["text"] = true, ["distance"] = 8, ["press"] = 1.5, ["perm"] = "Ballas", ["sound"] = true},
	[94] = { ["x"] = -115.62, ["y"] = -1773.09, ["z"] = 29.84, ["hash"] = 245182344, ["lock"] = true, ["text"] = true, ["distance"] = 8, ["press"] = 1.5, ["perm"] = "Ballas", ["sound"] = true},
	[95] = { ["x"] = -103.24, ["y"] = -1791.73, ["z"] = 32.2, ["hash"] = 736699661, ["lock"] = true, ["text"] = true, ["distance"] = 8, ["press"] = 1.5, ["perm"] = "Ballas", ["sound"] = true},
	[96] = { ["x"] =  -90.59, ["y"] = -1792.68, ["z"] = 32.2, ["hash"] = 551491569, ["lock"] = true, ["text"] = true, ["distance"] = 8, ["press"] = 1.5, ["perm"] = "Ballas", ["sound"] = true},

	---Hospital
	[97] = { ["x"] = 307.9, ["y"] = -569.89, ["z"] = 43.29, ["hash"] = 854291622, ["lock"] = true, ["text"] = true, ["distance"] = 8, ["press"] = 1.5, ["perm"] = "Paramedico", ["sound"] = true},
	[98] = { ["x"] = 308.39, ["y"] = -597.47, ["z"] = 43.29, ["hash"] = 854291622, ["lock"] = true, ["text"] = true, ["distance"] = 8, ["press"] = 1.5, ["perm"] = "Paramedico", ["sound"] = true},
	
	---- MANSAO PLAYBOY
	[99] = { ["x"] = -1536.87, ["y"] = 131.37, ["z"] = 57.38, ["hash"] = 1033441082, ["lock"] = true, ["text"] = true, ["distance"] = 8, ["press"] = 1.5, ["perm"] = "Triade", ["sound"] = true},
	[100] = { ["x"] = -1522.38, ["y"] = 142.86, ["z"] = 55.67, ["hash"] = -1563640173, ["lock"] = true, ["text"] = true, ["distance"] = 8, ["press"] = 1.5, ["perm"] = "Triade", ["sound"] = true},
	[101] = { ["x"] = -1501.19, ["y"] = 103.46, ["z"] = 55.68, ["hash"] = -1563640173, ["lock"] = true, ["text"] = true, ["distance"] = 8, ["press"] = 1.5, ["perm"] = "Triade", ["sound"] = true},
	[102] = { ["x"] = -1579.5, ["y"] = 152.93, ["z"] = 58.71, ["hash"] = -1859471240, ["lock"] = true, ["text"] = true, ["distance"] = 8, ["press"] = 1.5, ["perm"] = "Triade", ["sound"] = true},
	[103] = { ["x"] = -1434.64, ["y"] = 235.89, ["z"] = 60.05, ["hash"] = -1859471240, ["lock"] = true, ["text"] = true, ["distance"] = 8, ["press"] = 1.5, ["perm"] = "Triade", ["sound"] = true},
	[104] = { ["x"] = -1441.35, ["y"] = 172.94, ["z"] = 55.85, ["hash"] = -1859471240, ["lock"] = true, ["text"] = true, ["distance"] = 8, ["press"] = 1.5, ["perm"] = "Triade", ["sound"] = true},
	[105] = { ["x"] = -1461.38, ["y"] = 65.8, ["z"] = 52.93, ["hash"] = -1859471240, ["lock"] = true, ["text"] = true, ["distance"] = 8, ["press"] = 1.5, ["perm"] = "Triade", ["sound"] = true},

	---- GALERIA DE ARTES
	[106] = { ["x"] = -463.71, ["y"] = 44.08, ["z"] = 46.24, ["hash"] = -1834751161, ["lock"] = true, ["text"] = true, ["distance"] = 8, ["press"] = 1.5, ["perm"] = "Bratva", ["sound"] = true},
	
	---- PARK RANGER
	[107] = { ["x"] = 379.13, ["y"] = 797.1, ["z"] = 187.47, ["hash"] = 517369125, ["lock"] = true, ["text"] = true, ["distance"] = 8, ["press"] = 1.5, ["perm"] = "Ranger", ["sound"] = true},
	[108] = { ["x"] = 382.67, ["y"] = 796.97, ["z"] = 187.47, ["hash"] = 517369125, ["lock"] = true, ["text"] = true, ["distance"] = 8, ["press"] = 1.5, ["perm"] = "Ranger", ["sound"] = true},
	[109] = { ["x"] = 383.48, ["y"] = 799.32, ["z"] = 187.47, ["hash"] = 517369125, ["lock"] = true, ["text"] = true, ["distance"] = 8, ["press"] = 1.5, ["perm"] = "Ranger", ["sound"] = true},
	[110] = { ["x"] = 384.31, ["y"] = 797.13, ["z"] = 190.5, ["hash"] = -117185009, ["lock"] = true, ["text"] = true, ["distance"] = 8, ["press"] = 1.5, ["perm"] = "Ranger", ["sound"] = true},
	
	---- FRAKLING
	[111] = { ["x"] = 8.42, ["y"] = 538.98, ["z"] = 176.03, ["hash"] = 308207762, ["lock"] = true, ["text"] = true, ["distance"] = 8, ["press"] = 1.5, ["perm"] = "Frank", ["sound"] = true},

	---- Farm Cocaina
	[112] = { ["x"] = -1097.18, ["y"] = 4949.66, ["z"] = 218.65, ["hash"] = -147325430, ["lock"] = true, ["text"] = true, ["distance"] = 8, ["press"] = 1.5, ["perm"] = "Ballas", ["sound"] = true},

	---POLICIA
	[113] = { ["x"] = 418.96, ["y"] = -978.25, ["z"] = 22.67, ["hash"] = -1033001619, ["lock"] = true, ["text"] = true, ["distance"] = 8, ["press"] = 1.5, ["perm"] = "Policia", ["sound"] = true},
	[114] = { ["x"] = 424.99, ["y"] = -978.2, ["z"] = 22.67, ["hash"] = -1033001619, ["lock"] = true, ["text"] = true, ["distance"] = 8, ["press"] = 1.5, ["perm"] = "Policia", ["sound"] = true},
	[115] = { ["x"] = 431.27, ["y"] = -978.12, ["z"] = 22.67, ["hash"] = -1033001619, ["lock"] = true, ["text"] = true, ["distance"] = 8, ["press"] = 1.5, ["perm"] = "Policia", ["sound"] = true}
}   
-----------------------------------------------------------------------------------------------------------------------------------------
-- DOORSSTATISTICS
-----------------------------------------------------------------------------------------------------------------------------------------
function cRP.doorsStatistics(doorNumber,doorStatus)
	local source = source

	doors[parseInt(doorNumber)].lock = doorStatus

	if doors[parseInt(doorNumber)].other ~= nil then
		local doorSecond = doors[parseInt(doorNumber)].other
		doors[doorSecond].lock = doorStatus
	end

	TriggerClientEvent("doors:doorsUpdate",-1,doors)

	if doors[parseInt(doorNumber)].sound then
		TriggerClientEvent("sound:source",source,"doorlock",0.1)
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- DOORSSTATISTICS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("doors:doorsStatistics")
AddEventHandler("doors:doorsStatistics",function(doorNumber,doorStatus)
	doors[parseInt(doorNumber)].lock = doorStatus

	if doors[parseInt(doorNumber)].other ~= nil then
		local doorSecond = doors[parseInt(doorNumber)].other
		doors[doorSecond].lock = doorStatus
	end

	TriggerClientEvent("doors:doorsUpdate",-1,doors)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- DOORSPERMISSION
-----------------------------------------------------------------------------------------------------------------------------------------
function cRP.doorsPermission(doorNumber)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if doors[parseInt(doorNumber)].perm ~= nil then
			if vRP.hasPermission(user_id,doors[parseInt(doorNumber)].perm) then
				return true
			end
		end
	end
	return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- PLAYERSPAWN
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("vRP:playerSpawn",function(user_id,source)
	TriggerClientEvent("doors:doorsUpdate",source,doors)
end)