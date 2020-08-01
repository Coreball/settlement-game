# Please give this a better name
class_name RoomDetail
extends PopupPanel

const BED_SM = preload("res://modules/bed_sm.png")
const BED_MD = preload("res://modules/bed_md.png")

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
		match selected_room.room_size:
			Room.RoomSize.SM:
				selected_room.get_node("Module").texture = BED_SM
			Room.RoomSize.MD:
				selected_room.get_node("Module").texture = BED_MD


func _on_TestEmpty_pressed():
	if selected_room != null:
		selected_room.get_node("Module").texture = null
