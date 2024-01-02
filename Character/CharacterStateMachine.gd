extends Node

class_name CharacterStateMachine

var states : Array[State]

@export var character : CharacterBody2D 
@export var current_state : State
@export var animation_tree: AnimationTree

# Called when the node enters the scene tree for the first time.
func _ready():
	for child in get_children():
		if child is State:
			states.append(child)
			
			# Set the states up with what they need to function
			child.character = character
			child.playback = animation_tree["parameters/playback"]
			
			#Connect to interrupt signal
			child.connect("interrupt_state", on_state_interrupt_state)
			
		else:
			push_warning("Child " + child.name + " is not a State for CharacterStateMachine")

func _physics_process(delta):
	if current_state.next_state != null:
		switch_states(current_state.next_state)
		
	current_state.state_process(delta)

func can_move_check():
	return current_state.can_move
	
func switch_states(new_state : State):
	if current_state != null:
		current_state.on_exit()
		current_state.next_state = null
		
	current_state = new_state
	
	current_state.on_enter()
	
func _input(event : InputEvent):
	current_state.state_input(event)
	
func on_state_interrupt_state(new_state : State):
	switch_states(new_state)
	
