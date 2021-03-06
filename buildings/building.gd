class_name Building
extends Node2D

const RoomSM = preload("res://rooms/room_sm.tscn")
const RoomMD = preload("res://rooms/room_md.tscn")

const TILE_SIZE = 64
# const FOOTPRINT = TILE_SIZE * 12

var building_templates: Array = []

var rooms: Array = []


func _init():
	building_templates = Util.json_result("res://buildings/building_templates.json")


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Set the rooms of this building to a random template
func use_random_template() -> void:
	var random_index: int = randi() % building_templates.size()
	use_template(random_index)


# Set the rooms of this building to those from [template_index]
func use_template(template_index: int) -> void:
	# Might want to clear the children/rooms later
	var building_template: Dictionary = building_templates[template_index]
	print(building_template)
	for room_template in building_template["rooms"]:
		var new_room: Room = make_room(room_template)
		add_child(new_room)
		rooms.append(new_room)


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
func connect_room_edit(popup: RoomDetail) -> void:
	for room in rooms:
		room.connect("edit_room", popup, "_on_Room_edit_room")


func step(resources: Dictionary) -> void:
	for room in rooms:
		room.production(resources)
