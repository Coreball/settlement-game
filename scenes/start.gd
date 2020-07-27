extends MarginContainer

const main = preload("res://scenes/main.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_Start_pressed():
	get_tree().change_scene_to(main)


func _on_Exit_pressed():
	get_tree().quit()
