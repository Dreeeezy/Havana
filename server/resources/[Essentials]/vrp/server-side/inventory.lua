-----------------------------------------------------------------------------------------------------------------------------------------
-- ITEMLIST
-----------------------------------------------------------------------------------------------------------------------------------------
local itemlist = {
	["radio"] = {
		index = "radio",
		name = "Rádio",
		desc = "Utizado para se comunicar",
		tipo = "Usável",
		unity = "Não",
		economy = "120",
		type = "use",
		subtype = "eletronico",
		transform = "nbradio",
		max = 99999,
		durability = 30000,
		weight = 1.10
	},
	["nbradio"] = {
        index = "nbradio",
        name = "Rádio",
		desc = "Rádio sem bateria",
		tipo = "Comum",
		unity = "Não",
		economy = "S/E",
        type = "use",
        weight = 0.75
    },
	["radiobattery"] = {
		index = "radiobattery",
		name = "Bateria de rádio",
		desc = "Utilizado no rádio",
		tipo = "Usável",
		unity = "Não",
		economy = "45",
		type = "use",
		weight = 0.75
	},
	["radiodamaged"] = {
        index = "radiodamaged",
        name = "Rádio Queimado",
		desc = "Rádio Quebrado",
		tipo = "Eletrônico",
		unity = "",
		economy = "",
        type = "use",
        weight = 1.10
    },
	["tablet"] = {
		index = "tablet",
		name = "Tablet",
		desc = "Informações",
		tipo = "Usável",
		unity = "Não",
		economy = "450",
		type = "use",
		subtype = "eletronico",
		transform = "nbtablet",
		max = 99999,
		durability = 30000,
		weight = 0.75
	},
	["nbtablet"] = {
        index = "nbtablet",
        name = "Tablet",
		desc = "Tablet sem bateria",
		tipo = "Comum",
		unity = "Não",
		economy = "S/E",
        type = "use",
        weight = 0.75
    },
	["tabletbattery"] = {
		index = "tabletbattery",
		name = "Bateria de tablet",
		desc = "Utilizado no Tablet",
		tipo = "Usável",
		unity = "Não",
		economy = "45",
		type = "use",
		weight = 0.75
	},
	["tabletdamaged"] = {
		index = "tabletdamaged",
		name = "Tablet Queimado",
		desc = "Aparelho quebrado",
		tipo = "Usável",
		unity = "Não",
		economy = "120",
		type = "use",
		weight = 1.10
	},
	["vest"] = {
		index = "vest",
		name = "Colete",
		desc = "Utilizado para Proteger",
		tipo = "Usável",
		unity = "Não",
		economy = "",
		type = "use",
		weight = 2.45
	},
	["bandage"] = {
		index = "bandage",
		name = "Bandagem",
		desc = "Utilizado para enfaixar",
		tipo = "Usável",
		unity = "Não",
		max = 3,
		economy = "80",
		type = "use",
		weight = 0.10
	},
	["ibuprofeno"] = {
		index = "ibuprofeno",
		name = "Ibuprofeno",
		desc = "Age contra inflamações não tão intensas",
		tipo = "Usável",
		unity = "Não",
		economy = "",
		type = "use",
		weight = 0.05
	},
	["tylenol"] = {
		index = "tylenol",
		name = "Tylenol",
		desc = "Age contra inflamações não tão intensas",
		tipo = "Usável",
		unity = "Não",
		economy = "",
		type = "use",
		weight = 0.05
	},
	["paracetamol"] = {
		index = "paracetamol",
		name = "Paracetamol",
		desc = "500mg Paracetamol",
		tipo = "Usável",
		unity = "Não",
		economy = "",
		type = "use",
		weight = 0.05
	},
	["benzoato"] = {
		index = "benzoato",
		name = "Benzoato",
		desc = "Benzoato de sódio",
		tipo = "Usável",
		unity = "Não",
		economy = "",
		type = "use",
		weight = 0.05
	},
	["dioxido"] = {
		index = "dioxido",
		name = "Dióxido",
		desc = "Dióxido de titânio",
		tipo = "Usável",
		unity = "Não",
		economy = "",
		type = "use",
		weight = 0.05
	},
	["warfarin"] = {
		index = "medkit",
		name = "Kit Médico",
		desc = "Kit de primeiros socorros",
		tipo = "Usável",
		unity = "Não",
		max = 2,
		economy = "300",
		type = "use",
		weight = 0.45
	},
	["adrenaline"] = {
		index = "adrenaline",
		name = "Adrenalina",
		desc = "Medicamento",
		tipo = "Usável",
		unity = "Não",
		economy = "300",
		type = "use",
		weight = 0.35
	},
	["raceticket"] = {
		index = "raceticket",
		name = "Credencial",
		desc = "Cracha",
		tipo = "Comum",
		unity = "Não",
		economy = "",
		type = "use",
		weight = 0.10
	},
	["pouch"] = {
		index = "pouch",
		name = "Malote",
		desc = "Mala de dinheiro",
		tipo = "Comum",
		unity = "Não",
		economy = "S/E",
		type = "use",
		weight = 0.75
	},
	["woodlog"] = {
		index = "woodlog",
		name = "Tora de Madeira",
		desc = "Maidera Comum",
		tipo = "Comum",
		unity = "Não",
		economy = "S/E",
		type = "use",
		weight = 0.75
	},
	["serragem"] = {
		index = "serragem",
		name = "serragem de Madeira",
		desc = "",
		tipo = "Comum",
		unity = "Não",
		economy = "S/E",
		type = "use",
		weight = 0.25
	},
	["fishingrod"] = {
		index = "fishingrod",
		name = "Vara de Pescar",
		desc = "Utilizado para pesca",
		tipo = "Usável",
		unity = "Não",
		economy = "1000",
		type = "use",
		weight = 2.75
	},
	["octopus"] = {
		index = "octopus",
		name = "Polvo",
		desc = "Mollusca",
		tipo = "Comum",
		unity = "Não",
		economy = "18",
		type = "use",
		weight = 0.75
	},
	["shrimp"] = {
		index = "shrimp",
		name = "Camarão",
		desc = "Fruto do mar",
		tipo = "Comum",
		unity = "Não",
		economy = "20",
		type = "use",
		weight = 0.50
	},
	["carp"] = {
		index = "carp",
		name = "Carpa",
		desc = "Peixe comum",
		tipo = "Comum",
		unity = "Não",
		economy = "8",
		type = "use",
		weight = 0.50
	},
	["codfish"] = {
		index = "codfish",
		name = "Bacalhau",
		desc = "Peixe comum",
		tipo = "Comum",
		unity = "Não",
		economy = "",
		type = "use",
		weight = 0.50
	},
	["catfish"] = {
		index = "catfish",
		name = "Bagre",
		desc = "Peixe comum",
		tipo = "Comum",
		unity = "Não",
		economy = "",
		type = "use",
		weight = 0.50
	},
	["goldenfish"] = {
		index = "goldenfish",
		name = "Dourado",
		desc = "Peixe comum",
		tipo = "Comum",
		unity = "Não",
		economy = "6",
		type = "use",
		weight = 0.25
	},
	["horsefish"] = {
		index = "horsefish",
		name = "Cavala",
		desc = "Peixe comum",
		tipo = "Comum",
		unity = "Não",
		economy = "",
		type = "use",
		weight = 0.50
	},
	["tilapia"] = {
		index = "tilapia",
		name = "Tilápia",
		desc = "Peixe comum",
		tipo = "Comum",
		unity = "Não",
		economy = "6",
		type = "use",
		weight = 0.25
	},
	["pacu"] = {
		index = "pacu",
		name = "Pacu",
		desc = "Peixe comum",
		tipo = "Comum",
		unity = "Não",
		economy = "",
		type = "use",
		weight = 0.50
	},
	["pirarucu"] = {
		index = "pirarucu",
		name = "Pirarucu",
		desc = "Peixe comum",
		tipo = "Comum",
		unity = "Não",
		economy = "10",
		type = "use",
		weight = 0.25
	},
	["tambaqui"] = {
		index = "tambaqui",
		name = "Tambaqui",
		desc = "Peixe comum",
		tipo = "Comum",
		unity = "Não",
		economy = "",
		type = "use",
		weight = 0.75
	},
	["bait"] = {
		index = "bait",
		name = "Isca",
		desc = "Minhocas",
		tipo = "Comum",
		unity = "Não",
		max = 20,
		economy = "4",
		type = "use",
		weight = 0.25
	},
	["meatA"] = {
		index = "meat",
		name = "Carne Animal",
		desc = "Corte nobre de classe A.",
		tipo = "Comum",
		unity = "Não",
		economy = "10",
		type = "use",
		weight = 0.75
	},
	["meatB"] = {
		index = "meat2",
		name = "Carne Animal",
		desc = "Corte nobre de classe B.",
		tipo = "Comum",
		unity = "Não",
		economy = "20",
		type = "use",
		weight = 0.75
	},
	["meatC"] = {
		index = "meat3",
		name = "Carne Animal",
		desc = "Corte nobre de classe C.",
		tipo = "Comum",
		unity = "Não",
		economy = "30",
		type = "use",
		weight = 0.75
	},
	["meatS"] = {
		index = "meat4",
		name = "Carne Animal",
		desc = "Corte nobre de classe S.",
		tipo = "Comum",
		unity = "Não",
		economy = "40",
		type = "use",
		weight = 0.75
	},
	["animalpelt"] = {
		index = "animalpelt",
		name = "Pele Animal",
		desc = "Couro",
		tipo = "Comum",
		unity = "Não",
		economy = "45",
		type = "use",
		weight = 0.10
	},
	["cannabisseed"] = {
		index = "cannabisseed",
		name = "Semente de Maconha",
		desc = "Grão",
		tipo = "Semente",
		unity = "",
		economy = "",
		type = "use",
		weight = 0.10
	},
	["bucket"] = {
		index = "bucket",
		name = "Balde",
		desc = "Container",
		tipo = "Material",
		unity = "",
		economy = "",
		type = "use",
		weight = 1.50
	},
	["compost"] = {
		index = "compost",
		name = "Adubo",
		desc = "Utilizado em plantações",
		tipo = "Reciclado",
		unity = "",
		economy = "",
		type = "use",
		weight = 0.50
	},
	["weed"] = {
		index = "weed",
		name = "Maconha",
		desc = "Erva",
		tipo = "Planta",
		unity = "",
		economy = "",
		type = "use",
		weight = 0.50
	},
	["joint"] = {
		index = "joint",
		name = "Baseado",
		desc = "Composto químico",
		tipo = "Usável",
		unity = "Não",
		economy = "",
		type = "use",
		weight = 0.50
	},
	["mdma"] = {
		index = "mdma",
		name = "mdma",
		desc = "Composto químico",
		tipo = "Usável",
		unity = "Não",
		economy = "",
		type = "use",
		weight = 0.20
	},
	["dioxidodesilicio"] = {
		index = "dioxidodesilicio",
		name = "dioxido de silicio",
		desc = "Composto químico",
		tipo = "Usável",
		unity = "Não",
		economy = "",
		type = "use",
		weight = 0.20
	},
	["xaropelean"] = {
		index = "xaropelean",
		name = "Xarope de Lean",
		desc = "",
		tipo = "Usável",
		unity = "Não",
		economy = "",
		type = "use",
		weight = 0.50
	},
	["lean"] = {
		index = "lean",
		name = "Lean",
		desc = "Codeina",
		tipo = "Usável",
		unity = "Não",
		economy = "",
		type = "use",
		weight = 0.20
	},
	["ecstasy"] = {
		index = "ecstasy",
		name = "Ecstasy",
		desc = "Ecstasy",
		tipo = "Usável",
		unity = "Não",
		economy = "",
		type = "use",
		weight = 0.20
	},
	["cocaine"] = {
		index = "cocaine",
		name = "Cocaína",
		desc = "Cocaina",
		tipo = "Usável",
		unity = "Não",
		economy = "",
		type = "use",
		weight = 0.50
	},
	["cocainepin"] = {
		index = "cocainepin",
		name = "Pino de Cocaina",
		desc = "Pino de cocaina",
		tipo = "Usável",
		unity = "Não",
		economy = "",
		type = "use",
		weight = 0.20
	},
	["havana"] = {
		index = "havana",
		name = "Havana RP",
		desc = "Pra ficar doidão",
		tipo = "Usável",
		unity = "Não",
		economy = "",
		type = "use",
		weight = 0.20
	},
	["ifak"] = {
		index = "ifak",
		name = "ifak",
		desc = "ifak",
		tipo = "Usável",
		unity = "Não",
		economy = "",
		type = "use",
		weight = 0.20
	},
	["crystalmeth"] = {
		index = "crystalmeth",
		name = "Crystal de Metaanfetamina",
		desc = "Puro Cristal",
		tipo = "Usável",
		unity = "Não",
		economy = "",
		type = "use",
		weight = 0.50
	},
	["meth"] = {
		index = "meth",
		name = "Metanfetamina",
		desc = "Meta",
		tipo = "Usável",
		unity = "Não",
		economy = "",
		type = "use",
		weight = 0.20
	},
	["methliquid"] = {
		index = "methliquid",
		name = "Meta Líquida",
		desc = "Metanfetamina",
		tipo = "Medicamento",
		unity = "",
		economy = "",
		type = "use",
		weight = 1.00
	},
	["xaropecodeina"] = {
		index = "xaropecodeina",
		name = "Xarope De Codeina",
		desc = "Remédio analgésico",
		tipo = "Medicamento",
		unity = "",
		economy = "",
		type = "use",
		weight = 0.10
	},
	["prometazina"] = {
		index = "prometazina",
		name = "Prometazina",
		desc = "Anti-histamínico",
		tipo = "Medicamento",
		unity = "",
		economy = "",
		type = "use",
		weight = 0.10
	},
	["silk"] = {
		index = "silk",
		name = "Seda",
		desc = "Papel de seda",
		tipo = "Material",
		unity = "",
		economy = "",
		type = "use",
		weight = 0.05
	},
	["backpack"] = {
		index = "backpack",
		name = "Mochila",
		desc = "Carregar mais cargas",
		tipo = "Usável",
		unity = "Não",
		economy = "400",
		type = "use",
		weight = 4.25
	},
	["premium01"] = {
		index = "premium01",
		name = "VipPlus 30 Dias",
		desc = "5% de prioridade na fila",
		tipo = "Usável",
		unity = "Não",
		economy = "",
		type = "use",
		weight = 0.00
	},
	["premium02"] = {
		index = "premium02",
		name = "VipSilver 30 Dias",
		desc = "10% de prioridade na fila",
		tipo = "Usável",
		unity = "Não",
		economy = "",
		type = "use",
		weight = 0.00
	},
	["premium03"] = {
		index = "premium03",
		name = "VipGold 30 Dias",
		desc = "20% de prioridade na fila",
		tipo = "Usável",
		unity = "Não",
		economy = "",
		type = "use",
		weight = 0.00
	},
	["premium04"] = {
		index = "premium04",
		name = "VipPlatinum 30 Dias",
		desc = "35% de prioridade na fila",
		tipo = "Usável",
		unity = "Não",
		economy = "",
		type = "use",
		weight = 0.00
	},
	["premium05"] = {
		index = "premium05",
		name = "VipDiamond 30 Dias",
		desc = "50% de prioridade na fila",
		tipo = "Usável",
		unity = "Não",
		economy = "",
		type = "use",
		weight = 0.00
	},
	["namechange"] = {
		index = "namechange",
		name = "Troca de nome",
		desc = "Troca o nome do personagem.",
		tipo = "Usável",
		unity = "Não",
		economy = "",
		type = "use",
		weight = 0.00
	},
	["newchars"] = {
		index = "newchars",
		name = "+1 Personagem",
		desc = "Limite de personagem em +1.",
		tipo = "Usável",
		unity = "Não",
		economy = "",
		type = "use",
		weight = 0.00
	},
	["newgarage"] = {
		index = "newgarage",
		name = "+1 Garagem",
		desc = "Limite de garagem em +1.",
		tipo = "Usável",
		unity = "Não",
		economy = "",
		type = "use",
		weight = 0.00
	},
	["premiumplate"] = {
		index = "platepremium",
		name = "Placa Premium",
		desc = "Troca a placa de registro do veículo.",
		tipo = "Usável",
		unity = "Não",
		economy = "",
		type = "use",
		weight = 0.50
	},
	["chip"] = {
		index = "chip",
		name = "Chip de Celular",
		desc = "Troca o numero do Celular.",
		tipo = "Usável",
		unity = "Não",
		economy = "",
		type = "use",
		weight = 0.50
	},
	-- PAREI AQUI
	["energetic"] = {
		index = "energetic",
		name = "Energético",
		desc = "Bebida",
		tipo = "Usável",
		unity = "Não",
		economy = "",
		max = 5,
		type = "use",
		weight = 0.25
	},
	["delivery"] = { -- remover
		index = "delivery",
		name = "Caixa cheia",
		desc = "Sacola Uber",
		tipo = "Material",
		unity = "",
		economy = "",
		type = "use",
		weight = 1.00
	},
	["paper"] = {
		index = "paper",
		name = "Folha de Papel",
		desc = "Folhas",
		tipo = "Material",
		unity = "",
		economy = "",
		type = "use",
		weight = 0.10
	},
	["glue"] = {
		index = "glue",
		name = "Cola",
		desc = "Cola simples",
		tipo = "Material",
		unity = "",
		economy = "",
		type = "use",
		weight = 0.10
	},
	["paperbag"] = { -- remover
		index = "paperbag",
		name = "Saco de Papel",
		desc = "Saco de papel",
		tipo = "Material",
		unity = "",
		economy = "",
		type = "use",
		weight = 0.50
	},
	["battery"] = {
		index = "battery",
		name = "Pilhas",
		desc = "Pilhas descartáveis",
		tipo = "Comum",
		unity = "Não",
		economy = "",
		type = "use",
		weight = 0.20
	},
	["elastic"] = {
		index = "elastic",
		name = "Elástico",
		desc = "Elástico para notas",
		tipo = "Comum",
		unity = "Não",
		economy = "",
		type = "use",
		weight = 0.10
	},
	["plasticbag"] = {
		index = "plasticbag",
		name = "Saco Plastico",
		desc = "Sacola plástica",
		tipo = "Comum",
		unity = "Não",
		economy = "",
		type = "use",
		weight = 0.05
	},
	["plasticbottle"] = {
		index = "plasticbottle",
		name = "Garrafa Plástica",
		desc = "Garrafa vazia",
		tipo = "Comum",
		unity = "Não",
		economy = "",
		type = "use",
		weight = 0.20
	},
	["pin"] = {
		index = "pin",
		name = "Pino Vazio",
		desc = "Pino de plástico",
		tipo = "Comum",
		unity = "Não",
		economy = "",
		type = "use",
		weight = 0.05
	},
	["emptyglassbottle"] = {
		index = "emptyglassbottle",
		name = "Garrafa de Vidro Vazia",
		desc = "Garrafa de vidro vazia",
		tipo = "Comum",
		unity = "Não",
		economy = "",
		type = "use",
		weight = 0.50
	},
	["glassbottle"] = {
		index = "glassbottle",
		name = "Garrafa de Vidro",
		desc = "",
		tipo = "Comum",
		unity = "Não",
		economy = "",
		type = "use",
		weight = 0.50
	},
	["metalcan"] = {
		index = "metalcan",
		name = "Lata de Metal",
		desc = "",
		tipo = "Comum",
		unity = "Não",
		economy = "",
		type = "use",
		weight = 0.20
	},
	["alface"] = {
		index = "alface",
		name = "Alface",
		desc = "Usado para fazer Hamburguer",
		tipo = "Usável",
		unity = "Não",
		economy = "S/E",
		type = "use",
		weight = 0.10
	},
	["bacon"] = {
		index = "bacon",
		name = "Bacon",
		desc = "Usado para fazer Hamburguer",
		tipo = "Usável",
		unity = "Não",
		economy = "S/E",
		type = "use",
		weight = 0.10
	},
	["burguer"] = {
		index = "burguer",
		name = "Hamburguer",
		desc = "Usado para fazer Hamburguer",
		tipo = "Usável",
		unity = "Não",
		economy = "S/E",
		type = "use",
		weight = 0.20
	},
	["milk"] = {
		index = "milk",
		name = "Leite",
		desc = "Usado para fazer Hamburguer",
		tipo = "Usável",
		unity = "Não",
		economy = "S/E",
		type = "use",
		weight = 0.75
	},
	["onion"] = {
		index = "onion",
		name = "Cebola",
		desc = "Usado para fazer Hamburguer",
		tipo = "Usável",
		unity = "Não",
		economy = "S/E",
		type = "use",
		weight = 0.20
	},
	["ovos"] = {
		index = "ovos",
		name = "Ovos",
		desc = "Usado para fazer Hamburguer",
		tipo = "Usável",
		unity = "Não",
		economy = "S/E",
		type = "use",
		weight = 0.15
	},
	["presunto"] = {
		index = "presunto",
		name = "Presunto",
		desc = "Usado para fazer Hamburguer",
		tipo = "Usável",
		unity = "Não",
		economy = "S/E",
		type = "use",
		weight = 0.10
	},
	["queijo"] = {
		index = "queijo",
		name = "Queijo",
		desc = "Usado para fazer Hamburguer",
		tipo = "Usável",
		unity = "Não",
		economy = "S/E",
		type = "use",
		weight = 0.10
	},
	["tomate"] = {
		index = "tomate",
		name = "Tomate",
		desc = "Usado para fazer Hamburguer",
		tipo = "Usável",
		unity = "Não",
		economy = "S/E",
		type = "use",
		weight = 0.25
	},
	["macarronada"] = {
		index = "macarronada",
		name = "macarronada",
		desc = "Macarrão bolonhesa",
		tipo = "Usável",
		unity = "Sim",
		economy = "",
		type = "use",
		subtype = "comida",
		transform = "badmacaronada",
		max = 10,
		durability = 11500,
		weight = 0.25
	},
	["badmacarronada"] = {
		index = "badmacarronada",
		name = "Macarronada vencido",
		desc = "Macarronada Vencida",
		tipo = "Comum",
		unity = "Não",
		economy = "",
		type = "use",
		weight = 0.35
	},
	["cookie"] = {
		index = "cookie",
		name = "Cookie",
		desc = "Cookie de Chocolate",
		tipo = "Usável",
		unity = "Sim",
		economy = "",
		type = "use",
		subtype = "comida",
		transform = "badcookie",
		max = 20,
		durability = 10500,
		weight = 0.25
	},
	["badcookie"] = {
		index = "badcookie",
		name = "Cookie vencido",
		desc = "Cookie Vencida",
		tipo = "Comum",
		unity = "Não",
		economy = "",
		type = "use",
		weight = 0.35
	},
	["weedcookie"] = {
		index = "weedcookie",
		name = "weedCookie",
		desc = "Cookie de Chocolate com um toque especial",
		tipo = "Usável",
		unity = "Sim",
		economy = "",
		type = "use",
		subtype = "comida",
		transform = "badweedcookie",
		max = 50,
		durability = 10500,
		weight = 0.25
	},
	["badweedcookie"] = {
		index = "badweedcookie",
		name = "weedCookie vencido",
		desc = "Weed Cookie Vencida",
		tipo = "Comum",
		unity = "Não",
		economy = "",
		type = "use",
		weight = 0.35
	},
	["farinha"] = {
		index = "farinha",
		name = "Farinha",
		desc = "Usado para fazer Cookie",
		tipo = "Usável",
		unity = "Não",
		economy = "S/E",
		type = "use",
		weight = 0.10
	},
	["macarrao"] = {
		index = "macarrao",
		name = "macarrao",
		desc = "Usado para fazer Macarrão",
		tipo = "Usável",
		unity = "Não",
		economy = "S/E",
		type = "use",
		weight = 0.10
	},
	["molho"] = {
		index = "molho",
		name = "Molho",
		desc = "Usado para fazer Macarrão",
		tipo = "Usável",
		unity = "Não",
		economy = "S/E",
		type = "use",
		weight = 0.10
	},
	["emptybottle"] = {
		index = "emptybottle",
		name = "Garrafa Vazia",
		desc = "Garrafa Vazia",
		tipo = "Usável",
		unity = "Não",
		economy = "",
		type = "use",
		weight = 0.10
	},
	["water"] = {
		index = "water",
		name = "Água",
		desc = "Água Limpa",
		tipo = "Usável",
		unity = "Não",
		economy = "2",
		type = "use",
		weight = 0.15
	},
	["dirtywater"] = {
		index = "dirtywater",
		name = "Água Suja",
		desc = "Impossivel Beber",
		tipo = "Usável",
		unity = "Não",
		economy = "",
		type = "use",
		weight = 0.15
	},
	["cellbattery"] = {
		index = "cellbattery",
		name = "Bateria de celular",
		desc = "",
		tipo = "Usável",
		unity = "Não",
		economy = "35",
		type = "use",
		weight = 0.75
	},
	["cellphone"] = {
		index = "cellphone",
		name = "Celular",
		desc = "Celular funcionando",
		tipo = "Usável",
		unity = "Sim",
		economy = "300",
		type = "use",
		subtype = "eletronico",
		transform = "nbcellphone",
		max = 99999,
		durability = 30000,
		weight = 0.75
	},
	["nbcellphone"] = {
        index = "nbcellphone",
        name = "Celular",
		desc = "Celular sem bateria",
		tipo = "Comum",
		unity = "Não",
		economy = "S/E",
        type = "use",
        weight = 0.75
    },
	["cellphonedamaged"] = {
        index = "cellphonedamaged",
        name = "Celular Queimado",
		desc = "Celular totalmente queimado",
		tipo = "Eletrônico",
		unity = "Não",
		economy = "S/E",
        type = "use",
        weight = 0.85
    },
-- SUBTYPE COMIDA
-- subtype = "comida",
-- transform = "comida-estragada",
-- durability = 1500,
    ["cola"] = {
		index = "cola",
		name = "Cola",
		desc = "Refrigerante de Cola",
		tipo = "Usável",
		unity = "Sim",
		economy = "4",
		type = "use",
		subtype = "comida",
		transform = "badcola",
		max = 5,
		durability = 22500,
		weight = 0.15
	},
	["badcola"] = {
		index = "badcola",
		name = "Cola vencida",
		desc = "Coca vencida",
		tipo = "Usável",
		unity = "Não",
		economy = "",
		type = "use",
		weight = 0.15
	},
    ["soda"] = {
		index = "soda",
		name = "Sprunk",
		desc = "Deliciosa Soda",
		tipo = "Usável",
		unity = "Sim",
		economy = "4",
		type = "use",
		subtype = "comida",
		transform = "badsoda",
		max = 5,
		durability = 22500,
		weight = 0.15
	},
	["badsoda"] = {
		index = "badsoda",
		name = "Sprunk vencida",
		desc = "Refrigerante vencido",
		tipo = "Usável",
		unity = "Não",
		economy = "",
		type = "use",
		weight = 0.15
	},
	["coffee"] = {
		index = "coffee",
		name = "Café",
		desc = "Delicioso Café",
		tipo = "Usável",
		unity = "Sim",
		economy = "10",
		type = "use",
		subtype = "comida",
		transform = "badcoffee",
		max = 5,
		durability = 15000,
		weight = 0.15
	},
	["badcoffee"] = {
		index = "badcoffee",
		name = "Café vencido",
		desc = "Café estragado",
		tipo = "Usável",
		unity = "Não",
		economy = "",
		type = "use",
		weight = 0.15
	},
	["hamburger"] = {
		index = "hamburger",
		name = "Hambúrguer",
		desc = "Delicio Hamburguer",
		tipo = "Usável",
		unity = "Sim",
		economy = "6",
		type = "use",
		subtype = "comida",
		transform = "badhamburger",
		max = 5,
		durability = 8500,
		weight = 0.35
	},
	["badhamburger"] = {
		index = "badhamburger",
		name = "Hambúrguer vencido",
		desc = "Hambúrguer estragado",
		tipo = "Comum",
		unity = "Não",
		economy = "800",
		type = "use",
		weight = 0.35
	},
	["hotdog"] = {
		index = "hotdog",
		name = "Cachorro-Quente",
		desc = "Delicio lanche",
		tipo = "Usável",
		unity = "Sim",
		economy = "10",
		type = "use",
		subtype = "comida",
		transform = "badhotdog",
		max = 5,
		durability = 8500,
		weight = 0.35
	},
	["badhotdog"] = {
		index = "badhotdog",
		name = "Cachorro-Quente vencido",
		desc = "Lanche Vencido",
		tipo = "Comum",
		unity = "Não",
		economy = "",
		type = "use",
		weight = 0.35
	},
	["mistureba"] = {
		index = "mistureba",
		name = "Mistureba",
		desc = "Comida de Cadeia",
		tipo = "Usável",
		unity = "Sim",
		economy = "",
		type = "use",
		subtype = "comida",
		transform = "badmistureba",
		max = 5,
		durability = 10500,
		weight = 0.35
	},
	["badmistureba"] = {
		index = "badmistureba",
		name = "Mistureba Vencido",
		desc = "Comida de cadeia",
		tipo = "Comum",
		unity = "Não",
		economy = "",
		type = "use",
		weight = 0.35
	},
	["sandwich"] = {
		index = "sandwich",
		name = "Sanduiche",
		desc = "Delicioso sanduiche",
		tipo = "Usável",
		unity = "Sim",
		economy = "3",
		type = "use",
		subtype = "comida",
		transform = "badhamburger",
		max = 5,
		durability = 8500,
		weight = 0.25
	},
	["badsandwich"] = {
		index = "badsandwich",
		name = "Sanduiche vencido",
		desc = "Sanduiche estragado",
		tipo = "Comum",
		unity = "Não",
		economy = "",
		type = "use",
		weight = 0.25
	},
	["chocolate"] = {
		index = "chocolate",
		name = "Chocolate",
		desc = "Delicioso Chocolate",
		tipo = "Usável",
		unity = "Sim",
		economy = "4",
		type = "use",
		subtype = "comida",
		transform = "badchocolate",
		max = 5,
		durability = 12500,
		weight = 0.10
	},
	["badchocolate"] = {
		index = "badchocolate",
		name = "Chocolate vencido",
		desc = "Chocolate estragado",
		tipo = "Comum",
		unity = "Não",
		economy = "",
		type = "use",
		weight = 0.10
	},
	["donut"] = {
		index = "donut",
		name = "Donut",
		desc = "Delicioso donut",
		tipo = "Usável",
		unity = "Sim",
		economy = "4",
		type = "use",
		subtype = "comida",
		transform = "baddonut",
		max = 5,
		durability = 12500,
		weight = 0.20
	},
	["baddonut"] = {
		index = "baddonut",
		name = "Donut vencido",
		desc = "Donut estragado",
		tipo = "Comum",
		unity = "Não",
		economy = "",
		type = "use",
		weight = 0.20
	},
	["tacos"] = {
		index = "tacos",
		name = "Tacos",
		desc = "Deliciso taco",
		tipo = "Usável",
		unity = "Sim",
		economy = "4",
		type = "use",
		subtype = "comida",
		transform = "badtacos",
		max = 5,
		durability = 8500,
		weight = 0.25
	},
	["badtacos"] = {
		index = "badtacos",
		name = "Tacos vencido",
		desc = "Taco estragado",
		tipo = "Comum",
		unity = "Não",
		economy = "350",
		type = "use",
		weight = 0.25
	},
-- END SUBTYPE COMIDA
	["bread"] = {
		index = "bread",
		name = "Pão",
		desc = "Usado para fazer Hambúrguer",
		tipo = "Usável",
		unity = "Não",
		economy = "5",
		type = "use",
		weight = 0.25
	},
	["plate"] = {
		index = "plate",
		name = "Placa",
		desc = "Sinalização",
		tipo = "Usável",
		unity = "Não",
		economy = "",
		type = "use",
		weight = 0.50
	},
	["lockpick"] = {
		index = "lockpick",
		name = "Lockpick",
		desc = "Utilizado para arrombar",
		tipo = "Usável",
		unity = "Não",
		max = 2,
		economy = "500",
		type = "use",
		weight = 1.25
	},
	["lockpick2"] = {
		index = "lockpick2",
		name = "Lockpick Quebrado",
		desc = "Utilizado para arrombar",
		tipo = "Comum",
		unity = "Não",
		economy = "200",
		type = "use",
		weight = 1.25
	},
	["toolbox"] = {
		index = "toolbox",
		name = "Caixa de Ferramentas",
		desc = "Utilizado para concertos",
		tipo = "Ferramentas",
		unity = "Não",
		economy = "800",
		type = "use",
		weight = 1.75
	},
	["notepad"] = {
		index = "notepad",
		name = "Bloco de Notas",
		desc = "Caderneta de anotações",
		tipo = "Usável",
		unity = "Não",
		economy = "10",
		type = "use",
		weight = 0.25
	},
	["tires"] = {
		index = "tires",
		name = "Pneus",
		desc = "Pneu Borracha",
		tipo = "Material",
		unity = "Não",
		economy = "400",
		type = "use",
		weight = 1.50
	},
	["divingsuit"] = {
		index = "divingsuit",
		name = "Roupa de Mergulho",
		desc = "Utilizado para mergulhar",
		tipo = "Usável",
		unity = "Não",
		economy = "2000",
		type = "use",
		weight = 4.75
	},
	["ametista"] = {
		index = "ametista",
		name = "Ametista",
		desc = "Pedra preciosa",
		tipo = "Minério",
		unity = "Não",
		economy = "",
		type = "use",
		weight = 0.50
	},
	["diamante"] = {
		index = "diamante",
		desc = "Pedra preciosa",
		tipo = "Minério",
		unity = "Não",
		economy = "",
		type = "use",
		weight = 0.50
	},
	["esmeralda"] = {
		index = "esmeralda",
		name = "Esmeralda",
		desc = "Pedra preciosa",
		tipo = "Minério",
		unity = "Não",
		economy = "",
		type = "use",
		weight = 0.50
	},
	["rubi"] = {
		index = "rubi",
		name = "Rubi",
		desc = "Pedra preciosa",
		tipo = "Minério",
		unity = "Não",
		economy = "",
		type = "use",
		weight = 0.50
	},
	["safira"] = {
		index = "safira",
		name = "Safira",
		desc = "Pedra preciosa",
		tipo = "Minério",
		unity = "Não",
		economy = "",
		type = "use",
		weight = 0.50
	},
	["turquesa"] = {
		index = "turquesa",
		name = "Turquesa",
		desc = "Pedra preciosa",
		tipo = "Minério",
		unity = "Não",
		economy = "",
		type = "use",
		weight = 0.50
	},
	["ambar"] = {
		index = "ambar",
		name = "Âmbar",
		desc = "Pedra preciosa",
		tipo = "Minério",
		unity = "Não",
		economy = "",
		type = "use",
		weight = 0.50
	},
	["gemstone"] = {
		index = "gemstone",
		name = "Bitcoins",
		desc = "Bitcoins",
		tipo = "Usável",
		unity = "Não",
		economy = "",
		type = "use",
		weight = 0.10
	},
	["handcuff"] = {
		index = "handcuff",
		name = "Algemas",
		desc = "Utilizado para prender",
		tipo = "Objeto",
		unity = "",
		economy = "",
		type = "use",
		weight = 1.00
	},
	["rope"] = {
		index = "rope",
		name = "Cordas",
		desc = "Serve para amarrar",
		tipo = "Usável",
		unity = "Não",
		economy = "",
		type = "use",
		weight = 1.50
	},
	["hood"] = {
		index = "hood",
		name = "Capuz",
		desc = "Colocar na cabeça",
		tipo = "Ilicito",
		unity = "",
		economy = "",
		type = "use",
		weight = 1.00
	},
	["pilhas"] = {
		index = "pilhas",
		name = "Pilhas",
		desc = "Energia",
		tipo = "Material",
		unity = "Não",
		economy = "10",
		type = "use",
		weight = 0.25
	},
	["key"] = {
		index = "key",
		name = "Chaves",
		desc = "Chaves",
		tipo = "Comum",
		unity = "Não",
		economy = "45",
		type = "use",
		weight = 0.25
	},
	["fabric"] = {
		index = "fabric",
		name = "Tecido",
		desc = "Material Tecido",
		tipo = "Comum",
		unity = "Não",
		economy = "75",
		type = "use",
		weight = 0.050
	},
	["plastic"] = {
		index = "plastic",
		name = "Plástico",
		desc = "Material Plástico",
		tipo = "Material",
		unity = "Não",
		economy = "6",
		type = "use",
		weight = 0.07
	},
	["glass"] = {
		index = "glass",
		name = "Vidro",
		desc = "Material Vidro",
		tipo = "Material",
		unity = "Não",
		economy = "6",
		type = "use",
		weight = 0.07
	},
	["rubber"] = {
		index = "rubber",
		name = "Borracha",
		desc = "Material Borracha",
		tipo = "Material",
		unity = "Não",
		economy = "6",
		type = "use",
		weight = 0.05
	},
	["aluminum"] = {
		index = "aluminum",
		name = "Alúminio",
		desc = "Material Aluminio",
		tipo = "Material",
		unity = "Não",
		economy = "6",
		type = "use",
		weight = 0.05
	},
	["copper"] = {
		index = "copper",
		name = "Cobre",
		desc = "Material Cobre",
		tipo = "Material",
		unity = "Não",
		economy = "6",
		type = "use",
		weight = 0.05
	},
	["eletronics"] = {
		index = "eletronics",
		name = "Eletrônico",
		desc = "Componente Eletrônico",
		tipo = "Periférico",
		unity = "",
		economy = "",
		type = "use",
		weight = 1.80
	},
	["notebook"] = {
		index = "notebook",
		name = "Notebook",
		desc = "Micro Computador",
		tipo = "Componente",
		unity = "",
		economy = "",
		type = "use",
		weight = 6.00
	},
	["jammer"] = {
		index = "jammer",
		name = "Jammer",
		desc = "Jammer pronto pra ativar!",
		tipo = "Componente",
		unity = "",
		economy = "",
		type = "use",
		weight = 3.00
	},
	["keyboard"] = {
		index = "keyboard",
		name = "Teclado",
		desc = "Digitar",
		tipo = "Componente",
		unity = "",
		economy = "",
		type = "use",
		weight = 2.50
	},
	["mouse"] = {
		index = "mouse",
		name = "Mouse",
		desc = "Mouse",
		tipo = "Componente",
		unity = "",
		economy = "",
		type = "use",
		weight = 1.50
	},
	["ring"] = {
		index = "ring",
		name = "Anel",
		desc = "Lindo anel",
		tipo = "Jóia",
		unity = "",
		economy = "",
		type = "use",
		weight = 2.60
	},
	["watch"] = {
		index = "watch",
		name = "Relógio",
		desc = "Veja as horas",
		tipo = "Item",
		unity = "",
		economy = "",
		type = "use",
		weight = 1.20
	},
	["c4"] = {
		index = "c4",
		name = "C4",
		desc = "Bomba explosiva",
		tipo = "Usável",
		unity = "Não",
		economy = "",
		type = "use",
		weight = 2.50
	},
	["ritmoneury"] = {
		index = "ritmoneury",
		name = "Ritmoneury",
		desc = "Tratamento de insônia",
		tipo = "Usável",
		unity = "Não",
		economy = "40",
		type = "use",
		weight = 0.25
	},
	["sinkalmy"] = {
		index = "sinkalmy",
		name = "Sinkalmy",
		desc = "Tratamento de stress",
		tipo = "Usável",
		unity = "Não",
		economy = "45",
		type = "use",
		weight = 0.25
	},
	["cigarette"] = {
		index = "cigarette",
		name = "Cigarro",
		desc = "Retira o stress",
		tipo = "Usável",
		unity = "Não",
		economy = "10",
		type = "use",
		weight = 0.05
	},
	["lighter"] = {
		index = "lighter",
		name = "Isqueiro",
		desc = "Utilizado para acender",
		tipo = "Usável",
		unity = "Não",
		economy = "10",
		type = "use",
		weight = 0.25
	},
	["vape"] = {
		index = "vape",
		name = "Vape",
		desc = "Retira o stress",
		tipo = "Usável",
		unity = "Não",
		economy = "600",
		type = "use",
		weight = 0.75
	},
	["jornal"] = {
		index = "jornal",
		name = "Jornal",
		desc = "Material informativo",
		tipo = "Material",
		unity = "Não",
		economy = "10",
		type = "use",
		weight = 0.38
	},
	["havanaticket"] = {
		index = "havanaticket",
		name = "Havana Ticket",
		desc = "Vale Compras",
		tipo = "Comum",
		unity = "Não",
		economy = "S/E",
		type = "use",
		weight = 0.0001
	},
	["cartaodebito"] = {
		index = "cartaodebito",
		name = "Cartão de Débito",
		desc = "Cartão de débito para realizar contas com dinheiro no banco.",
		tipo = "Comum",
		unity = "Não",
		economy = "S/E",
		type = "use",
		weight = 0.0001
	},
	["dollars"] = {
		index = "dollars",
		name = "Dólares",
		desc = "Dinheiro",
		tipo = "Comum",
		unity = "Não",
		economy = "S/E",
		type = "use",
		weight = 0.0001
	},
	["dollars2"] = {
		index = "dollars2",
		name = "Dólares Marcados",
		desc = "Dinheiro Ilicito",
		tipo = "Comum",
		unity = "Não",
		economy = "S/E",
		type = "use",
		weight = 0.0001
	},
	["crachasix"] = {
		index = "crachasix",
		name = "CrachaSix",
		desc = "Abrir Carro Forte",
		tipo = "Usável",
		unity = "",
		economy = "",
		type = "use",
		weight = 0.10
	},
	["card01"] = {
		index = "card01",
		name = "Cartão Classic",
		desc = "Hackear Lojas de Departamento.",
		tipo = "Usável",
		unity = "",
		economy = "",
		type = "use",
		weight = 0.10
	},
	["card02"] = {
		index = "card02",
		name = "Cartão Gold",
		desc = "Hackear Lojas de Armas.",
		tipo = "Usável",
		unity = "",
		economy = "",
		type = "use",
		weight = 0.10
	},
	["card03"] = {
		index = "card03",
		name = "Cartão Platinum",
		desc = "Hackear Bancos Fleeca.",
		tipo = "Usável",
		unity = "",
		economy = "",
		type = "use",
		weight = 0.10
	},
	["card04"] = {
		index = "card04",
		name = "Cartão Standard",
		desc = "Hackear Barbearias.",
		tipo = "Usável",
		unity = "",
		economy = "",
		type = "use",
		weight = 0.10
	},
	["card05"] = {
		index = "card05",
		name = "Cartão Black",
		desc = "Hackear Bancos.",
		tipo = "Usável",
		unity = "",
		economy = "",
		type = "use",
		weight = 0.10
	},
	["hardness"] = {
		index = "hardness",
		name = "Cinto Reforçado",
		desc = "Cinto protetor",
		tipo = "Usável",
		unity = "Não",
		economy = "",
		type = "use",
		weight = 5.00
	},
	["rose"] = {
		index = "rose",
		name = "Rosa",
		desc = "Rosa cheirosa",
		tipo = "Usável",
		unity = "Não",
		economy = "8",
		type = "use",
		weight = 0.15
	},
	["teddy"] = {
		index = "teddy",
		name = "Teddy",
		desc = "Prente carinhoso",
		tipo = "Usável",
		unity = "Não",
		economy = "24",
		type = "use",
		weight = 0.75
	},
	["absolut"] = {
		index = "absolut",
		name = "Absolut",
		desc = "Vodka",
		tipo = "Usável",
		unity = "Não",
		economy = "40",
		type = "use",
		weight = 0.25
	},
	["chandon"] = {
		index = "chandon",
		name = "Chandon",
		desc = "Espumante",
		tipo = "Usável",
		unity = "Não",
		economy = "120",
		type = "use",
		weight = 0.35
	},
	["dewars"] = {
		index = "dewars",
		name = "Dewars",
		desc = "Whisky Escocês",
		tipo = "Usável",
		unity = "Não",
		economy = "120",
		type = "use",
		weight = 0.25
	},
	["hennessy"] = {
		index = "hennessy",
		name = "Hennessy",
		desc = "Conhaque",
		tipo = "Usável",
		unity = "Não",
		economy = "120",
		type = "use",
		weight = 0.25
	},
	["identity"] = {
		index = "identity",
		name = "Identidade",
		desc = "Registro",
		tipo = "Documento",
		unity = "",
		economy = "100",
		type = "use",
		weight = 1.50
	},
	["portec"] = {
		index = "portec",
		name = "P. Civil",
		desc = "Caça de civil",
		tipo = "Documento",
		unity = "",
		economy = "5000",
		type = "use",
		weight = 1.50
	},
	["portef"] = {
		index = "portef",
		name = "P. Fazendeiro",
		desc = "Caça de fazendeiro",
		tipo = "Documento",
		unity = "",
		economy = "2500",
		type = "use",
		weight = 1.50
	},
	["portes"] = {
		index = "portes",
		name = "P. Caça",
		desc = "Utilizado para caça",
		tipo = "Documento",
		unity = "",
		economy = "1000",
		type = "use",
		weight = 1.50
	},
	["goldbar"] = {
		index = "goldbar",
		name = "Barra de Ouro",
		desc = "Linguote de Ouro",
		tipo = "Comum",
		unity = "Não",
		economy = "200",
		type = "use",
		weight = 0.25
	},
	["binoculars"] = {
		index = "binoculars",
		name = "Binóculos",
		desc = "Serve para Observação",
		tipo = "Usável",
		unity = "Não",
		economy = "40",
		type = "use",
		weight = 0.75
	},
	["camera"] = {
		index = "camera",
		name = "Câmera",
		desc = "Aparelho fotográfico",
		tipo = "Usável",
		unity = "Não",
		economy = "60",
		type = "use",
		weight = 2.25
	},
	["playstation"] = {
		index = "playstation",
		name = "Playstation",
		desc = "Console Game",
		tipo = "Console",
		unity = "",
		economy = "",
		type = "use",
		weight = 5.00
	},
	["xbox"] = {
		index = "xbox",
		name = "Xbox",
		desc = "Console Game",
		tipo = "Console",
		unity = "",
		economy = "",
		type = "use",
		weight = 6.00
	},
	["legos"] = {
		index = "legos",
		name = "Legos",
		desc = "Brinquedo lego",
		tipo = "Brinquedo",
		unity = "",
		economy = "",
		type = "use",
		weight = 2.50
	},
	["ominitrix"] = {
		index = "ominitrix",
		name = "Ominitrix",
		desc = "Relógio do Ben 10",
		tipo = "Brinquedo",
		unity = "",
		economy = "",
		type = "use",
		weight = 2.50
	},
	["bracelet"] = {
		index = "bracelet",
		name = "Bracelete",
		desc = "Lindo Bracelete",
		tipo = "Jóia",
		unity = "",
		economy = "",
		type = "use",
		weight = 3.50
	},
	["dildo"] = {
		index = "dildo",
		name = "Vibrador",
		desc = "Brinquedinho",
		tipo = "Eletronico",
		unity = "",
		economy = "",
		type = "use",
		weight = 1.50
	},
	["painting1"] = {
		index = "painting1",
		name = "Pablo Picasso",
		desc = "Pintura",
		tipo = "pintura",
		unity = "",
		economy = "",
		type = "use",
		weight = 3.50
	},
	["painting2"] = {
		index = "painting2",
		name = "Vincent van Gogh",
		desc = "Pintura",
		tipo = "pintura",
		unity = "",
		economy = "",
		type = "use",
		weight = 3.00
	},
	["painting3"] = {
		index = "painting3",
		name = "Salvador Dalí",
		desc = "Pintura",
		tipo = "pintura",
		unity = "",
		economy = "",
		type = "use",
		weight = 3.00
	},
	["painting4"] = {
		index = "painting4",
		name = "René Magritte",
		desc = "Pintura",
		tipo = "pintura",
		unity = "",
		economy = "",
		type = "use",
		weight = 3.00
	},
	["WEAPON_KNIFE"] = {
		index = "knife",
		name = "Faca",
		desc = "Pequena faca",
		tipo = "Arma branca",
		unity = "",
		economy = "",
		type = "equip",
		weight = 1.50
	},
	["WEAPON_SNOWBALL"] = {
	    index = "snowball",
		name = "Snowball",
		desc = "Tijolo",
		tipo = "Armamento",
		unity = "",
		economy = "",
		type = "equip",
		ammo = "WEAPON_SNOWBALL_AMMO",
		weight = 0.20
    },
	["WEAPON_SNOWBALL_AMMO"] = {
		index = "snowballammo",
		name = "M.Snowball",
		desc = "tijolin",
		tipo = "Munição",
		unity = "",
		economy = "",
		type = "recharge",
		weight = 0.05
	},
	["WEAPON_HATCHET"] = {
		index = "hatchet",
		name = "Machado",
		desc = "Machado",
		tipo = "Armamento",
		unity = "Não",
		economy = "400",
		type = "equip",
		weight = 0.75
	},
	["WEAPON_BAT"] = {
		index = "bat",
		name = "Bastão de Beisebol",
		desc = "Bastão de Beisebol",
		tipo = "Armamento",
		unity = "Não",
		economy = "340",
		type = "equip",
		weight = 0.75
	},
	["WEAPON_BATTLEAXE"] = {
		index = "battleaxe",
		name = "Machado de Batalha",
		desc = "Machadinha",
		tipo = "Armamento",
		unity = "Não",
		economy = "400",
		type = "equip",
		weight = 0.75
	},
	["WEAPON_BOTTLE"] = {
		index = "bottle",
		name = "Garrafa",
		desc = "Garrafa vazia",
		tipo = "Arma Branca",
		unity = "",
		economy = "",
		type = "equip",
		weight = 2.50
	},
	["WEAPON_CROWBAR"] = {
		index = "crowbar",
		name = "Pé de Cabra",
		desc = "Utilizado para abrir",
		tipo = "Armamento",
		unity = "Não",
		economy = "",
		type = "equip",
		weight = 0.75
	},
	["WEAPON_DAGGER"] = {
		index = "dagger",
		name = "Adaga",
		desc = "Pequena faca",
		tipo = "Arma Branca",
		unity = "",
		economy = "",
		type = "equip",
		weight = 1.50
	},
	["WEAPON_GOLFCLUB"] = {
		index = "golfclub",
		name = "Taco de Golf",
		desc = "Utilizado para golf",
		tipo = "Armamento",
		unity = "Não",
		economy = "250",
		type = "equip",
		weight = 0.75
	},
	["WEAPON_HAMMER"] = {
		index = "hammer",
		name = "Martelo",
		desc = "Utilizado em obra",
		tipo = "Armamento",
		unity = "Não",
		economy = "200",
		type = "equip",
		weight = 0.75
	},
	["WEAPON_MACHETE"] = {
		index = "machete",
		name = "Facão",
		desc = "Facao com corte",
		tipo = "Armamento",
		unity = "Não",
		economy = "400",
		type = "equip",
		weight = 0.75
	},
	["WEAPON_POOLCUE"] = {
		index = "poolcue",
		name = "Taco de Sinuca",
		desc = "Bastao de sinuca",
		tipo = "Armamento",
		unity = "Não",
		economy = "120",
		type = "equip",
		weight = 0.75
	},
	["WEAPON_STONE_HATCHET"] = {
		index = "stonehatchet",
		name = "Machado de Pedra",
		desc = "Pequeno machado de pedra",
		tipo = "Armamento",
		unity = "Não",
		economy = "400",
		type = "equip",
		weight = 0.75
	},
	["WEAPON_SWITCHBLADE"] = {
		index = "switchblade",
		name = "Canivete",
		desc = "Utilizada para remoção de carne.",
		tipo = "Usável",
		unity = "Não",
		economy = "350",
		type = "equip",
		weight = 0.75
	},
	["WEAPON_WRENCH"] = {
		index = "wrench",
		name = "Chave Inglesa",
		desc = "Utilizado para concertar",
		tipo = "Armamento",
		unity = "Não",
		economy = "",
		type = "equip",
		weight = 0.75
	},
	["WEAPON_KNUCKLE"] = {
		index = "knuckle",
		name = "Soco Inglês",
		desc = "Utilizado para socar",
		tipo = "Armamento",
		unity = "Não",
		economy = "450",
		type = "equip",
		weight = 0.75
	},
	["WEAPON_FLASHLIGHT"] = {
		index = "flashlight",
		name = "Lanterna",
		desc = "Utilizado para iluminar",
		tipo = "Armamento",
		unity = "Não",
		economy = "40",
		type = "equip",
		weight = 0.75
	},
	["WEAPON_NIGHTSTICK"] = {
		index = "nightstick",
		name = "Cassetete",
		desc = "Utilizado para Segurança",
		tipo = "Armamento",
		unity = "Não",
		economy = "",
		type = "equip",
		weight = 0.75
	},
	["WEAPON_PETROLCAN"] = {
		index = "gallon",
		name = "Galão",
		desc = "Gasolina",
		tipo = "Container",
		unity = "",
		economy = "",
		type = "equip",
		ammo = "WEAPON_PETROLCAN_AMMO",
		weight = 2.50
	},
	["GADGET_PARACHUTE"] = {
		index = "parachute",
		name = "Paraquedas",
		desc = "Utilizado para salto",
		tipo = "Usável",
		unity = "Não",
		economy = "800",
		type = "equip",
		weight = 2.25
	},
	["WEAPON_STUNGUN"] = {
		index = "stungun",
		name = "Tazer",
		desc = "Arma de Choque",
		tipo = "Arma",
		unity = "",
		economy = "",
		type = "equip",
		weight = 2.00
	},
	["WEAPON_FIREEXTINGUISHER"] = {
		index = "extinguisher",
		name = "Extintor",
		desc = "Apagar Incendio",
		tipo = "Consumivel",
		unity = "",
		economy = "",
		type = "equip",
		weight = 3.00
	},
	
 -- START PISTOLS
    ["WEAPON_PISTOL"] = {
	    index = "m1911",
		name = "M1911",
		desc = "Pistola semiautomatica",
		tipo = "Pistola",
		unity = "",
		economy = "",
		type = "equip",
		ammo = "WEAPON_PISTOL_AMMO",
		weight = 2.00
    },
	["WEAPON_PISTOL_MK2"] = {
		index = "fiveseven",
		name = "FN Five Seven",
		desc = "Pistola semi-automatica",
		tipo = "Pistola",
		unity = "",
		economy = "",
		type = "equip",
		ammo = "WEAPON_PISTOL_MK2_AMMO",
		weight = 2.00
	},
	["WEAPON_APPISTOL"] = {
	    index = "kochvp9",
	    name = "Koch Vp9",
		desc = "Pistola leve",
		tipo = "Pistola",
		unity = "",
		economy = "",
		type = "equip",
		ammo = "WEAPON_APPISTOL_AMMO",
		weight = 2.00
	},
    ["WEAPON_HEAVYPISTOL"] = {
		index = "atifx45",
		name = "Ati FX45",
		desc = "Pistola leve",
		tipo = "Pistola",
		unity = "",
		economy = "",
		type = "equip",
		ammo = "WEAPON_HEAVYPISTOL_AMMO",
		weight = 2.00
	},
	["WEAPON_SNSPISTOL"] = {
		index = "amt380",
		name = "AMT 380",
		desc = "Pistola leve",
		tipo = "Pistola",
		unity = "",
		economy = "",
		type = "equip",
		ammo = "WEAPON_SNSPISTOL_AMMO",
		weight = 2.00
	},
	["WEAPON_SNSPISTOL_MK2"] = {
		index = "hkp7m10",
		name = "HK P7M10",
		desc = "Pistola leve",
		tipo = "Pistola",
		unity = "",
		economy = "",
		type = "equip",
		ammo = "WEAPON_SNSPISTOL_MK2_AMMO",
		weight = 2.00
	},
	["WEAPON_VINTAGEPISTOL"] = {
		index = "m1922",
		name = "M1922",
		desc = "Pistola leve",
		tipo = "Pistola",
		unity = "",
		economy = "",
		type = "equip",
		ammo = "WEAPON_VINTAGEPISTOL_AMMO",
		weight = 2.00
	},
	["WEAPON_PISTOL50"] = {
		index = "desert",
		name = "Desert Eagle",
		desc = "Pistola semiautomática",
		tipo = "Pistola",
		unity = "",
		economy = "",
		type = "equip",
		ammo = "WEAPON_PISTOL50_AMMO",
		weight = 2.00
	},
	["WEAPON_REVOLVER"] = {
		index = "magnum",
		name = "Magnum 44",
		desc = "Pistola Grosso Calibre",
		tipo = "Pistola",
		unity = "",
		economy = "",
		type = "equip",
		ammo = "WEAPON_REVOLVER_AMMO",
		weight = 2.00
	},
	["WEAPON_COMBATPISTOL"] = {
		index = "glock",
		name = "Glock",
		desc = "Pistola semiautomática",
		tipo = "Pistola",
		unity = "",
		economy = "",
		type = "equip",
		ammo = "WEAPON_COMBATPISTOL_AMMO",
		weight = 2.00
	},
	["WEAPON_PISTOL_AMMO"] = {
		index = "m1911ammo",
		name = "M. M1911",
		desc = "Munição de M1911",
		tipo = "Munição",
		unity = "",
		economy = "",
		type = "recharge",
		weight = 0.10
	},
	["WEAPON_PISTOL_MK2_AMMO"] = {
		index = "fivesevenammo",
		name = "M. Five Seven",
		desc = "Pistola semiautomática",
		tipo = "Munição",
		unity = "",
		economy = "",
		type = "recharge",
		weight = 0.10
	},
	["origami"] = {
		index = "origami",
		name = "Origami",
		desc = "Item Raro",
		tipo = "Raro",
		unity = "",
		economy = "",
		type = "use",
		weight = 0.10
	},
	["abobora"] = {
		index = "abobora",
		name = "Broba",
		desc = "Evento Halloween troque na Life Invader",
		tipo = "Raro",
		unity = "",
		economy = "",
		type = "use",
		weight = 0.10
	},
	["WEAPON_APPISTOL_AMMO"] = {
		index = "kochvp9ammo",
		name = "M. Koch Vp9",
		desc = "Pistola semiautomática",
		tipo = "Munição",
		unity = "",
		economy = "",
		type = "recharge",
		weight = 0.10
	},
	["WEAPON_HEAVYPISTOL_AMMO"] = {
		index = "atifx45ammo",
		name = "M. Ati FX45",
		desc = "Pistola semiautomática",
		tipo = "Munição",
		unity = "",
		economy = "",
		type = "recharge",
		weight = 0.10
	},
	["WEAPON_SNSPISTOL_AMMO"] = {
		index = "amt380ammo",
		name = "M. AMT 380",
		desc = "Pistola semiautomática",
		tipo = "Munição",
		unity = "",
		economy = "",
		type = "recharge",
		weight = 0.10
	},
	["WEAPON_SNSPISTOL_MK2_AMMO"] = {
		index = "hkp7m10ammo",
		name = "M. HK P7M10",
		desc = "Pistola semiautomática",
		tipo = "Munição",
		unity = "",
		economy = "",
		type = "recharge",
		weight = 0.10
	},
	["WEAPON_VINTAGEPISTOL_AMMO"] = {
		index = "m1922ammo",
		name = "M. M1922",
		desc = "Pistola semiautomática",
		tipo = "Munição",
		unity = "",
		economy = "",
		type = "recharge",
		weight = 0.10
	},
	["WEAPON_PISTOL50_AMMO"] = {
		index = "desertammo",
		name = "M. Desert Eagle",
		desc = "Pistola semiautomática",
		tipo = "Munição",
		unity = "",
		economy = "",
		type = "recharge",
		weight = 0.10
	},
	["WEAPON_REVOLVER_AMMO"] = {
		index = "magnumammo",
		name = "M. Magnum 44",
		desc = "Revolver",
		tipo = "Munição",
		unity = "",
		economy = "",
		type = "recharge",
		weight = 0.10
	},
	["WEAPON_COMBATPISTOL_AMMO"] = {
		index = "glockammo",
		name = "M. Glock",
		desc = "Pistola semiautomática",
		tipo = "Munição",
		unity = "",
		economy = "",
		type = "recharge",
		weight = 0.10
	},
	["WEAPON_SMG_MK2_AMMO"] = {
		index = "smg2ammo",
		name = "M. SMG2",
		desc = "munição smg mk2",
		tipo = "Munição",
		unity = "",
		economy = "",
		type = "recharge",
		weight = 0.10
	},
 -- END PISTOLS

 -- START SMG
    ["WEAPON_COMPACTRIFLE"] = {
		index = "akcompact",
		name = "AK Compact",
		desc = "Assault portatil",
		tipo = "Metralhadora",
		unity = "",
		economy = "",
		type = "equip",
		ammo = "WEAPON_COMPACTRIFLE_AMMO",
		weight = 3.00
	},
	["WEAPON_SMG_MK2"] = {
		index = "smgmk2",
		name = "Smg Mk2",
		desc = "Assault portatil",
		tipo = "Metralhadora",
		unity = "",
		economy = "",
		type = "equip",
		ammo = "WEAPON_SMG_MK2_AMMO",
		weight = 3.00
	},
	["WEAPON_MICROSMG"] = {
		index = "uzi",
		name = "Uzi",
		desc = "Assault portatil",
		tipo = "Metralhadora",
		unity = "",
		economy = "",
		type = "equip",
		ammo = "WEAPON_MICROSMG_AMMO",
		weight = 3.00
	},
	["WEAPON_MINISMG"] = {
		index = "skorpionv61",
		name = "Skorpion V61",
		desc = "Assault portatil",
		tipo = "Metralhadora",
		unity = "",
		economy = "",
		type = "equip",
		ammo = "WEAPON_MINISMG_AMMO",
		weight = 3.00
	},
	["WEAPON_COMBATPDW"] = {
		index = "pdw",
		name = "Combat-PDW",
		desc = "Assault portatil",
		tipo = "Metralhadora",
		unity = "",
		economy = "",
		type = "equip",
		ammo = "WEAPON_COMBATPDW_AMMO",
		weight = 3.00
	},
	["WEAPON_SMG"] = {
		index = "mp5",
		name = "MP5",
		desc = "Assault portatil",
		tipo = "Metralhadora",
		unity = "",
		economy = "",
		type = "equip",
		ammo = "WEAPON_SMG_AMMO",
		weight = 3.00
	},
	["WEAPON_ASSAULTSMG"] = {
		index = "mtar21",
		name = "MTAR-21",
		desc = "Metralhadora",
		tipo = "Rifle de assaulto",
		unity = "",
		economy = "",
		type = "equip",
		ammo = "WEAPON_ASSAULTSMG_AMMO",
		weight = 3.00
	},
	["WEAPON_BULLPUPRIFLE_MK2"] = {
		index = "Bullpuprifle",
		name = "Bullpuprifle",
		desc = "Rifle",
		tipo = "Rifle de assaulto",
		unity = "",
		economy = "",
		type = "equip",
		ammo = "WEAPON_BULLPUPRIFLE_MK2_AMMO",
		weight = 4.00
	},
	["WEAPON_SPECIALCARBINE_MK2"] = {
		index = "carbine-mk2",
		name = "G-36",
		desc = "Rifle Carabina",
		tipo = "Carabina",
		unity = "",
		economy = "",
		type = "equip",
		ammo = "WEAPON_SPECIALCARBINE_MK2_AMMO",
		weight = 3.00
	},
	["WEAPON_GUSENBERG"] = {
		index = "thompson",
		name = "Thompson",
		desc = "",
		tipo = "",
		unity = "",
		economy = "",
		type = "equip",
		ammo = "WEAPON_GUSENBERG_AMMO",
		weight = 3.00
	},
	["WEAPON_MACHINEPISTOL"] = {
		index = "tec9",
		name = "Tec-9",
		desc = "Munição metralhadora",
		tipo = "Munição",
		unity = "",
		economy = "",
		type = "equip",
		ammo = "WEAPON_MACHINEPISTOL_AMMO",
		weight = 3.00
	},
	["WEAPON_COMPACTRIFLE_AMMO"] = {
		index = "akcompactammo",
		name = "M. AK Compact",
		desc = "Munição metralhadora",
		tipo = "Munição",
		unity = "",
		economy = "",
		type = "recharge",
		weight = 0.10
	},
	["WEAPON_MICROSMG_AMMO"] = {
		index = "uziammo",
		name = "M. Uzi",
		desc = "Munição metralhadora",
		tipo = "Munição",
		unity = "",
		economy = "",
		type = "recharge",
		weight = 0.10
	},
	["WEAPON_MINISMG_AMMO"] = {
		index = "skorpionv61ammo",
		name = "M. Skorpion V61",
		desc = "Munição metralhadora",
		tipo = "Munição",
		unity = "",
		economy = "",
		type = "recharge",
		weight = 0.10
	},
	["WEAPON_COMBATPDW_AMMO"] = {
		index = "pdwammo",
		name = "M. Pdw",
		desc = "Munição metralhadora",
		tipo = "Munição",
		unity = "",
		economy = "",
		type = "recharge",
		weight = 0.10
	},
	["WEAPON_SPECIALCARBINE_MK2_AMMO"] = {
		index = "specialcarbineammomk2",
		name = "M. S.Carbine-MK2",
		desc = "Munição metralhadora",
		tipo = "Munição",
		unity = "",
		economy = "",
		type = "recharge",
		weight = 0.10
	},
	["WEAPON_BULLPUPRIFLE_MK2_AMMO"] = {
		index = "bulpuprifleammomk2",
		name = "M. Bulpup",
		desc = "Munição Fuzil",
		tipo = "Munição",
		unity = "",
		economy = "",
		type = "recharge",
		weight = 0.10
	},
	["WEAPON_SMG_AMMO"] = {
		index = "mp5ammo",
		name = "M. MP5",
		desc = "Munição metralhadora",
		tipo = "Munição",
		unity = "",
		economy = "",
		type = "recharge",
		weight = 0.10
	},
	["WEAPON_ASSAULTSMG_AMMO"] = {
		index = "mtar21ammo",
		name = "M. MTAR-21",
		desc = "Munição metralhadora",
		tipo = "Munição",
		unity = "",
		economy = "",
		type = "recharge",
		weight = 0.10
	},
	["WEAPON_GUSENBERG_AMMO"] = {
		index = "thompsonammo",
		name = "M. Thompson",
		desc = "Munição metralhadora",
		tipo = "Munição",
		unity = "",
		economy = "",
		type = "recharge",
		weight = 0.10
	},
	["WEAPON_MACHINEPISTOL_AMMO"] = {
		index = "tec9ammo",
		name = "M. Tec-9",
		desc = "Munição metralhadora",
		tipo = "Munição",
		unity = "",
		economy = "",
		type = "recharge",
		weight = 0.10
	},
 -- END SMG

 -- START RIFLE
    ["WEAPON_CARBINERIFLE"] = {
		index = "m4a1",
		name = "M4A1",
		desc = "Fuzil de assalto",
		tipo = "Rifle automático",
		unity = "",
		economy = "",
		type = "equip",
		ammo = "WEAPON_CARBINERIFLE_AMMO",
		weight = 3.00
	},
	["WEAPON_ASSAULTRIFLE"] = {
		index = "ak103",
		name = "AK-103",
		desc = "Fuzil de assalto",
		tipo = "Rifle automático",
		unity = "",
		economy = "",
		type = "equip",
		ammo = "WEAPON_ASSAULTRIFLE_AMMO",
		weight = 3.00
	},
	["WEAPON_ASSAULTRIFLE_MK2"] = {
		index = "ak74",
		name = "AK-74",
		desc = "Fuzil de assalto",
		tipo = "Rifle automático",
		unity = "",
		economy = "",
		type = "equip",
		ammo = "WEAPON_ASSAULTRIFLE_MK2_AMMO",
		weight = 3.00
	},
	["WEAPON_CARBINERIFLE_AMMO"] = {
		index = "m4a1ammo",
		name = "M. M4A1",
		desc = "Munição Rifle",
		tipo = "Munição",
		unity = "",
		economy = "",
		type = "recharge",
		weight = 0.10
	},
	["WEAPON_ASSAULTRIFLE_AMMO"] = {
		index = "ak103ammo",
		name = "M. AK-103",
		desc = "Munição para Rifle",
		tipo = "Munição",
		unity = "",
		economy = "",
		type = "recharge",
		weight = 0.10
	},
	["WEAPON_ASSAULTRIFLE_MK2_AMMO"] = {
		index = "ak74ammo",
		name = "M. AK-74",
		desc = "Munição para Rifle",
		tipo = "Munição",
		unity = "",
		economy = "",
		type = "recharge",
		weight = 0.10
	},
 -- END RIFLE

 -- START SHOTGUN
    ["WEAPON_MUSKET"] = {
		index = "winchester",
		name = "Winchester 1892",
		desc = "Arma de Caça",
		tipo = "",
		unity = "",
		economy = "2500",
		type = "equip",
		ammo = "WEAPON_MUSKET_AMMO",
		weight = 4.25
	},
	["WEAPON_PUMPSHOTGUN"] = {
		index = "remington",
		name = "Remington",
		desc = "Calibre 12",
		tipo = "",
		unity = "",
		economy = "",
		type = "equip",
		ammo = "WEAPON_PUMPSHOTGUN_AMMO",
		weight = 3.00
	},
	["WEAPON_SAWNOFFSHOTGUN"] = {
		index = "mossberg590",
		name = "Mossberg 590",
		desc = "Calibre 12",
		tipo = "",
		unity = "",
		economy = "",
		type = "equip",
		ammo = "WEAPON_SAWNOFFSHOTGUN_AMMO",
		weight = 3.00
	},
	["WEAPON_MUSKET_AMMO"] = {
		index = "winchesterammo",
		name = "M. Mosquete",
		desc = "Esferas de Chumbo",
		tipo = "Munição",
		unity = "",
		economy = "",
		type = "recharge",
		weight = 0.10
	},
	["WEAPON_PUMPSHOTGUN_AMMO"] = {
		index = "remingtonammo",
		name = "M. Remington",
		desc = "Calibre .223 Rem",
		tipo = "Munição",
		unity = "",
		economy = "",
		type = "recharge",
		weight = 0.10
	},
	["WEAPON_SAWNOFFSHOTGUN_AMMO"] = {
		index = "mossberg590ammo",
		name = "M. Mossberg 590",
		desc = "Calibre 12",
		tipo = "Munição",
		unity = "",
		economy = "",
		type = "recharge",
		weight = 0.10
	},
 -- END SHOTGUN

 -- START OTHERS
	["WEAPON_PETROLCAN_AMMO"] = {
		index = "fuel",
		name = "Combustível",
		desc = "",
		tipo = "",
		unity = "",
		economy = "",
		type = "recharge",
		weight = 0.10
	},
	["WEAPON_RAYPISTOL"] = {
		index = "raypistol",
		name = "Pistola de Raios",
		desc = "",
		tipo = "",
		unity = "",
		economy = "",
		type = "equip",
		weight = 1.00
	},
	["WEAPON_RPG"] = {
		index = "rpg",
		name = "RPG-7",
		desc = "",
		tipo = "",
		unity = "",
		economy = "",
		type = "equip",
		weight = 3.00
	},
	["WEAPON_RPG_AMMO"] = {
		index = "rpgammo",
		name = "M. RPG-7",
		desc = "",
		tipo = "",
		unity = "",
		economy = "",
		type = "recharge",
		weight = 0.50
	},
 -- END OTHERS

	["pager"] = {
		index = "pager",
		name = "Pager",
		desc = "Entrar e sair de serviço",
		tipo = "Eletrônico",
		unity = "",
		economy = "",
		type = "use",
		weight = 1.50
	},
	["firecracker"] = {
		index = "firecracker",
		name = "Fogos de artificio",
		desc = "Explosão",
		tipo = "Usável",
		unity = "Não",
		economy = "30",
		type = "use",
		weight = 2.25
	},
	["analgesic"] = {
		index = "analgesic",
		name = "Analgésico",
		desc = "Tira dores",
		tipo = "Remédio",
		unity = "Não",
		economy = "40",
		type = "use",
		weight = 0.10
	},
	["gauze"] = {
		index = "gauze",
		name = "Gazes",
		desc = "Estanca sangramento",
		tipo = "Curativo",
		unity = "Não",
		max = 4,
		economy = "40",
		type = "use",
		weight = 0.07
	},
	["gsrkit"] = {
		index = "gsrkit",
		name = "Kit Residual",
		desc = "Solvente detecta disparo",
		tipo = "Consumivel",
		unity = "",
		economy = "",
		type = "use",
		weight = 3.50
	},
	["gdtkit"] = {
		index = "gdtkit",
		name = "Kit químico",
		desc = "Exame Tóxicológico",
		tipo = "Consumivel",
		unity = "",
		economy = "",
		type = "use",
		weight = 6.50
	},
	["fueltech"] = {
		index = "fueltech",
		name = "Fueltech",
		desc = "Performance do Carro",
		tipo = "Componente",
		unity = "",
		economy = "",
		type = "use",
		weight = 3.50
	},
	["cpuchip"] = {
		index = "cpuchip",
		name = "Processador",
		desc = "Componente Eletrônico",
		tipo = "Componente",
		unity = "",
		economy = "",
		type = "use",
		weight = 5.50
	},
	["orange"] = {
		index = "orange",
		name = "Laranja",
		desc = "Fruta fresca",
		tipo = "Usável",
		unity = "Não",
		economy = "S/E",
		type = "use",
		weight = 0.25
	},
	["strawberry"] = {
		index = "strawberry",
		name = "Morango",
		desc = "Fruta fresca",
		tipo = "Usável",
		unity = "Não",
		economy = "S/E",
		type = "use",
		weight = 0.15
	},
	["grape"] = {
		index = "grape",
		name = "Uva",
		desc = "Fruta fresca",
		tipo = "Usável",
		unity = "Não",
		economy = "S/E",
		type = "use",
		weight = 0.15
	},
	["tange"] = {
		index = "tange",
		name = "Tangerina",
		type = "use",
		desc = "",
		tipo = "Usável",
		unity = "Não",
		economy = "S/E",
		weight = 0.25
	},
	["banana"] = {
		index = "banana",
		name = "Banana",
		desc = "Fruta fresca",
		tipo = "Usável",
		unity = "Não",
		economy = "S/E",
		type = "use",
		weight = 0.25
	},
	["passion"] = {
		index = "passion",
		name = "Maracujá",
		desc = "Fruta fresca",
		tipo = "Usável",
		unity = "Não",
		economy = "S/E",
		type = "use",
		weight = 0.25
	},
	["tomato"] = {
		index = "tomato",
		name = "Tomate",
		desc = "",
		tipo = "Usável",
		unity = "Não",
		economy = "S/E",
		type = "use",
		weight = 0.15
	},
	["ketchup"] = {
		index = "ketchup",
		name = "Ketchup",
		desc = "",
		tipo = "Comum",
		unity = "Não",
		economy = "15",
		type = "use",
		weight = 0.25
	},
	["orangejuice"] = {
		index = "orangejuice",
		name = "Suco de Laranja",
		desc = "Mata sede e cura estresse",
		tipo = "Usável",
		unity = "Sim",
		economy = "30",
		type = "use",
		max = 5,
		durability = 2500,
		weight = 0.75
	},
	["tangejuice"] = {
		index = "tangejuice",
		name = "Suco de Tangerina",
		desc = "Mata sede e cura estresse",
		tipo = "Usável",
		unity = "Sim",
		economy = "30",
		type = "use",
		max = 5,
		durability = 2500,
		weight = 0.45
	},
	["grapejuice"] = {
		index = "grapejuice",
		name = "Suco de Uva",
		desc = "Mata sede e cura estresse",
		tipo = "Usável",
		unity = "Sim",
		economy = "30",
		type = "use",
		max = 5,
		durability = 2500,
		weight = 0.45
	},
	["strawberryjuice"] = {
		index = "strawberryjuice",
		name = "Suco de Morango",
		desc = "Mata sede e cura estresse",
		tipo = "Usável",
		unity = "Sim",
		economy = "30",
		type = "use",
		max = 5,
		durability = 2500,
		weight = 0.45
	},
	["bananajuice"] = {
		index = "bananajuice",
		name = "Suco de Banana",
		desc = "Mata sede e cura estresse",
		tipo = "Usável",
		unity = "Sim",
		economy = "30",
		type = "use",
		max = 5,
		durability = 2500,
		weight = 0.45
	},
	["passionjuice"] = {
		index = "passionjuice",
		name = "Suco de Maracujá",
		desc = "Mata sede e cura estresse",
		tipo = "Usável",
		unity = "Sim",
		economy = "30",
		type = "use",
		max = 5,
		durability = 2500,
		weight = 0.45
	},
	["xmoneyshot"] = {
		index = "xmoneyshot",
		name = "XMoneyshot",
		desc = "Mata fome e cura estresse",
		tipo = "Usável",
		unity = "Sim",
		economy = "40",
		type = "use",
		max = 1,
		durability = 3500,
		weight = 0.45
	},
	["xtorpedo"] = {
		index = "xtorpedo",
		name = "XTorpedo",
		desc = "Mata fome e cura estresse",
		tipo = "Usável",
		unity = "Sim",
		economy = "40",
		type = "use",
		max = 1,
		durability = 3500,
		weight = 0.45
	},
	["xsalada"] = {
		index = "xsalada",
		name = "XSalada",
		desc = "Mata fome e cura estresse",
		tipo = "Usável",
		unity = "Sim",
		economy = "40",
		type = "use",
		max = 1,
		durability = 3500,
		weight = 0.45
	},
	["xblender"] = {
		index = "xblender",
		name = "XBlender",
		desc = "Mata fome e cura estresse",
		tipo = "Usável",
		unity = "Sim",
		economy = "40",
		type = "use",
		max = 1,
		durability = 3500,
		weight = 0.45
	},
	["lamen"] = {
		index = "lamen",
		name = "Lamen",
		desc = "Mata fome e cura estresse",
		tipo = "Usável",
		unity = "Não",
		economy = "40",
		type = "use",
		weight = 0.45
	},
	["temaki"] = {
		index = "temaki",
		name = "Temaki",
		desc = "Mata fome e cura estresse",
		tipo = "Usável",
		unity = "Não",
		economy = "40",
		type = "use",
		weight = 0.45
	},
	["sushi"] = {
		index = "sushi",
		name = "Sushi",
		desc = "Mata fome e cura estresse",
		tipo = "Usável",
		unity = "Não",
		economy = "40",
		type = "use",
		weight = 0.45
	},
	["amendoim"] = {
		index = "amendoim",
		name = "Amendoim",
		desc = "",
		tipo = "Usável",
		unity = "Não",
		economy = "5",
		type = "use",
		weight = 0.45
	},
	["ovo"] = {
		index = "ovo",
		name = "Ovo",
		desc = "",
		tipo = "Usável",
		unity = "Não",
		economy = "",
		type = "use",
		weight = 0.45
	},
	["fries"] = {
		index = "fries",
		name = "Batata Frita",
		desc = "Mata fome e cura estresse",
		tipo = "Usável",
		unity = "Não",
		max = 6,
		economy = "6",
		type = "use",
		weight = 0.45
	},
	-----Ilegal---	
	["capsula"] = {
		index = "capsula",
		name = "Capsulas",
		desc = "Capsulas de munição vazia",
		tipo = "Usável",
		unity = "Não",
		economy = "S/E",
		type = "use",
		weight = 0.02
	},
	["polvora"] = {
		index = "polvora",
		name = "Pólvora",
		desc = "Pólvora para produção",
		tipo = "Usável",
		unity = "Não",
		economy = "S/E",
		type = "use",
		weight = 0.02
	},
	["gatilho"] = {
		index = "gatilho",
		name = "Gatilho",
		desc = "Gatilho para montagem de armamento",
		tipo = "Usável",
		unity = "Não",
		economy = "S/E",
		type = "use",
		weight = 0.05
	},
	["molas"] = {
		index = "molas",
		name = "Molas",
		desc = "Molas para montagem de armamentos",
		tipo = "Usável",
		unity = "Não",
		economy = "S/E",
		type = "use",
		weight = 0.05
	},
	["corpo-m1911"] = {
		index = "corpo-m1911",
		name = "Corpo de arma",
		desc = "Corpo de armamento para montagem de m1911",
		tipo = "Usável",
		unity = "Não",
		economy = "S/E",
		type = "use",
		weight = 0.20
	},
	["corpo-akmk2"] = {
		index = "corpo-akmk2",
		name = "Corpo de arma",
		desc = "Corpo de armamento para montagem de akmk2",
		tipo = "Usável",
		unity = "Não",
		economy = "S/E",
		type = "use",
		weight = 0.30
	},
	["corpo-five"] = {
		index = "corpo-five",
		name = "Corpo de arma",
		desc = "Corpo de armamento para montagem de Five Seven",
		tipo = "Usável",
		unity = "Não",
		economy = "S/E",
		type = "use",
		weight = 0.20
	},
	["corpo-tec"] = {
		index = "corpo-tec",
		name = "Corpo de arma",
		desc = "Corpo de armamento para montagem de Tec-9",
		tipo = "Usável",
		unity = "Não",
		economy = "S/E",
		type = "use",
		weight = 0.20
	},
	["corpo-miniak"] = {
		index = "corpo-miniak",
		name = "Corpo de arma",
		desc = "Corpo de armamento para montagem de Mini-AK",
		tipo = "Usável",
		unity = "Não",
		economy = "S/E",
		type = "use",
		weight = 0.30
	},
	["corpo-smgmk2"] = {
		index = "corpo-smgmk2",
		name = "Corpo de arma",
		desc = "Corpo de armamento para montagem de Smg Mk2",
		tipo = "Usável",
		unity = "Não",
		economy = "S/E",
		type = "use",
		weight = 0.30
	},
	["corpo-g36"] = {
		index = "corpo-g36",
		name = "Corpo de arma",
		desc = "Corpo de armamento para montagem de G-36",
		tipo = "Usável",
		unity = "Não",
		economy = "S/E",
		type = "use",
		weight = 0.40
	},
	["corpo-ak47"] = {
		index = "corpo-ak47",
		name = "Corpo de arma",
		desc = "Corpo de armamento para montagem de ak-103",
		tipo = "Usável",
		unity = "Não",
		economy = "S/E",
		type = "use",
		weight = 0.40
	},
	["corpo-desert"] = {
		index = "corpo-desert",
		name = "Corpo de arma ATI FX45",
		desc = "Corpo de armamento para montagem de ATI FX45",
		tipo = "Usável",
		unity = "Não",
		economy = "S/E",
		type = "use",
		weight = 0.20
	},
	["corpo-uzi"] = {
		index = "corpo-uzi",
		name = "Corpo de arma",
		desc = "Corpo de armamento para montagem de Micro-Uzi",
		tipo = "Usável",
		unity = "Não",
		economy = "S/E",
		type = "use",
		weight = 0.30
	},
	["corpo-sig"] = {
		index = "corpo-sig",
		name = "Corpo de arma",
		desc = "Corpo de armamento para montagem de PDW",
		tipo = "Usável",
		unity = "Não",
		economy = "S/E",
		type = "use",
		weight = 0.30
	},
	["corpo-skorpion"] = {
		index = "corpo-skorpion",
		name = "Corpo de arma",
		desc = "Corpo de armamento para montagem de Skorpion",
		tipo = "Usável",
		unity = "Não",
		economy = "S/E",
		type = "use",
		weight = 0.20
	},
	["corpo-mtar"] = {
		index = "corpo-mtar",
		name = "Corpo de arma",
		desc = "Corpo de armamento para montagem de MTAR-21",
		tipo = "Usável",
		unity = "Não",
		economy = "S/E",
		type = "use",
		weight = 0.40
	},
	["carvao"] = {
		index = "carvao",
		name = "carvao",
		desc = "Com a Mistura certa pode virar um Estouro",
		tipo = "Usável",
		unity = "Não",
		economy = "S/E",
		type = "use",
		weight = 0.03
	},
	["Salitre"] = {
		index = "Salitre",
		name = "Salitre",
		desc = "Com a Mistura certa pode virar um Estouro",
		tipo = "Usável",
		unity = "Não",
		economy = "S/E",
		type = "use",
		weight = 0.03
	},
	["folhadecoca"] = {
		index = "folhadecoca",
		name = "Folha de Coca",
		desc = "Ingrediente de Produção",
		tipo = "Usável",
		unity = "Não",
		economy = "S/E",
		type = "use",
		weight = 0.45
	},
	["pastadecoca"] = {
		index = "pastadecoca",
		name = "Pasta de Coca",
		desc = "Ingrediente de produção",
		tipo = "Usável",
		unity = "Não",
		economy = "S/E",
		type = "use",
		weight = 0.45
	},
	["acidobateria"] = {
		index = "acidobateria",
		name = "Acido de bateria",
		desc = "Ingrediente de produção",
		tipo = "Usável",
		unity = "Não",
		economy = "S/E",
		type = "use",
		weight = 0.45
	},
	["descartavel1"] = {
		index = "descartavel1",
		name = "Telefone descartavel desligado",
		desc = "Ligue para receber pedidos",
		tipo = "Usável",
		unity = "Não",
		economy = "150",
		type = "use",
		weight = 0.45
	},
	["descartavel2"] = {
		index = "descartavel2",
		name = "Telefone descartavel ligado",
		desc = "Desligue para não receber mais pedidos",
		tipo = "Usável",
		unity = "Não",
		economy = "150",
		type = "use",
		weight = 0.45
	},
	["fichas"] = {
		index = "fichas",
		name = "Fichas",
		desc = "Fichas do Cassino",
		tipo = "Usável",
		unity = "Não",
		economy = "S/E",
		type = "use",
		weight = 0.05
	},
	["pretreino"] = {
		index = "pretreino",
		name = "Pré Treino",
		desc = "Uma bebida para dar um pump no treino",
		tipo = "Usável",
		unity = "Não",
		max = 6,
		economy = "S/E",
		type = "use",
		weight = 0.45
	},
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- GENERATE:ADVTOOLBOX
-----------------------------------------------------------------------------------------------------------------------------------------
for i = 1,99 do
	itemlist["toolboxes"..i] = {
		index = "toolbox",
		name = "Caixa de Ferramentas",
		desc = "Concertar o carro",
		tipo = "Ferramentas",
		unity = "Não",
		economy = "500",
		type = "use",
		weight = 1.75
	}
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- ITEMBODYLIST
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.itemBodyList(item)
	if itemlist[item] then
		return itemlist[item]
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- ITEMINDEXLIST
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.itemIndexList(item)
	if itemlist[item] then
		return itemlist[item].index
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- ITEMNAMELIST
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.itemNameList(item)
	if itemlist[item] then
		return itemlist[item].name
	end
	return "REMOVIDO"
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- ITEMDESCLIST
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.itemDescList(item)
    if itemlist[item] then
        return itemlist[item].desc or nil
    end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- ITEMTIPOLIST
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.itemTipoList(item)
    if itemlist[item] then
        return itemlist[item].tipo or nil
    end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- ITEMUNITYLIST
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.itemUnityList(item)
    if itemlist[item] then
        return itemlist[item].unity or nil
    end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- ITEMECONOMYLIST
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.itemEconomyList(item)
    if itemlist[item] then
        return itemlist[item].economy or nil
    end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- ITEMSUBTYPELIST
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.itemSubTypeList(item)
    if itemlist[item] then
        return itemlist[item].subtype or nil
    end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- ITEMTRANSFORMLIST
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.itemTransformList(item)
    if itemlist[item] then
        return itemlist[item].transform or nil
    end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- ITEMDURABILITYLIST
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.itemDurabilityList(item)
    if itemlist[item] then
        return itemlist[item].durability or nil
    end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- ITEMTYPELIST
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.itemTypeList(item)
	if itemlist[item] then
		return itemlist[item].type
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- ITEMAMMOLIST
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.itemAmmoList(item)
	if itemlist[item] then
		return itemlist[item].ammo
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- ITEMWEIGHTLIST
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.itemWeightList(item)
	if itemlist[item] then
		return itemlist[item].weight
	end
	return 0
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- ITEMWEIGHTLIST
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.itemMaxAmount(item)
	if itemlist[item] then
		if itemlist[item].max ~= nil then
			return itemlist[item].max
		else
			return 1
		end
	end
	return 0
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- COMPUTEINVWEIGHT
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.computeInvWeight(user_id)
	local weight = 0
	local inventory = vRP.getInventory(user_id)
	if inventory then
		for k,v in pairs(inventory) do
			if vRP.itemBodyList(v.item) then
				weight = weight + vRP.itemWeightList(v.item) * parseInt(v.amount)
			end
		end
		return weight
	end
	return 0
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- COMPUTECHESTWEIGHT
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.computeChestWeight(items)
	local weight = 0
	for k,v in pairs(items) do
		if vRP.itemBodyList(k) then
			weight = weight + vRP.itemWeightList(k) * parseInt(v.amount)
		end
	end
	return weight
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- GETINVENTORYITEMAMOUNT
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.getInventoryItemAmount(user_id,idname)
	local data = vRP.getInventory(user_id)
	if data then
		for k,v in pairs(data) do
			if v.item == idname then
				return parseInt(v.amount)
			end
		end
	end
	return 0
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- SWAPSLOT
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.swapSlot(user_id,slot,target)
	local data = vRP.getInventory(user_id)
	if data then
		local temp = data[tostring(slot)]
		data[tostring(slot)] = data[tostring(target)]
		data[tostring(target)] = temp
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- GETINVENTORYITEMDURABILITY
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.getInventoryItemDurability(user_id,idname)
	local data = vRP.getInventory(user_id)
	if data then
		for k,v in pairs(data) do
			if v.item == idname and v.timestamp then
				return v.timestamp
			end
		end
	end
	return nil
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- GIVEINVENTORYITEM
-----------------------------------------------------------------------------------------------------------------------------------------
	function vRP.giveInventoryItem(user_id,idname,amount,notify,slot,timestamp)
		local data = vRP.getInventory(user_id)
		if data and parseInt(amount) > 0 then
			if not slot then
				local initial = 0
				repeat
					initial = initial + 1
				until data[tostring(initial)] == nil or (data[tostring(initial)] and data[tostring(initial)].item == idname)
				initial = tostring(initial)
				

				if vRP.itemSubTypeList(idname) then
					if vRP.getInventoryItemAmount(user_id,idname) > 0 then
						return false
					else
						if data[initial] == nil then
							if vRP.getInventoryItemAmount(user_id,idname) >= vRP.itemMaxAmount(idname) then
								return false
							end
							newamount = amount
							if (vRP.getInventoryItemAmount(user_id,idname) + amount) >= vRP.itemMaxAmount(idname) then
								newamount = vRP.itemMaxAmount(idname) - vRP.getInventoryItemAmount(user_id,idname)
							end
							if timestamp then
								data[initial] = { item = idname, amount = parseInt(newamount), timestamp = timestamp }
							else
								data[initial] = { item = idname, amount = parseInt(newamount), timestamp = (os.time() + vRP.itemDurabilityList(idname)) }
							end
							
						elseif data[initial] and data[initial].item == idname then
							return false
						end
		
						if notify and vRP.itemBodyList(idname) then
							TriggerClientEvent("itensNotify",vRP.getUserSource(user_id),{ "+",vRP.itemIndexList(idname),vRP.format(parseInt(newamount)),vRP.itemNameList(idname) })
						end
						return true
					end
				else
					if data[initial] == nil then
						data[initial] = { item = idname, amount = parseInt(amount) }
					elseif data[initial] and data[initial].item == idname then
						data[initial].amount = parseInt(data[initial].amount) + parseInt(amount)
					end

					if notify and vRP.itemBodyList(idname) then
						TriggerClientEvent("itensNotify",vRP.getUserSource(user_id),{ "+",vRP.itemIndexList(idname),vRP.format(parseInt(amount)),vRP.itemNameList(idname) })
					end
					return true
				end
			else
				slot = tostring(slot)

				if vRP.itemSubTypeList(idname) then
					if vRP.getInventoryItemAmount(user_id,idname) >= vRP.itemMaxAmount(idname) then
						return false
					end
					newamount = amount
					if (vRP.getInventoryItemAmount(user_id,idname) + amount) >= vRP.itemMaxAmount(idname) then
						newamount = vRP.itemMaxAmount(idname) - vRP.getInventoryItemAmount(user_id,idname)
					end
					if data[slot] then
						return false
					else
						if timestamp then
							data[slot] = { item = idname, amount = parseInt(newamount), timestamp = timestamp }
						else
							data[slot] = { item = idname, amount = parseInt(newamount), timestamp = (os.time() + vRP.itemDurabilityList(idname)) }
						end
					end

					if notify and vRP.itemBodyList(idname) then
						TriggerClientEvent("itensNotify",vRP.getUserSource(user_id),{ "+",vRP.itemIndexList(idname),vRP.format(parseInt(newamount)),vRP.itemNameList(idname) })
					end
					return true
				else
					if data[slot] then
						if data[slot].item == idname then
							local oldAmount = parseInt(data[slot].amount)
							data[slot] = { item = idname, amount = parseInt(oldAmount) + parseInt(amount) }
						end
					else
						data[slot] = { item = idname, amount = parseInt(amount) }
					end

					if notify and vRP.itemBodyList(idname) then
						TriggerClientEvent("itensNotify",vRP.getUserSource(user_id),{ "+",vRP.itemIndexList(idname),vRP.format(parseInt(amount)),vRP.itemNameList(idname) })
					end
					return true
				end
			end
		end
	end

	-- function vRP.giveInventoryItem(user_id,idname,amount,notify,slot)
	-- 	local data = vRP.getInventory(user_id)
	-- 	if data and parseInt(amount) > 0 then
	-- 		if not slot then
	-- 			local initial = 0
	-- 			repeat
	-- 				initial = initial + 1
	-- 			until data[tostring(initial)] == nil or (data[tostring(initial)] and data[tostring(initial)].item == idname)
	-- 			initial = tostring(initial)
				
	-- 			if data[initial] == nil then
	-- 				data[initial] = { item = idname, amount = parseInt(amount) }
	-- 			elseif data[initial] and data[initial].item == idname then
	-- 				data[initial].amount = parseInt(data[initial].amount) + parseInt(amount)
	-- 			end

	-- 			if notify and vRP.itemBodyList(idname) then
	-- 				TriggerClientEvent("itensNotify",vRP.getUserSource(user_id),{ "RECEBEU",vRP.itemIndexList(idname),vRP.format(parseInt(amount)),vRP.itemNameList(idname) })
	-- 			end
	-- 		else
	-- 			slot = tostring(slot)

	-- 			if data[slot] then
	-- 				if data[slot].item == idname then
	-- 					local oldAmount = parseInt(data[slot].amount)
	-- 					data[slot] = { item = idname, amount = parseInt(oldAmount) + parseInt(amount) }
	-- 				end
	-- 			else
	-- 				data[slot] = { item = idname, amount = parseInt(amount) }
	-- 			end

	-- 			if notify and vRP.itemBodyList(idname) then
	-- 				TriggerClientEvent("itensNotify",vRP.getUserSource(user_id),{ "RECEBEU",vRP.itemIndexList(idname),vRP.format(parseInt(amount)),vRP.itemNameList(idname) })
	-- 			end
	-- 		end
	-- 	end
	-- end
-----------------------------------------------------------------------------------------------------------------------------------------
-- TRYGETINVENTORYITEM
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.tryGetInventoryItem(user_id,idname,amount,notify,slot)
	local data = vRP.getInventory(user_id)
	if data then
		if not slot then
			for k,v in pairs(data) do
				if v.item == idname and parseInt(v.amount) >= parseInt(amount) then
					v.amount = parseInt(v.amount) - parseInt(amount)

					if parseInt(v.amount) <= 0 then
						data[k] = nil
					end

					if notify and vRP.itemBodyList(idname) then
						TriggerClientEvent("itensNotify",vRP.getUserSource(user_id),{ "-",vRP.itemIndexList(idname),vRP.format(parseInt(amount)),vRP.itemNameList(idname) })
					end
					return true
				end
			end
		else
			local slot  = tostring(slot)

			if data[slot] and data[slot].item == idname and parseInt(data[slot].amount) >= parseInt(amount) then
				data[slot].amount = parseInt(data[slot].amount) - parseInt(amount)

				if parseInt(data[slot].amount) <= 0 then
					data[slot] = nil
				end

				if notify and vRP.itemBodyList(idname) then
					TriggerClientEvent("itensNotify",vRP.getUserSource(user_id),{ "-",vRP.itemIndexList(idname),vRP.format(parseInt(amount)),vRP.itemNameList(idname) })
				end
				return true
			end
		end
	end

	return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- REMOVEINVENTORYITEM
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.removeInventoryItem(user_id,idname,amount,notify)
	local data = vRP.getInventory(user_id)
	if data then
		for k,v in pairs(data) do
			if v.item == idname and parseInt(v.amount) >= parseInt(amount) then
				v.amount = parseInt(v.amount) - parseInt(amount)

				if parseInt(v.amount) <= 0 then
					data[k] = nil
				end

				if notify and vRP.itemBodyList(idname) then
					TriggerClientEvent("itensNotify",vRP.getUserSource(user_id),{ "-",vRP.itemIndexList(idname),vRP.format(parseInt(amount)),vRP.itemNameList(idname) })
				end

				break
			end
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- CREATEDURABILITY
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.createDurability(itemName)
	local advFile = LoadResourceFile("logsystem","toolboxes.json")
	local advDecode = json.decode(advFile)

	if advDecode[itemName] then
		advDecode[itemName] = advDecode[itemName] - 1

		if advDecode[itemName] <= 0 then
			advDecode[itemName] = nil
			vRP.removeInventoryItem(user_id,itemName,1,true)
		end
	else
		advDecode[itemName] = 9
	end

	SaveResourceFile("logsystem","toolboxes.json",json.encode(advDecode),-1)
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- ACTIVED
-----------------------------------------------------------------------------------------------------------------------------------------
local actived = {}
local activedAmount = {}
Citizen.CreateThread(function()
	while true do
		local slyphe = 500
		if actived then
			slyphe = 100 
			for k,v in pairs(actived) do
				if actived[k] > 0 then
					actived[k] = v - 1
					if actived[k] <= 0 then
						actived[k] = nil
					end
				end
			end
		end
		Citizen.Wait(slyphe)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARLOGS
-----------------------------------------------------------------------------------------------------------------------------------------
local policeLogs = ""
local webhook = module("creative","config")
-----------------------------------------------------------------------------------------------------------------------------------------
-- TRYCHESTITEM
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.tryChestItem(user_id,chestData,itemName,amount,slot)
	if actived[user_id] == nil then
		actived[user_id] = 1
		local data = vRP.getSData(chestData)
		local items = json.decode(data) or {}
		local identity = vRP.getUserIdentity(parseInt(user_id))
		if data and items ~= nil then
			if items[itemName] ~= nil and parseInt(items[itemName].amount) >= parseInt(amount) then

				if parseInt(amount) > 0 then
					activedAmount[user_id] = parseInt(amount)
				else
					activedAmount[user_id] = parseInt(items[itemName].amount)
				end

				local new_weight = vRP.computeInvWeight(user_id) + vRP.itemWeightList(itemName) * parseInt(activedAmount[user_id])
				if new_weight <= vRP.getBackpack(user_id) then
					vRP.giveInventoryItem(user_id,itemName,parseInt(activedAmount[user_id]),true,slot)

					items[itemName].amount = parseInt(items[itemName].amount) - parseInt(activedAmount[user_id])

					if chestData == "chest:Policia" then

						PerformHttpRequest(webhook.BPolicia, function(err, text, headers) end, 'POST', json.encode({
							username = "Player Bau",
							avatar_url = webhook.Avatar,
							embeds = {
								{ 	------------------------------------------------------------
									title = "Registro - Bau",
									fields = {
										{ 
											name = "Usuário:", 
											value = ""..identity.name.." "..identity.name2.." [**"..user_id.."**] "
										},
										--[[ {
											name = "Coordenadas:", 
											value = coords
										}, ]]
										--[[ {
											name = "Motivo do quit:", 
											value = ""..reason..""
										}, ]]
										--[[ {
											name = "Grupos:", 
											value = " "..groups..""
										}, ]]
										{
											name = "Retirou:", 
											value = ""..vRP.format(parseInt(activedAmount[user_id])).."x "..vRP.itemNameList(itemName)..""
										},
										--[[ {
											name = "Armas:", 
											value = ""..guns.." "
										}, ]]
									}, 
									footer = { 
										text = webhook.Text..os.date('[Dia:] %d-%m-%Y - [Horas:] %H:%M:%S'),
										icon_url = webhook.Icon
									},
									color = webhook.Color
								}
							}
						}), { ['Content-Type'] = 'application/json' })

						--creativeLogs(policeLogs,"```PASSAPORTE: "..user_id.." ( RETIROU )\nITEM: "..vRP.format(parseInt(activedAmount[user_id])).."x "..vRP.itemNameList(itemName).."```")
					end

					if chestData == "chest:Ballas" then

						PerformHttpRequest(webhook.BBallas, function(err, text, headers) end, 'POST', json.encode({
							username = "Player Bau",
							avatar_url = webhook.Avatar,
							embeds = {
								{ 	------------------------------------------------------------
									title = "Registro - Bau",
									fields = {
										{ 
											name = "Usuário:", 
											value = ""..identity.name.." "..identity.name2.." [**"..user_id.."**] "
										},
										--[[ {
											name = "Coordenadas:", 
											value = coords
										}, ]]
										--[[ {
											name = "Motivo do quit:", 
											value = ""..reason..""
										}, ]]
										--[[ {
											name = "Grupos:", 
											value = " "..groups..""
										}, ]]
										{
											name = "Retirou:", 
											value = ""..vRP.format(parseInt(activedAmount[user_id])).."x "..vRP.itemNameList(itemName)..""
										},
										--[[ {
											name = "Armas:", 
											value = ""..guns.." "
										}, ]]
									}, 
									footer = { 
										text = webhook.Text..os.date('[Dia:] %d-%m-%Y - [Horas:] %H:%M:%S'),
										icon_url = webhook.Icon
									},
									color = webhook.Color
								}
							}
						}), { ['Content-Type'] = 'application/json' })

						--creativeLogs(BallasLogs,"```PASSAPORTE: "..user_id.." ( RETIROU )\nITEM: "..vRP.format(parseInt(activedAmount[user_id])).."x "..vRP.itemNameList(itemName).."```")
					end

					if chestData == "chest:Vagos" then

						PerformHttpRequest(webhook.BVagos, function(err, text, headers) end, 'POST', json.encode({
							username = "Player Bau",
							avatar_url = webhook.Avatar,
							embeds = {
								{ 	------------------------------------------------------------
									title = "Registro - Bau",
									fields = {
										{ 
											name = "Usuário:", 
											value = ""..identity.name.." "..identity.name2.." [**"..user_id.."**] "
										},
										--[[ {
											name = "Coordenadas:", 
											value = coords
										}, ]]
										--[[ {
											name = "Motivo do quit:", 
											value = ""..reason..""
										}, ]]
										--[[ {
											name = "Grupos:", 
											value = " "..groups..""
										}, ]]
										{
											name = "Retirou:", 
											value = ""..vRP.format(parseInt(activedAmount[user_id])).."x "..vRP.itemNameList(itemName)..""
										},
										--[[ {
											name = "Armas:", 
											value = ""..guns.." "
										}, ]]
									}, 
									footer = { 
										text = webhook.Text..os.date('[Dia:] %d-%m-%Y - [Horas:] %H:%M:%S'),
										icon_url = webhook.Icon
									},
									color = webhook.Color
								}
							}
						}), { ['Content-Type'] = 'application/json' })

						--creativeLogs(VagosLogs,"```PASSAPORTE: "..user_id.." ( RETIROU )\nITEM: "..vRP.format(parseInt(activedAmount[user_id])).."x "..vRP.itemNameList(itemName).."```")
					end

					if chestData == "chest:Cassino" then

						PerformHttpRequest(webhook.BCassino, function(err, text, headers) end, 'POST', json.encode({
							username = "Player Bau",
							avatar_url = webhook.Avatar,
							embeds = {
								{ 	------------------------------------------------------------
									title = "Registro - Bau",
									fields = {
										{ 
											name = "Usuário:", 
											value = ""..identity.name.." "..identity.name2.." [**"..user_id.."**] "
										},
										--[[ {
											name = "Coordenadas:", 
											value = coords
										}, ]]
										--[[ {
											name = "Motivo do quit:", 
											value = ""..reason..""
										}, ]]
										--[[ {
											name = "Grupos:", 
											value = " "..groups..""
										}, ]]
										{
											name = "Retirou:", 
											value = ""..vRP.format(parseInt(activedAmount[user_id])).."x "..vRP.itemNameList(itemName)..""
										},
										--[[ {
											name = "Armas:", 
											value = ""..guns.." "
										}, ]]
									}, 
									footer = { 
										text = webhook.Text..os.date('[Dia:] %d-%m-%Y - [Horas:] %H:%M:%S'),
										icon_url = webhook.Icon
									},
									color = webhook.Color
								}
							}
						}), { ['Content-Type'] = 'application/json' })


						--creativeLogs(CassinoLogs,"```PASSAPORTE: "..user_id.." ( RETIROU )\nITEM: "..vRP.format(parseInt(activedAmount[user_id])).."x "..vRP.itemNameList(itemName).."```")
					end

					if chestData == "chest:Mecanico" then

						PerformHttpRequest(webhook.BMecanico, function(err, text, headers) end, 'POST', json.encode({
							username = "Player Bau",
							avatar_url = webhook.Avatar,
							embeds = {
								{ 	------------------------------------------------------------
									title = "Registro - Bau",
									fields = {
										{ 
											name = "Usuário:", 
											value = ""..identity.name.." "..identity.name2.." [**"..user_id.."**] "
										},
										--[[ {
											name = "Coordenadas:", 
											value = coords
										}, ]]
										--[[ {
											name = "Motivo do quit:", 
											value = ""..reason..""
										}, ]]
										--[[ {
											name = "Grupos:", 
											value = " "..groups..""
										}, ]]
										{
											name = "Retirou:", 
											value = ""..vRP.format(parseInt(activedAmount[user_id])).."x "..vRP.itemNameList(itemName)..""
										},
										--[[ {
											name = "Armas:", 
											value = ""..guns.." "
										}, ]]
									}, 
									footer = { 
										text = webhook.Text..os.date('[Dia:] %d-%m-%Y - [Horas:] %H:%M:%S'),
										icon_url = webhook.Icon
									},
									color = webhook.Color
								}
							}
						}), { ['Content-Type'] = 'application/json' })

						--creativeLogs(MecanicoLogs,"```PASSAPORTE: "..user_id.." ( RETIROU )\nITEM: "..vRP.format(parseInt(activedAmount[user_id])).."x "..vRP.itemNameList(itemName).."```")
					end

					if chestData == "chest:Bennys" then

						PerformHttpRequest(webhook.BBennys, function(err, text, headers) end, 'POST', json.encode({
							username = "Player Bau",
							avatar_url = webhook.Avatar,
							embeds = {
								{ 	------------------------------------------------------------
									title = "Registro - Bau",
									fields = {
										{ 
											name = "Usuário:", 
											value = ""..identity.name.." "..identity.name2.." [**"..user_id.."**] "
										},
										--[[ {
											name = "Coordenadas:", 
											value = coords
										}, ]]
										--[[ {
											name = "Motivo do quit:", 
											value = ""..reason..""
										}, ]]
										--[[ {
											name = "Grupos:", 
											value = " "..groups..""
										}, ]]
										{
											name = "Retirou:", 
											value = ""..vRP.format(parseInt(activedAmount[user_id])).."x "..vRP.itemNameList(itemName)..""
										},
										--[[ {
											name = "Armas:", 
											value = ""..guns.." "
										}, ]]
									}, 
									footer = { 
										text = webhook.Text..os.date('[Dia:] %d-%m-%Y - [Horas:] %H:%M:%S'),
										icon_url = webhook.Icon
									},
									color = webhook.Color
								}
							}
						}), { ['Content-Type'] = 'application/json' })

						--creativeLogs(BennysLogs,"```PASSAPORTE: "..user_id.." ( RETIROU )\nITEM: "..vRP.format(parseInt(activedAmount[user_id])).."x "..vRP.itemNameList(itemName).."```")
					end

					if chestData == "chest:Cosanostra" then

						PerformHttpRequest(webhook.BCosanostra, function(err, text, headers) end, 'POST', json.encode({
							username = "Player Bau",
							avatar_url = webhook.Avatar,
							embeds = {
								{ 	------------------------------------------------------------
									title = "Registro - Bau",
									fields = {
										{ 
											name = "Usuário:", 
											value = ""..identity.name.." "..identity.name2.." [**"..user_id.."**] "
										},
										--[[ {
											name = "Coordenadas:", 
											value = coords
										}, ]]
										--[[ {
											name = "Motivo do quit:", 
											value = ""..reason..""
										}, ]]
										--[[ {
											name = "Grupos:", 
											value = " "..groups..""
										}, ]]
										{
											name = "Retirou:", 
											value = ""..vRP.format(parseInt(activedAmount[user_id])).."x "..vRP.itemNameList(itemName)..""
										},
										--[[ {
											name = "Armas:", 
											value = ""..guns.." "
										}, ]]
									}, 
									footer = { 
										text = webhook.Text..os.date('[Dia:] %d-%m-%Y - [Horas:] %H:%M:%S'),
										icon_url = webhook.Icon
									},
									color = webhook.Color
								}
							}
						}), { ['Content-Type'] = 'application/json' })

						--creativeLogs(CosanostraLogs,"```PASSAPORTE: "..user_id.." ( RETIROU )\nITEM: "..vRP.format(parseInt(activedAmount[user_id])).."x "..vRP.itemNameList(itemName).."```")
					end

					if chestData == "chest:Elcapone" then

						PerformHttpRequest(webhook.BElcapone, function(err, text, headers) end, 'POST', json.encode({
							username = "Player Bau",
							avatar_url = webhook.Avatar,
							embeds = {
								{ 	------------------------------------------------------------
									title = "Registro - Bau",
									fields = {
										{ 
											name = "Usuário:", 
											value = ""..identity.name.." "..identity.name2.." [**"..user_id.."**] "
										},
										--[[ {
											name = "Coordenadas:", 
											value = coords
										}, ]]
										--[[ {
											name = "Motivo do quit:", 
											value = ""..reason..""
										}, ]]
										--[[ {
											name = "Grupos:", 
											value = " "..groups..""
										}, ]]
										{
											name = "Retirou:", 
											value = ""..vRP.format(parseInt(activedAmount[user_id])).."x "..vRP.itemNameList(itemName)..""
										},
										--[[ {
											name = "Armas:", 
											value = ""..guns.." "
										}, ]]
									}, 
									footer = { 
										text = webhook.Text..os.date('[Dia:] %d-%m-%Y - [Horas:] %H:%M:%S'),
										icon_url = webhook.Icon
									},
									color = webhook.Color
								}
							}
						}), { ['Content-Type'] = 'application/json' })

						--creativeLogs(ElcaponeLogs,"```PASSAPORTE: "..user_id.." ( RETIROU )\nITEM: "..vRP.format(parseInt(activedAmount[user_id])).."x "..vRP.itemNameList(itemName).."```")
					end

					if chestData == "chest:Yakuza" then

						PerformHttpRequest(webhook.BYakuza, function(err, text, headers) end, 'POST', json.encode({
							username = "Player Bau",
							avatar_url = webhook.Avatar,
							embeds = {
								{ 	------------------------------------------------------------
									title = "Registro - Bau",
									fields = {
										{ 
											name = "Usuário:", 
											value = ""..identity.name.." "..identity.name2.." [**"..user_id.."**] "
										},
										--[[ {
											name = "Coordenadas:", 
											value = coords
										}, ]]
										--[[ {
											name = "Motivo do quit:", 
											value = ""..reason..""
										}, ]]
										--[[ {
											name = "Grupos:", 
											value = " "..groups..""
										}, ]]
										{
											name = "Retirou:", 
											value = ""..vRP.format(parseInt(activedAmount[user_id])).."x "..vRP.itemNameList(itemName)..""
										},
										--[[ {
											name = "Armas:", 
											value = ""..guns.." "
										}, ]]
									}, 
									footer = { 
										text = webhook.Text..os.date('[Dia:] %d-%m-%Y - [Horas:] %H:%M:%S'),
										icon_url = webhook.Icon
									},
									color = webhook.Color
								}
							}
						}), { ['Content-Type'] = 'application/json' })

						--creativeLogs(YakuzaLogs,"```PASSAPORTE: "..user_id.." ( RETIROU )\nITEM: "..vRP.format(parseInt(activedAmount[user_id])).."x "..vRP.itemNameList(itemName).."```")
					end

					if chestData == "chest:Bratva" then
						
						PerformHttpRequest(webhook.BBratva, function(err, text, headers) end, 'POST', json.encode({
							username = "Player Bau",
							avatar_url = webhook.Avatar,
							embeds = {
								{ 	------------------------------------------------------------
									title = "Registro - Bau",
									fields = {
										{ 
											name = "Usuário:", 
											value = ""..identity.name.." "..identity.name2.." [**"..user_id.."**] "
										},
										--[[ {
											name = "Coordenadas:", 
											value = coords
										}, ]]
										--[[ {
											name = "Motivo do quit:", 
											value = ""..reason..""
										}, ]]
										--[[ {
											name = "Grupos:", 
											value = " "..groups..""
										}, ]]
										{
											name = "Retirou:", 
											value = ""..vRP.format(parseInt(activedAmount[user_id])).."x "..vRP.itemNameList(itemName)..""
										},
										--[[ {
											name = "Armas:", 
											value = ""..guns.." "
										}, ]]
									}, 
									footer = { 
										text = webhook.Text..os.date('[Dia:] %d-%m-%Y - [Horas:] %H:%M:%S'),
										icon_url = webhook.Icon
									},
									color = webhook.Color
								}
							}
						}), { ['Content-Type'] = 'application/json' })

						--creativeLogs(BratvaLogs,"```PASSAPORTE: "..user_id.." ( RETIROU )\nITEM: "..vRP.format(parseInt(activedAmount[user_id])).."x "..vRP.itemNameList(itemName).."```")
					end

					if chestData == "chest:Groove" then

						PerformHttpRequest(webhook.BGroove, function(err, text, headers) end, 'POST', json.encode({
							username = "Player Bau",
							avatar_url = webhook.Avatar,
							embeds = {
								{ 	------------------------------------------------------------
									title = "Registro - Bau",
									fields = {
										{ 
											name = "Usuário:", 
											value = ""..identity.name.." "..identity.name2.." [**"..user_id.."**] "
										},
										--[[ {
											name = "Coordenadas:", 
											value = coords
										}, ]]
										--[[ {
											name = "Motivo do quit:", 
											value = ""..reason..""
										}, ]]
										--[[ {
											name = "Grupos:", 
											value = " "..groups..""
										}, ]]
										{
											name = "Retirou:", 
											value = ""..vRP.format(parseInt(activedAmount[user_id])).."x "..vRP.itemNameList(itemName)..""
										},
										--[[ {
											name = "Armas:", 
											value = ""..guns.." "
										}, ]]
									}, 
									footer = { 
										text = webhook.Text..os.date('[Dia:] %d-%m-%Y - [Horas:] %H:%M:%S'),
										icon_url = webhook.Icon
									},
									color = webhook.Color
								}
							}
						}), { ['Content-Type'] = 'application/json' })

						--creativeLogs(GrooveLogs,"```PASSAPORTE: "..user_id.." ( RETIROU )\nITEM: "..vRP.format(parseInt(activedAmount[user_id])).."x "..vRP.itemNameList(itemName).."```")
					end

					if chestData == "chest:Galaxy" then

						PerformHttpRequest(webhook.BGalaxy, function(err, text, headers) end, 'POST', json.encode({
							username = "Player Bau",
							avatar_url = webhook.Avatar,
							embeds = {
								{ 	------------------------------------------------------------
									title = "Registro - Bau",
									fields = {
										{ 
											name = "Usuário:", 
											value = ""..identity.name.." "..identity.name2.." [**"..user_id.."**] "
										},
										--[[ {
											name = "Coordenadas:", 
											value = coords
										}, ]]
										--[[ {
											name = "Motivo do quit:", 
											value = ""..reason..""
										}, ]]
										--[[ {
											name = "Grupos:", 
											value = " "..groups..""
										}, ]]
										{
											name = "Retirou:", 
											value = ""..vRP.format(parseInt(activedAmount[user_id])).."x "..vRP.itemNameList(itemName)..""
										},
										--[[ {
											name = "Armas:", 
											value = ""..guns.." "
										}, ]]
									}, 
									footer = { 
										text = webhook.Text..os.date('[Dia:] %d-%m-%Y - [Horas:] %H:%M:%S'),
										icon_url = webhook.Icon
									},
									color = webhook.Color
								}
							}
						}), { ['Content-Type'] = 'application/json' })
						
						--creativeLogs(GalaxyLogs,"```PASSAPORTE: "..user_id.." ( RETIROU )\nITEM: "..vRP.format(parseInt(activedAmount[user_id])).."x "..vRP.itemNameList(itemName).."```")
					end

					if chestData == "chest:Desmanche" then

						PerformHttpRequest(webhook.BDesmanche, function(err, text, headers) end, 'POST', json.encode({
							username = "Player Bau",
							avatar_url = webhook.Avatar,
							embeds = {
								{ 	------------------------------------------------------------
									title = "Registro - Bau",
									fields = {
										{ 
											name = "Usuário:", 
											value = ""..identity.name.." "..identity.name2.." [**"..user_id.."**] "
										},
										--[[ {
											name = "Coordenadas:", 
											value = coords
										}, ]]
										--[[ {
											name = "Motivo do quit:", 
											value = ""..reason..""
										}, ]]
										--[[ {
											name = "Grupos:", 
											value = " "..groups..""
										}, ]]
										{
											name = "Retirou:", 
											value = ""..vRP.format(parseInt(activedAmount[user_id])).."x "..vRP.itemNameList(itemName)..""
										},
										--[[ {
											name = "Armas:", 
											value = ""..guns.." "
										}, ]]
									}, 
									footer = { 
										text = webhook.Text..os.date('[Dia:] %d-%m-%Y - [Horas:] %H:%M:%S'),
										icon_url = webhook.Icon
									},
									color = webhook.Color
								}
							}
						}), { ['Content-Type'] = 'application/json' })

						--creativeLogs(DesmancheLogs,"```PASSAPORTE: "..user_id.." ( RETIROU )\nITEM: "..vRP.format(parseInt(activedAmount[user_id])).."x "..vRP.itemNameList(itemName).."```")
					end


					if chestData == "chest:Marabunta" then

						PerformHttpRequest(webhook.BMarabunta, function(err, text, headers) end, 'POST', json.encode({
							username = "Player Bau",
							avatar_url = webhook.Avatar,
							embeds = {
								{ 	------------------------------------------------------------
									title = "Registro - Bau",
									fields = {
										{ 
											name = "Usuário:", 
											value = ""..identity.name.." "..identity.name2.." [**"..user_id.."**] "
										},
										--[[ {
											name = "Coordenadas:", 
											value = coords
										}, ]]
										--[[ {
											name = "Motivo do quit:", 
											value = ""..reason..""
										}, ]]
										--[[ {
											name = "Grupos:", 
											value = " "..groups..""
										}, ]]
										{
											name = "Retirou:", 
											value = ""..vRP.format(parseInt(activedAmount[user_id])).."x "..vRP.itemNameList(itemName)..""
										},
										--[[ {
											name = "Armas:", 
											value = ""..guns.." "
										}, ]]
									}, 
									footer = { 
										text = webhook.Text..os.date('[Dia:] %d-%m-%Y - [Horas:] %H:%M:%S'),
										icon_url = webhook.Icon
									},
									color = webhook.Color
								}
							}
						}), { ['Content-Type'] = 'application/json' })

						--creativeLogs(MarabuntaLogs,"```PASSAPORTE: "..user_id.." ( RETIROU )\nITEM: "..vRP.format(parseInt(activedAmount[user_id])).."x "..vRP.itemNameList(itemName).."```")
					end

					if chestData == "chest:Bahamas" then

						PerformHttpRequest(webhook.BBahamas, function(err, text, headers) end, 'POST', json.encode({
							username = "Player Bau",
							avatar_url = webhook.Avatar,
							embeds = {
								{ 	------------------------------------------------------------
									title = "Registro - Bau",
									fields = {
										{ 
											name = "Usuário:", 
											value = ""..identity.name.." "..identity.name2.." [**"..user_id.."**] "
										},
										--[[ {
											name = "Coordenadas:", 
											value = coords
										}, ]]
										--[[ {
											name = "Motivo do quit:", 
											value = ""..reason..""
										}, ]]
										--[[ {
											name = "Grupos:", 
											value = " "..groups..""
										}, ]]
										{
											name = "Retirou:", 
											value = ""..vRP.format(parseInt(activedAmount[user_id])).."x "..vRP.itemNameList(itemName)..""
										},
										--[[ {
											name = "Armas:", 
											value = ""..guns.." "
										}, ]]
									}, 
									footer = { 
										text = webhook.Text..os.date('[Dia:] %d-%m-%Y - [Horas:] %H:%M:%S'),
										icon_url = webhook.Icon
									},
									color = webhook.Color
								}
							}
						}), { ['Content-Type'] = 'application/json' })

						--creativeLogs(DesmancheLogs,"```PASSAPORTE: "..user_id.." ( RETIROU )\nITEM: "..vRP.format(parseInt(activedAmount[user_id])).."x "..vRP.itemNameList(itemName).."```")
					end

					if parseInt(items[itemName].amount) <= 0 then
						items[itemName] = nil
					end

					vRP.setSData(chestData,json.encode(items))
					return true
				end
			end
		end
	end
	return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- STORECHESTITEM
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.storeChestItem(user_id,chestData,itemName,amount,chestWeight,slot)
	if actived[user_id] == nil then
		actived[user_id] = 1
		local slot = tostring(slot)
		local data = vRP.getSData(chestData)
		local items = json.decode(data) or {}
		local identity = vRP.getUserIdentity(parseInt(user_id))
		if data and items ~= nil then

			if parseInt(amount) > 0 then
				activedAmount[user_id] = parseInt(amount)
			else
				local inv = vRP.getInventory(user_id)
				if inv[slot] then
					activedAmount[user_id] = parseInt(inv[slot].amount)
				end
			end

			local new_weight = vRP.computeChestWeight(items) + vRP.itemWeightList(itemName) * parseInt(activedAmount[user_id])
			if new_weight <= chestWeight then
				if vRP.tryGetInventoryItem(user_id,itemName,parseInt(activedAmount[user_id]),true,slot) then
					if items[itemName] ~= nil then
						items[itemName].amount = parseInt(items[itemName].amount) + parseInt(activedAmount[user_id])
					else
						items[itemName] = { amount = parseInt(activedAmount[user_id]) }
					end

					if chestData == "chest:Policia" then

						PerformHttpRequest(webhook.BPolicia, function(err, text, headers) end, 'POST', json.encode({
							username = "Player Bau",
							avatar_url = webhook.Avatar,
							embeds = {
								{ 	------------------------------------------------------------
									title = "Registro - Bau",
									fields = {
										{ 
											name = "Usuário:", 
											value = ""..identity.name.." "..identity.name2.." [**"..user_id.."**] "
										},
										--[[ {
											name = "Coordenadas:", 
											value = coords
										}, ]]
										--[[ {
											name = "Motivo do quit:", 
											value = ""..reason..""
										}, ]]
										--[[ {
											name = "Grupos:", 
											value = " "..groups..""
										}, ]]
										{
											name = "Guardou:", 
											value = ""..vRP.format(parseInt(activedAmount[user_id])).."x "..vRP.itemNameList(itemName)..""
										},
										--[[ {
											name = "Armas:", 
											value = ""..guns.." "
										}, ]]
									}, 
									footer = { 
										text = webhook.Text..os.date('[Dia:] %d-%m-%Y - [Horas:] %H:%M:%S'),
										icon_url = webhook.Icon
									},
									color = webhook.Color
								}
							}
						}), { ['Content-Type'] = 'application/json' })

						--creativeLogs(policeLogs,"```PASSAPORTE: "..user_id.." ( Guardou )\nITEM: "..vRP.format(parseInt(activedAmount[user_id])).."x "..vRP.itemNameList(itemName).."```")
					end

					if chestData == "chest:Ballas" then

						PerformHttpRequest(webhook.BBallas, function(err, text, headers) end, 'POST', json.encode({
							username = "Player Bau",
							avatar_url = webhook.Avatar,
							embeds = {
								{ 	------------------------------------------------------------
									title = "Registro - Bau",
									fields = {
										{ 
											name = "Usuário:", 
											value = ""..identity.name.." "..identity.name2.." [**"..user_id.."**] "
										},
										--[[ {
											name = "Coordenadas:", 
											value = coords
										}, ]]
										--[[ {
											name = "Motivo do quit:", 
											value = ""..reason..""
										}, ]]
										--[[ {
											name = "Grupos:", 
											value = " "..groups..""
										}, ]]
										{
											name = "Guardou:", 
											value = ""..vRP.format(parseInt(activedAmount[user_id])).."x "..vRP.itemNameList(itemName)..""
										},
										--[[ {
											name = "Armas:", 
											value = ""..guns.." "
										}, ]]
									}, 
									footer = { 
										text = webhook.Text..os.date('[Dia:] %d-%m-%Y - [Horas:] %H:%M:%S'),
										icon_url = webhook.Icon
									},
									color = webhook.Color
								}
							}
						}), { ['Content-Type'] = 'application/json' })

						--creativeLogs(BallasLogs,"```PASSAPORTE: "..user_id.." ( Guardou )\nITEM: "..vRP.format(parseInt(activedAmount[user_id])).."x "..vRP.itemNameList(itemName).."```")
					end

					if chestData == "chest:Vagos" then

						PerformHttpRequest(webhook.BVagos, function(err, text, headers) end, 'POST', json.encode({
							username = "Player Bau",
							avatar_url = webhook.Avatar,
							embeds = {
								{ 	------------------------------------------------------------
									title = "Registro - Bau",
									fields = {
										{ 
											name = "Usuário:", 
											value = ""..identity.name.." "..identity.name2.." [**"..user_id.."**] "
										},
										--[[ {
											name = "Coordenadas:", 
											value = coords
										}, ]]
										--[[ {
											name = "Motivo do quit:", 
											value = ""..reason..""
										}, ]]
										--[[ {
											name = "Grupos:", 
											value = " "..groups..""
										}, ]]
										{
											name = "Guardou:", 
											value = ""..vRP.format(parseInt(activedAmount[user_id])).."x "..vRP.itemNameList(itemName)..""
										},
										--[[ {
											name = "Armas:", 
											value = ""..guns.." "
										}, ]]
									}, 
									footer = { 
										text = webhook.Text..os.date('[Dia:] %d-%m-%Y - [Horas:] %H:%M:%S'),
										icon_url = webhook.Icon
									},
									color = webhook.Color
								}
							}
						}), { ['Content-Type'] = 'application/json' })

						--creativeLogs(VagosLogs,"```PASSAPORTE: "..user_id.." ( Guardou )\nITEM: "..vRP.format(parseInt(activedAmount[user_id])).."x "..vRP.itemNameList(itemName).."```")
					end

					if chestData == "chest:Cassino" then

						PerformHttpRequest(webhook.BCassino, function(err, text, headers) end, 'POST', json.encode({
							username = "Player Bau",
							avatar_url = webhook.Avatar,
							embeds = {
								{ 	------------------------------------------------------------
									title = "Registro - Bau",
									fields = {
										{ 
											name = "Usuário:", 
											value = ""..identity.name.." "..identity.name2.." [**"..user_id.."**] "
										},
										--[[ {
											name = "Coordenadas:", 
											value = coords
										}, ]]
										--[[ {
											name = "Motivo do quit:", 
											value = ""..reason..""
										}, ]]
										--[[ {
											name = "Grupos:", 
											value = " "..groups..""
										}, ]]
										{
											name = "Guardou:", 
											value = ""..vRP.format(parseInt(activedAmount[user_id])).."x "..vRP.itemNameList(itemName)..""
										},
										--[[ {
											name = "Armas:", 
											value = ""..guns.." "
										}, ]]
									}, 
									footer = { 
										text = webhook.Text..os.date('[Dia:] %d-%m-%Y - [Horas:] %H:%M:%S'),
										icon_url = webhook.Icon
									},
									color = webhook.Color
								}
							}
						}), { ['Content-Type'] = 'application/json' })


						--creativeLogs(CassinoLogs,"```PASSAPORTE: "..user_id.." ( Guardou )\nITEM: "..vRP.format(parseInt(activedAmount[user_id])).."x "..vRP.itemNameList(itemName).."```")
					end

					if chestData == "chest:Mecanico" then

						PerformHttpRequest(webhook.BMecanico, function(err, text, headers) end, 'POST', json.encode({
							username = "Player Bau",
							avatar_url = webhook.Avatar,
							embeds = {
								{ 	------------------------------------------------------------
									title = "Registro - Bau",
									fields = {
										{ 
											name = "Usuário:", 
											value = ""..identity.name.." "..identity.name2.." [**"..user_id.."**] "
										},
										--[[ {
											name = "Coordenadas:", 
											value = coords
										}, ]]
										--[[ {
											name = "Motivo do quit:", 
											value = ""..reason..""
										}, ]]
										--[[ {
											name = "Grupos:", 
											value = " "..groups..""
										}, ]]
										{
											name = "Guardou:", 
											value = ""..vRP.format(parseInt(activedAmount[user_id])).."x "..vRP.itemNameList(itemName)..""
										},
										--[[ {
											name = "Armas:", 
											value = ""..guns.." "
										}, ]]
									}, 
									footer = { 
										text = webhook.Text..os.date('[Dia:] %d-%m-%Y - [Horas:] %H:%M:%S'),
										icon_url = webhook.Icon
									},
									color = webhook.Color
								}
							}
						}), { ['Content-Type'] = 'application/json' })

						--creativeLogs(MecanicoLogs,"```PASSAPORTE: "..user_id.." ( Guardou )\nITEM: "..vRP.format(parseInt(activedAmount[user_id])).."x "..vRP.itemNameList(itemName).."```")
					end

					if chestData == "chest:Bennys" then

						PerformHttpRequest(webhook.BBennys, function(err, text, headers) end, 'POST', json.encode({
							username = "Player Bau",
							avatar_url = webhook.Avatar,
							embeds = {
								{ 	------------------------------------------------------------
									title = "Registro - Bau",
									fields = {
										{ 
											name = "Usuário:", 
											value = ""..identity.name.." "..identity.name2.." [**"..user_id.."**] "
										},
										--[[ {
											name = "Coordenadas:", 
											value = coords
										}, ]]
										--[[ {
											name = "Motivo do quit:", 
											value = ""..reason..""
										}, ]]
										--[[ {
											name = "Grupos:", 
											value = " "..groups..""
										}, ]]
										{
											name = "Guardou:", 
											value = ""..vRP.format(parseInt(activedAmount[user_id])).."x "..vRP.itemNameList(itemName)..""
										},
										--[[ {
											name = "Armas:", 
											value = ""..guns.." "
										}, ]]
									}, 
									footer = { 
										text = webhook.Text..os.date('[Dia:] %d-%m-%Y - [Horas:] %H:%M:%S'),
										icon_url = webhook.Icon
									},
									color = webhook.Color
								}
							}
						}), { ['Content-Type'] = 'application/json' })

						--creativeLogs(BennysLogs,"```PASSAPORTE: "..user_id.." ( Guardou )\nITEM: "..vRP.format(parseInt(activedAmount[user_id])).."x "..vRP.itemNameList(itemName).."```")
					end

					if chestData == "chest:Cosanostra" then

						PerformHttpRequest(webhook.BCosanostra, function(err, text, headers) end, 'POST', json.encode({
							username = "Player Bau",
							avatar_url = webhook.Avatar,
							embeds = {
								{ 	------------------------------------------------------------
									title = "Registro - Bau",
									fields = {
										{ 
											name = "Usuário:", 
											value = ""..identity.name.." "..identity.name2.." [**"..user_id.."**] "
										},
										--[[ {
											name = "Coordenadas:", 
											value = coords
										}, ]]
										--[[ {
											name = "Motivo do quit:", 
											value = ""..reason..""
										}, ]]
										--[[ {
											name = "Grupos:", 
											value = " "..groups..""
										}, ]]
										{
											name = "Guardou:", 
											value = ""..vRP.format(parseInt(activedAmount[user_id])).."x "..vRP.itemNameList(itemName)..""
										},
										--[[ {
											name = "Armas:", 
											value = ""..guns.." "
										}, ]]
									}, 
									footer = { 
										text = webhook.Text..os.date('[Dia:] %d-%m-%Y - [Horas:] %H:%M:%S'),
										icon_url = webhook.Icon
									},
									color = webhook.Color
								}
							}
						}), { ['Content-Type'] = 'application/json' })

						--creativeLogs(CosanostraLogs,"```PASSAPORTE: "..user_id.." ( Guardou )\nITEM: "..vRP.format(parseInt(activedAmount[user_id])).."x "..vRP.itemNameList(itemName).."```")
					end

					if chestData == "chest:Elcapone" then

						PerformHttpRequest(webhook.BElcapone, function(err, text, headers) end, 'POST', json.encode({
							username = "Player Bau",
							avatar_url = webhook.Avatar,
							embeds = {
								{ 	------------------------------------------------------------
									title = "Registro - Bau",
									fields = {
										{ 
											name = "Usuário:", 
											value = ""..identity.name.." "..identity.name2.." [**"..user_id.."**] "
										},
										--[[ {
											name = "Coordenadas:", 
											value = coords
										}, ]]
										--[[ {
											name = "Motivo do quit:", 
											value = ""..reason..""
										}, ]]
										--[[ {
											name = "Grupos:", 
											value = " "..groups..""
										}, ]]
										{
											name = "Guardou:", 
											value = ""..vRP.format(parseInt(activedAmount[user_id])).."x "..vRP.itemNameList(itemName)..""
										},
										--[[ {
											name = "Armas:", 
											value = ""..guns.." "
										}, ]]
									}, 
									footer = { 
										text = webhook.Text..os.date('[Dia:] %d-%m-%Y - [Horas:] %H:%M:%S'),
										icon_url = webhook.Icon
									},
									color = webhook.Color
								}
							}
						}), { ['Content-Type'] = 'application/json' })

						--creativeLogs(ElcaponeLogs,"```PASSAPORTE: "..user_id.." ( Guardou )\nITEM: "..vRP.format(parseInt(activedAmount[user_id])).."x "..vRP.itemNameList(itemName).."```")
					end

					if chestData == "chest:Yakuza" then

						PerformHttpRequest(webhook.BYakuza, function(err, text, headers) end, 'POST', json.encode({
							username = "Player Bau",
							avatar_url = webhook.Avatar,
							embeds = {
								{ 	------------------------------------------------------------
									title = "Registro - Bau",
									fields = {
										{ 
											name = "Usuário:", 
											value = ""..identity.name.." "..identity.name2.." [**"..user_id.."**] "
										},
										--[[ {
											name = "Coordenadas:", 
											value = coords
										}, ]]
										--[[ {
											name = "Motivo do quit:", 
											value = ""..reason..""
										}, ]]
										--[[ {
											name = "Grupos:", 
											value = " "..groups..""
										}, ]]
										{
											name = "Guardou:", 
											value = ""..vRP.format(parseInt(activedAmount[user_id])).."x "..vRP.itemNameList(itemName)..""
										},
										--[[ {
											name = "Armas:", 
											value = ""..guns.." "
										}, ]]
									}, 
									footer = { 
										text = webhook.Text..os.date('[Dia:] %d-%m-%Y - [Horas:] %H:%M:%S'),
										icon_url = webhook.Icon
									},
									color = webhook.Color
								}
							}
						}), { ['Content-Type'] = 'application/json' })

						--creativeLogs(YakuzaLogs,"```PASSAPORTE: "..user_id.." ( Guardou )\nITEM: "..vRP.format(parseInt(activedAmount[user_id])).."x "..vRP.itemNameList(itemName).."```")
					end

					if chestData == "chest:Bratva" then
						
						PerformHttpRequest(webhook.BBratva, function(err, text, headers) end, 'POST', json.encode({
							username = "Player Bau",
							avatar_url = webhook.Avatar,
							embeds = {
								{ 	------------------------------------------------------------
									title = "Registro - Bau",
									fields = {
										{ 
											name = "Usuário:", 
											value = ""..identity.name.." "..identity.name2.." [**"..user_id.."**] "
										},
										--[[ {
											name = "Coordenadas:", 
											value = coords
										}, ]]
										--[[ {
											name = "Motivo do quit:", 
											value = ""..reason..""
										}, ]]
										--[[ {
											name = "Grupos:", 
											value = " "..groups..""
										}, ]]
										{
											name = "Guardou:", 
											value = ""..vRP.format(parseInt(activedAmount[user_id])).."x "..vRP.itemNameList(itemName)..""
										},
										--[[ {
											name = "Armas:", 
											value = ""..guns.." "
										}, ]]
									}, 
									footer = { 
										text = webhook.Text..os.date('[Dia:] %d-%m-%Y - [Horas:] %H:%M:%S'),
										icon_url = webhook.Icon
									},
									color = webhook.Color
								}
							}
						}), { ['Content-Type'] = 'application/json' })

						--creativeLogs(BratvaLogs,"```PASSAPORTE: "..user_id.." ( Guardou )\nITEM: "..vRP.format(parseInt(activedAmount[user_id])).."x "..vRP.itemNameList(itemName).."```")
					end

					if chestData == "chest:Groove" then

						PerformHttpRequest(webhook.BGroove, function(err, text, headers) end, 'POST', json.encode({
							username = "Player Bau",
							avatar_url = webhook.Avatar,
							embeds = {
								{ 	------------------------------------------------------------
									title = "Registro - Bau",
									fields = {
										{ 
											name = "Usuário:", 
											value = ""..identity.name.." "..identity.name2.." [**"..user_id.."**] "
										},
										--[[ {
											name = "Coordenadas:", 
											value = coords
										}, ]]
										--[[ {
											name = "Motivo do quit:", 
											value = ""..reason..""
										}, ]]
										--[[ {
											name = "Grupos:", 
											value = " "..groups..""
										}, ]]
										{
											name = "Guardou:", 
											value = ""..vRP.format(parseInt(activedAmount[user_id])).."x "..vRP.itemNameList(itemName)..""
										},
										--[[ {
											name = "Armas:", 
											value = ""..guns.." "
										}, ]]
									}, 
									footer = { 
										text = webhook.Text..os.date('[Dia:] %d-%m-%Y - [Horas:] %H:%M:%S'),
										icon_url = webhook.Icon
									},
									color = webhook.Color
								}
							}
						}), { ['Content-Type'] = 'application/json' })

						--creativeLogs(GrooveLogs,"```PASSAPORTE: "..user_id.." ( Guardou )\nITEM: "..vRP.format(parseInt(activedAmount[user_id])).."x "..vRP.itemNameList(itemName).."```")
					end

					if chestData == "chest:Galaxy" then

						PerformHttpRequest(webhook.BGalaxy, function(err, text, headers) end, 'POST', json.encode({
							username = "Player Bau",
							avatar_url = webhook.Avatar,
							embeds = {
								{ 	------------------------------------------------------------
									title = "Registro - Bau",
									fields = {
										{ 
											name = "Usuário:", 
											value = ""..identity.name.." "..identity.name2.." [**"..user_id.."**] "
										},
										--[[ {
											name = "Coordenadas:", 
											value = coords
										}, ]]
										--[[ {
											name = "Motivo do quit:", 
											value = ""..reason..""
										}, ]]
										--[[ {
											name = "Grupos:", 
											value = " "..groups..""
										}, ]]
										{
											name = "Guardou:", 
											value = ""..vRP.format(parseInt(activedAmount[user_id])).."x "..vRP.itemNameList(itemName)..""
										},
										--[[ {
											name = "Armas:", 
											value = ""..guns.." "
										}, ]]
									}, 
									footer = { 
										text = webhook.Text..os.date('[Dia:] %d-%m-%Y - [Horas:] %H:%M:%S'),
										icon_url = webhook.Icon
									},
									color = webhook.Color
								}
							}
						}), { ['Content-Type'] = 'application/json' })
						
						--creativeLogs(GalaxyLogs,"```PASSAPORTE: "..user_id.." ( Guardou )\nITEM: "..vRP.format(parseInt(activedAmount[user_id])).."x "..vRP.itemNameList(itemName).."```")
					end

					if chestData == "chest:Desmanche" then

						PerformHttpRequest(webhook.BDesmanche, function(err, text, headers) end, 'POST', json.encode({
							username = "Player Bau",
							avatar_url = webhook.Avatar,
							embeds = {
								{ 	------------------------------------------------------------
									title = "Registro - Bau",
									fields = {
										{ 
											name = "Usuário:", 
											value = ""..identity.name.." "..identity.name2.." [**"..user_id.."**] "
										},
										--[[ {
											name = "Coordenadas:", 
											value = coords
										}, ]]
										--[[ {
											name = "Motivo do quit:", 
											value = ""..reason..""
										}, ]]
										--[[ {
											name = "Grupos:", 
											value = " "..groups..""
										}, ]]
										{
											name = "Guardou:", 
											value = ""..vRP.format(parseInt(activedAmount[user_id])).."x "..vRP.itemNameList(itemName)..""
										},
										--[[ {
											name = "Armas:", 
											value = ""..guns.." "
										}, ]]
									}, 
									footer = { 
										text = webhook.Text..os.date('[Dia:] %d-%m-%Y - [Horas:] %H:%M:%S'),
										icon_url = webhook.Icon
									},
									color = webhook.Color
								}
							}
						}), { ['Content-Type'] = 'application/json' })

						--creativeLogs(DesmancheLogs,"```PASSAPORTE: "..user_id.." ( Guardou )\nITEM: "..vRP.format(parseInt(activedAmount[user_id])).."x "..vRP.itemNameList(itemName).."```")
					end

					if chestData == "chest:Bahamas" then

						PerformHttpRequest(webhook.BBahamas, function(err, text, headers) end, 'POST', json.encode({
							username = "Player Bau",
							avatar_url = webhook.Avatar,
							embeds = {
								{ 	------------------------------------------------------------
									title = "Registro - Bau",
									fields = {
										{ 
											name = "Usuário:", 
											value = ""..identity.name.." "..identity.name2.." [**"..user_id.."**] "
										},
										--[[ {
											name = "Coordenadas:", 
											value = coords
										}, ]]
										--[[ {
											name = "Motivo do quit:", 
											value = ""..reason..""
										}, ]]
										--[[ {
											name = "Grupos:", 
											value = " "..groups..""
										}, ]]
										{
											name = "Guardou:", 
											value = ""..vRP.format(parseInt(activedAmount[user_id])).."x "..vRP.itemNameList(itemName)..""
										},
										--[[ {
											name = "Armas:", 
											value = ""..guns.." "
										}, ]]
									}, 
									footer = { 
										text = webhook.Text..os.date('[Dia:] %d-%m-%Y - [Horas:] %H:%M:%S'),
										icon_url = webhook.Icon
									},
									color = webhook.Color
								}
							}
						}), { ['Content-Type'] = 'application/json' })

						--creativeLogs(DesmancheLogs,"```PASSAPORTE: "..user_id.." ( Guardou )\nITEM: "..vRP.format(parseInt(activedAmount[user_id])).."x "..vRP.itemNameList(itemName).."```")
					end

					vRP.setSData(chestData,json.encode(items))
					return true
				end
			end
		end
	end
	return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- CREATIVELOGS
-----------------------------------------------------------------------------------------------------------------------------------------
function creativeLogs(webhook,message)
	if webhook ~= "" then
		PerformHttpRequest(webhook,function(err,text,headers) end,"POST",json.encode({ content = message }),{ ['Content-Type'] = "application/json" })
	end
end