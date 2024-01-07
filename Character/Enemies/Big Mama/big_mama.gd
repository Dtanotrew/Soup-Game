extends CharacterBody2D

@onready var animation_tree : AnimationTree = $AnimationTree
@onready var sprite = $Sprite2D
@onready var state_machine : CharacterStateMachine = $CharacterStateMachine
@export var start_move_direction : Vector2 = Vector2.RIGHT
@export var movement_speed = 30.0
@export var hit_state : State

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var direction : Vector2

func _ready():
	pass

func _physics_process(delta):
	pass
	
