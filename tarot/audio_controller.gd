extends Node
@onready var bg_music: AudioStreamPlayer = $BgMusic

func playMusic():
	bg_music.play()
