extends Node

const BuildingScene = preload("res://buildings/building.tscn")

var settlement_name: String = "Unnamed Settlement"
var days: int = 0
var building: Building
var resources: Dictionary
var resource_labels: Dictionary

onready var log_label: RichTextLabel = $CanvasLayer/VBoxContainer/BottomPanel/HBoxContainer/LogLabel
onready var settlement_name_label: Label = $CanvasLayer/VBoxContainer/TopPanel/HBoxContainer/SettlementNameLabel
onready var day_label: Label = $CanvasLayer/VBoxContainer/TopPanel/HBoxContainer/DayLabel
onready var info_vbox: VBoxContainer = $CanvasLayer/InfoVBox
onready var room_popup: RoomDetail = $CanvasLayer/RoomPopup


func _init():
	randomize()
	building = BuildingScene.instance()
	building.use_random_template()
	resources = GameProperties.get_initial_resources()


# Called when the node enters the scene tree for the first time.
func _ready():
	Logger.connect("new_log", self, "_on_Logger_new_log")
	add_child(building)
	building.get_node("Camera2D").make_current() # Centered camera
	building.connect_room_edit(room_popup)
	room_popup.connect("change_module", self, "_on_RoomPopup_change_module")
	settlement_name_label.text = settlement_name
	for resource in resources: # Make resource labels
		var resource_label: Label = Label.new()
		resource_labels[resource] = resource_label
		info_vbox.add_child(resource_label)
	update_resources()


# Update resource labels
func update_resources() -> void:
	for resource in resources:
		var amount = resources[resource]
		var resource_label = resource_labels[resource]
		resource_label.text = "%s: %d" % [resource.capitalize(), amount]


# Advance the turn/step
func next_turn() -> void:
	days += 1
	day_label.text = "Day %d" % days
	building.step(resources)
	update_resources()


func _on_Logger_new_log(words: String) -> void:
	log_label.newline()
	log_label.add_text(words)


# Change module of [room] to [module]
func _on_RoomPopup_change_module(room: Room, module: String) -> void:
	if module == "": # For clearing, empty module
		room.clear_module()
		return
	# Otherwise get the costs
	var costs: Dictionary = ModuleProperties.get_costs(module, room.room_size)
	var can_build = true
	# Check that module is affordable
	for resource in costs:
		if resources[resource] < costs[resource]:
			can_build = false
	# And build if able, updating resource labels too
	if can_build:
		Logger.add("Building a %s module" % module)
		for resource in costs:
			resources[resource] -= costs[resource]
		room.change_module(module)
		update_resources()


func _on_EndTurnButton_pressed():
	next_turn()
