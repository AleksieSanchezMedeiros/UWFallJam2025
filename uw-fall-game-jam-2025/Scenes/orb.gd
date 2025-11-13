extends Node2D

var mouseHovering = false

func _input(event: InputEvent) -> void:
	if(mouseHovering and event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT):
		#tarot reveal
		print("clicked!")


func _on_area_2d_mouse_entered() -> void:
	mouseHovering = true
	$AnimatedSprite2D.play("glow")


func _on_area_2d_mouse_exited() -> void:
	mouseHovering = false
	$AnimatedSprite2D.play("default")
