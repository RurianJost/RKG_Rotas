fx_version 'bodacious'
game 'gta5'

name 'RKG Rotas'
author 'Rurian Jost'
version '1.0'

shared_script {
	'@vrp/lib/utils.lua',
	'shared/*',
}

server_scripts {
	'src/server/*.lua',
}

client_scripts {
	'src/client/*.lua',
}