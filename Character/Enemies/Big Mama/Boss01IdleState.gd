extends State

@export var timer : Timer
@export var attack_state : State
# Called when the node enters the scene tree for the first time.
func _ready():
	timer.start()
func on_enter():
	playback.travel("idle")
	timer.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_timer_timeout():
	next_state = attack_state
