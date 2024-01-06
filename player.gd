extends CharacterBody2D

func _physics_process(delta):
	velocity = Vector2.RIGHT * 150
	move_and_slide()
