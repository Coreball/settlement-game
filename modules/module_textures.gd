class_name ModuleTextures
extends Reference

const BED_SM = preload("res://modules/bed_sm.png")
const BED_MD = preload("res://modules/bed_md.png")

# TEXTURES[module_name][room_size], array in same order as RoomSize enum
const TEXTURES = {
	"bed": [
		BED_SM,
		BED_MD,
	],
}
