fx_version "bodacious"
game "gta5"

ui_page "nui/index.html"

client_scripts {
	"@vrp/lib/utils.lua",
	"src/c_utils.lua",
	"c_config.lua",
	"src/c_main.lua",
	"src/c_TokoVoip.lua",
	"src/nuiProxy.js"
}

server_scripts {
	"@vrp/lib/utils.lua",
	"s_config.lua",
	"src/s_main.lua",
	"src/s_utils.lua"
}

files {
	"nui/*"
}







