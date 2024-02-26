extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -380.0
const ACCEL = 500
const NUM_JUMPS = 3

var jumps = NUM_JUMPS
#TODO Implementation of animation handler

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	apply_gravity(delta)

	handle_jump()
	
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = move_toward(velocity.x, SPEED * direction, ACCEL * delta)
	else:
		velocity.x = move_toward(velocity.x, 0, (ACCEL *2) * delta)

	move_and_slide()
	
func apply_gravity(delta):
	if not is_on_floor():
		velocity.y += gravity * delta

func handle_jump():
	if Input.is_action_just_pressed("ui_accept") and jumps > 0:
		velocity.y = JUMP_VELOCITY
		jumps -= 1
	if Input.is_action_just_released("ui_accept") and velocity.y < JUMP_VELOCITY/2:
		velocity.y = move_toward(velocity.y, 0, 1000)
	elif is_on_floor():
		jumps = NUM_JUMPS	
