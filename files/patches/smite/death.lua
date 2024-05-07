local entity_id = GetUpdatedEntityID()
local x, y = EntityGetTransform(entity_id)
local projcomp = EntityGetFirstComponentIncludingDisabled(entity_id, "ProjectileComponent")
if projcomp ~= nil then
    local explosion_radius = ComponentObjectGetValue2( projcomp, "config_explosion", "explosion_radius" )
    for _, target in ipairs(EntityGetInRadiusWithTag(x, y, explosion_radius, "smite_target")) do
        local varscomponent = EntityGetFirstComponent( target, "VariableStorageComponent", "become_entity" )
        if varscomponent ~= nil then
            local become_entity = ComponentGetValue2( varscomponent, "value_string")
            local tx, ty = EntityGetTransform(target)
            EntityKill(target)
            EntityLoad(become_entity, tx, ty)
        end
    end
end


-- TODO!
-- Rewrite for cleanliness 
-- Handle transferring data