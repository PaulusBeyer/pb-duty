fx_version 'cerulean'
game 'gta5'

author 'Paulus Beyer'
description 'Script for toggle duty on customs created jobs for QB Framework'
version '1.0.0'

client_script 'client/main.lua'

server_script 'server/main.lua'

shared_scripts {
    '@PolyZone/client.lua',
    '@PolyZone/CircleZone.lua',
    '@PolyZone/BoxZone.lua',
    'config.lua',
    '@qb-core/shared/locale.lua',
    'locales/es.lua',
    'locales/*.lua'
}

dependencies {
	'qb-core'
}