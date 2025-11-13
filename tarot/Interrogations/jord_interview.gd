extends Node2D


@onready var Jord = $CanvasLayer3/Control/Node2D
@onready var card = $CanvasLayer4/Control/Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	card.revealCard("Devil", false)
	$CanvasLayer3/Control/AnimatedSprite2D.play("default")
	$CanvasLayer3/Control/AnimatedSprite2D2.play("default")
	InterviewTracker.mark_visited("scene_b", true)
	Jord.start_up("JordShow")
	DialogueManager.show_example_dialogue_balloon(load("res://Dialogue/JordJocus.dialogue"), "start")

func back_to_line_up():
	get_tree().change_scene_to_file("res://Scenes/LineUp.tscn")
