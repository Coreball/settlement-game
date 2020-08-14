extends MarginContainer

const main = preload("res://scenes/main.tscn")

onready var settlement_name_edit: LineEdit = $VBoxContainer/SettlementNameEdit


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_Start_pressed():
	var game = main.instance()
	if not settlement_name_edit.text.empty():
		game.settlement_name = settlement_name_edit.text
	get_tree().root.add_child(game)
	self.queue_free()


func _on_Exit_pressed():
	get_tree().quit()
