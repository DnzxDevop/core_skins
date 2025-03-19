Shared = {}

-- @Bank -- Paga com dinheiro do banco
-- @Gems Paga com gemas
-- @Full Paga com dinheiro do banco ou dinheiro da mão

Shared.Payment = 'Full' -- bank, Gems or Full

Weapons = {
    { 
        id = 1, 
        name = "Sol Nascente", 
        weapon = "WEAPON_SNSPISTOL", 
        component = "COMPONENT_SNSPISTOL_VARMOD_LOWRIDER", 
        price = 3500,
        image = "https://media.discordapp.net/attachments/1244388642122895424/1351730354863739015/image-removebg-preview.png?ex=67db707e&is=67da1efe&hm=227efa1b923e79d0bdcdf318fa27f99dd049fbaaf772c68af40a31f329c53618&=&format=webp&quality=lossless",
        description = "Pistola compacta com acabamento dourado elegante."
    },
    { 
        id = 2, 
        name = "Lâmina Fantasma", 
        weapon = "WEAPON_HEAVYPISTOL", 
        component = "COMPONENT_HEAVYPISTOL_VARMOD_LUXE", 
        price = 4000,
        image = "https://media.discordapp.net/attachments/1244388642122895424/1351730354863739015/image-removebg-preview.png?ex=67db707e&is=67da1efe&hm=227efa1b923e79d0bdcdf318fa27f99dd049fbaaf772c68af40a31f329c53618&=&format=webp&quality=lossless",
        description = "Pistola pesada com detalhes em prata e gravuras."
    },
    { 
        id = 3, 
        name = "Maré Carmesim", 
        weapon = "WEAPON_PISTOL", 
        component = "COMPONENT_PISTOL_VARMOD_LUXE", 
        price = 3000,
        image = "https://media.discordapp.net/attachments/1244388642122895424/1351730354863739015/image-removebg-preview.png?ex=67db707e&is=67da1efe&hm=227efa1b923e79d0bdcdf318fa27f99dd049fbaaf772c68af40a31f329c53618&=&format=webp&quality=lossless",
        description = "Pistola clássica com acabamento vermelho e dourado."
    },
    { 
        id = 4, 
        name = "Sussurro Sombrio", 
        weapon = "WEAPON_COMBATPISTOL", 
        component = "COMPONENT_COMBATPISTOL_VARMOD_LOWRIDER", 
        price = 3800,
        image = "https://media.discordapp.net/attachments/1244388642122895424/1351730354863739015/image-removebg-preview.png?ex=67db707e&is=67da1efe&hm=227efa1b923e79d0bdcdf318fa27f99dd049fbaaf772c68af40a31f329c53618&=&format=webp&quality=lossless",
        description = "Pistola de combate com design tático e acabamento escuro."
    },
    { 
        id = 5, 
        name = "Estrela Cadente", 
        weapon = "WEAPON_APPISTOL", 
        component = "COMPONENT_APPISTOL_VARMOD_LUXE", 
        price = 4725,
        image = "https://media.discordapp.net/attachments/1244388642122895424/1351730354863739015/image-removebg-preview.png?ex=67db707e&is=67da1efe&hm=227efa1b923e79d0bdcdf318fa27f99dd049fbaaf772c68af40a31f329c53618&=&format=webp&quality=lossless",
        description = "Pistola automática com detalhes em ouro e platina."
    },
    { 
        id = 6, 
        name = "Aurora Cintilante", 
        weapon = "WEAPON_PISTOL50", 
        component = "COMPONENT_PISTOL50_VARMOD_LUXE", 
        price = 4725,
        image = "https://media.discordapp.net/attachments/1244388642122895424/1351730354863739015/image-removebg-preview.png?ex=67db707e&is=67da1efe&hm=227efa1b923e79d0bdcdf318fa27f99dd049fbaaf772c68af40a31f329c53618&=&format=webp&quality=lossless",
        description = "Pistola calibre .50 com acabamento luxuoso e brilhante."
    },
    { 
        id = 7, 
        name = "Respeito da Luxúria", 
        weapon = "WEAPON_MICROSMG", 
        component = "COMPONENT_MICROSMG_VARMOD_LUXE", 
        price = 5725,
        image = "https://media.discordapp.net/attachments/1244388642122895424/1351730354863739015/image-removebg-preview.png?ex=67db707e&is=67da1efe&hm=227efa1b923e79d0bdcdf318fa27f99dd049fbaaf772c68af40a31f329c53618&=&format=webp&quality=lossless",
        description = "Micro SMG com detalhes em ouro e empunhadura personalizada."
    },
    { 
        id = 8, 
        name = "Respeito da Guerra", 
        weapon = "WEAPON_MICROSMG", 
        component = "COMPONENT_MICROSMG_VARMOD_XM3", 
        price = 5725,
        image = "https://media.discordapp.net/attachments/1244388642122895424/1351730354863739015/image-removebg-preview.png?ex=67db707e&is=67da1efe&hm=227efa1b923e79d0bdcdf318fa27f99dd049fbaaf772c68af40a31f329c53618&=&format=webp&quality=lossless",
        description = "Micro SMG com camuflagem militar e detalhes táticos."
    },
    { 
        id = 9, 
        name = "Respeito da Selva", 
        weapon = "WEAPON_MICROSMG", 
        component = "COMPONENT_MICROSMG_VARMOD_FRN", 
        price = 5725,
        image = "https://media.discordapp.net/attachments/1244388642122895424/1351730354863739015/image-removebg-preview.png?ex=67db707e&is=67da1efe&hm=227efa1b923e79d0bdcdf318fa27f99dd049fbaaf772c68af40a31f329c53618&=&format=webp&quality=lossless",
        description = "Micro SMG com camuflagem florestal e acabamento fosco."
    },
    { 
        id = 10, 
        name = "Estrela da Sorte", 
        weapon = "WEAPON_SMG", 
        component = "COMPONENT_SMG_VARMOD_LUXE", 
        price = 5725,
        image = "https://media.discordapp.net/attachments/1244388642122895424/1351730354863739015/image-removebg-preview.png?ex=67db707e&is=67da1efe&hm=227efa1b923e79d0bdcdf318fa27f99dd049fbaaf772c68af40a31f329c53618&=&format=webp&quality=lossless",
        description = "SMG com detalhes dourados e símbolos de boa sorte."
    },
    { 
        id = 11, 
        name = "Estrela da Aurora", 
        weapon = "WEAPON_ASSAULTSMG", 
        component = "COMPONENT_ASSAULTSMG_VARMOD_LOWRIDER", 
        price = 5725,
        image = "https://media.discordapp.net/attachments/1244388642122895424/1351730354863739015/image-removebg-preview.png?ex=67db707e&is=67da1efe&hm=227efa1b923e79d0bdcdf318fa27f99dd049fbaaf772c68af40a31f329c53618&=&format=webp&quality=lossless",
        description = "SMG de assalto com padrões coloridos e acabamento metálico."
    },
    { 
        id = 12, 
        name = "Tempestade Ardente", 
        weapon = "WEAPON_ASSAULTRIFLE", 
        component = "COMPONENT_ASSAULTRIFLE_VARMOD_LUXE", 
        price = 6275,
        image = "https://media.discordapp.net/attachments/1244388642122895424/1351730354863739015/image-removebg-preview.png?ex=67db707e&is=67da1efe&hm=227efa1b923e79d0bdcdf318fa27f99dd049fbaaf772c68af40a31f329c53618&=&format=webp&quality=lossless",
        description = "Rifle de assalto com detalhes em vermelho e dourado."
    },
    { 
        id = 13, 
        name = "Manto da Escuridão", 
        weapon = "WEAPON_BULLPUPRIFLE", 
        component = "COMPONENT_BULLPUPRIFLE_VARMOD_LOW", 
        price = 6275,
        image = "https://media.discordapp.net/attachments/1244388642122895424/1351730354863739015/image-removebg-preview.png?ex=67db707e&is=67da1efe&hm=227efa1b923e79d0bdcdf318fa27f99dd049fbaaf772c68af40a31f329c53618&=&format=webp&quality=lossless",
        description = "Rifle bullpup com acabamento escuro e detalhes táticos."
    },
  

    {
        id = 14,
        name = "Five Seven Korea",
        weapon = "WEAPON_PISTOL_MK2",
        component = "COMPONENT_FIVESEVEN_AA",
        price = 2500,
        image = "https://example.com/image1.png",  -- Substitua pelo link da imagem
        description = "Pistola épica com tema Coreano."
    },
    {
        id = 15,
        name = "Five Seven Hello Kitty",
        weapon = "WEAPON_PISTOL_MK2",
        component = "COMPONENT_FIVESEVEN_AI",
        price = 2500,
        image = "https://example.com/image2.png",  -- Substitua pelo link da imagem
        description = "Pistola épica com tema Hello Kitty."
    },
    {
        id = 16,
        name = "Five Seven Alien",
        weapon = "WEAPON_PISTOL_MK2",
        component = "COMPONENT_FIVESEVEN_AJ",
        price = 2500,
        image = "https://example.com/image3.png",  -- Substitua pelo link da imagem
        description = "Pistola épica com tema Alien."
    },
    {
        id = 17,
        name = "Five Seven Mexico",
        weapon = "WEAPON_PISTOL_MK2",
        component = "COMPONENT_FIVESEVEN_AM",
        price = 2500,
        image = "https://example.com/image4.png",  -- Substitua pelo link da imagem
        description = "Pistola épica com tema do México."
    },
    {
        id = 18,
        name = "Five Seven Nike X",
        weapon = "WEAPON_PISTOL_MK2",
        component = "COMPONENT_FIVESEVEN_AO",
        price = 2500,
        image = "https://example.com/image5.png",  -- Substitua pelo link da imagem
        description = "Pistola épica com tema Nike X."
    },
    {
        id = 19,    
        name = "Five Seven My X",
        weapon = "WEAPON_PISTOL_MK2",
        component = "COMPONENT_FIVESEVEN_AP",
        price = 2500,
        image = "https://example.com/image6.png",  -- Substitua pelo link da imagem
        description = "Pistola épica com tema My X."
    },
    {
        id = 20,
        name = "Five Seven Vulcão",
        weapon = "WEAPON_PISTOL_MK2",
        component = "COMPONENT_FIVESEVEN_AR",
        price = 2500,
        image = "https://example.com/image7.png",  -- Substitua pelo link da imagem
        description = "Pistola épica com tema Vulcão."
    },
    {
        id = 21,
        name = "Five Seven Nike Smile",
        weapon = "WEAPON_PISTOL_MK2",
        component = "COMPONENT_FIVESEVEN_AT",
        price = 2500,
        image = "https://example.com/image8.png",  -- Substitua pelo link da imagem
        description = "Pistola épica com tema Nike Smile."
    },
    {
        id = 22,
        name = "Five Seven Nike V.",
        weapon = "WEAPON_PISTOL_MK2",
        component = "COMPONENT_FIVESEVEN_NV",
        price = 2500,
        image = "https://example.com/image9.png",  -- Substitua pelo link da imagem
        description = "Pistola épica com tema Nike V."
    },
    {
        id = 23,
        name = "Five Seven Barbie",
        weapon = "WEAPON_PISTOL_MK2",
        component = "COMPONENT_FIVESEVEN_BARBIE",
        price = 2500,
        image = "https://example.com/image10.png",  -- Substitua pelo link da imagem
        description = "Pistola épica com tema Barbie."
    },
    {
        id = 24,
        name = "Glock Snack Club",
        weapon = "WEAPON_COMBATPISTOL",
        component = "COMPONENT_GLOCK_SNACKCLUB",
        price = 2500,
        image = "https://example.com/image11.png",  -- Substitua pelo link da imagem
        description = "Pistola épica com tema Snack Club."
    },
    {
        id = 25,
        name = "Glock Sea Terror",
        weapon = "WEAPON_COMBATPISTOL",
        component = "COMPONENT_GLOCK_SEATERROR",
        price = 2500,
        image = "https://example.com/image12.png",  -- Substitua pelo link da imagem
        description = "Pistola épica com tema Sea Terror."
    },
    {
        id = 26,
        name = "Glock Red Samurai",
        weapon = "WEAPON_COMBATPISTOL",
        component = "COMPONENT_GLOCK_REDSAMURAI",
        price = 2500,
        image = "https://example.com/image13.png",  -- Substitua pelo link da imagem
        description = "Pistola épica com tema Red Samurai."
    },
    {
        id = 27,
        name = "Glock Gaiden",
        weapon = "WEAPON_COMBATPISTOL",
        component = "COMPONENT_GLOCK_BT",
        price = 2500,
        image = "https://example.com/image14.png",  -- Substitua pelo link da imagem
        description = "Pistola épica com tema Gaiden."
    },
    {
        id = 28,
        name = "Glock Royal Salute",
        weapon = "WEAPON_COMBATPISTOL",
        component = "COMPONENT_GLOCK_BW",
        price = 2500,
        image = "https://example.com/image15.png",  -- Substitua pelo link da imagem
        description = "Pistola épica com tema Royal Salute."
    },
    {
        id = 29,
        name = "Glock Nike France",
        weapon = "WEAPON_COMBATPISTOL",
        component = "COMPONENT_GLOCK_CH",
        price = 2500,
        image = "https://example.com/image16.png",  -- Substitua pelo link da imagem
        description = "Pistola épica com tema Nike France."
    },
    {
        id = 30,
        name = "Glock Cyclone",
        weapon = "WEAPON_COMBATPISTOL",
        component = "COMPONENT_GLOCK_CI",
        price = 2500,
        image = "https://example.com/image17.png",  -- Substitua pelo link da imagem
        description = "Pistola épica com tema Cyclone."
    },

    
    {
        id = 31,
        name = "AK-47 Dragon",
        weapon = "WEAPON_ASSAULTRIFLE",
        component = "COMPONENT_AK47_SKIN",
        price = 5000,
        image = "https://example.com/image1.png",  -- Substitua pelo link da imagem
        description = "Rifle lendário com design Dragon."
    },
    {
        id = 32,
        name = "AK-47 Mark",
        weapon = "WEAPON_ASSAULTRIFLE",
        component = "COMPONENT_AK47_MARK_SKIN",
        price = 5000,
        image = "https://example.com/image2.png",  -- Substitua pelo link da imagem
        description = "Rifle lendário com design Mark."
    },
    {
        id = 33,
        name = "AK-47 Skeleton Red",
        weapon = "WEAPON_ASSAULTRIFLE",
        component = "COMPONENT_AK47_TOE_SKIN",
        price = 5000,
        image = "https://example.com/image3.png",  -- Substitua pelo link da imagem
        description = "Rifle lendário com design Skeleton Red."
    },
    {
        id = 34,
        name = "AK-47 Rosa",
        weapon = "WEAPON_ASSAULTRIFLE",
        component = "COMPONENT_AK47_WH_SKIN",
        price = 5000,
        image = "https://example.com/image4.png",  -- Substitua pelo link da imagem
        description = "Rifle lendário com design Rosa."
    },
    {
        id = 35,
        name = "AK-47 My X",
        weapon = "WEAPON_ASSAULTRIFLE",
        component = "COMPONENT_AK47_WHITE_SKIN",
        price = 5000,
        image = "https://example.com/image5.png",  -- Substitua pelo link da imagem
        description = "Rifle lendário com design My X."
    },
    {
        id = 36,
        name = "AK-47 My X 2",
        weapon = "WEAPON_ASSAULTRIFLE",
        component = "COMPONENT_AK47_WHITEB_SKIN",
        price = 5000,
        image = "https://example.com/image6.png",  -- Substitua pelo link da imagem
        description = "Rifle lendário com design My X 2."
    },
    {
        id = 37,
        name = "AK-47 Cromada",
        weapon = "WEAPON_ASSAULTRIFLE",
        component = "COMPONENT_AK47_PARTEN_SKIN",
        price = 5000,
        image = "https://example.com/image7.png",  -- Substitua pelo link da imagem
        description = "Rifle lendário com design Cromado."
    },
    {
        id = 38,
        name = "AK-47 Banana Joy",
        weapon = "WEAPON_ASSAULTRIFLE",
        component = "COMPONENT_AK47_YE_SKIN",
        price = 5000,
        image = "https://example.com/image8.png",  -- Substitua pelo link da imagem
        description = "Rifle lendário com design Banana Joy."
    },
    {
        id = 39,
        name = "AK-47 Monster",
        weapon = "WEAPON_ASSAULTRIFLE",
        component = "COMPONENT_AK47_AH_SKIN",
        price = 5000,
        image = "https://example.com/image9.png",  -- Substitua pelo link da imagem
        description = "Rifle lendário com design Monster."
    },
    {
        id = 40,
        name = "AK-47 MK2 Pink",
        weapon = "WEAPON_ASSAULTRIFLE_MK2",
        component = "COMPONENT_AK47_AA_SKIN",
        price = 5000,
        image = "https://example.com/image10.png",  -- Substitua pelo link da imagem
        description = "Rifle lendário MK2 com design Pink."
    },
    {
        id = 41,
        name = "AK-47 MK2 Noturna Blue",
        weapon = "WEAPON_ASSAULTRIFLE_MK2",
        component = "COMPONENT_AK47_AB_SKIN",
        price = 5000,
        image = "https://example.com/image11.png",  -- Substitua pelo link da imagem
        description = "Rifle lendário MK2 com design Noturna Blue."
    },
    {
        id = 42,
        name = "AK-47 MK2 Gelo",
        weapon = "WEAPON_ASSAULTRIFLE_MK2",
        component = "COMPONENT_AK47_AC_SKIN",
        price = 5000,
        image = "https://example.com/image12.png",  -- Substitua pelo link da imagem
        description = "Rifle lendário MK2 com design Gelo."
    },
    {
        id = 43,
        name = "AK-47 MK2 Roxo",
        weapon = "WEAPON_ASSAULTRIFLE_MK2",
        component = "COMPONENT_AK47_AE_SKIN",
        price = 5000,
        image = "https://example.com/image13.png",  -- Substitua pelo link da imagem
        description = "Rifle lendário MK2 com design Roxo."
    },
    {
        id = 44,
        name = "AK-47 MK2 Noturna Green",
        weapon = "WEAPON_ASSAULTRIFLE_MK2",
        component = "COMPONENT_AK47_AG_SKIN",
        price = 5000,
        image = "https://example.com/image14.png",  -- Substitua pelo link da imagem
        description = "Rifle lendário MK2 com design Noturna Green."
    },
    {
        id = 45,
        name = "AK-47 MK2 Hulk",
        weapon = "WEAPON_ASSAULTRIFLE_MK2",
        component = "COMPONENT_AK47_AI_SKIN",
        price = 5000,
        image = "https://example.com/image15.png",  -- Substitua pelo link da imagem
        description = "Rifle lendário MK2 com design Hulk."
    },
    {
        id = 46,
        name = "AK-47 MK2 Have",
        weapon = "WEAPON_ASSAULTRIFLE_MK2",
        component = "COMPONENT_AK47_AK_SKIN",
        price = 5000,
        image = "https://example.com/image16.png",  -- Substitua pelo link da imagem
        description = "Rifle lendário MK2 com design Have."
    },
    {
        id = 47,
        name = "AK-47 MK2 Water",
        weapon = "WEAPON_ASSAULTRIFLE_MK2",
        component = "COMPONENT_AK47_AL_SKIN",
        price = 5000,
        image = "https://example.com/image17.png",  -- Substitua pelo link da imagem
        description = "Rifle lendário MK2 com design Water."
    },
    {
        id = 49,
        name = "AK-47 MK2 Cinza",
        weapon = "WEAPON_ASSAULTRIFLE_MK2",
        component = "COMPONENT_AK47_AM_SKIN",
        price = 5000,
        image = "https://example.com/image1.png",  -- Substitua pelo link da imagem
        description = "Rifle lendário MK2 com design Cinza."
    },
    {
        id = 50,
        name = "AK-47 MK2 Bolt Black",
        weapon = "WEAPON_ASSAULTRIFLE_MK2",
        component = "COMPONENT_AK47_AN_SKIN",
        price = 5000,
        image = "https://example.com/image2.png",  -- Substitua pelo link da imagem
        description = "Rifle lendário MK2 com design Bolt Black."
    },
    {
        id = 53,
        name = "AK-47 MK2 Minerva Purple",
        weapon = "WEAPON_ASSAULTRIFLE_MK2",
        component = "COMPONENT_AK47_AQ_SKIN",
        price = 5000,
        image = "https://example.com/image3.png",  -- Substitua pelo link da imagem
        description = "Rifle lendário MK2 com design Minerva Purple."
    },
    {
        id = 54,
        name = "M4 Neon",
        weapon = "WEAPON_CARBINERIFLE",
        component = "COMPONENT_M4_AD_SKIN",
        price = 5000,
        image = "https://example.com/image4.png",  -- Substitua pelo link da imagem
        description = "Rifle lendário M4 com design Neon."
    },
    {
        id = 55,
        name = "M4 Dragon Red",
        weapon = "WEAPON_CARBINERIFLE",
        component = "COMPONENT_M4_AL_SKIN",
        price = 5000,
        image = "https://example.com/image5.png",  -- Substitua pelo link da imagem
        description = "Rifle lendário M4 com design Dragon Red."
    },
    {
        id = 56,
        name = "M4 AM",
        weapon = "WEAPON_CARBINERIFLE",
        component = "COMPONENT_M4_AM_SKIN",
        price = 5000,
        image = "https://example.com/image6.png",  -- Substitua pelo link da imagem
        description = "Rifle lendário M4 com design AM."
    },
    {
        id = 57,
        name = "M4 Dragon Purple",
        weapon = "WEAPON_CARBINERIFLE",
        component = "COMPONENT_M4_AR_SKIN",
        price = 5000,
        image = "https://example.com/image7.png",  -- Substitua pelo link da imagem
        description = "Rifle lendário M4 com design Dragon Purple."
    },
    {
        id = 58,
        name = "M4 Dragon Blue",
        weapon = "WEAPON_CARBINERIFLE",
        component = "COMPONENT_M4_AS_SKIN",
        price = 5000,
        image = "https://example.com/image8.png",  -- Substitua pelo link da imagem
        description = "Rifle lendário M4 com design Dragon Blue."
    },
    {
        id = 59,
        name = "M4 Colt",
        weapon = "WEAPON_CARBINERIFLE",
        component = "COMPONENT_M4_COLT_SKIN",
        price = 5000,
        image = "https://example.com/image9.png",  -- Substitua pelo link da imagem
        description = "Rifle lendário M4 com design Colt."
    },
    {
        id = 60,
        name = "M4 DK",
        weapon = "WEAPON_CARBINERIFLE",
        component = "COMPONENT_M4_DK_SKIN",
        price = 5000,
        image = "https://example.com/image10.png",  -- Substitua pelo link da imagem
        description = "Rifle lendário M4 com design DK."
    },
    {
        id = 61,
        name = "M4 Dragon",
        weapon = "WEAPON_CARBINERIFLE",
        component = "COMPONENT_M4_DRAGON_SKIN",
        price = 5000,
        image = "https://example.com/image11.png",  -- Substitua pelo link da imagem
        description = "Rifle lendário M4 com design Dragon."
    },
    {
        id = 62,
        name = "M4 Griffin",
        weapon = "WEAPON_CARBINERIFLE",
        component = "COMPONENT_M4_GR_SKIN",
        price = 5000,
        image = "https://example.com/image12.png",  -- Substitua pelo link da imagem
        description = "Rifle lendário M4 com design Griffin."
    },
    {
        id = 63,
        name = "M4 Hunter",
        weapon = "WEAPON_CARBINERIFLE",
        component = "COMPONENT_M4_HUNTER_SKIN",
        price = 5000,
        image = "https://example.com/image13.png",  -- Substitua pelo link da imagem
        description = "Rifle lendário M4 com design Hunter."
    },
    {
        id = 64,
        name = "M4 W",
        weapon = "WEAPON_CARBINERIFLE",
        component = "COMPONENT_M4_W_SKIN",
        price = 5000,
        image = "https://example.com/image14.png",  -- Substitua pelo link da imagem
        description = "Rifle lendário M4 com design W."
    },
    {
        id = 65,
        name = "M4 MK2 Mark",
        weapon = "WEAPON_CARBINERIFLE_MK2",
        component = "COMPONENT_M4_MK2_AJ_SKIN",
        price = 5000,
        image = "https://example.com/image15.png",  -- Substitua pelo link da imagem
        description = "Rifle lendário MK2 com design Mark."
    },
    {
        id = 66,
        name = "M4 MK2 BL",
        weapon = "WEAPON_CARBINERIFLE_MK2",
        component = "COMPONENT_M4_MK2_BL_SKIN",
        price = 5000,
        image = "https://example.com/image16.png",  -- Substitua pelo link da imagem
        description = "Rifle lendário MK2 com design BL."
    },
    {
        id = 67,
        name = "G3 Branco Brasil",
        weapon = "WEAPON_SPECIALCARBINE_MK2",
        component = "COMPONENT_G3_BB",
        price = 5000,
        image = "https://example.com/image17.png",  -- Substitua pelo link da imagem
        description = "Rifle lendário G3 com design Branco Brasil."
    },
    {
        id = 68,
        name = "G3 Camaleao",
        weapon = "WEAPON_SPECIALCARBINE",
        component = "COMPONENT_G3_CA",
        price = 5000,
        image = "https://example.com/image18.png",  -- Substitua pelo link da imagem
        description = "Rifle lendário G3 com design Camaleao."
    },
    {
        id = 69,
        name = "G3 Preto Brasil",
        weapon = "WEAPON_SPECIALCARBINE",
        component = "COMPONENT_G3_PB",
        price = 5000,
        image = "https://example.com/image19.png",  -- Substitua pelo link da imagem
        description = "Rifle lendário G3 com design Preto Brasil."
    },
    {
        id = 70,
        name = "G3 Rosa Espelhado",
        weapon = "WEAPON_SPECIALCARBINE",
        component = "COMPONENT_G3_RAE",
        price = 5000,
        image = "https://example.com/image20.png",  -- Substitua pelo link da imagem
        description = "Rifle lendário G3 com design Rosa Espelhado."
    },
    {
        id = 71,
        name = "G3 Sublime",
        weapon = "WEAPON_SPECIALCARBINE",
        component = "COMPONENT_G3_SUB",
        price = 5000,
        image = "https://example.com/image21.png",  -- Substitua pelo link da imagem
        description = "Rifle lendário G3 com design Sublime."
    },
    {
        id = 72,
        name = "G3 Brinquedo",
        weapon = "WEAPON_SPECIALCARBINE",
        component = "COMPONENT_G3_BRIN",
        price = 5000,
        image = "https://example.com/image22.png",  -- Substitua pelo link da imagem
        description = "Rifle lendário G3 com design Brinquedo."
    },
    {
        id = 73,
        name = "G3 Ancifogo",
        weapon = "WEAPON_SPECIALCARBINE",
        component = "COMPONENT_G3_ANCI",
        price = 5000,
        image = "https://example.com/image23.png",  -- Substitua pelo link da imagem
        description = "Rifle lendário G3 com design Ancifogo."
    },
    {
        id = 74,
        name = "G3 MK2 Glitchpop",
        weapon = "WEAPON_SPECIALCARBINE_MK2",
        component = "COMPONENT_G3_MK2_GP",
        price = 5000,
        image = "https://example.com/image24.png",  -- Substitua pelo link da imagem
        description = "Rifle lendário MK2 com design Glitchpop."
    },
    {
        id = 75,
        name = "G3 MK2 Oni",
        weapon = "WEAPON_SPECIALCARBINE_MK2",
        component = "COMPONENT_G3_MK2_ONI",
        price = 5000,
        image = "https://example.com/image25.png",  -- Substitua pelo link da imagem
        description = "Rifle lendário MK2 com design Oni."
    },
    {
        id = 76,
        name = "G3 MK2 Rgx",
        weapon = "WEAPON_SPECIALCARBINE_MK2",
        component = "COMPONENT_G3_MK2_RGX",
        price = 5000,
        image = "https://example.com/image26.png",  -- Substitua pelo link da imagem
        description = "Rifle lendário MK2 com design Rgx."
    },
    {
        id = 77,
        name = "G3 MK2 Saqueadora",
        weapon = "WEAPON_SPECIALCARBINE_MK2",
        component = "COMPONENT_G3_MK2_SAQ",
        price = 5000,
        image = "https://example.com/image27.png",  -- Substitua pelo link da imagem
        description = "Rifle lendário MK2 com design Saqueadora."
    },
    {
        id = 78,
        name = "G3 MK2 Singularidade",
        weapon = "WEAPON_SPECIALCARBINE_MK2",
        component = "COMPONENT_G3_MK2_SING",
        price = 5000,
        image = "https://example.com/image28.png",  -- Substitua pelo link da imagem
        description = "Rifle lendário MK2 com design Singularidade."
    }  
    
}