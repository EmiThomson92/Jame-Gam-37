extends Node2D
signal enemy_hurt
@onready var animated_sprite = $animatedSprite

# Called when the node enters the scene tree for the first time.
func _ready():
	add_to_group("enemy", true)
	animated_sprite.play()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass








func _on_hit(body):
	if body.name == "player":
		print_debug()
		body.jumps = 0
		print_debug(body.velocity)
		if body.position.x <= position.x:
			body.velocity = Vector2(-250,-250)
		elif body.position.x > position.x:
			body.velocity = Vector2(250,-250)
		body.take_damage()
	pass # Replace with function body.

func _on_hurt(body):
	print_debug("HURT")
	GlobalControl.enemy_hurt.play()
	body.jumps = 0
	body.velocity = body.velocity * Vector2(1,-1.2)
	queue_free()
