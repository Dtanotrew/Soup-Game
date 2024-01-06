extends CharacterBody2D

@onready var animation_tree : AnimationTree = $AnimationTree
@onready var sprite = $Sprite2D
@onready var state_machine : CharacterStateMachine = $CharacterStateMachine
@export var start_move_direction : Vector2 = Vector2.LEFT
@export var movement_speed = 30.0
@export var hit_state : State

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var direction : Vector2

func _ready():
	animation_tree.active = true

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	## Get the input direction and handle the movement/deceleration.
	## As good practice, you should replace UI actions with custom gameplay actions.
	#direction = start_move_direction
	#if direction && state_machine.can_move_check():
		#velocity.x = direction.x * movement_speed
	#elif state_machine.current_state != hit_state:
		#velocity.x = move_toward(velocity.x, 0, movement_speed)
#
	#update_facing_direction()
	#move_and_slide()
#
#func update_facing_direction():
	#if direction.x > 0:
		#sprite.flip_h = false
	#elif direction.x < 0:
		#sprite.flip_h = true
