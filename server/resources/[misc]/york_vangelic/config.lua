local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")

System = {
    ['number_of_cops'] = 3,
    ['jewelry_respawn_timer'] = 3600,
    ['user_perms'] = vRP.numPermission('Policia')
}

Locations = {
    ['robbery_start'] = vec3(-631.46, -230.11, 38.06) -- Local para iniciar o roubo
}

Itens = {
	{ item = "watch", nome = "Relogio(s) Roubado(s)" },
	{ item = "bracelet", nome = "Pulseira(s) Roubada(s)" },
	{ item = "ring", nome = "Anel(s) Roubado(s)" },
	{ item = "goldring", nome = "Anel(s) de Ouro Roubado(s)" },
	{ item = "colar", nome = "Colar(es) Roubado(s)" }
}

Give_item = function(user_id,joia,quant)
    vRP.giveInventoryItem(user_id,joia,quant,true)
end

Give_Painting = function(user_id, int)
    vRP.giveInventoryItem(user_id,('painting'..int),1,true)
end

Strings = {
    ['start_stealing'] = 'Pressione [E] para roubar a pintura',
    ['start_robbery'] = 'Pressione ~p~[E]~w~ para iniciar o roubo',
    ['cut_right'] = 'Pressione [E] para cortar a direita',
    ['cut_left'] = 'Pressione [E] para cortar a esquerda',
    ['cut_down'] = 'Pressione [E] para cortar para baixo',
    ['start_heist'] = 'Pressione [E] para começar o roubo',
    ['get_jewels'] = '~b~[E] ~w~ROUBAR',

    ['weapon_needed'] = 'Você precisa estar com uma <b>AK-103</b> ou uma <b>SMG</b> em suas mãos.',
    ['robbery_started'] = 'Você iniciou o roubo',
    ['already_cuting'] = 'Você já está cortando a pintura.',
    ['already_heist'] = 'Você já iniciou o roubo.',
    ['received_painting'] = 'Você recebeu um <b>quadro</b>',

    ['paintings_first'] = 'Roube os <b>quadros</b> primeiro, para depois roubar as <b>joias</b>.',
    ['insufficient_cops_amount'] = 'Número insuficiente de <b>Policiais</b> no momento.',
    ['get_them'] = 'O roubo começou na ^1Joalheria^0, dirija-se até o local e intercepte os Assaltantes.',
}