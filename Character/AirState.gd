extends State

class_name AirState
@export var ground_state : State
@export var DOUBLE_JUMP_VELOCITY = -600

var double_jumped = false

func state_process(delta):
	if character.is_on_floor():
		next_state = ground_state

func state_input(event : InputEvent):
	if event.is_action_pressed("jump") and not double_jumped:
		double_jump()

func on_exit():
	if next_state == ground_state:
		double_jumped = false
		#playback.travel("landing") finish tutorial

func double_jump():
	character.velocity.y = DOUBLE_JUMP_VELOCITY
	playback.travel("double_jump")
	double_jumped = true
