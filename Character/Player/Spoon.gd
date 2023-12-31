extends Area2D

@export var damage : int = 10
@export var player : Player
@export var facing_shape : FacingCollisionShape2D
@export var hit_sound : AudioStreamPlayer2D
@export var woosh_sound : AudioStreamPlayer2D
func _ready():
	monitoring = false
	player.connect("facing_direction_changed", _on_player_facing_direction_changed)

func _on_body_entered(body):
	print(body.name)
	for child in body.get_children():
		if child is Damageable:
			#get direction from spoon to the body
			var direction_to_damageable = (body.global_position - get_parent().global_position)
			var direction_sign = sign(direction_to_damageable.x)
			woosh_sound.play()
			hit_sound.play()
			if direction_sign > 0:
				child.hit(damage, Vector2.RIGHT)
			elif direction_sign < 0:
				child.hit(damage, Vector2.LEFT)
			else:
				child.hit(damage, Vector2.ZERO)
			#print_debug(body.name + " took " + str(damage) + " from Spoon.")
func _on_player_facing_direction_changed(facing_right : bool):
	if facing_right:
		facing_shape.position = facing_shape.facing_right_pos
	else:
		facing_shape.position = facing_shape.facing_left_pos
