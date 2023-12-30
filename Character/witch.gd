extends CharacterBody2D

@export var SPEED = 300.0

#@export var SH_JUMP_VELOCITY = -300.0 #for implementing a short hop. Keep workshoping it.
@onready var animation_tree : AnimationTree = $AnimationTree
@onready var sprite = $Sprite2D
@onready var state_machine : PlayerStateMachine = $PlayerStateMachine
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var ani_locked = false
var direction = 0

func _ready():
	animation_tree.active = true #Regadless of settings outside the game, when the game starts, our animations will 
								 #from the animation tree will be set to active.
	
func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
	
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	direction = Input.get_axis("move_left", "move_right")

	if direction && state_machine.can_move_check():
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	update_animation()
	update_facing_direction()
	move_and_slide()

func update_animation():
	animation_tree.set("parameters/Move/blend_position", direction)

func update_facing_direction():
	if direction > 0:
		sprite.flip_h = false
	elif direction < 0:
		sprite.flip_h = true
		

func land():
	#sprite.play("jump_end")
	ani_locked = true
