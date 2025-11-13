extends Node2D
@onready var anim = $AnimatedSprite2D
@onready var lab = $Node2D/Label
var cards_name
const cardNamesAndDesc = {
	"Devil": "The Devil\n(upright)\nMaterialism",
	"World": "The World\n(reversed)\nLack of Closure",
	"PageOfCups": "Page Of Cups\n(reversed)\nInstability",
	"SevenOfPentacles": "Seven Pentacles\n(upright)\nAmbition",
	"tower": "The Tower\n(upright)\nDestruction"
}

func _ready() -> void:
	anim.play("none")
	var tween = create_tween()
	tween.tween_property(lab, "modulate:a", 0.0, 0.0)

func revealCard(card_name: String, isReversed: bool):
	lab.text = cardNamesAndDesc[card_name]
	cards_name = card_name
	if(isReversed):
		print(lab.text)
		anim.play(card_name)
		stopRotateCard()
	else:
		anim.play(card_name + "Reveal")
		await anim.animation_finished
		anim.play(card_name)

func showCard(card_name: String):
	anim.play(card_name)

func hideCard():
	anim.play("none")

var rotation_speed_degrees = 180.0
var canRotate = false

func _process(delta):
	if(canRotate):
		rotation_degrees += rotation_speed_degrees * delta

func rotateCard():
	canRotate = true

func stopRotateCard():
	canRotate = false
	var tween = create_tween()
	tween.tween_property($".", "rotation_degrees", 180.0, 1.0)
	await tween.finished
	anim.play(cards_name + "ReverseReveal")
	await anim.animation_finished
	anim.play(cards_name + "Reversed")

func _input(event: InputEvent) -> void:
	var tween = create_tween()
	if Input.is_key_pressed(KEY_C):
		tween.tween_property(lab, "modulate:a", 1.0, 0.3)
	else:
		tween.tween_property(lab, "modulate:a", 0.0, 0.3)
		
