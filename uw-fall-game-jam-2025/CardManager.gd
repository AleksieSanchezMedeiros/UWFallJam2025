extends Node2D

var card_being_dragged

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	#if there is a card being dragged
	if card_being_dragged:
		#get the location of the mouse and set the card to that location
		var mouse_pos = get_global_mouse_position()
		card_being_dragged.position = mouse_pos

# input checks for any inputs happening
func _input(event):
	#event variable is set to some sort of input and the button pressed?
	if event is InputEventMouseButton and event.button_index  == MOUSE_BUTTON_LEFT:
		#if the button is being pressed
		if event.pressed:
			#check if we are clicking a card
			var card = raycast_checK_for_card()
			#if card is found, drag that card
			if card:
				card_being_dragged = card
		else: #if the button is being let go of
			card_being_dragged = null #dont drag anything

func raycast_checK_for_card():
	var space_state = get_world_2d().direct_space_state # no clue what this line means
	var parameters = PhysicsPointQueryParameters2D.new() # no clue either but needed to return cursor click?
	parameters.position = get_global_mouse_position() # find the position of the mouse
	parameters.collide_with_areas = true #able to collide with areas?
	parameters.collision_mask = 1 # no idea
	var result = space_state.intersect_point(parameters) #based of the location and the parameters for the raycast
	# save the result of it here
	
	#result is an array i guess
	if(result.size() > 0):
		return result[0].collider.get_parent()
	return null # return null if nothing detected
