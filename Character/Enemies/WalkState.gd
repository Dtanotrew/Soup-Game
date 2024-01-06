extends State


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	character.direction = character.start_move_direction
	if character.direction && character.state_machine.can_move_check():
		character.velocity.x = character.direction.x * character.movement_speed
	elif character.state_machine.current_state != character.hit_state:
		character.velocity.x = move_toward(character.velocity.x, 0, character.movement_speed)

	update_facing_direction()
	character.move_and_slide()

func update_facing_direction():
	if character.direction.x > 0:
		character.sprite.flip_h = false
	elif character.direction.x < 0:
		character.sprite.flip_h = true
