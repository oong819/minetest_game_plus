-- Minetest 0.4 mod: default
-- See README.txt for licensing and other information.

-- The API documentation in here was moved into game_api.txt

-- Load support for MT game translation.
local S = minetest.get_translator("default")

-- Definitions made by this mod that other mods can use too
default = {}

default.LIGHT_MAX = 14
default.get_translator = S

-- Check for engine features required by MTG
-- This provides clear error behaviour when MTG is newer than the installed engine
-- and avoids obscure, hard to debug runtime errors.
-- This section should be updated before release and older checks can be dropped
-- when newer ones are introduced.
if ItemStack("").add_wear_by_uses == nil then
	error("\nThis version of Minetest Game is incompatible with your engine version "..
		"(which is too old). You should download a version of Minetest Game that "..
		"matches the installed engine version.\n")
end

-- GUI related stuff
minetest.register_on_joinplayer(function(player)
	-- Set formspec prepend
	local formspec = [[
			bgcolor[#080808BB;true]
			listcolors[#00000069;#5A5A5A;#141318;#30434C;#FFF] ]]
	local name = player:get_player_name()
	local info = minetest.get_player_information(name)
	if info.formspec_version > 1 then
		formspec = formspec .. "background9[5,5;1,1;gui_formbg.png;true;10]"
	else
		formspec = formspec .. "background[5,5;1,1;gui_formbg.png;true]"
	end
	player:set_formspec_prepend(formspec)

	-- Set hotbar textures
	player:hud_set_hotbar_image("gui_hotbar.png")
	player:hud_set_hotbar_selected_image("gui_hotbar_selected.png")
end)

function default.get_hotbar_bg(x,y)
	local out = ""
	for i=0,7,1 do
		out = out .."image["..x+i..","..y..";1,1;gui_hb_bg.png]"
	end
	return out
end

default.gui_survival_form = "size[8,8.5]"..
			"list[current_player;main;0,4.25;8,1;]"..
			"list[current_player;main;0,5.5;8,3;8]"..
			"list[current_player;craft;1.75,0.5;3,3;]"..
			"list[current_player;craftpreview;5.75,1.5;1,1;]"..
			"image[4.75,1.5;1,1;gui_furnace_arrow_bg.png^[transformR270]"..
			"listring[current_player;main]"..
			"listring[current_player;craft]"..
			default.get_hotbar_bg(0,4.25)

-- Load files
local default_path = minetest.get_modpath("default")

dofile(default_path.."/functions.lua")
dofile(default_path.."/trees.lua")
dofile(default_path.."/nodes.lua")
dofile(default_path.."/chests.lua")
dofile(default_path.."/furnace.lua")
dofile(default_path.."/torch.lua")
dofile(default_path.."/tools.lua")
dofile(default_path.."/item_entity.lua")
dofile(default_path.."/craftitems.lua")
dofile(default_path.."/crafting.lua")
dofile(default_path.."/mapgen.lua")
dofile(default_path.."/aliases.lua")
dofile(default_path.."/legacy.lua")
--Stvk zone

minetest.register_biome({
    name = "deadlydesert",
    node_top = "default:desert_sand",
    depth_top = 1,
    node_filler = "default:desert_sandstone",
    depth_filler = 5,
    node_stone = "default:desert_stone",
    y_max = 1000,
    y_min = -3,
    heat_point = 100,
    humidity_point = 0,
})

	minetest.register_decoration({
		name = "default:outpost",
		deco_type = "schematic",
		place_on = {"default:dirt_with_grass"},
		sidelen = 16,
		noise_params = {
			offset = -0.02,
			scale = 0.001,
			spread = {x = 5, y = 5, z = 5},
			seed = 8,
			octaves = 1,
			persist = 0.66
		},
		biomes = {"deciduous_forest"},
		y_max = 31000,
		y_min = 1,
		schematic = minetest.get_modpath("default") .. "/schematics/outpost.mts",
		flags = "place_center_x, place_center_z",
		rotation = "random",
	})

	minetest.register_decoration({
		name = "default:calzon",
		deco_type = "schematic",
		place_on = {"default:dry_dirt_with_dry_grass"},
		sidelen = 16,
		noise_params = {
			offset = -0.02,
			scale = 0.001,
			spread = {x = 5, y = 5, z = 5},
			seed = 4,
			octaves = 1,
			persist = 0.80
		},
		biomes = {"savanna"},
		y_max = 31000,
		y_min = 1,
		schematic = minetest.get_modpath("default") .. "/schematics/calmzone.mts",
		flags = "place_center_x, place_center_z",
	})

minetest.register_decoration({
		name = "default:outpost",
		deco_type = "schematic",
		place_on = {"default:dirt_with_grass"},
		sidelen = 16,
		noise_params = {
			offset = -0.02,
			scale = 0.001,
			spread = {x = 5, y = 5, z = 5},
			seed = 8,
			octaves = 1,
			persist = 0.66
		},
		biomes = {"deciduous_forest"},
		y_max = 31000,
		y_min = 1,
		schematic = minetest.get_modpath("default") .. "/schematics/outpost.mts",
		flags = "place_center_x, place_center_z",
		rotation = "random",
	})

	minetest.register_decoration({
		name = "default:storage",
		deco_type = "schematic",
		place_on = {"default:dirt_with_rainforest_litter"},
		sidelen = 16,
		noise_params = {
			offset = -0.02,
			scale = 0.001,
			spread = {x = 5, y = 5, z = 5},
			seed = 4,
			octaves = 1,
			persist = 0.80
		},
		biomes = {"rainforest"},
		y_max = 31000,
		y_min = 1,
		schematic = minetest.get_modpath("default") .. "/schematics/storage.mts",
		flags = "place_center_x, place_center_z",
	})

minetest.register_decoration({
		name = "default:derock",
		deco_type = "schematic",
		place_on = {"default:desert_sand"},
		sidelen = 16,
		noise_params = {
			offset = -0.02,
			scale = 0.001,
			spread = {x = 5, y = 5, z = 5},
			seed = 4,
			octaves = 1,
			persist = 0.80
		},
		biomes = {"deadlydesert"},
		y_max = 31000,
		y_min = 1,
		schematic = minetest.get_modpath("default") .. "/schematics/derock.mts",
		flags = "place_center_x, place_center_z",
	})
