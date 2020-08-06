class_name Room
extends Area2D

signal edit_room(Room)

enum RoomSize {SM, MD}
export(RoomSize) var room_size
var module: String = ""

onready var module_sprite: Sprite = $Module as Sprite


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


# Change the module of the room to [module_name]
func change_module(module_name: String) -> void:
	module = module_name
	module_sprite.texture = ModuleProperties.get_module_texture(module_name, room_size)


# Clear the current module in the room
func clear_module() -> void:
	module = ""
	module_sprite.texture = null
