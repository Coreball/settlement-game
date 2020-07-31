class_name Building
extends Node2D

const RoomSM = preload("res://rooms/room_sm.tscn")
const RoomMD = preload("res://rooms/room_md.tscn")

const TILE_SIZE = 64
# const FOOTPRINT = TILE_SIZE * 12

var rooms: Array = []


# Called when the node enters the scene tree for the first time.
func _ready():
	var json_rooms = json_result("res://buildings/building_a.json")
	for json_room in json_rooms:
		var new_room: Room = make_room(json_room)
		add_child(new_room)
		rooms.append(new_room)


# The JSON result from parsing file at [path]
func json_result(path: String):
	var file: File = File.new()
	file.open(path, file.READ)
	var json = JSON.parse(file.get_as_text())
	file.close()
	if json.error == OK:
		return json.result
	else:
		print(json.error_string)
		return null


# Creates a new room using [room_info]
func make_room(room_info: Dictionary) -> Room:
	var new_room: Room
	match room_info["size"]:
		"sm":
			new_room = RoomSM.instance()
		"md":
			new_room = RoomMD.instance()
	new_room.rotation_degrees = room_info["rotation"]
	new_room.position = Vector2(room_info["x"], room_info["y"]) * TILE_SIZE
	return new_room


# Connect all rooms in building to RoomDetail popup
func connect_room_edit(popup: RoomDetail):
	for room in rooms:
		room.connect("edit_room", popup, "_on_Room_edit_room")
