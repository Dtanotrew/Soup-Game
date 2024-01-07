extends Area2D

@export var damage : int = 5
@export var enemy : CharacterBody2D
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_body_entered(body):
	for child in body.get_children():
		if child is Damageable:
			#get direction from spoon to the body
			var direction_to_damageable = (body.global_position - get_parent().global_position)
			var direction_sign = sign(direction_to_damageable.x)
			if direction_sign > 0:
				child.hit(damage, Vector2.RIGHT)
			elif direction_sign < 0:
				child.hit(damage, Vector2.LEFT)
			else:
				child.hit(damage, Vector2.ZERO)	
