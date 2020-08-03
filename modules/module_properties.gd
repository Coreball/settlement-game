extends Node

var module_types: Dictionary = {}


func _init():
	var module_data: Array = Util.json_result("res://modules/modules.json")
	for raw_module in module_data:
		var module_name: String = raw_module["name"]
		var sizes: Dictionary = raw_module["sizes"]
		module_types[module_name] = ModuleType.new(sizes)


# Get the module type for [type]
func type(type: String) -> ModuleType:
	return module_types[type]
