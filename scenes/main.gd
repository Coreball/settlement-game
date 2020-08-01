extends Node

const BuildingScene = preload("res://buildings/building.tscn")

var days: int = 0
var building: Building

onready var day_label: Label = $CanvasLayer/InfoVBox/DayLabel
onready var room_popup: RoomDetail = $CanvasLayer/RoomPopup


func _init():
	randomize()
	building = BuildingScene.instance()
	building.use_random_template()
	add_child(building)


# Called when the node enters the scene tree for the first time.
func _ready():
	building.get_node("Camera2D").make_current() # Centered camera
	building.connect_room_edit(room_popup)


func next_turn() -> void:
	days += 100
	day_label.text = "Day %d" % days


func _on_EndTurnButton_pressed():
	next_turn()
