fx_version 'cerulean'

game 'gta5'
ui_page 'ui/index.html'

shared_scripts {
    '@qb-core/shared/locale.lua',
    'locales/en.lua',
    'config.lua',
}

client_scripts{
    'client/*.lua',
}

server_scripts{
    'server/*.lua',
}

files {
    'config.js',
	'ui/index.html',
	'ui/style.css',
	'ui/app.js',
	'ui/assets/img/*.png'
}

dependency 'qb-target'