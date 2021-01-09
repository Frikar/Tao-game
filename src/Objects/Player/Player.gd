extends KinematicBody2D

var velocity = Vector2.ZERO
var MAX_SPEED = 90
var FRICTION = 500
var ACCELERATION = 500
var direction = "Right"
onready var sprite = $Sprite
onready var animationPlayer = $AnimationPlayer
onready var animationTree = $AnimationTree
onready var collision = $CollisionShape2D
onready var animationState = animationTree.get("parameters/playback")

func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector = input_vector.normalized()
	get_player_animation(input_vector)
	if input_vector != Vector2.ZERO:
		velocity = velocity.move_toward(input_vector * MAX_SPEED, ACCELERATION * delta)
		animationState.travel("Run" + direction)
	else:
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
		animationState.travel("Idle" + direction)
	move()

func move():
	velocity = move_and_slide(velocity)

func get_player_animation(input_vector):
	if input_vector.x <= -0.707:
		direction = "Left"
	elif input_vector.x >= 0.707:
		direction = "Right"
