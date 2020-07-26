class_name Room
extends Area2D


func _init():
	print("room init")


# Called when the node enters the scene tree for the first time.
func _ready():
	print("room ready")
	pass # Replace with function body.


func _input_event(viewport, event, shape_idx):
	if event.is_action_pressed("ui_click"):
		print("hello")
		$Popup.popup_centered()
