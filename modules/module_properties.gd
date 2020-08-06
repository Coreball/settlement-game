extends Node

var properties: Dictionary


func _init():
	properties = Util.json_result("res://modules/modules.json")
	_load_textures()


func _load_textures() -> void:
	for module in properties:
		for size in properties[module]:
			properties[module][size]["texture"] = load(properties[module][size]["texture"])


func size_string(size: int) -> String:
	match size:
		Room.RoomSize.SM:
			return "sm"
		Room.RoomSize.MD:
			return "md"
		_:
			push_error("No size string for this int size")
			return ""


# The texture for a [module] of [size]
func get_module_texture(module: String, size: int) -> Texture:
	return properties[module][size_string(size)]["texture"]


# The number of residents for [module] of [size]
func get_max_residents(module: String, size: int) -> int:
	return properties[module][size_string(size)]["max residents"]
