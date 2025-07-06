extends CharacterBody3D
class_name Player

# CONSTANTS
const JUMP_VELOCITY : float = 4.5
const RUNNING_SPEED : float = 2.5
const FORWARD_SPEED : float = 2.5
const BACKWARD_SPEED : float = 1.0
const TURN_SPEED : float = 0.04

# VARIABLES
var speed : float = 1.0

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta

	if Input.is_action_pressed("run"):
		speed = RUNNING_SPEED
	else:
		speed = 1

	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	if Input.is_action_pressed("move_forward"):
		var forwardVector: Vector3 = Vector3.FORWARD.rotated(Vector3.UP, rotation.y)
		velocity = -forwardVector * FORWARD_SPEED * speed
	elif Input.is_action_pressed("move_back"):
		var forwardVector: Vector3 = -Vector3.FORWARD.rotated(Vector3.UP, rotation.y)
		velocity = -forwardVector * BACKWARD_SPEED * speed
	else:
		velocity.x = 0.0
		velocity.z = 0.0

	var is_moving_back = Input.is_action_pressed("move_back")
	var is_turning_right = Input.is_action_pressed("turn_right")
	var is_turning_left = Input.is_action_pressed("turn_left")

	if is_turning_right or is_turning_left:
		var turn_direction = 1 if is_turning_right else -1
		var invert: int = -1 if is_moving_back else 1

		rotation.z += invert * (Vector3.ZERO.y + TURN_SPEED) * turn_direction
		rotation.z = clamp(rotation.x, -50, 90)
		rotation.y += (Vector3.ZERO.y + TURN_SPEED) * turn_direction * invert

	move_and_slide()
