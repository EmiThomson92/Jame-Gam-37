extends Node2D
var gallery_sprite = {}
@onready var gallery_display = $CenterContainer/Control/gallery_display
@onready var gallery_credit = $gallery_credit

var scaler = [0.451,0.451,0.451,0.451,0.451,0.327,0.411,0.411,0.411,0.316,0.133,0.281,0.123,0.123,0.281,0.145,0.476,0.476,0.476,0.476,0.476,0.111]

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
	gallery_sprite[8] = "BG_3"
	gallery_sprite[9] = "Portal_1"
	gallery_sprite[10] = "Portal_2"
	gallery_sprite[11] = "Dragon_1"
	gallery_sprite[12] = "Dragon_2"
	gallery_sprite[13] = "Dragon_3"
	gallery_sprite[14] = "Dragon_Tree_1"
	gallery_sprite[15] = "Dragon_Tree_2"
	gallery_sprite[16] = "Tile_1"
	gallery_sprite[17] = "Tile_2"
	gallery_sprite[18] = "Tile_3"
	gallery_sprite[19] = "Tile_4"
	gallery_sprite[20] = "Tile_5"
	gallery_sprite[21] = "Trees"

	gallery_display.play(gallery_sprite[current_sprite])
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	gallery_display.play(gallery_sprite[current_sprite])
	if current_sprite >= 6:
		gallery_credit.text = "By Luna"
	else:
		gallery_credit.text = "By Auri"
	gallery_display.scale.x = scaler[current_sprite]
	gallery_display.scale.y = scaler[current_sprite]
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
