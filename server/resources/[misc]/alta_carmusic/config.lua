Config = {}

Config.DistanceToVolume = 30.0 -- A distância que estará com o volume em .,0, então se o volume for 0.5 a distância será 15,0, se o volume for 0.2 a distância será 6.

Config.PlayToEveryone = true -- A música no carro será tocada para todos? Ou apenas para as pessoas que estão naquele veículo? Se for false, o DistanceToVolume não fará nada

Config.Permission = false -- Coloque aqui, se voce quer pra abrir por permission ( mude ela no server-side)

Config.CommandVehicle = "carmusic" -- Só funcionará se Config.ItemInVehicle == true

Config.Zones = {
	{
		name = "Mecanica", -- O nome do rádio não importa
		coords = vector3(-212.52,-1341.59,34.89), -- a posição onde a música é tocada
		range = 30.0, -- a extensão em que a música pode ser ouvida
		volume = 0.1, --volume padrão? mínimo 0.00, máximo 1.00
		deflink = "https://www.youtube.com/watch?v=2qZCL0zcxLM",-- o link padrão, se não, não reproduzirá nada
		isplaying = false, -- a música tocará quando o servidor iniciar?
		loop = false,-- quando a música para, ela se repete?
		deftime = 0, -- onde começa a música? 0 e vai começar no começo
		changemusicblip = vector3(-212.53,-1341.61,34.89) -- onde o jogador pode mudar a música
	},
}