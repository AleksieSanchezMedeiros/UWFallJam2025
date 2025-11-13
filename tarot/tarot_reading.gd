extends Node2D
@onready var orb = $CanvasLayer2/Control/Orb
@onready var card = $CanvasLayer3/Control/Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$CanvasLayer2/Control/AnimatedSprite2D.play("default")
	$CanvasLayer2/Control/AnimatedSprite2D2.play("default")
	$CanvasLayer3/Control/Node2D.hideCard()
	orb.contScene("FirstReading")
	DialogueManager.show_example_dialogue_balloon(load("res://Dialogue/FirstReading.dialogue"), "start")

func change_scene_again():
	get_tree().change_scene_to_file("res://Scenes/LineUp.tscn")

func set_click(new: bool):
	orb.set_click(new)

var current_card = "Devil"
func show_all_tarot_card():
	card.revealCard(current_card, false)
	
func hide_all_tarot_card():
	card.anim.play("none")
