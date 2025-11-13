extends Node2D

var char_name
@onready var anim = $AnimatedSprite2D


func start_up(character_name: String):
	char_name = character_name
	anim.play(character_name)

var mouseHovering = false
var canClick = false

func _input(event: InputEvent) -> void:
	if(canClick and mouseHovering and event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT):
		if(InterviewTracker.can_enter_final_scene()):
			return
		get_tree().change_scene_to_file("res://Interrogations/" + char_name + ".tscn") #temporary

func flipClick():
	canClick = not canClick

func _on_area_2d_mouse_entered() -> void:
	if(char_name.contains("Show")):
		return
	#tween to have it pop in and out
	mouseHovering = true
	var tween = create_tween()
	tween.tween_property(anim, "modulate", Color(0.1, 0.1, 0.1, 1.0), 0.3)

func _on_area_2d_mouse_exited() -> void:
	if(char_name.contains("Show")):
		return
	mouseHovering = false
	var tween = create_tween()
	tween.tween_property(anim, "modulate", Color(1.0, 1.0, 1.0, 1.0), 0.3)
