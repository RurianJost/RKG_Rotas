Config = {
    ["Creative"] = false, -- se sua base for 'creative' deixe true, caso não seje deixe false.
    ["Commands"] = {
        ["Rota"] = "rotas", -- Iniciar a Rota
    },
    ["Permissions"] = {
        ["Bennys"] = "admin.permissao", -- Permissao. (Nome-Ilustrativo,Permissao).
        ["SportRace"] = "sportrace.permissao", -- Permissao. (Nome-Ilustrativo,Permissao).
        ["Tequila"] = "tequila.permissao", -- Permissao. (Nome-Ilustrativo,Permissao).
        ["Vanilla"] = "vanilla.permissao", -- Permissao. (Nome-Ilustrativo,Permissao).
        ["Madrazo"] = "madrazo.permissao", -- Permissao. (Nome-Ilustrativo,Permissao).
        ["CosaNostra"] = "cosanostra.permissao", -- Permissao. (Nome-Ilustrativo,Permissao).
        ["TheLost"] = "thelost.permissao", -- Permissao. (Nome-Ilustrativo,Permissao).
        ["YellowJack"] = "yellowJack.permissao", -- Permissao. (Nome-Ilustrativo,Permissao).
        ["Elements"] = "elements.permissao", -- Permissao. (Nome-Ilustrativo,Permissao).
        ["Furious"] = "furious.permissao", -- Permissao. (Nome-Ilustrativo,Permissao).
        ["Aztecas"] = "aztecas.permissao", -- Permissao. (Nome-Ilustrativo,Permissao).
        ["Incas"] = "incas.permissao", -- Permissao. (Nome-Ilustrativo,Permissao).
        ["Barragem"] = "barragem.permissao", -- Permissao. (Nome-Ilustrativo,Permissao).
        ["SandyShores"] = "sandyshores.permissao", -- Permissao. (Nome-Ilustrativo,Permissao).
        ["Catavento"] = "catavento.permissao", -- Permissao. (Nome-Ilustrativo,Permissao).
        ["Observatorio"] = "observatorio.permissao", -- Permissao. (Nome-Ilustrativo,Permissao).
    },
    ["Locates"] = {
        ["Bennys"] = { -200.8,-1318.24,31.09 }, -- Locais aonde porderá iniciar a Rota. ["Nome"] = {CDS}.
        ["SportRace"] = { -1422.55,-456.09,35.91 }, -- Locais aonde porderá iniciar a Rota. ["Nome"] = {CDS}.
        ["Tequila"] = { -561.2,286.29,85.38 }, -- Locais aonde porderá iniciar a Rota. ["Nome"] = {CDS}.
        ["Vanilla"] = { 106.67,-1302.21,28.77 }, -- Locais aonde porderá iniciar a Rota. ["Nome"] = {CDS}.
        ["Madrazo"] = { 1403.15,1138.37,109.75 }, -- Locais aonde porderá iniciar a Rota. ["Nome"] = {CDS}.
        ["CosaNostra"] = { -1866.1,2061.25,135.44 }, -- Locais aonde porderá iniciar a Rota. ["Nome"] = {CDS}.
        ["TheLost"] = { 987.85,-98.1,74.85 }, -- Locais aonde porderá iniciar a Rota. ["Nome"] = {CDS}.
        ["YellowJack"] = { 1986.28,3051.2,47.22 }, -- Locais aonde porderá iniciar a Rota. ["Nome"] = {CDS}.
        ["Elements"] = { 730.07,-1078.66,22.17 }, -- Locais aonde porderá iniciar a Rota. ["Nome"] = {CDS}.
        ["Furious"] = { 479.3,-1317.6,29.21 }, -- Locais aonde porderá iniciar a Rota. ["Nome"] = {CDS}.
        ["Aztecas"] = { -596.07,-1618.14,33.02 }, -- Locais aonde porderá iniciar a Rota. ["Nome"] = {CDS}.
        ["Incas"] = { 589.65,-3277.48,6.07 }, -- Locais aonde porderá iniciar a Rota. ["Nome"] = {CDS}.
        ["Barragem"] = { 1384.55,-208.44,153.75 }, -- Locais aonde porderá iniciar a Rota. ["Nome"] = {CDS}.
        ["SandyShores"] = { -152.13,2122.08,173.4 }, -- Locais aonde porderá iniciar a Rota. ["Nome"] = {CDS}.
        ["Catavento"] = { 2276.79,2186.02,81.0 }, -- Locais aonde porderá iniciar a Rota. ["Nome"] = {CDS}.
        ["Observatorio"] = { -465.1,1513.22,392.26 }, -- Locais aonde porderá iniciar a Rota. ["Nome"] = {CDS}.
    },
    ["Distance"] = { 10.0 }, -- Distancia que você vai ver o Blip, após ter iniciado a Rota.
    ["GiveItem"] = {
        ["Mecanicas"] = {
           "elastic", -- Nome do Item.
           "emptybottle", -- Nome do Item.
           "metalcan", -- Nome do Item.
           "battery", -- Nome do Item.
           "glassbottle", -- Nome do Item.
           ["Quantity"] = {3,10}, -- Quantidade que virá, ao Apertar E no Blip (Minimo,Maximo).
        },
        ["Bars"] = {
            "soda", -- Nome do Item.
            "glassbottle", -- Nome do Item.
            "metalcan", -- Nome do Item.
            ["Quantity"] = {3,10}, -- Quantidade que virá, ao Apertar E no Blip (Minimo,Maximo).
        },
        ["Mafias"] = {
            "battery", -- Nome do Item.
            "battery", -- Nome do Item.
            ["Quantity"] = {3,10}, -- Quantidade que virá, ao Apertar E no Blip (Minimo,Maximo).
        },
        ["Municoes"] = {
            "battery", -- Nome do Item.
            "battery", -- Nome do Item.
            ["Quantity"] = {3,10}, -- Quantidade que virá, ao Apertar E no Blip (Minimo,Maximo).
        },
        ["Desmanches"] = {
            "metalcan", -- Nome do Item.
            ["Quantity"] = {3,10}, -- Quantidade que virá, ao Apertar E no Blip (Minimo,Maximo).
        },
        ["Contrabandos"] = {
            "metalcan", -- Nome do Item.
            "cloth", -- Nome do Item.
            "emptybottle", -- Nome do Item.
            "battery", -- Nome do Item.
            ["Quantity"] = {3,10}, -- Quantidade que virá, ao Apertar E no Blip (Minimo,Maximo).
        },
        ["Barragem"] = {
            "ecstasy-box", -- Nome do Item.
            ["Quantity"] = {3,10}, -- Quantidade que virá, ao Apertar E no Blip (Minimo,Maximo).
        },
        ["Observatorio"] = {
            "cocaine-box", -- Nome do Item.
            ["Quantity"] = {3,10}, -- Quantidade que virá, ao Apertar E no Blip (Minimo,Maximo).
        },
        ["Catavento"] = {
            "meth-box", -- Nome do Item.
            ["Quantity"] = {3,10}, -- Quantidade que virá, ao Apertar E no Blip (Minimo,Maximo).
        },
        ["SandyShores"] = {
            "lean-box", -- Nome do Item.
            ["Quantity"] = {3,10}, -- Quantidade que virá, ao Apertar E no Blip (Minimo,Maximo).
        },
    },
    ["BlipRoutes"] = {
        {1557.9,-1679.89,90.96}, -- CDS dos Blips, Após ter iniciado a Rota.
        {1753.83,-1577.54,112.62}, -- CDS dos Blips, Após ter iniciado a Rota.
        {1758.65,-1659.98,112.73}, -- CDS dos Blips, Após ter iniciado a Rota.
        {1756.07,-1682.99,112.6}, -- CDS dos Blips, Após ter iniciado a Rota.
        {1579.45,-1977.27,93.56}, -- CDS dos Blips, Após ter iniciado a Rota.
        {1356.32,-2067.02,52.0}, -- CDS dos Blips, Após ter iniciado a Rota.
        {1518.11,-2092.8,76.98}, -- CDS dos Blips, Após ter iniciado a Rota.
        {603.38,-499.23,24.73}, -- CDS dos Blips, Após ter iniciado a Rota.
        {1552.75,-2079.15,77.1}, -- CDS dos Blips, Após ter iniciado a Rota.
        {33.58,-619.21,31.76}, -- CDS dos Blips, Após ter iniciado a Rota.
        {-166.22,-1006.5,21.28}, -- CDS dos Blips, Após ter iniciado a Rota.
        {1502.07,-2105.97,76.4}, -- CDS dos Blips, Após ter iniciado a Rota.
        {-369.44,-1017.2,28.0}, -- CDS dos Blips, Após ter iniciado a Rota.
        {1500.43,-2098.41,76.68}, -- CDS dos Blips, Após ter iniciado a Rota.
        {-26.7,-1274.71,29.3}, -- CDS dos Blips, Após ter iniciado a Rota.
        {509.53,-514.58,24.76}, -- CDS dos Blips, Após ter iniciado a Rota.
        {1573.39,-2151.83,77.62}, -- CDS dos Blips, Após ter iniciado a Rota.
        {576.76,-1256.17,9.8}, -- CDS dos Blips, Após ter iniciado a Rota.
        {74.21,-430.61,37.56}, -- CDS dos Blips, Após ter iniciado a Rota.
        {679.67,1280.28,360.3}, -- CDS dos Blips, Após ter iniciado a Rota.
        {1508.52,-2095.42,76.84}, -- CDS dos Blips, Após ter iniciado a Rota.
        {-279.73,2522.02,74.47}, -- CDS dos Blips, Após ter iniciado a Rota.
        {68.24,2792.6,57.88}, -- CDS dos Blips, Após ter iniciado a Rota.
        {1694.23,3326.14,41.48}, -- CDS dos Blips, Após ter iniciado a Rota.
        {1548.05,-2163.6,77.55}, -- CDS dos Blips, Após ter iniciado a Rota.
        {428.81,3081.53,41.95}, -- CDS dos Blips, Após ter iniciado a Rota.
        {1504.66,-2151.84,77.36}, -- CDS dos Blips, Após ter iniciado a Rota.
        {1407.08,-2069.81,52.0}, -- CDS dos Blips, Após ter iniciado a Rota.
        {404.58,2987.1,40.74}, -- CDS dos Blips, Após ter iniciado a Rota.
        {1508.2,-2118.84,76.54} -- CDS dos Blips, Após ter iniciado a Rota.
    },
    ["Notify"] = {
        ["NOPermission"] = "Você Não tem permissao.", -- Notify para Permissao Negada.
        ["InService"] = "Você ja está em serviço!", -- Notify para avisar que ja está em serviço.
        ["StartRoute"] = "Você Iniciou sua Rota.", -- Notify para avisar que iniciou a Rota.
        ["StopService"] = "Você saiu de serviço.", -- Notify para saida de serviço.
        ["BackpackFull"] = "A sua Mochila está cheia." -- Notify para Mochila Cheia.
    },
}