extends Node2D
@onready var orb = $CanvasLayer2/Control/Orb
@onready var card = $CanvasLayer3/Control/Node2D
@onready var card2 = $CanvasLayer3/Control/Node2D2
@onready var audio = $AudioStreamPlayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$CanvasLayer2/Control/AnimatedSprite2D.play("default")
	$CanvasLayer2/Control/AnimatedSprite2D2.play("default")
	$CanvasLayer3/Control/Node2D.hideCard()
	orb.contScene("inbetween2")
	DialogueManager.show_example_dialogue_balloon(load("res://Dialogue/inbetween2.dialogue"), "start")

func playAudio():
	audio.play()

func stopAudio():
	audio.stop()

func change_scene_again():
	get_tree().change_scene_to_file("res://Scenes/tatoo_lineup.tscn")

func set_click(new: bool):
	orb.set_click(new)

func show_all_tarot_card():
	card2.revealCard("World", true)
	card.revealCard("SevenOfPentacles", false)
	
func hide_all_tarot_card():
	card.anim.play("none")
