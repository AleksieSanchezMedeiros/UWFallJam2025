extends Node2D

@export var script_file: String = "res://Data/intro.txt"
@onready var speaker = $CanvasLayer2/Control/Character
@onready var diag_ui = $CanvasLayer2/DiagUi
@onready var BG = $CanvasLayer/TextureRect


const bgs = {
	"line_up": preload("res://assets/lineup_background.png"),
	"no_bg": preload("res://temp_assets/black.png"),
	"interrogation_bg": preload("res://suspect.png")
}

var dialog_lines = []
var numOfLines = 0
var currentLine = 0


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	scriptArray()
	process_line(parse_line(dialog_lines[0]))

func _input(event):
	if(event.is_action_pressed("next_line")):
		if currentLine < numOfLines:
			currentLine += 1
			process_line(parse_line(dialog_lines[currentLine]))

func scriptArray():
	var file = FileAccess.open(script_file, FileAccess.READ)
	if(file):
		while not (file.eof_reached()):
			var curr = file.get_line()
			print("")
			dialog_lines.append(curr)
			numOfLines += 1
		file.close()
	else:
		print("File failed to open")
	
func parse_line(line: String):
	if(line.begins_with("=")):
		var scene_info = line.split("=")
		BG.texture = bgs[scene_info[1]]
		return{
			"speaker_name": "",
			"dialog_line": "Click to continue." 
		}
	if(line.begins_with("+")):
		get_tree().change_scene_to_file("res://Scenes/Interrogation_Room.tscn")
	var line_info = line.split(":")
	return{
		"speaker_name": line_info[0],
		"dialog_line": line_info[1]
	}	

func process_line(line_info: Dictionary):
	diag_ui.speaker_name.text = line_info["speaker_name"]
	diag_ui.dialog.text = line_info["dialog_line"]
	speaker.change_character(line_info["speaker_name"])
