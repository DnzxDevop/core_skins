# Core Weapon Skins System

A comprehensive weapon skin management system for FiveM servers using vRP framework. This system allows players to purchase, equip, and manage weapon skins through an intuitive UI.

## Features

- **Skin Shop**: Browse and purchase weapon skins
- **Skin Management**: Equip and preview owned skins
- **Statistics Tracking**: Track popular skins based on usage
- **Persistent Storage**: All skins and preferences are saved to database
- **Real-time Synchronization**: Skins apply automatically when weapons are equipped

## Installation

1. Add the `core_skins` folder to your server resources directory
2. Add `ensure core_skins` to your server.cfg
3. Configure the `shared.lua` file to match your server's economy
4. Start or restart your server

## Usage

### Player Commands

- `/core_skins` - Opens the main skins menu
- `/core_skinshop` - Opens directly to the skin shop
- `F5` key (default) - Quick access to skins menu

### Database Tables

The system automatically creates the following tables:

- `core_skins` - Stores all purchased skins by player
- `active_core_skins` - Stores which skins are currently equipped
- `core_skins_stats` - Tracks usage statistics for each skin

## Configuration

### Shared Configuration

Edit the `shared.lua` file to configure:

- Payment methods (Bank, Gems, or Full)
- Default prices
- Available weapons and skins

### Adding New Skins

Add new skins to the `Weapons` table in `shared.lua`:

```lua
{
    id = 1, -- Unique ID for the skin
    name = "Gold Finish", -- Display name
    weapon = "WEAPON_PISTOL", -- Weapon type
    component = "COMPONENT_PISTOL_VARMOD_LUXE", -- Component ID
    price = 5000, -- Price in server currency
    image = "nui/images/gold_pistol.png", -- Image path
    description = "Luxury gold finish for standard pistol" -- Optional description
}
```

## Developer Information

### Server Events

- `vRP:playerSpawn` - Loads active skins when player spawns
- `core_skins:syncSkins` - Forces synchronization of skins data

### Client-Server Communication

The system uses vRP's Tunnel and Proxy for secure client-server communication:

- `core_skins.getAllWeapons()` - Returns all available weapon skins
- `core_skins.getOwnedSkins()` - Returns skins owned by the player
- `core_skins.buySkin(weaponId)` - Handles skin purchase
- `core_skins.saveActiveSkin(weaponName, skinId)` - Saves equipped skin preference
- `core_skins.getActiveSkins()` - Returns all currently active skins
- `core_skins.recordPreview(skinId)` - Records skin preview for statistics
- `core_skins.getPopularSkins()` - Returns the most popular skins

### NUI Interface

The system includes a modern UI built with HTML/CSS/JS. Communication with the UI is handled through:

- `OpenNUI(menu)` - Opens the interface on a specific menu
- `CloseNUI()` - Closes the interface
- Various NUI callbacks handle UI interactions

## Support

For issues, feature requests, or custom development:
- Create an issue on the GitHub repository
- Contact the developer via Discord

## License

This resource is protected under copyright law. Unauthorized redistribution is prohibited.

## Credits

Developed by DnzxDevop
