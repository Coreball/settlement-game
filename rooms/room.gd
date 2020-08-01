class_name Room
extends Area2D

signal edit_room(Room)

enum RoomSize {SM, MD}
export(RoomSize) var room_size


func _init():
	print("room init")


# Called when the node enters the scene tree for the first time.
func _ready():
	print("room ready")
	pass # Replace with function body.


func _input_event(viewport, event, shape_idx):
	if event.is_action_pressed("ui_click"):
		print("Pressed room")
		emit_signal("edit_room", self)
