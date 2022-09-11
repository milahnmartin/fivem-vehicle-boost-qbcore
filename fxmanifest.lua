fx_version 'cerulean'
game 'gta5'

description 'heist by ultrafy'
version '1.2.0'

ui_page 'ui/index.html'

shared_scripts {
    '@oxmysql/lib/MySQL.lua',
    '@qb-core/shared/locale.lua',
    'shared/config.lua',
}

server_scripts {
    'server/*.lua'
}

client_scripts{
    'client/*.lua',
}

files {
    'ui/index.html',
    'ui/script.js',
    'ui/style.css',
}

lua54 'yes'
