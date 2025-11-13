extends Node2D

@onready var CEO = $CanvasLayer2/Control/Node2D
@onready var Fan = $CanvasLayer2/Control2/Node2D
@onready var Mascot = $CanvasLayer2/Control3/Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if(InterviewTracker.can_enter_final_scene()):
		InterviewTracker.mark_visited("scene_a", false)
		InterviewTracker.mark_visited("scene_b", false)
		InterviewTracker.mark_visited("scene_c", false)
		get_tree().change_scene_to_file("res://Scenes/wackonalds_final_scene.tscn")
	CEO.start_up("CEOHide")
	Fan.start_up("FanHide")
	Mascot.start_up("MascotHide")
	DialogueManager.show_example_dialogue_balloon(load("res://Dialogue/wackonald_lineup.dialogue"), "start")

func can_click_now():
	CEO.flipClick()
	Fan.flipClick()
	Mascot.flipClick()
