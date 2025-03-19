local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")
vRP = Proxy.getInterface("vRP")


core_skins = Tunnel.getInterface("core_skins")

-- DnzxDevop -  Variáveis

local Weapons = {}
local ownedSkins = {}
local activeSkins = {}
local uiOpen = false

function LoadOwnedSkins()
    ownedSkins = core_skins.getOwnedSkins() or {}
    Weapons = core_skins.getAllWeapons() or {}
end

function HasSkin(weaponId)
    for _, id in ipairs(ownedSkins) do
        if id == weaponId then
            return true
        end
    end
    return false
end


function FindWeaponBySkinId(skinId)
    for _, weapon in ipairs(Weapons) do
        if weapon.id == skinId then
            return weapon
        end
    end
    return nil
end



RegisterNUICallback("ping", function(data, cb)
    cb({success = true, message = "pong"})
end)

function OpenNUI(menu)
    if uiOpen then
        LoadOwnedSkins()
    
        local weaponsData = {}
        for _, weapon in ipairs(Weapons) do
            local owned = HasSkin(weapon.id)
            table.insert(weaponsData, {
                id = weapon.id,
                name = weapon.name,
                weapon = weapon.weapon,
                weaponName = string.gsub(weapon.weapon, "WEAPON_", ""),
                component = weapon.component,
                price = weapon.price,
                owned = owned,
                image = weapon.image or "",
                description = weapon.description or ""
            })
        end

        local popularSkins = core_skins.getPopularSkins() or {}

        SendNUIMessage({
            action = "updateWeapons",
            weapons = weaponsData,
            activeSkins = activeSkins,
            popularSkins = popularSkins
        })

        if menu then
            SendNUIMessage({
                action = "changeMenu",
                menu = menu
            })
        end
        
        return
    end
    LoadOwnedSkins()

    local weaponsData = {}
    for _, weapon in ipairs(Weapons) do
        local owned = HasSkin(weapon.id)
        table.insert(weaponsData, {
            id = weapon.id,
            name = weapon.name,
            weapon = weapon.weapon,
            weaponName = string.gsub(weapon.weapon, "WEAPON_", ""),
            component = weapon.component,
            price = weapon.price,
            owned = owned,
            image = weapon.image or "",
            description = weapon.description or ""
        })
    end
    

    local popularSkins = core_skins.getPopularSkins() or {}

    SetNuiFocus(true, true)
    SendNUIMessage({
        action = "open",
        menu = menu or "main",
        weapons = weaponsData,
        activeSkins = activeSkins,
        popularSkins = popularSkins
    })
    
    
    uiOpen = true
end
function CloseNUI()
    if not uiOpen then return end
    
    SetNuiFocus(false, false)
    SendNUIMessage({
        action = "close"
    })

    uiOpen = false
    
    Citizen.CreateThread(function()
        Wait(500)
    end)
end



function ApplySkinToWeapon(weaponName, skinId)
    local playerPed = PlayerPedId()
    local weaponHash = GetHashKey(weaponName)
    
    if HasPedGotWeapon(playerPed, weaponHash, false) then
        local weapon = FindWeaponBySkinId(skinId)
        if weapon then
            local componentHash = GetHashKey(weapon.component)
            GiveWeaponComponentToPed(playerPed, weaponHash, componentHash)
            return true
        end
    end
    return false
end

function LoadActiveSkins()
    local serverActiveSkins = core_skins.getActiveSkins() or {}
    activeSkins = serverActiveSkins
end

Citizen.CreateThread(function()
    while true do
        local playerPed = PlayerPedId()
        local sleep = 1000
        
        for weaponName, skinId in pairs(activeSkins) do
            local weapon = FindWeaponBySkinId(skinId)
            if weapon then
                local weaponHash = GetHashKey(weaponName)
                local componentHash = GetHashKey(weapon.component)
                
                if HasPedGotWeapon(playerPed, weaponHash, false) and not HasPedGotWeaponComponent(playerPed, weaponHash, componentHash) then
                    GiveWeaponComponentToPed(playerPed, weaponHash, componentHash)
                end
            end
        end
        
        Citizen.Wait(sleep)
    end
end)

RegisterNUICallback("close", function(data, cb)
    CloseNUI()
    cb({})
end)

RegisterNUICallback("buySkin", function(data, cb)
    local skinId = data.skinId
    local success = core_skins.buySkin(skinId)
    
    if success then
        LoadOwnedSkins()
        
        local weaponsData = {}
        for _, weapon in ipairs(Weapons) do
            local owned = HasSkin(weapon.id)
            table.insert(weaponsData, {
                id = weapon.id,
                name = weapon.name,
                weapon = weapon.weapon,
                weaponName = string.gsub(weapon.weapon, "WEAPON_", ""),
                component = weapon.component,
                price = weapon.price,
                owned = owned,
                image = weapon.image or "",
                description = weapon.description or ""
            })
        end
        
        SendNUIMessage({
            action = "updateWeapons",
            weapons = weaponsData
        })
    end
    
    cb({success = success})
end)

RegisterNUICallback("equipSkin", function(data, cb)
    local skinId = data.skinId
    local weapon = FindWeaponBySkinId(skinId)
    
    if not weapon then
        cb({success = false, message = "Skin não encontrada"})
        return
    end
    
    local playerPed = PlayerPedId()
    local weaponHash = GetHashKey(weapon.weapon)
    local componentHash = GetHashKey(weapon.component)
    
    if HasPedGotWeapon(playerPed, weaponHash, false) then
        GiveWeaponComponentToPed(playerPed, weaponHash, componentHash)
        
        activeSkins[weapon.weapon] = weapon.id
        core_skins.saveActiveSkin(weapon.weapon, weapon.id)
        
        cb({success = true})
    else
        cb({success = false, message = "Você não possui essa arma"})
    end
end)



RegisterNUICallback("changeMenu", function(data, cb)
    SendNUIMessage({
        action = "changeMenu",
        menu = data.menu
    })
    cb({})
end)

RegisterCommand("core_skins", function()
    OpenNUI("main")
end, false)

RegisterCommand("core_skinshop", function()
    OpenNUI("shop")
end, false)

Citizen.CreateThread(function()
    Wait(2000) 
    
    LoadOwnedSkins()
    Wait(500)
    LoadActiveSkins() 
end)

RegisterNetEvent("core_skins:syncSkins")
AddEventHandler("core_skins:syncSkins", function()
    LoadOwnedSkins()
    LoadActiveSkins()
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if IsControlJustPressed(0, 166) then
            OpenNUI("main")
        end
    end
end)

