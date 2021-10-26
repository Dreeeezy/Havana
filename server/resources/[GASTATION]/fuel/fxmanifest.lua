fx_version "adamant"
fx_version "bodacious"
game "gta5"

ui_page 'html/ui.html'

server_scripts {
	'@vrp/lib/utils.lua',
	"@mysql-async/lib/MySQL.lua",
	"config.lua",
	"server.lua"
}

client_scripts {
	'@vrp/lib/utils.lua',	
	"config.lua",
	"client.lua"
}

files {
  'html/ui.html',
  'html/ui.css', 
  'html/ui.js'
}









