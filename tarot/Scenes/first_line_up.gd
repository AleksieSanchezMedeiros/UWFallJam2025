extends Node2D

@onready var Eagle = $CanvasLayer2/Control/Node2D
@onready var Jord = $CanvasLayer2/Control2/Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	InterviewTracker.mark_visited("scene_c", true)
	if(InterviewTracker.can_enter_final_scene()):
		InterviewTracker.mark_visited("scene_a", false)
		InterviewTracker.mark_visited("scene_b", false)
		InterviewTracker.mark_visited("scene_c", false)
		get_tree().change_scene_to_file("res://SpriteAnim/tutorial_final_scene.tscn")
	Eagle.start_up("EagleHide")
	Jord.start_up("JordHide")
	DialogueManager.show_example_dialogue_balloon(load("res://Dialogue/Lineup.dialogue"), "start")

func can_click_now():
	Eagle.flipClick()
	Jord.flipClick()
