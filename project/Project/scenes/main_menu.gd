extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_texture_button_pressed():
	print_debug("CLICK: "+str(GlobalControl.level))
	GlobalControl.level += 1
	GlobalControl.goto_scene("res://scenes/playable_levels/level_1.tscn")
	pass # Replace with function body.
