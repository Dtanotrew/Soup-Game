extends State

@export var raycast : RayCast2D
@export var timer : Timer
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	if character.direction && character.state_machine.can_move_check():
		#if the enemy has reached a ledge or wall
		if character.is_on_wall() or (character.is_on_floor() and !raycast.is_colliding()) and timer.is_stopped():
			timer.start()
			character.direction.x *= -1
			raycast.position.x *= -1
		character.velocity.x = character.direction.x * character.movement_speed
			
	elif character.state_machine.current_state != character.hit_state:
		character.velocity.x = move_toward(character.velocity.x, 0, character.movement_speed)

	update_facing_direction()
	character.move_and_slide()

#func flip_collider():
	#if not character.ground_detector.has_overlapping_bodies():
		#character.direction.x *= -1
		#character.flip_node.scale.x *= -1
		#
		
func update_facing_direction():	
	if character.direction.x > 0:
		character.sprite.flip_h = false
	elif character.direction.x < 0:
		character.sprite.flip_h = true
		#emit_signal("facing_direction_changed", !character.sprite.flip_h)
		
