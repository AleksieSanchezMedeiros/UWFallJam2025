extends Node2D

@onready var Artist = $CanvasLayer2/Control/Node2D
@onready var SMC = $CanvasLayer2/Control2/Node2D
@onready var Lady = $CanvasLayer2/Control3/Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if(InterviewTracker.can_enter_final_scene()):
		InterviewTracker.mark_visited("scene_a", false)
		InterviewTracker.mark_visited("scene_b", false)
		InterviewTracker.mark_visited("scene_c", false)
		get_tree().change_scene_to_file("res://Scenes/tattoo_final.tscn")
	Artist.start_up("ArtistHide")
	SMC.start_up("SocialMediaHide")
	Lady.start_up("AdelaideHide")
	DialogueManager.show_example_dialogue_balloon(load("res://Dialogue/tattoo_lineup.dialogue"), "start")

func can_click_now():
	Artist.flipClick()
	SMC.flipClick()
	Lady.flipClick()
