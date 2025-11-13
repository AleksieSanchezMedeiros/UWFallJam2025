extends Node2D


@onready var Eagle = $CanvasLayer3/Control/Node2D
@onready var card = $CanvasLayer4/Control/Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$CanvasLayer3/Control/AnimatedSprite2D.play("default")
	$CanvasLayer3/Control/AnimatedSprite2D2.play("default")
	card.revealCard("Devil", false)
	
	InterviewTracker.mark_visited("scene_a", true)
	Eagle.start_up("EagleShow")
	DialogueManager.show_example_dialogue_balloon(load("res://Dialogue/EagleScoutz.dialogue"), "EagleScoutz")

func back_to_line_up():
	get_tree().change_scene_to_file("res://Scenes/LineUp.tscn")
