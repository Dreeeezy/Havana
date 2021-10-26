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
Tunnel.bindInterface("crafting",cRP)
vCLIENT = Tunnel.getInterface("crafting")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CRAFTLIST
-----------------------------------------------------------------------------------------------------------------------------------------
local craftList = {
	["BahamasCrafting"] = {
		["perm"] = "Bahamas",
		["list"] = {
			["handcuff"] = {
				["amount"] = 1,
				["destroy"] = true,
				["require"] = {
					["plastic"] = 20,
					["aluminum"] = 60,
					["copper"] = 20
				}
			},
			["hood"] = {
				["amount"] = 1,
				["destroy"] = true,
				["require"] = {
					["rubber"] = 35,
					["glass"] = 30
				}
			},
			["c4"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["glass"] = 15,
					["rubber"] = 4,
					["aluminum"] = 4,
					["copper"] = 4
				}
			},
			["rope"] = {
				["amount"] = 1,
				["destroy"] = true,
				["require"] = {
					["rubber"] = 15,
					["plastic"] = 20,
					["glass"] = 15
				}
			},
			["vest"] = {
				["amount"] = 1,
				["destroy"] = true,
				["require"] = {
					["rubber"] = 10,
					["aluminum"] = 6,
					["copper"] = 4,
					["animalpelt"] = 2
				}
			}
		}
	},
	["mecanicoCrafting"] = {
		["perm"] = "Mecanico",
		["list"] = {
			["tires"] = {
				["amount"] = 1,
				["destroy"] = true,
				["require"] = {
					["rubber"] = 15
				}
			},
			["plate"] = {
				["amount"] = 1,
				["destroy"] = true,
				["require"] = {
					["aluminum"] = 8
				}
			},
			["toolbox"] = {
				["amount"] = 1,
				["destroy"] = true,
				["require"] = {
					["rubber"] = 7,
					["aluminum"] = 3,
					["copper"] = 3
				}
			},
			--[[ ["toolboxes1"] = {
				["amount"] = 1,
				["destroy"] = true,
				["require"] = {
					["rubber"] = 120,
					["aluminum"] = 50,
					["copper"] = 50
				}
			}, ]]
			["raceticket"] = {
				["amount"] = 1,
				["destroy"] = true,
				["require"] = {
					["paper"] = 1,
					["glue"] = 3
				}
			},
			["lockpick"] = {
				["amount"] = 1,
				["destroy"] = true,
				["require"] = {
					["aluminum"] = 3,
					["plastic"] = 2,
					["rubber"] = 3,
					["copper"] = 3
				}
			}
		}
	},
	["fueltechCrafting"] = {
		["list"] = {
			["fueltech"] = {
				["amount"] = 1,
				["destroy"] = true,
				["require"] = {
					["cpuchip"] = 25
				}
			}
		}
	},
	["lixeiroShop"] = {
		["list"] = {
			["aluminum"] = {
				["amount"] = 3,
				["destroy"] = true,
				["require"] = {
					["metalcan"] = 1
				}
			},
			["rubber"] = {
				["amount"] = 3,
				["destroy"] = true,
				["require"] = {
					["elastic"] = 1
				}
			},
			["copper"] = {
				["amount"] = 3,
				["destroy"] = true,
				["require"] = {
					["battery"] = 1
				}
			},
			["plastic"] = {
				["amount"] = 3,
				["destroy"] = true,
				["require"] = {
					["plasticbottle"] = 1
				}
			},
			["glass"] = {
				["amount"] = 3,
				["destroy"] = true,
				["require"] = {
					["glassbottle"] = 1
				}
			}
		}
	},
	["tradefood"] = {
		["list"] = {
			["compost"] = {
				["amount"] = 4,
				["destroy"] = true,
				["require"] = {
					["sandwich"] = 1,
					["hamburger"] = 1,
					["tacos"] = 1,
					["hotdog"] = 1
				}
			}
		}
	},
	["foodMarket"] = {
		["list"] = {
			["ketchup"] = {
				["amount"] = 1,
				["destroy"] = true,
				["require"] = {
					["emptybottle"] = 1,
					["tomato"] = 6
				}
			},
			["bananajuice"] = {
				["amount"] = 1,
				["destroy"] = true,
				["require"] = {
					["water"] = 1,
					["banana"] = 9
				}
			},
			["orangejuice"] = {
				["amount"] = 1,
				["destroy"] = true,
				["require"] = {
					["water"] = 1,
					["orange"] = 9
				}
			},
			["passionjuice"] = {
				["amount"] = 1,
				["destroy"] = true,
				["require"] = {
					["water"] = 1,
					["passion"] = 9
				}
			},
			["strawberryjuice"] = {
				["amount"] = 1,
				["destroy"] = true,
				["require"] = {
					["water"] = 1,
					["strawberry"] = 9
				}
			},
			["tangejuice"] = {
				["amount"] = 1,
				["destroy"] = true,
				["require"] = {
					["water"] = 1,
					["tange"] = 9
				}
			},
			["grapejuice"] = {
				["amount"] = 1,
				["destroy"] = true,
				["require"] = {
					["water"] = 1,
					["grape"] = 9
				}
			}
		}
	},
	["mechanicCraft"] = {
		["perm"] = "Mecanico",
		["list"] = {
			["tires"] = {
				["amount"] = 1,
				["destroy"] = true,
				["require"] = {
					["rubber"] = 15
				}
			},
			["plate"] = {
				["amount"] = 1,
				["destroy"] = true,
				["require"] = {
					["aluminum"] = 8
				}
			},
			["toolbox"] = {
				["amount"] = 1,
				["destroy"] = true,
				["require"] = {
					["rubber"] = 7,
					["aluminum"] = 3,
					["copper"] = 3
				}
			},
			["raceticket"] = {
				["amount"] = 1,
				["destroy"] = true,
				["require"] = {
					["paper"] = 1,
					["glue"] = 3
				}
			},
			["lockpick"] = {
				["amount"] = 1,
				["destroy"] = true,
				["require"] = {
					["aluminum"] = 3,
					["plastic"] = 2,
					["rubber"] = 3,
					["copper"] = 3
				}
			}
		}
	},
	["boateCrafting2"] = {
		["perm"] = "Vanilla",
		["list"] = {
			["handcuff"] = {
				["amount"] = 1,
				["destroy"] = true,
				["require"] = {
					["plastic"] = 20,
					["aluminum"] = 60,
					["copper"] = 20
				}
			},
			["hood"] = {
				["amount"] = 1,
				["destroy"] = true,
				["require"] = {
					["rubber"] = 35,
					["glass"] = 30
				}
			},
			["c4"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["glass"] = 25,
					["rubber"] = 4,
					["aluminum"] = 4,
					["copper"] = 4
				}
			},
			["rope"] = {
				["amount"] = 1,
				["destroy"] = true,
				["require"] = {
					["rubber"] = 15,
					["plastic"] = 20,
					["glass"] = 15
				}
			},
			["vest"] = {
				["amount"] = 1,
				["destroy"] = true,
				["require"] = {
					["rubber"] = 10,
					["aluminum"] = 6,
					["copper"] = 4,
					["animalpelt"] = 2
				}
			},
			["dollars"] = {
				["amount"] = 1,
				["destroy"] = true,
				["require"] = {
					["dollars2"] = 1
				}
			}
		}
	},
	["craftBennys"] = {
		["perm"] = "Bennys",
		["list"] = {
			["tires"] = {
				["amount"] = 1,
				["destroy"] = true,
				["require"] = {
					["rubber"] = 15
				}
			},
			["plate"] = {
				["amount"] = 1,
				["destroy"] = true,
				["require"] = {
					["aluminum"] = 8
				}
			},
			["toolbox"] = {
				["amount"] = 1,
				["destroy"] = true,
				["require"] = {
					["rubber"] = 7,
					["aluminum"] = 3,
					["copper"] = 3
				}
			},
			["raceticket"] = {
				["amount"] = 1,
				["destroy"] = true,
				["require"] = {
					["paper"] = 1,
					["glue"] = 3
				}
			},
			["lockpick"] = {
				["amount"] = 1,
				["destroy"] = true,
				["require"] = {
					["aluminum"] = 3,
					["plastic"] = 2,
					["rubber"] = 3,
					["copper"] = 3
				}
			}
		}
	},
	["forja"] = {
		["list"] = {
			["goldbar"] = {
				["amount"] = 1,
				["destroy"] = true,
				["require"] = {
					["bracelet"] = 15
				}
			}
		}
	},
	["fichascraft"] = {
		["list"] = {
			["fichas"] = {
				["amount"] = 1,
				["destroy"] = true,
				["require"] = {
					["plastic"] = 2,
					["folhadepapel"] = 2
				}
			}
		}
	},
	["triadeCrafting"] = {
		["perm"] = "Cosanostra",
		["list"] = {
			["WEAPON_ASSAULTRIFLE_AMMO"] = {
				["amount"] = 10,
				["destroy"] = true,
				["require"] = {
					["polvora"] = 9,
					["capsula"] = 10
				}
			},
			["WEAPON_ASSAULTRIFLE_MK2_AMMO"] = {
				["amount"] = 10,
				["destroy"] = true,
				["require"] = {
					["polvora"] = 7,
					["capsula"] = 10
				}
			},
			["WEAPON_PISTOL_MK2_AMMO"] = {
				["amount"] = 10,
				["destroy"] = true,
				["require"] = {
					["polvora"] = 4,
					["capsula"] = 10
				}
			},
			--[[["WEAPON_PISTOL_AMMO"] = {
				["amount"] = 10,
				["destroy"] = true,
				["require"] = {
					["polvora"] = 4,
					["capsula"] = 10
				}
			},]]
			["WEAPON_MACHINEPISTOL_AMMO"] = {
				["amount"] = 10,
				["destroy"] = true,
				["require"] = {
					["polvora"] = 5,
					["capsula"] = 10
				}
			},
			["WEAPON_COMPACTRIFLE_AMMO"] = {
				["amount"] = 10,
				["destroy"] = true,
				["require"] = {
					["polvora"] = 6,
					["capsula"] = 10
				}
			},
			["WEAPON_SPECIALCARBINE_MK2_AMMO"] = {
				["amount"] = 10,
				["destroy"] = true,
				["require"] = {
					["polvora"] = 7,
					["capsula"] = 10
				}
			},
			["WEAPON_HEAVYPISTOL_AMMO"] = {
				["amount"] = 10,
				["destroy"] = true,
				["require"] = {
					["polvora"] = 4,
					["capsula"] = 10
				}
			},
			["WEAPON_MICROSMG_AMMO"] = {
				["amount"] = 10,
				["destroy"] = true,
				["require"] = {
					["polvora"] = 6,
					["capsula"] = 10
				}
			},
			["WEAPON_MINISMG_AMMO"] = {
				["amount"] = 10,
				["destroy"] = true,
				["require"] = {
					["polvora"] = 6,
					["capsula"] = 10
				}
			},
			["WEAPON_COMBATPDW_AMMO"] = {
				["amount"] = 10,
				["destroy"] = true,
				["require"] = {
					["polvora"] = 6,
					["capsula"] = 10
				}
			},
			["WEAPON_ASSAULTSMG_AMMO"] = {
				["amount"] = 10,
				["destroy"] = true,
				["require"] = {
					["polvora"] = 6,
					["capsula"] = 10
				}
			}
		}
	},
	["medellinCrafting"] = {
		["perm"] = "Elcapone",
		["list"] = {
			["WEAPON_ASSAULTRIFLE_AMMO"] = {
				["amount"] = 10,
				["destroy"] = true,
				["require"] = {
					["polvora"] = 7,
					["capsula"] = 10
				}
			},
			["WEAPON_ASSAULTRIFLE_MK2_AMMO"] = {
				["amount"] = 10,
				["destroy"] = true,
				["require"] = {
					["polvora"] = 7,
					["capsula"] = 10
				}
			},
			["WEAPON_PISTOL_MK2_AMMO"] = {
				["amount"] = 10,
				["destroy"] = true,
				["require"] = {
					["polvora"] = 4,
					["capsula"] = 10
				}
			},
			["WEAPON_PISTOL_AMMO"] = {
				["amount"] = 10,
				["destroy"] = true,
				["require"] = {
					["polvora"] = 4,
					["capsula"] = 10
				}
			},
			["WEAPON_MACHINEPISTOL_AMMO"] = {
				["amount"] = 10,
				["destroy"] = true,
				["require"] = {
					["polvora"] = 5,
					["capsula"] = 10
				}
			},
			["WEAPON_COMPACTRIFLE_AMMO"] = {
				["amount"] = 10,
				["destroy"] = true,
				["require"] = {
					["polvora"] = 6,
					["capsula"] = 10
				}
			},
			["WEAPON_SPECIALCARBINE_MK2_AMMO"] = {
				["amount"] = 10,
				["destroy"] = true,
				["require"] = {
					["polvora"] = 7,
					["capsula"] = 10
				}
			},
			["WEAPON_HEAVYPISTOL_AMMO"] = {
				["amount"] = 10,
				["destroy"] = true,
				["require"] = {
					["polvora"] = 4,
					["capsula"] = 10
				}
			},
			["WEAPON_MICROSMG_AMMO"] = {
				["amount"] = 10,
				["destroy"] = true,
				["require"] = {
					["polvora"] = 6,
					["capsula"] = 10
				}
			},
			["WEAPON_MINISMG_AMMO"] = {
				["amount"] = 10,
				["destroy"] = true,
				["require"] = {
					["polvora"] = 6,
					["capsula"] = 10
				}
			},
			["WEAPON_COMBATPDW_AMMO"] = {
				["amount"] = 10,
				["destroy"] = true,
				["require"] = {
					["polvora"] = 6,
					["capsula"] = 10
				}
			},
			["WEAPON_ASSAULTSMG_AMMO"] = {
				["amount"] = 10,
				["destroy"] = true,
				["require"] = {
					["polvora"] = 6,
					["capsula"] = 10
				}
			}
		}
	},
	["lavagemCrafting2"] = {
		["perm"] = "Galaxy",
		["list"] = {
			["dollars"] = {
				["amount"] = 1,
				["destroy"] = true,
				["require"] = {
					["dollars2"] = 1
				}
			}
		}
	},
	["desmanche"] = {
		["perm"] = "Desmanche",
		["list"] = {
			["plate"] = {
				["amount"] = 1,
				["destroy"] = true,
				["require"] = {
					["aluminum"] = 15,
					["copper"] = 20
				}
			}
		}
	},
	["lesterCrafting"] = {
		["list"] = {
			["c4"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["glass"] = 52,
					["rubber"] = 15,
					["aluminum"] = 15,
					["copper"] = 15
				}
			}
		}
	},
	["yakuzaCrafting"] = {
		["perm"] = "Yakuza",
		["list"] = {
			["WEAPON_ASSAULTRIFLE"] = {
				["amount"] = 1,
				["destroy"] = true,
				["require"] = {
					["aluminum"] = 40,
					["copper"] = 40,
					["corpo-ak47"] = 7,
					["gatilho"] = 55,
					["molas"] = 40
				}
			},
			["WEAPON_PISTOL_MK2"] = {
				["amount"] = 1,
				["destroy"] = true,
				["require"] = {
					["aluminum"] = 20,
					["copper"] = 20,
					["corpo-five"] = 2,
					["gatilho"] = 40,
					["molas"] = 30
				}
			},
			["WEAPON_MACHINEPISTOL"] = {
				["amount"] = 1,
				["destroy"] = true,
				["require"] = {
					["aluminum"] = 30,
					["copper"] = 35,
					["corpo-tec"] = 4,
					["gatilho"] = 45,
					["molas"] = 45
				}
			},
			["WEAPON_COMPACTRIFLE"] = {
				["amount"] = 1,
				["destroy"] = true,
				["require"] = {
					["aluminum"] = 30,
					["copper"] = 35,
					["corpo-miniak"] = 6,
					["gatilho"] = 50,
					["molas"] = 45
				}
			},
			["WEAPON_ASSAULTSMG"] = {
				["amount"] = 1,
				["destroy"] = true,
				["require"] = {
					["aluminum"] = 30,
					["copper"] = 35,
					["corpo-mtar"] = 6,
					["gatilho"] = 50,
					["molas"] = 30
				}
			},
			["WEAPON_SPECIALCARBINE_MK2"] = {
				["amount"] = 1,
				["destroy"] = true,
				["require"] = {
					["aluminum"] = 40,
					["copper"] = 40,
					["corpo-g36"] = 7,
					["gatilho"] = 55,
					["molas"] = 40
				}
			},
			["WEAPON_HEAVYPISTOL"] = {
				["amount"] = 1,
				["destroy"] = true,
				["require"] = {
					["aluminum"] = 20,
					["copper"] = 20,
					["corpo-desert"] = 2,
					["gatilho"] = 40,
					["molas"] = 30
				}
			},
			["WEAPON_MICROSMG"] = {
				["amount"] = 1,
				["destroy"] = true,
				["require"] = {
					["aluminum"] = 30,
					["copper"] = 35,
					["corpo-uzi"] = 4,
					["gatilho"] = 45,
					["molas"] = 45
				}
			},
			["WEAPON_MINISMG"] = {
				["amount"] = 1,
				["destroy"] = true,
				["require"] = {
					["aluminum"] = 30,
					["copper"] = 35,
					["corpo-skorpion"] = 2,
					["gatilho"] = 50,
					["molas"] = 45
				}
			},
			["WEAPON_COMBATPDW"] = {
				["amount"] = 1,
				["destroy"] = true,
				["require"] = {
					["aluminum"] = 30,
					["copper"] = 35,
					["corpo-sig"] = 6,
					["gatilho"] = 50,
					["molas"] = 30
				}
			}
		}
	},
	["catedralCrafting"] = {
		["perm"] = "Bratva",
		["list"] = {
			["WEAPON_ASSAULTRIFLE"] = {
				["amount"] = 1,
				["destroy"] = true,
				["require"] = {
					["aluminum"] = 40,
					["copper"] = 40,
					["corpo-ak47"] = 7,
					["gatilho"] = 55,
					["molas"] = 40
				}
			},
			["WEAPON_PISTOL_MK2"] = {
				["amount"] = 1,
				["destroy"] = true,
				["require"] = {
					["aluminum"] = 20,
					["copper"] = 20,
					["corpo-five"] = 2,
					["gatilho"] = 40,
					["molas"] = 30
				}
			},
			["WEAPON_MACHINEPISTOL"] = {
				["amount"] = 1,
				["destroy"] = true,
				["require"] = {
					["aluminum"] = 30,
					["copper"] = 35,
					["corpo-tec"] = 4,
					["gatilho"] = 45,
					["molas"] = 45
				}
			},
			["WEAPON_COMPACTRIFLE"] = {
				["amount"] = 1,
				["destroy"] = true,
				["require"] = {
					["aluminum"] = 30,
					["copper"] = 35,
					["corpo-miniak"] = 6,
					["gatilho"] = 50,
					["molas"] = 45
				}
			},
			["WEAPON_ASSAULTSMG"] = {
				["amount"] = 1,
				["destroy"] = true,
				["require"] = {
					["aluminum"] = 30,
					["copper"] = 35,
					["corpo-mtar"] = 6,
					["gatilho"] = 50,
					["molas"] = 30
				}
			},
			["WEAPON_SPECIALCARBINE_MK2"] = {
				["amount"] = 1,
				["destroy"] = true,
				["require"] = {
					["aluminum"] = 40,
					["copper"] = 40,
					["corpo-g36"] = 7,
					["gatilho"] = 55,
					["molas"] = 40
				}
			},
			["WEAPON_HEAVYPISTOL"] = {
				["amount"] = 1,
				["destroy"] = true,
				["require"] = {
					["aluminum"] = 20,
					["copper"] = 20,
					["corpo-desert"] = 2,
					["gatilho"] = 40,
					["molas"] = 30
				}
			},
			["WEAPON_MICROSMG"] = {
				["amount"] = 1,
				["destroy"] = true,
				["require"] = {
					["aluminum"] = 30,
					["copper"] = 35,
					["corpo-uzi"] = 4,
					["gatilho"] = 45,
					["molas"] = 45
				}
			},
			["WEAPON_MINISMG"] = {
				["amount"] = 1,
				["destroy"] = true,
				["require"] = {
					["aluminum"] = 30,
					["copper"] = 35,
					["corpo-skorpion"] = 2,
					["gatilho"] = 50,
					["molas"] = 45
				}
			},
			["WEAPON_COMBATPDW"] = {
				["amount"] = 1,
				["destroy"] = true,
				["require"] = {
					["aluminum"] = 30,
					["copper"] = 35,
					["corpo-sig"] = 6,
					["gatilho"] = 50,
					["molas"] = 30
				}
			}
		}
	},
	["FarmCrafting"] = {
		["list"] = {
			["pin"] = {
				["amount"] = 3,
				["destroy"] = true,
				["require"] = {
					["plastic"] = 1
				}
			},
			["plasticbag"] = {
				["amount"] = 3,
				["destroy"] = true,
				["require"] = {
					["plastic"] = 1
				}
			},
			["silk"] = {
				["amount"] = 3,
				["destroy"] = true,
				["require"] = {
					["paper"] = 1
				}
			},
			["emptyglassbottle"] = {
				["amount"] = 3,
				["destroy"] = true,
				["require"] = {
					["glass"] = 1
				}
			}
		}
	},
	["housefood"] = {
		["list"] = {
			["macarronada"] = {
				["amount"] = 1,
				["destroy"] = true,
				["require"] = {
					["macarrao"] = 1,
					["molho"] = 1,
					["meatA"] = 1
				}
			},
			["cookie"] = {
				["amount"] = 3,
				["destroy"] = true,
				["require"] = {
					["farinha"] = 1,
					["milk"] = 1,
					["chocolate"] = 1
				}
			},
			["weedcookie"] = {
				["amount"] = 3,
				["destroy"] = true,
				["require"] = {
					["farinha"] = 1,
					["milk"] = 1,
					["chocolate"] = 1,
					["weed"] = 1
				}
			}
		}
	},
	["lenhador"] = {
		["list"] = {
			["serragem"] = {
				["amount"] = 3,
				["destroy"] = true,
				["require"] = {
					["woodlog"] = 1
				}
			},
			["paper"] = {
				["amount"] = 3,
				["destroy"] = true,
				["require"] = {
					["serragem"] = 3
				}
			}
		}
	},
	["incapsule"] = {
		["perm"] = "Cosanostra",
		["list"] = {
			["capsula"] = {
				["amount"] = 4,
				["destroy"] = true,
				["require"] = {
					["aluminum"] = 1,
					["copper"] = 1
				}
			}
		}
	},
	["waterlsc"] = {
		["list"] = {
			["water"] = {
				["amount"] = 1,
				["destroy"] = true,
				["require"] = {
					["emptybottle"] = 1
				}
			}
		}
	},
	["triade"] = {
		["perm"] = "Triade",
		["list"] = {
			["WEAPON_ASSAULTRIFLE"] = {
				["amount"] = 1,
				["destroy"] = true,
				["require"] = {
					["aluminum"] = 40,
					["copper"] = 40,
					["corpo-ak47"] = 7,
					["gatilho"] = 55,
					["molas"] = 40
				}
			},
			["WEAPON_PISTOL_MK2"] = {
				["amount"] = 1,
				["destroy"] = true,
				["require"] = {
					["aluminum"] = 20,
					["copper"] = 20,
					["corpo-five"] = 2,
					["gatilho"] = 40,
					["molas"] = 30
				}
			},
			["WEAPON_MACHINEPISTOL"] = {
				["amount"] = 1,
				["destroy"] = true,
				["require"] = {
					["aluminum"] = 30,
					["copper"] = 35,
					["corpo-tec"] = 4,
					["gatilho"] = 45,
					["molas"] = 45
				}
			},
			["WEAPON_COMPACTRIFLE"] = {
				["amount"] = 1,
				["destroy"] = true,
				["require"] = {
					["aluminum"] = 30,
					["copper"] = 35,
					["corpo-miniak"] = 6,
					["gatilho"] = 50,
					["molas"] = 45
				}
			},
			["WEAPON_ASSAULTSMG"] = {
				["amount"] = 1,
				["destroy"] = true,
				["require"] = {
					["aluminum"] = 30,
					["copper"] = 35,
					["corpo-mtar"] = 6,
					["gatilho"] = 50,
					["molas"] = 30
				}
			},
			["WEAPON_SPECIALCARBINE_MK2"] = {
				["amount"] = 1,
				["destroy"] = true,
				["require"] = {
					["aluminum"] = 40,
					["copper"] = 40,
					["corpo-g36"] = 7,
					["gatilho"] = 55,
					["molas"] = 40
				}
			},
			["WEAPON_HEAVYPISTOL"] = {
				["amount"] = 1,
				["destroy"] = true,
				["require"] = {
					["aluminum"] = 20,
					["copper"] = 20,
					["corpo-desert"] = 2,
					["gatilho"] = 40,
					["molas"] = 30
				}
			},
			["WEAPON_MICROSMG"] = {
				["amount"] = 1,
				["destroy"] = true,
				["require"] = {
					["aluminum"] = 30,
					["copper"] = 35,
					["corpo-uzi"] = 4,
					["gatilho"] = 45,
					["molas"] = 45
				}
			},
			["WEAPON_MINISMG"] = {
				["amount"] = 1,
				["destroy"] = true,
				["require"] = {
					["aluminum"] = 30,
					["copper"] = 35,
					["corpo-skorpion"] = 2,
					["gatilho"] = 50,
					["molas"] = 45
				}
			},
			["WEAPON_COMBATPDW"] = {
				["amount"] = 1,
				["destroy"] = true,
				["require"] = {
					["aluminum"] = 30,
					["copper"] = 35,
					["corpo-sig"] = 6,
					["gatilho"] = 50,
					["molas"] = 30
				}
			}
		}
	},
	["paramedicocraft"] = {
		["perm"] = "Paramedico",
		["list"] = {
			["ibuprofeno"] = {
				["amount"] = 1,
				["destroy"] = true,
				["require"] = {
					["benzoato"] = 2,
					["dioxido"] = 2
				}
			},
			["tylenol"] = {
				["amount"] = 1,
				["destroy"] = true,
				["require"] = {
					["paracetamol"] = 2
				}
			}
		}
	},
	["digitalreparo"] = {
		["list"] = {
			["cellphone"] = {
				["amount"] = 1,
				["destroy"] = true,
				["require"] = {
					["cellphonedamaged"] = 1,
					["dollars"] = 120
				}
			},
			["radio"] = {
				["amount"] = 1,
				["destroy"] = true,
				["require"] = {
					["radiodamaged"] = 1,
					["dollars"] = 50
				}
			}
		}
	}
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- REQUESTPERM
-----------------------------------------------------------------------------------------------------------------------------------------
function cRP.requestPerm(craftType)
	local source = source
	local user_id = vRP.getUserId(source)

	if user_id then
		if vRP.wantedReturn(user_id) then
			return false
		end

		if craftList[craftType]["perm"] ~= nil then
			if not vRP.hasPermission(user_id,craftList[craftType]["perm"]) then
				return false
			end
		end

		return true
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- REQUESTCRAFTING
-----------------------------------------------------------------------------------------------------------------------------------------
function cRP.requestCrafting(craftType)
	local source = source
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if user_id then
		local inventoryShop = {}
		for k,v in pairs(craftList[craftType]["list"]) do
			local craftList = {}
			for k,v in pairs(v.require) do
				table.insert(craftList,{ name = vRP.itemNameList(k), amount = v })
			end

			table.insert(inventoryShop,{ name = vRP.itemNameList(k), amount = parseInt(v.amount), index = vRP.itemIndexList(k), key = k, weight = vRP.itemWeightList(k), list = craftList })
		end

		local inventoryUser = {}
		local inv = vRP.getInventory(user_id)
		if inv then
			for k,v in pairs(inv) do
				if string.sub(v.item,1,9) == "toolboxes" then
					local advFile = LoadResourceFile("logsystem","toolboxes.json")
					local advDecode = json.decode(advFile)

					v.durability = advDecode[v.item]
				end

				v.amount = parseInt(v.amount)
				v.name = vRP.itemNameList(v.item)
				v.peso = vRP.itemWeightList(v.item)
				v.index = vRP.itemIndexList(v.item)
				v.key = v.item
				v.slot = k

				inventoryUser[k] = v
			end
		end

		return inventoryShop,inventoryUser,vRP.computeInvWeight(user_id),vRP.getBackpack(user_id),{ identity.name.." "..identity.name2,parseInt(user_id),parseInt(identity.bank),parseInt(vRP.getGmsId(user_id)),identity.phone,identity.registration }
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- FUNCTIONCRAFTING
-----------------------------------------------------------------------------------------------------------------------------------------
function cRP.functionCrafting(shopItem,shopType,shopAmount,slot)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if shopAmount == nil then shopAmount = 1 end
		if shopAmount <= 0 then shopAmount = 1 end

		if craftList[shopType]["list"][shopItem] then
			for k,v in pairs(craftList[shopType]["list"][shopItem]["require"]) do
				if vRP.getInventoryItemAmount(user_id,k) < parseInt(v*shopAmount) then
					return
				end
				Citizen.Wait(1)
			end

			for k,v in pairs(craftList[shopType]["list"][shopItem]["require"]) do
				vRP.removeInventoryItem(user_id,k,parseInt(v*shopAmount))
				Citizen.Wait(1)
			end

			if string.sub(shopItem,1,9) == "toolboxes" then
				local advAmount = 0

				repeat
					Citizen.Wait(1)
					advAmount = advAmount + 1
					local advFile = LoadResourceFile("logsystem","toolboxes.json")
					local advDecode = json.decode(advFile)
					local number = 0

					repeat
						Citizen.Wait(1)
						number = number + 1
					until advDecode[tostring("toolboxes"..number)] == nil

					advDecode[tostring("toolboxes"..number)] = 10
					vRP.giveInventoryItem(user_id,tostring("toolboxes"..number),1,false)
					SaveResourceFile("logsystem","toolboxes.json",json.encode(advDecode),-1)
				until advAmount == shopAmount
			else
				vRP.giveInventoryItem(user_id,shopItem,craftList[shopType]["list"][shopItem]["amount"]*shopAmount,false,slot)
			end
		end

		vCLIENT.updateCrafting(source,"requestCrafting")
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- FUNCTIONDESTROY
-----------------------------------------------------------------------------------------------------------------------------------------
function cRP.functionDestroy(shopItem,shopType,shopAmount,slot)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if shopAmount == nil then shopAmount = 1 end
		if shopAmount <= 0 then shopAmount = 1 end

		if craftList[shopType]["list"][shopItem] then
			if craftList[shopType]["list"][shopItem]["destroy"] then
				if vRP.tryGetInventoryItem(user_id,shopItem,craftList[shopType]["list"][shopItem]["amount"]) then
					for k,v in pairs(craftList[shopType]["list"][shopItem]["require"]) do
						if parseInt(v) <= 1 then
							vRP.giveInventoryItem(user_id,k,1)
						else
							vRP.giveInventoryItem(user_id,k,v/2)
						end
						Citizen.Wait(1)
					end
				end
			end
		end

		vCLIENT.updateCrafting(source,"requestCrafting")
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- POPULATESLOT
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("crafting:populateSlot")
AddEventHandler("crafting:populateSlot",function(itemName,slot,target,amount)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if amount == nil then amount = 1 end
		if amount <= 0 then amount = 1 end

		if vRP.tryGetInventoryItem(user_id,itemName,amount,false,slot) then
			vRP.giveInventoryItem(user_id,itemName,amount,false,target)
			vCLIENT.updateCrafting(source,"requestCrafting")
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- POPULATESLOT
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("crafting:updateSlot")
AddEventHandler("crafting:updateSlot",function(itemName,slot,target,amount)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if amount == nil then amount = 1 end
		if amount <= 0 then amount = 1 end

		local inv = vRP.getInventory(user_id)
		if inv then
			if inv[tostring(slot)] and inv[tostring(target)] and inv[tostring(slot)].item == inv[tostring(target)].item then
				if vRP.tryGetInventoryItem(user_id,itemName,amount,false,slot) then
					vRP.giveInventoryItem(user_id,itemName,amount,false,target)
				end
			else
				vRP.swapSlot(user_id,slot,target)
			end
		end

		vCLIENT.updateCrafting(source,"requestCrafting")
	end
end)