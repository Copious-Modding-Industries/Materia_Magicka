function OnModPreInit() end
function OnModInit() end
function OnModPostInit() end
function OnPlayerSpawned( player_entity ) end
function OnPlayerDied( player_entity ) end
function OnWorldInitialized() end
function OnWorldPreUpdate() end
function OnWorldPostUpdate() end
function OnBiomeConfigLoaded() end
function OnMagicNumbersAndWorldSeedInitialized() end
function OnPausedChanged( is_paused, is_inventory_pause ) end
function OnModSettingsChanged() end
function OnPausePreUpdate() end



function OnPlayerSpawned( player_entity )
    EntityLoad('mods/materia_magicka/files/items/holy_eye/item.xml', tonumber(MagicNumbersGetValue("DESIGN_PLAYER_START_POS_X")), tonumber(MagicNumbersGetValue("DESIGN_PLAYER_START_POS_Y") - 50))
end