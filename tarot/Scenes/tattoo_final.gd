extends Node2D

@onready var Artist = $CanvasLayer2/Control/Node2D
@onready var SMC = $CanvasLayer2/Control2/Node2D
@onready var Lady = $CanvasLayer2/Control3/Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Artist.start_up("ArtistShow")
	SMC.start_up("SocialMediaShow")
	Lady.start_up("AdelaideShow")
	DialogueManager.show_example_dialogue_balloon(load("res://Dialogue/TattooEnding.dialogue"), "start")

func go_to_next_crime():
	print("FINISHED ROUND 2")
	get_tree().change_scene_to_file("res://Scenes/gameEND.tscn")
	
func can_click_now():
	Artist.flipClick()
	SMC.flipClick()
	Lady.flipClick()
