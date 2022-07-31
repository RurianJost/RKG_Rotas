fx_version 'bodacious'
game 'gta5'

name 'RKG Rotas'
author 'Rurian Jost'
discord 'https://dsc.gg/rkgstore'
version '1.0.2'

shared_script {
	'@vrp/lib/utils.lua',
	'config/config.lua',
	'shared/*',
}

server_scripts {
	"config/sv_func.lua",
	'src/server/*.lua',
}

client_scripts {
	"config/cl_func.lua",
	'src/client/*.lua',
}