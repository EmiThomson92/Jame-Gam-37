extends CharacterBody2D
@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var heart_1 = $"CanvasLayer/hud/Heart 1"
@onready var heart_2 = $"CanvasLayer/hud/Heart 2"
@onready var heart_3 = $"CanvasLayer/hud/Heart 3"
@onready var portal = $CanvasLayer/hud/portal



const SPEED = 300.0
const JUMP_VELOCITY = -380.0
const ACCEL = 500
const NUM_JUMPS = 2
const STARTING_AMMO = 5
const MAX_HEALTH = 3

var jumps = NUM_JUMPS
var ammo = STARTING_AMMO
var is_jumping = false
var cant_fire := Timer.new()
var facing_left = true
var health = MAX_HEALTH
var is_hurt = false
var level_clear = false
#TODO Implementation of animation handler

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
func _ready():
	add_child(cant_fire)
	cant_fire.one_shot = true
	
func _physics_process(delta):
	apply_gravity(delta)

	handle_jump()
	
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("move_left", "move_right")
	if direction:
		velocity.x = move_toward(velocity.x, SPEED * direction, ACCEL * delta)
		if velocity.x != 0 and !is_jumping and !is_hurt:
			animated_sprite_2d.play()
			animated_sprite_2d.animation = "walking"
			animated_sprite_2d.flip_h = !facing_left
	else:
		velocity.x = move_toward(velocity.x, 0, (ACCEL *1) * delta)
	if velocity.x == 0 and !is_jumping and !is_hurt:
		animated_sprite_2d.animation = "idle"
		animated_sprite_2d.play()
	if velocity.x > 0:
		facing_left = true
	elif velocity.x < 0:
		facing_left = false
		
	if is_hurt:
		if animated_sprite_2d.frame == 2:
			is_hurt = false
			if health == 0:
				GlobalControl._respawn(GlobalControl.level)
	if Input.is_action_just_pressed("take_damage"):
		take_damage()
	move_and_slide()
	throw_snowball()
	hud_update()
	
func apply_gravity(delta):
	if not is_on_floor():
		velocity.y += gravity * delta

func handle_jump():
	if !is_on_floor() and is_jumping == false:
		pass
	elif Input.is_action_just_pressed("jump") and jumps > 0:
		velocity.y = JUMP_VELOCITY
		jumps -= 1
		animated_sprite_2d.play("jump")
		animated_sprite_2d.flip_h = !facing_left
		if is_on_floor():
			is_jumping = true
	elif is_on_floor():
		jumps = NUM_JUMPS
		is_jumping = false	
	if Input.is_action_just_released("jump") and velocity.y < JUMP_VELOCITY/2:
		velocity.y = move_toward(velocity.y, 0, 1000)

func throw_snowball():
	
	if Input.is_action_just_pressed("fire"):
		if ammo > 0 and cant_fire.is_stopped() == true:
			print_debug("fire")
			ammo -= 1
			cant_fire.start(1)
		else:
			print_debug("out of ammo")

func take_damage():
	health -= 1
	animated_sprite_2d.play("hurt")
	is_hurt = true
	
func hud_update():
	if health < 3:
		heart_3.frame = 1
	if health < 2:
		heart_2.frame = 1
	if health < 1:
		heart_1.frame = 1
	if level_clear == true:
		portal.frame = 1
	else:
		portal.frame = 0
