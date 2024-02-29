extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass






func _on_body_entered(body):
	if body.name == "player":
		body.jumps = 0
		print_debug(body.velocity)
		if body.velocity.x > 0:
			body.velocity = Vector2(-250,-250)
		elif body.velocity.x < 0:
			body.velocity = Vector2(250,-250)
		body.take_damage()
		queue_free()
		
	pass # Replace with function body.
