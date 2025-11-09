extends Node

#json path
@export var json_file: String = "res://Data/suspects.json"
#the suspect prefab to reuse, im coding like i would in unity
@export var suspect_scene: PackedScene = preload("res://Prefabs/Suspect.tscn")
#leftmost point and spacing of each one
@export var start_position: Vector2 = Vector2(-350, 0)
@export var spacing: float = 350.0

var suspects_data: Array = []

func _ready() -> void:
	load_json()
	populate_suspects()

# Load JSON
func load_json() -> void:
	var file = FileAccess.open(json_file, FileAccess.READ)
	if not file:
		push_error("Could not open JSON file: %s" % json_file)
		return
	
	var json_text = file.get_as_text()
	file.close()
	
	# parse_string returns the object directly as array
	var parsed_result = JSON.parse_string(json_text)
	
	suspects_data = parsed_result

# Spawn Suspect nodes
func populate_suspects() -> void:
	#from all the suspects made separate evenly
	spacing = (1000 / suspects_data.size()) + 50
	for i in range(suspects_data.size()):
		#fill them with data
		var data = suspects_data[i]
		var suspect_node = suspect_scene.instantiate()
		
		#call setup() with all json data
		suspect_node.call("setup", 
			data.get("id", ""), 
			data.get("name", "Unknown"), 
			data.get("bio", "No info"), 
			data.get("sprite", "")
		)
		
		#position the instantiated
		if suspect_node is Node2D:
			suspect_node.position = start_position + Vector2(i * spacing, 0)
		
		add_child(suspect_node)
