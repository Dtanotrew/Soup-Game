extends State

class_name AirState
@export var landing_state : State
@export var ground_state : State
@export var DOUBLE_JUMP_VELOCITY = -600
var pre_collision_velo
var double_jumped = false

func state_process(delta):
	if character.velocity.y > 0:
		playback.travel("falling")
		
	if character.velocity.y >= 0 and not character.is_on_floor():
		# print("character velocity before impact = " + str(character.velocity.y) + ".")
		pre_collision_velo = character.velocity.y
		
	if character.is_on_floor():
		if pre_collision_velo <= 600:
			next_state = ground_state
		else:
			next_state = landing_state

func state_input(event : InputEvent):
	if event.is_action_pressed("jump") and not double_jumped:
		double_jump()

func on_exit():
	if next_state == landing_state:
		double_jumped = false
		playback.travel("landing") #Setting current animation to "landing". Necessary for landing state.
	elif next_state == ground_state:
		double_jumped = false
		playback.travel("move")

func double_jump():
	character.velocity.y = DOUBLE_JUMP_VELOCITY
	playback.travel("double_jump")
	double_jumped = true
