extends Node

const BuildingScene = preload("res://buildings/building.tscn")

onready var room_popup: RoomDetail = $CanvasLayer/RoomPopup


# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	var building_test: Building = BuildingScene.instance()
	building_test.use_random_template()
	add_child(building_test)
	building_test.get_node("Camera2D").make_current() # Centered camera
	#building_test.get_node("Camera2D").zoom = Vector2(1.5, 1.5)
	building_test.connect_room_edit(room_popup)

