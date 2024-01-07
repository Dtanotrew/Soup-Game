#extends Area2D
#
#@export var face_shape : FacingCollisionShape2D
#
## Called when the node enters the scene tree for the first time.
#func _ready():
	#pass # Replace with function body.
#
#
## Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
	#pass
#
#func _on_enemy_facing_direction_changed(facing_right : bool):
	#if facing_right:
		#face_shape.position = face_shape.facing_right_pos
	#else:
		#face_shape.position = face_shape.facing_left_pos
