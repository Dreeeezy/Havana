fx_version "bodacious"
game "gta5"

ui_page "web-side/index.html"

server_scripts {
	"lib/utils.lua",
	"base.lua",
	"queue.lua",
	"server-side/*"
}

client_scripts {
	"lib/utils.lua",
	"client-side/*"
}

files {
    'loadscreen/index.html',
    'loadscreen/musica/musica.mp3',
    'loadscreen/css/bootstrap.min.css',
    'loadscreen/css/css.css',
    'loadscreen/css/fontawesome-all.min.css',
    'loadscreen/css/colors/yellow-2.css',
    'loadscreen/css/style-dark.css',
    'loadscreen/img/film-grain.png',
    'loadscreen/img/logo-light.png',
    'loadscreen/js/main.js',
    'loadscreen/js/plugins.js',
    'loadscreen/webfonts/fa-brands-400.eot',
    'loadscreen/webfonts/fa-brands-400.svg',
    'loadscreen/webfonts/fa-brands-400.ttf',
    'loadscreen/webfonts/fa-brands-400.woff',
    'loadscreen/webfonts/fa-brands-400.woff2',
    'loadscreen/webfonts/fa-light-300.eot',
    'loadscreen/webfonts/fa-light-300.svg',
    'loadscreen/webfonts/fa-light-300.ttf',
    'loadscreen/webfonts/fa-light-300.woff',
    'loadscreen/webfonts/fa-light-300.woff2',
    'loadscreen/webfonts/fa-regular-400.eot',
    'loadscreen/webfonts/fa-regular-400.svg',
    'loadscreen/webfonts/fa-regular-400.ttf',
    'loadscreen/webfonts/fa-regular-400.woff',
    'loadscreen/webfonts/fa-regular-400.woff2',
    'loadscreen/webfonts/fa-solid-900.eot',
    'loadscreen/webfonts/fa-solid-900.svg',
    'loadscreen/webfonts/fa-solid-900.ttf',
    'loadscreen/webfonts/fa-solid-900.woff',
    'loadscreen/webfonts/fa-solid-900.woff2',
    "web-side/*",
    "lib/Tunnel.lua",
    "lib/Proxy.lua",
    "lib/Luaseq.lua",
    "lib/Tools.lua"
}

loadscreen 'loadscreen/index.html'









