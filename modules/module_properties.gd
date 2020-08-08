extends Node

var properties: Dictionary


func _init():
	properties = Util.json_result("res://modules/modules.json")
	_load_textures()


# Load module textures
func _load_textures() -> void:
	for module in properties:
		for size in properties[module]:
			properties[module][size]["texture"] = load(properties[module][size]["texture"])


# The string corresponding to the Room.RoomSize enum
func size_string(size: int) -> String:
	match size:
		Room.RoomSize.SM:
			return "sm"
		Room.RoomSize.MD:
			return "md"
		_:
			push_error("No size string for this int size")
			return ""


# Try to get [property] from [module] of [size]. Will cause things to break
# Because GDScript doesn't have error handling, and no Variant return type...
func _property(module: String, size: int, property: String):
	if module in properties:
		if size_string(size) in properties[module]:
			if property in properties[module][size_string(size)]:
				return properties[module][size_string(size)][property]
			else:
				push_error("Property %s is not valid for size %d of module %s" % [property, size, module])
				return null
		else:
			push_error("Size %d is not valid for module %s" % [size, module])
			return null
	else:
		push_error("Module %s is not valid" % module)
		return null


# The texture for a [module] of [size]
func get_module_texture(module: String, size: int) -> Texture:
	return _property(module, size, "texture")


# The number of residents for [module] of [size]
func get_max_residents(module: String, size: int) -> int:
	return _property(module, size, "max residents")


# The production dictionary for [module] of [size]
func get_productions(module: String, size: int) -> Dictionary:
	return _property(module, size, "production")
