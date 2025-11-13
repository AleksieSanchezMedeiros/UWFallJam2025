extends Node2D

@onready var BG = $CanvasLayer/Background

const bgs = {
	"line_up": preload("res://Backgrounds/lineup_background.png"),
	"black": preload("res://Backgrounds/black.png"),
	"interrogation": preload("res://Backgrounds/reading_background.png"),
	"title": preload("res://Assets/title_screen.png")
}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	AudioController.playMusic()
	DialogueManager.show_example_dialogue_balloon(load("res://Dialogue/Intro.dialogue"), "start")

func change_background(bg : String):
	BG.texture = bgs[bg]

func change_scene():
	get_tree().change_scene_to_file("res://Scenes/tarotReading.tscn")
