local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")
vRP = Proxy.getInterface("vRP")

vRPclient = Tunnel.getInterface("vRP")
local activeSkins = {}

local function setupDatabase()
    exports.oxmysql:execute([[
        CREATE TABLE IF NOT EXISTS core_skins (
            id INT AUTO_INCREMENT PRIMARY KEY,
            user_id INT NOT NULL,
            weapon_id INT NOT NULL,
            purchased_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
            UNIQUE(user_id, weapon_id)
        )
    ]], {})

    exports.oxmysql:execute([[
        CREATE TABLE IF NOT EXISTS active_core_skins (
            id INT AUTO_INCREMENT PRIMARY KEY,
            user_id INT NOT NULL,
            weapon_name VARCHAR(50) NOT NULL,
            skin_id INT NOT NULL,
            updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
            UNIQUE(user_id, weapon_name)
        )
    ]], {})

    exports.oxmysql:execute([[
        CREATE TABLE IF NOT EXISTS core_skins_stats (
            id INT AUTO_INCREMENT PRIMARY KEY,
            skin_id INT NOT NULL,
            times_equipped INT DEFAULT 0,
            times_previewed INT DEFAULT 0,
            UNIQUE(skin_id)
        )
    ]], {})

    print("^2[WEAPON SKINS] ^7Banco de dados inicializado com sucesso!")
end


AddEventHandler('onResourceStart', function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then return end
    setupDatabase()
    print('^2[WEAPON SKINS] ^7Sistema de skins de armas inicializado com sucesso!')
    local players = GetPlayers()
    for _, source in ipairs(players) do
        local user_id = vRP.Passport(source)
        if user_id then
            loadActiveSkinsForPlayer(user_id)
        end
    end
end)


AddEventHandler("vRP:playerSpawn", function(user_id, source, first_spawn)
    if first_spawn then
        loadActiveSkinsForPlayer(user_id)
    end
end)


