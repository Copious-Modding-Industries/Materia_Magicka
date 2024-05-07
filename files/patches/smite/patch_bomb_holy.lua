local file_path = "data/entities/projectiles/bomb_holy.xml"
local contents = ModTextFileGetContent(file_path):gsub("</Entity>$",
function()
    return ('<LuaComponent execute_every_n_frame="-1" script_death="mods/materia_magicka/files/patches/smite/death.lua" ></LuaComponent>') .. "</Entity>"
end)
ModTextFileSetContent(file_path, contents)