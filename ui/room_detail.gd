# Please give this a better name
class_name RoomDetail
extends PopupPanel

var selected_room: Room


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_Room_edit_room(room: Room):
	print("Popup opening")
	self.popup_centered()
	selected_room = room


func _on_TestBed_pressed():
	if selected_room != null:
		selected_room.change_module("bed")


func _on_TestRain_pressed():
	if selected_room != null:
		selected_room.change_module("rain")


func _on_TestEmpty_pressed():
	if selected_room != null:
		selected_room.clear_module()