function loadActiveSkinsForPlayer(user_id)
    if not activeSkins[user_id] then
        activeSkins[user_id] = {}
    end
    
    exports.oxmysql:execute('SELECT weapon_name, skin_id FROM active_core_skins WHERE user_id = @user_id', {
        ['@user_id'] = user_id
    }, function(rows)
        if rows and #rows > 0 then
            for _, row in ipairs(rows) do
                activeSkins[user_id][row.weapon_name] = row.skin_id
            end
            print(string.format("^2[WEAPON SKINS] ^7Carregadas %d skins ativas para o jogador ID: %s", #rows, user_id))
        end
    end)
end


function getPlayerSkins(user_id, cb)
    exports.oxmysql:execute('SELECT weapon_id FROM core_skins WHERE user_id = @user_id', {
        ['@user_id'] = user_id
    }, function(rows)
        local ownedSkins = {}
        if rows and #rows > 0 then
            for _, row in ipairs(rows) do
                table.insert(ownedSkins, row.weapon_id)
            end
        end
        cb(ownedSkins)
    end)
end


function playerHasSkin(user_id, weapon_id)
    local rows = exports.oxmysql:executeSync('SELECT id FROM core_skins WHERE user_id = @user_id AND weapon_id = @weapon_id', {
        ['@user_id'] = user_id,
        ['@weapon_id'] = weapon_id
    })
    
    return rows and #rows > 0
end

function updateSkinStats(skin_id, stat_type)
    if not skin_id then return end
    
    local field = ""
    if stat_type == "equipped" then
        field = "times_equipped"
    elseif stat_type == "previewed" then
        field = "times_previewed"
    else
        return
    end
    
    exports.oxmysql:execute(string.format([[
        INSERT INTO core_skins_stats (skin_id, %s) 
        VALUES (@skin_id, 1) 
        ON DUPLICATE KEY UPDATE %s = %s + 1
    ]], field, field, field), {
        ['@skin_id'] = skin_id
    })
end


local core_skins = {}
Tunnel.bindInterface("core_skins", core_skins)


function core_skins.getAllWeapons()
    return Weapons
end

function core_skins.getOwnedSkins()
    local source = source
    local user_id = vRP.Passport(source)
    if user_id then
        local ownedSkins = {}
        local rows = exports.oxmysql:executeSync('SELECT weapon_id FROM core_skins WHERE user_id = @user_id', {
            ['@user_id'] = user_id
        })
        
        if rows and #rows > 0 then
            for _, row in ipairs(rows) do
                table.insert(ownedSkins, row.weapon_id)
            end
        end
        
        return ownedSkins
    end
    return {}
end

function Payment(Value)
    local source = source
    local Player = vRP.Passport(source)
    if Shared.Payment == 'Bank' then
        return vRP.PaymentBank(Player, Value)
    elseif Shared.Payment == 'Gems' then
        return vRP.PaymentGems(Player, Value)
    elseif Shared.Payment == 'Full' then
        return vRP.PaymentFull(Player, Value)
    end
end


function core_skins.buySkin(weaponId)
    local source = source
    local user_id = vRP.Passport(source)
    if user_id then
        local selectedWeapon = nil
        for _, weapon in ipairs(Weapons) do
            if weapon.id == weaponId then
                selectedWeapon = weapon
                break
            end
        end
        
        if not selectedWeapon then
            TriggerClientEvent("Notify", source, "negado", "Skin não encontrada!")
            return false
        end
        
        if playerHasSkin(user_id, weaponId) then
            TriggerClientEvent("Notify", source, "negado", "Você já possui esta skin!")
            return false
        end
        
        local price = selectedWeapon.price or 5000
        
        if vRP.PaymentFull(user_id,price) then
            exports.oxmysql:execute('INSERT INTO core_skins (user_id, weapon_id) VALUES (@user_id, @weapon_id)', {
                ['@user_id'] = user_id,
                ['@weapon_id'] = weaponId
            })
            
            TriggerClientEvent("Notify", source, "Sucesso", "Skin comprada com sucesso por $" .. price .. "!")
            
            print(string.format("^2[WEAPON SKINS] ^7Jogador ID: %s comprou a skin ID: %s (%s) por $%s", 
                user_id, weaponId, selectedWeapon.name, price))
            
            return true
        else
            TriggerClientEvent("Notify", source, "Negado", "Dinheiro insuficiente! Você precisa de $" .. price)
            return false
        end
    end
    return false
end

function core_skins.saveActiveSkin(weaponName, skinId)
    local source = source
    local user_id = vRP.Passport(source)
    if user_id then
        if not activeSkins[user_id] then
            activeSkins[user_id] = {}
        end
        
        activeSkins[user_id][weaponName] = skinId

        exports.oxmysql:execute('INSERT INTO active_core_skins (user_id, weapon_name, skin_id) VALUES (@user_id, @weapon_name, @skin_id) ON DUPLICATE KEY UPDATE skin_id = @skin_id', {
            ['@user_id'] = user_id,
            ['@weapon_name'] = weaponName,
            ['@skin_id'] = skinId
        })
        

        updateSkinStats(skinId, "equipped")
        
        return true
    end
    return false
end


function core_skins.getActiveSkins()
    local source = source
    local user_id = vRP.Passport(source)
    if user_id then
        return activeSkins[user_id] or {}
    end
    return {}
end

function core_skins.recordPreview(skinId)
    updateSkinStats(skinId, "previewed")
    return true
end

function core_skins.getPopularSkins()
    local rows = exports.oxmysql:executeSync([[
        SELECT skin_id, times_equipped, times_previewed 
        FROM core_skins_stats 
        ORDER BY times_equipped DESC 
        LIMIT 5
    ]])
    
    local popularSkins = {}
    if rows and #rows > 0 then
        for _, row in ipairs(rows) do
            table.insert(popularSkins, {
                skin_id = row.skin_id,
                times_equipped = row.times_equipped,
                times_previewed = row.times_previewed
            })
        end
    end
    
    return popularSkins
end

