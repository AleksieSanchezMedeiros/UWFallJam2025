extends Node2D
class_name Suspect

#text and sprite
var textAboveHead
var spriteNode 

@onready var area: Area2D = $Area2D
var suspect_id: String = ""
var suspect_name: String = ""

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#find the text
	textAboveHead = find_child("RichTextLabel", true)
	textAboveHead.modulate.a = 0  # start invisible

# Setup function to populate from JSON
func setup(id: String, name_text: String, bio_text: String, sprite_path: String = "") -> void:
	textAboveHead = find_child("RichTextLabel", true) #finding text was tweaking so making double sure
	spriteNode = find_child("SuspectImg", true)
	
	#id and text from json
	suspect_id = id
	suspect_name = name_text
	
	#display name + bio in  text
	textAboveHead.text = "%s\n%s" % [name_text, bio_text]
	
	# load sprite given from json file
	if sprite_path != "":
		var tex = load(sprite_path)
		if tex:
			spriteNode.texture = tex

func _on_area_2d_mouse_entered() -> void:
	#tween to have it pop in and out
	var tween = create_tween()
	tween.tween_property(textAboveHead, "modulate:a", 1.0, 0.3)
	#move up to show highligted, probably replace later
	position += Vector2(0, -15)


func _on_area_2d_mouse_exited() -> void:
	var tween = create_tween()
	tween.tween_property(textAboveHead, "modulate:a", 0.0, 0.3)
	position += Vector2(0, 15)
