extends Node2D


@onready var Mascot = $CanvasLayer3/Control/Node2D
@onready var card = $CanvasLayer4/Control/Node2D
@onready var card2 = $CanvasLayer4/Control/Node2D2
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$CanvasLayer3/Control/AnimatedSprite2D.play("default")
	$CanvasLayer3/Control/AnimatedSprite2D2.play("default")
	card2.revealCard("PageOfCups", true)
	card.revealCard("tower", false)
	
	InterviewTracker.mark_visited("scene_b", true)
	Mascot.start_up("MascotShow")
	DialogueManager.show_example_dialogue_balloon(load("res://Dialogue/Mascot.dialogue"), "start")

func back_to_line_up():
	get_tree().change_scene_to_file("res://Assets/WackonaldsLineUp.tscn")
