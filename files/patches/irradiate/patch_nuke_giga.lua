local file_path = "data/entities/projectiles/deck/nuke_giga.xml"
local contents = ModTextFileGetContent(file_path):gsub("</Entity>$",
function()
    return ('<LuaComponent execute_every_n_frame="-1" script_death="mods/materia_magicka/files/patches/irradiate/death.lua" ></LuaComponent>') .. "</Entity>"
end)
ModTextFileSetContent(file_path, contents)