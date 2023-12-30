extends State

class_name GroundState
@export var JUMP_VELOCITY = -600.0
@export var air_state : State
func state_input(event : InputEvent):
	if event.is_action_pressed(("jump")):
		jump()
	if not character.is_on_floor():
		next_state = air_state
		
func jump():
	character.velocity.y = JUMP_VELOCITY
	next_state = air_state