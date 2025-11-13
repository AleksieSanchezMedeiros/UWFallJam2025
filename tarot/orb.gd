extends Node2D

var mouseHovering = false
var canClick = true
var contSc

# Called when the node enters the scene tree for the first time.
func _input(event: InputEvent) -> void:
	if(canClick and mouseHovering and event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT):
		#tarot reveal
		#await till blah happens
		DialogueManager.show_example_dialogue_balloon(load("res://Dialogue/" + contSc + ".dialogue"), "continue")

func contScene(cont: String):
	contSc = cont


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if(not canClick):
		$AnimatedSprite2D.play("NoHover")

func set_click(new: bool):
	canClick = new

func _on_area_2d_mouse_entered() -> void:
	mouseHovering = true
	$AnimatedSprite2D.play("Hover")


func _on_area_2d_mouse_exited() -> void:
	mouseHovering = false
	$AnimatedSprite2D.play("NoHover")
