Config = {
    BindCancelRoute = "F7", -- Tecla para cancelar a rota.
    RandomRoutes = true, -- true para deixar as rotas aleatórias.
    ["Orgs"] = {
        ["Favelas"] = { -- Nome da fac (Ilustrativo)
            Ped = {
                coords = vector3( 1220.47,-2964.51,5.87 ), -- Cordenadas do ped. (Iniciar a rota.)
                heading = 92.79, -- Heading do ped.
                Hash = { 0x4F2E038A,"a_m_m_salton_01" }, -- Hash do ped (https://wiki.rage.mp/index.php?title=Peds)
                Text = "~r~[E]~w~ PARA INICIAR A ROTA", -- Texto que aparecerá na cabeça do ped.
            },
            Perms = { "Barragem","Campinho" }, -- Permissões para inicar a rota. (Deixe em tabelas para colocar mais permissões.)
            RandomItens = true, -- true para pegar apenas UM item aleatório, false para pegar TODOS.
            Itens = {
                { name = "elastic", min = 3, max = 5 }, -- name = "nome do item", min = "minimo", max "maximo"
                { name = "emptybottle", min = 5, max = 7 }, -- name = "nome do item", min = "minimo", max "maximo"
            },
            BlipRoutes = { -- Coordenadas da rota.
                vector3( 206.15,-85.93,69.41 ),
                vector3( 124.01,64.86,79.75 ),
                vector3( 105.93,493.03,147.15 ),
                vector3( -355.69,516.42,120.19 ),
                vector3( -768.78,469.86,100.17 ),
                vector3( -1045.72,503.44,84.17 ),
                vector3( -1357.05,551.06,130.72 ),
                vector3( -914.18,693.68,151.44 ),
                vector3( -575.2,741.26,184.06 ),
                vector3( -396.56,877.59,230.78 ),
                vector3( -172.67,966.3,237.54 ),
                vector3( 347.53,930.02,203.44 ),
                vector3( 148.79,1667.29,228.85 ),
                vector3( -43.75,1960.0,190.28 ),
                vector3( 721.13,2335.37,50.25 ),
                vector3( 241.71,3107.92,42.49 ),
                vector3( 464.37,3565.33,33.24 ),
                vector3( 961.28,3625.82,32.46 ),
                vector3( 1433.75,3628.48,35.85 ),
                vector3( 1703.26,3791.46,34.81 ),
                vector3( 2004.1,3790.62,32.19 ),
                vector3( 2521.56,4124.29,38.64 ),
                vector3( 1792.88,4594.97,37.69 ),
                vector3( 1961.57,5184.87,47.99 ),
                vector3( 2553.99,4668.08,34.02 ),
                vector3( 2932.2,4624.17,48.71 ),
                vector3( 2916.17,4367.91,50.47 ),
                vector3( 2987.89,3481.61,72.49 ),
                vector3( 2632.29,2935.29,40.43 ),
                vector3( 2527.82,2617.12,37.96 ),
                vector3( 2473.79,1572.17,32.73 ),
                vector3( 1531.67,816.58,77.43 ),
                vector3( 771.51,230.37,86.04 ),
                vector3( 397.9,175.87,103.86 ),
            }
        },
        ["Mecanica"] = { -- Nome da fac (Ilustrativo)
            Ped = {
                coords = vector3( 1220.47,-2962.51,5.87 ),  -- Cordenadas do ped. (Iniciar a rota.)
                heading = 92.79, -- Heading do ped.
                Hash = { 0x4F2E038A,"a_m_m_salton_01" },  -- Hash do ped (https://wiki.rage.mp/index.php?title=Peds)
                Text = "~r~[E]~w~ PARA INICIAR A ROTA", -- Texto que aparecerá na cabeça do ped.
            },
            Perms = "Bennys", -- Permissões para inicar a rota. (Deixe em tabelas para colocar mais permissões.)
            RandomItens = false, -- true para pegar apenas UM item aleatório, false para pegar TODOS.
            Itens = {
                { name = "elastic", min = 3, max = 5 }, -- name = "nome do item", min = "minimo", max "maximo"
                { name = "emptybottle", min = 5, max = 7 }, -- name = "nome do item", min = "minimo", max "maximo"
            },
            BlipRoutes = { -- Coordenadas da rota.
                vector3( 758.88,-677.72,28.87 ),
                vector3( 739.23,-970.12,24.64 ),
                vector3( 780.73,-1298.46,26.28 ),
                vector3( 764.65,-1722.65,30.53 ),
                vector3( 473.63,-1778.7,28.7 ),
                vector3( 441.46,-2080.76,22.25 ),
                vector3( -375.83,-1878.33,20.53 ),
                vector3( -657.78,-1705.83,24.85 ),
                vector3( -684.24,-1198.69,10.72 ),
                vector3( -1011.38,-1224.02,5.95 ),
                vector3( -1092.74,-1532.83,4.61 ),
                vector3( -1242.25,-1301.02,3.91 ),
                vector3( -1381.31,-940.95,10.07 ),
                vector3( -1923.59,-558.81,12.07 ),
                vector3( -2205.48,-373.73,13.33 ),
                vector3( -3024.57,80.23,11.61 ),
                vector3( -3044.67,564.33,7.82 ),
                vector3( -3232.71,934.66,13.8 ),
                vector3( -3180.45,1297.52,14.59 ),
                vector3( -2720.51,1501.98,106.56 ),
                vector3( -2552.9,1914.8,169.06 ),
                vector3( -1928.32,1779.38,173.08 ),
                vector3( -1123.57,2682.44,18.76 ),
                vector3( -458.21,2859.59,34.96 ),
                vector3( -97.28,2810.99,53.25 ),
                vector3( 543.4,2658.6,42.18 ),
                vector3( 1224.85,2728.58,38.01 ),
                vector3( 1475.82,2724.65,37.64 ),
                vector3( 1984.29,3059.41,47.22 ),
                vector3( 2555.79,2607.35,38.09 ),
                vector3( 2663.45,1639.91,24.6 ),
                vector3( 2572.11,479.97,108.67 ),
                vector3( 2555.64,-600.02,64.73 ),
                vector3( 1924.51,-973.23,78.64 ),
                vector3( 1425.12,-1502.14,61.15 ),
                vector3( 1258.79,-1563.95,54.56 ),
                vector3( 1218.7,-1235.79,35.34 ),
                vector3( 839.43,-713.34,31.29 ),
            }
        },
    },
    ["Notify"] = {
        StartRoute = "Você Iniciou sua Rota.", -- Iniciou a Rota.
        StopService = "Você saiu de serviço.", -- Saiu de serviço.
        BackpackFull = "A sua Mochila está cheia." -- Mochila Cheia.
    },
}