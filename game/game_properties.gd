extends Node

var properties: Dictionary


func _init():
	properties = Util.json_result("res://game/game_properties.json")


func get_initial_resources() -> Dictionary:
	return properties["initial resources"]
