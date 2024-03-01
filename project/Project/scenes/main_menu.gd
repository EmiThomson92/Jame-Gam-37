extends Node2D
@onready var dragon_1 = $CenterContainer/Container/Dragon1
@onready var dragon_2 = $CenterContainer/Container2/Dragon1


# Called when the node enters the scene tree for the first time.
func _ready():
	GlobalControl.level = "main_menu"
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_texture_button_pressed():
	print_debug("CLICK: "+str(GlobalControl.level))
	GlobalControl.goto_scene("res://scenes/playable_levels/level_1.tscn")
	pass # Replace with function body.


func _on_texture_button_mouse_entered():
	dragon_1.frame = 1
	dragon_2.frame = 1
	pass # Replace with function body.


func _on_texture_button_mouse_exited():
	dragon_1.frame = 0
	dragon_2.frame = 0
	pass # Replace with function body.
