Config_Rotas = {
    ["Creative"] = false, -- se sua base for 'creative' deixe true, caso não seje deixe false.
    ["Orgs"] = {
        ["Bennys"] = {
            ["Perm"] = "bennys.permissao", -- Perissão para iniciar a rota.
            ["Locale"] = vector3( -224.96084594727, -1339.8135986328, 30.8939037323 ), -- Local do blip para iniciar a rota.
            ["Itens"] = {
                "elastic", -- Nome do Item.
                "emptybottle", -- Nome do Item.
                ["Quantity"] = {3,10}, -- Quantidade que virá, ao Apertar E no Blip (Minimo,Maximo).
            },
            ["BlipRoutes"] = {
                vector3( -1179.0146484375, -2047.6497802734, 13.938519477844 ), -- CDS dos Blips, Após ter iniciado a Rota.
                vector3( -1151.0631103516, -2044.3098144531, 13.184195518494 ), -- CDS dos Blips, Após ter iniciado a Rota.
                vector3( -1109.6333007812, -1987.0076904297, 13.160370826721 ), -- CDS dos Blips, Após ter iniciado a Rota.
                vector3( -539.85778808594, -2212.4538574219, 6.3940267562866 ), -- CDS dos Blips, Após ter iniciado a Rota.
                vector3( -424.33850097656, -2167.8781738281, 11.338561058044 ), -- CDS dos Blips, Após ter iniciado a Rota.
            }
        },
        ["SportRace"] = {
            ["Perm"] = "sportrace.permissao", -- Perissão para iniciar a rota.
            ["Locale"] = vector3( 839.42559814453, -948.36492919922, 26.484636306763 ), -- Local do blip para iniciar a rota.
            ["Itens"] = {
                "elastic", -- Nome do Item.
                "emptybottle", -- Nome do Item.
                ["Quantity"] = {3,10}, -- Quantidade que virá, ao Apertar E no Blip (Minimo,Maximo).
            },
            ["BlipRoutes"] = {
                vector3( 495.26477050781, -576.78662109375, 24.641208648682 ), -- CDS dos Blips, Após ter iniciado a Rota.
                vector3( 488.20831298828, -515.92205810547, 24.751008987427 ), -- CDS dos Blips, Após ter iniciado a Rota.
                vector3( 544.31243896484, -435.20196533203, 24.799722671509 ), -- CDS dos Blips, Após ter iniciado a Rota.
            }
        },
    },
    ["Notify"] = {
        ["NOPermission"] = "Você Não tem permissao.", -- Notify para Permissao Negada.
        ["InService"] = "Você ja está em serviço!", -- Notify para avisar que ja está em serviço.
        ["StartRoute"] = "Você Iniciou sua Rota.", -- Notify para avisar que iniciou a Rota.
        ["StopService"] = "Você saiu de serviço.", -- Notify para saida de serviço.
        ["BackpackFull"] = "A sua Mochila está cheia." -- Notify para Mochila Cheia.
    },
}