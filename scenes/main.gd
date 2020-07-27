extends Node

const BuildingTest = preload("res://buildings/building_test.tscn")


# Called when the node enters the scene tree for the first time.
func _ready():
	var building_test: Building = BuildingTest.instance()
	add_child(building_test)
	building_test.get_node("Camera2D").make_current() # Centered camera

