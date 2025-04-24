fx_version "bodacious"
game "gta5"
lua54 "yes"
author 'Core Development'
developer 'Dnzx'
client_scripts {
	"@vrp/config/Native.lua",
	"@vrp/lib/Utils.lua",
	"client-side/*"
}

server_scripts {
	"@vrp/config/Item.lua",
	"@vrp/config/Vehicle.lua",
	"@vrp/lib/Utils.lua",
	"server-side/*"
}

shared_scripts {
	"shared-side/*"
}

files {
	"web-side/index.html",
	"web-side/index.js",
	"web-side/index.css",
	"data-side/*",
}

ui_page "web-side/index.html"


data_file "DLC_ITYP_REQUEST" "stream/Utils/Box/mt_boxpreta.ytyp"

-- Addons
data_file "PED_PERSONALITY_FILE" "data-side/pedpersonality.meta"
data_file "WEAPON_ANIMATIONS_FILE" "data-side/weaponanimations.meta"
data_file "WEAPON_METADATA_FILE" "data-side/weaponarchetypes.meta"
data_file "WEAPONCOMPONENTSINFO_FILE" "data-side/weaponcomponents.meta"
data_file "WEAPONINFO_FILE" "data-side/weapons_brick.meta"
data_file "WEAPONINFO_FILE" "data-side/weapons_coltxm177.meta"
data_file "WEAPONINFO_FILE" "data-side/weapons_karambit.meta"
data_file "WEAPONINFO_FILE" "data-side/weapons_katana.meta"
data_file "WEAPONINFO_FILE" "data-side/weapons_nailgun.meta"
data_file "WEAPONINFO_FILE" "data-side/weapons_shoes.meta"

-- Vanilla
data_file "WEAPONINFO_FILE_PATCH" "data-side/weapon_militaryrifle.meta"
data_file "WEAPONINFO_FILE_PATCH" "data-side/weaponcombatpdw.meta"
data_file "WEAPONINFO_FILE_PATCH" "data-side/weaponheavyshotgun.meta"
data_file "WEAPONINFO_FILE_PATCH" "data-side/weapons_combatmg_mk2.meta"
data_file "WEAPONINFO_FILE_PATCH" "data-side/weapons_doubleaction.meta"
data_file "WEAPONINFO_FILE_PATCH" "data-side/weapons_heavyrifle.meta"
data_file "WEAPONINFO_FILE_PATCH" "data-side/weapons_heavysniper_mk2.meta"
data_file "WEAPONINFO_FILE_PATCH" "data-side/weapons_marksmanrifle_mk2.meta"
data_file "WEAPONINFO_FILE_PATCH" "data-side/weapons_revolver_mk2.meta"
data_file "WEAPONINFO_FILE_PATCH" "data-side/weapons.meta"
data_file "WEAPONINFO_FILE_PATCH" "data-side/weaponsnowball.meta"
data_file "WEAPONINFO_FILE_PATCH" "data-side/weapons_assaultrifle_mk2.meta"
data_file "WEAPONINFO_FILE_PATCH" "data-side/weaponcompactrifle.meta"
data_file "WEAPONINFO_FILE_PATCH" "data-side/weapongusenberg.meta"
data_file "WEAPONINFO_FILE_PATCH" "data-side/weaponheavypistol.meta"
data_file "WEAPONINFO_FILE_PATCH" "data-side/weaponmachinepistol.meta"
data_file "WEAPONINFO_FILE_PATCH" "data-side/weaponminismg.meta"
data_file "WEAPONINFO_FILE_PATCH" "data-side/weapons_pistol_mk2.meta"
data_file "WEAPONINFO_FILE_PATCH" "data-side/weaponrevolver.meta"
data_file "WEAPONINFO_FILE_PATCH" "data-side/weaponsnspistol.meta"
data_file "WEAPONINFO_FILE_PATCH" "data-side/weapons_snspistol_mk2.meta"
data_file "WEAPONINFO_FILE_PATCH" "data-side/weaponvintagepistol.meta"
data_file "WEAPONINFO_FILE_PATCH" "data-side/weaponbattleaxe.meta"
data_file "WEAPONINFO_FILE_PATCH" "data-side/weaponbottle.meta"
data_file "WEAPONINFO_FILE_PATCH" "data-side/weaponflashlight.meta"
data_file "WEAPONINFO_FILE_PATCH" "data-side/weaponhatchet.meta"
data_file "WEAPONINFO_FILE_PATCH" "data-side/weaponknuckle.meta"
data_file "WEAPONINFO_FILE_PATCH" "data-side/weaponmachete.meta"
data_file "WEAPONINFO_FILE_PATCH" "data-side/weaponpoolcue.meta"
data_file "WEAPONINFO_FILE_PATCH" "data-side/weaponstonehatchet.meta"
data_file "WEAPONINFO_FILE_PATCH" "data-side/weaponwrench.meta"
data_file "WEAPONINFO_FILE_PATCH" "data-side/weaponmusket.meta"
data_file "WEAPONINFO_FILE_PATCH" "data-side/weaponbullpuprifle.meta"
data_file "WEAPONINFO_FILE_PATCH" "data-side/weapons_bullpuprifle_mk2.meta"
data_file "WEAPONINFO_FILE_PATCH" "data-side/weapons_carbinerifle_mk2.meta"
data_file "WEAPONINFO_FILE_PATCH" "data-side/weapons_pumpshotgun_mk2.meta"
data_file "WEAPONINFO_FILE_PATCH" "data-side/weapon_combatshotgun.meta"
data_file "WEAPONINFO_FILE_PATCH" "data-side/weapons_smg_mk2.meta"
data_file "WEAPONINFO_FILE_PATCH" "data-side/weapons_specialcarbine_mk2.meta"
data_file "WEAPONINFO_FILE_PATCH" "data-side/weaponspecialcarbine.meta"
data_file "WEAPONINFO_FILE_PATCH" "data-side/weapons_spacerangers.meta"
