class_name ModuleType
extends Reference

var sizes: Dictionary = {}


func _init(sizes_data: Dictionary):
	for size in sizes_data:
		var module_data: Dictionary = sizes_data[size]
		sizes[size] = Module.new(module_data)


# Get the module for [size]
func size_string(size: String) -> Module:
	return sizes[size]


# Get the module for [size]
func size(size: int) -> Module:
	match size:
		Room.RoomSize.SM:
			return sizes["sm"]
		Room.RoomSize.MD:
			return sizes["md"]
		_:
			return null
