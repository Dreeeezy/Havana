fx_version 'cerulean'
games { 'gta5' }

ui_page 'html/index.html'

client_scripts {
  "@vrp/lib/utils.lua",
  'config.lua',
  'client/main.lua',
}

files {
	'html/index.html',
	'html/script.js',
	'html/*.svg',
	'html/radio.png',
	'html/main.css',
}

server_scripts {
  'config.lua',
  "@vrp/lib/utils.lua",
  'server/main.lua',
}