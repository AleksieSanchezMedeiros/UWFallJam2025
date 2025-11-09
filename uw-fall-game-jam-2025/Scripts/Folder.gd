extends Node

var sprite
var highlight
var unhighlight

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	sprite = find_child("FolderImg")
	highlight = load("res://assets/highlighted_folder.png")
	unhighlight = load("res://assets/unhighlighted_folder.png")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_2d_mouse_entered() -> void:
	sprite.texture = highlight


func _on_area_2d_mouse_exited() -> void:
	sprite.texture = unhighlight
