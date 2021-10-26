fx_version "adamant"
fx_version "bodacious"
game "gta5"

this_is_a_map 'yes'

ui_page "nui/index.html"

client_scripts {
	"@vrp/lib/utils.lua",
	"client_config.lua",
	"client.lua"
} 

server_script {
	"@vrp/lib/utils.lua",
	"server_config.lua",
	"server.lua"
}

files {
	"nui/index.html",
	"nui/lang.js",
	"nui/script.js",
	"nui/style.css",
	"nui/fonts/*.ttf",
	"nui/fonts/*.otf"
}