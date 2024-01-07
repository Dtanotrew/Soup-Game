extends CharacterBody2D

class_name Player

@export var SPEED = 300.0
@export var spoon_hitbox : CollisionShape2D

@onready var animation_tree : AnimationTree = $AnimationTree
@onready var sprite = $Sprite2D
@onready var state_machine : CharacterStateMachine = $CharacterStateMachine

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var direction = 0

signal facing_direction_changed(facing_right : bool)

func _ready():
	animation_tree.active = true #Regadless of settings outside the game, when the game starts, 
								 #our animations will from the animation tree will be set to active.
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
	
	update_animation_parameters()
	update_facing_direction()
	move_and_slide()

#Updates the nodes in the animation tree.
func update_animation_parameters():
	animation_tree.set("parameters/move/blend_position", direction)

#Flips player sprite based on direction.
func update_facing_direction():
	if state_machine.can_move_check():
		if direction > 0:
			sprite.flip_h = false
			#spoon_hitbox.position.x = -spoon_hitbox.position.x
		elif direction < 0:
			sprite.flip_h = true
		emit_signal("facing_direction_changed", !sprite.flip_h)

