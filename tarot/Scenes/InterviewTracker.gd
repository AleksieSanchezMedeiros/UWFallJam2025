# SceneTracker.gd
extends Node

# Keep track of visited scenes
var visited_scenes: Dictionary = {
	"scene_a": false,
	"scene_b": false,
	"scene_c": false
}

var RomanPass = true

func romanFail(fail: bool):
	if(fail) :
		RomanPass = false


func mark_visited(scene_name: String, visitState: bool) -> void:
	if visited_scenes.has(scene_name):
		visited_scenes[scene_name] = visitState
		print("Visited:", scene_name)

func can_enter_final_scene() -> bool:
	# Returns true if all required scenes are visited
	for visited in visited_scenes.values():
		if not visited:
			return false
	return true
