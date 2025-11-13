extends Node2D

@onready var CEO = $CanvasLayer2/Control/Node2D
@onready var Fan = $CanvasLayer2/Control2/Node2D
@onready var Mascot = $CanvasLayer2/Control3/Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	CEO.start_up("CEOShow")
	Fan.start_up("FanShow")
	Mascot.start_up("MascotShow")
	DialogueManager.show_example_dialogue_balloon(load("res://Dialogue/WackonaldEnding.dialogue"), "start")

func go_to_next_crime():
	print("FINISHED ROUND 1")
	get_tree().change_scene_to_file("res://Scenes/inbetween2.tscn")
	
func can_click_now():
	CEO.flipClick()
	Fan.flipClick()
	Mascot.flipClick()
