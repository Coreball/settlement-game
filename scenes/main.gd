extends Node

const BuildingScene = preload("res://buildings/building.tscn")

var days: int = 0
var building: Building
var resources: Dictionary
var resource_labels: Dictionary

onready var day_label: Label = $CanvasLayer/InfoVBox/DayLabel
onready var info_vbox: VBoxContainer = $CanvasLayer/InfoVBox
onready var room_popup: RoomDetail = $CanvasLayer/RoomPopup


func _init():
	randomize()
	building = BuildingScene.instance()
	building.use_random_template()
	resources = GameProperties.get_initial_resources()


# Called when the node enters the scene tree for the first time.
func _ready():
	add_child(building)
	building.get_node("Camera2D").make_current() # Centered camera
	building.connect_room_edit(room_popup)
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


func _on_EndTurnButton_pressed():
	next_turn()
