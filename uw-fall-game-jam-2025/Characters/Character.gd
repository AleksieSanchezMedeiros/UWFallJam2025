extends Node2D

@onready var sprite = $AnimatedSprite2D

const char_frames = {
	"  Detective Roman  ": preload("res://Characters/None.tres"),
	"  Roman  ": preload("res://Characters/None.tres"),
	"0": preload("res://Characters/None.tres"),
	"  EagleScoutz  ": preload("res://Characters/EagleScoutz.tres"),
	"  JordJocus  ": preload("res://Characters/JordJocus.tres")
}

func change_character(speaker_name: String):
	if(speaker_name == ""):
		speaker_name = "0"
	if(speaker_name == "  Detective  "):
		return
	sprite.sprite_frames = char_frames[speaker_name]	
