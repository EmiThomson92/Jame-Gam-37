extends Node2D
var gallery_sprite = {}
@onready var gallery_display = $CenterContainer/Control/gallery_display
@onready var gallery_credit = $gallery_credit


var current_sprite = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	gallery_sprite[0] = "player_idle"
	gallery_sprite[1] = "player_walk"
	gallery_sprite[2] = "player_jump"
	gallery_sprite[3] = "player_hurt"
	gallery_sprite[4] = "snowman"
	gallery_sprite[5] = "mush"
	gallery_sprite[6] = "BG_1"
	gallery_sprite[7] = "BG_2"
	gallery_display.play(gallery_sprite[current_sprite])
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	gallery_display.play(gallery_sprite[current_sprite])
	if current_sprite >= 6:
		gallery_credit.text = "By Luna"
	else:
		gallery_credit.text = "By Auri"
	pass


func _on_right_button_pressed():
	print_debug(gallery_sprite.size())
	current_sprite += 1
	if current_sprite > gallery_sprite.size()-1:
		current_sprite = 0
	pass # Replace with function body.


func _on_left_button_pressed():
	current_sprite -= 1
	if current_sprite < 0:
		current_sprite = gallery_sprite.size()-1
	pass # Replace with function body.


func _on_exit_button_pressed():
	GlobalControl.goto_scene("res://scenes/main_menu.tscn")
	pass # Replace with function body.
