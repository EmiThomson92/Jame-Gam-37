extends Area2D
@onready var portal = $portal
@onready var level_1 = $".."


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if level_1.level_clear == true:
		portal.frame = 1
	pass


func _on_body_entered(body):
	if body.name == "player" and level_1.level_clear == true:
		print_debug("touch")
		GlobalControl._respawn("main_menu")
	pass # Replace with function body.
