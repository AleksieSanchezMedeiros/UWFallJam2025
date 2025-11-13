extends Node2D

@onready var Eagle = $CanvasLayer2/Control/Node2D
@onready var Jord = $CanvasLayer2/Control2/Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Eagle.start_up("EagleShow")
	Jord.start_up("JordShow")
	DialogueManager.show_example_dialogue_balloon(load("res://Dialogue/Ending.dialogue"), "start")

func go_to_next_crime():
	get_tree().change_scene_to_file("res://Scenes/inbetween1.tscn")
	print("FINISHED ROUND 1")
	
func can_click_now():
	Eagle.flipClick()
	Jord.flipClick()
