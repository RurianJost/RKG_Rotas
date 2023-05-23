fx_version 'bodacious'
game 'gta5'

name 'RKG_Rotas'
author 'Rurian Jost'
discord 'https://dsc.gg/rkgstore'
version '2.0.1'

shared_script {
	'@vrp/lib/utils.lua', 

	'config/config.lua'
}

server_scripts {
	'config/server/*.lua', 

	'server/*.lua'
}

client_scripts {
	'config/client/*.lua', 

	'client/*.lua'
}