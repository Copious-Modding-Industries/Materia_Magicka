local entity_id = GetUpdatedEntityID()
local x, y = EntityGetTransform(entity_id)
local projcomp = EntityGetFirstComponentIncludingDisabled(entity_id, "ProjectileComponent")
if projcomp then
    local explosion_radius = ComponentObjectGetValue2( projcomp, "config_explosion", "explosion_radius" )
    for _, target in ipairs(EntityGetInRadiusWithTag(x, y, explosion_radius, "irradiate_target")) do
        local varscomponent = EntityGetFirstComponent( target, "VariableStorageComponent", "become_entity" )
        if varscomponent then
            local tx, ty = EntityGetTransform(target)
            local become_entity = ComponentGetValue2( varscomponent, "value_string")
            EntityKill(target)
            EntityLoad(become_entity, tx, ty)
        end
    end
end


-- TODO!
-- Rewrite for cleanliness 
-- Handle transferring data