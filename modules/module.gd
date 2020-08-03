class_name Module
extends Reference

var texture: Texture
var max_residents: int


func _init(module_data: Dictionary):
	texture = load(module_data["texture"])
	max_residents = module_data["max residents"]
