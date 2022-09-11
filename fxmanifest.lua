fx_version 'cerulean'
game 'gta5'

description 'boosting by ultrafy'
version '1.2.0'

ui_page 'ui/index.html'

shared_scripts {
    '@qb-core/shared/locale.lua',
    '@oxmysql/lib/MySQL.lua',
    'shared/config.lua',
}

server_scripts {
    'server/sv_main.lua'
}

client_scripts{
    'client/*.lua',
}

files {
    'ui/index.html',
    'ui/script.js',
    'ui/style.css',
    'ui/images/*.png',
    'ui/images/*.jpg',
    
}

lua54 'yes'
