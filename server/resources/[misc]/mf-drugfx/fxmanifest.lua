fx_version 'adamant'
games { 'gta5' }

version '1.0.0'
mod 'mf-drugfx'

ui_page 'src/nui/index.html'

client_scripts {
	"@vrp/lib/utils.lua",
  'config.lua',
  'src/client/functions.lua',
  'src/client/toons.lua',
  'src/client/drugsfx.lua',
}

server_scripts {
	"@vrp/lib/utils.lua",
  'config.lua',  
  'src/server/main.lua',
}

files {
  'src/nui/index.html'
}