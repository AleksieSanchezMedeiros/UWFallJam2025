extends Node2D


@onready var Adelaide = $CanvasLayer3/Control/Node2D
@onready var card = $CanvasLayer4/Control/Node2D
@onready var card2 = $CanvasLayer4/Control/Node2D2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$CanvasLayer3/Control/AnimatedSprite2D.play("default")
	$CanvasLayer3/Control/AnimatedSprite2D2.play("default")
	card2.revealCard("World", true)
	card.revealCard("SevenOfPentacles", false)
	
	InterviewTracker.mark_visited("scene_c", true)
	Adelaide.start_up("AdelaideShow")
	DialogueManager.show_example_dialogue_balloon(load("res://Dialogue/Adelaide.dialogue"), "start")

func back_to_line_up():
	get_tree().change_scene_to_file("res://Scenes/tatoo_lineup.tscn")
