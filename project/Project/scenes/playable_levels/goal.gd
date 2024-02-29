extends Area2D
@onready var color_rect = $ColorRect


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	if body.name == "player":
		print_debug("touch")
		color_rect.color = Color("00ff00b2")
		GlobalControl.goto_scene("res://scenes/main_menu.tscn")
	pass # Replace with function body.
