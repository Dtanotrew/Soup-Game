extends State

class_name HitState

@export var damageable : Damageable
@export var character_state_machine : CharacterStateMachine
@export var dead_state : State
@export var knockback_velocity : Vector2 = Vector2(100,-50)
# Called when the node enters the scene tree for the first time.
func _ready():
	damageable.connect("on_hit", on_damageable_hit)

func on_enter():
	character.velocity = knockback_velocity

func on_damageable_hit(node : Node, damage_amount : int):
	if damageable.health > 0:
		emit_signal("interrupt_state", self)
	else:
		emit_signal("interrupt_state", dead_state)
		playback.travel("dead") #Salamander death animation
