local item_id = GetUpdatedEntityID()
local sprites = EntityGetComponent(item_id, "SpriteComponent") or {}
local beam = nil
local spark = nil
for i=1, #sprites do
    local sprite = sprites[i]
    local file = ComponentGetValue2(sprite, "image_file")
    if file == "mods/materia_magicka/files/items/holy_eye/holy_beam.xml" then
        beam = sprite
    elseif file == "mods/materia_magicka/files/items/holy_eye/holy_spark.xml" then
        spark = sprite
    end
    if beam and spark then
        -- Project rotation vector to 128 pixels out from the item (full beam length)
        local self_x, self_y, rot = EntityGetTransform(item_id)
        local target_x = self_x + 128 * math.cos(rot)
        local target_y = self_y + 128 * math.sin(rot)
        -- Raycast to hit terrain
        local did_hit, hit_x, hit_y = RaytracePlatforms(self_x, self_y, target_x, target_y)
        if did_hit then target_x, target_y = hit_x, hit_y end -- Perchance spray particles on hit?
        local len = ((target_x-self_x)^2+(target_y-self_y)^2)^0.5
        -- Scale Beam to the length of the emitter position to the target position
        ComponentSetValue2(beam, "special_scale_x", len)
        -- Offset Beam end
        ComponentSetValue2(spark, "offset_x", 7.5-len)
        ComponentSetValue2(spark, "offset_y", 7.5)
        break
    end
end

