extends Node
var level = 0
var levels = {}
var current_scene = null
var music := AudioStreamPlayer.new()
var player_hurt := AudioStreamPlayer.new()
var enemy_hurt := AudioStreamPlayer.new()
# Called when the node enters the scene tree for the first time.
func _ready():
	music.stream = load("res://sound/Snowfall_Looped_ver..ogg")
	music.volume_db -= 10
	music.autoplay = true
	player_hurt.stream = load("res://sound/playerhit.mp3")
	enemy_hurt.stream = load("res://sound/qubodupRat/qubodupRatPain.ogg")
	enemy_hurt.volume_db -= 20
	add_child(music)
	add_child(player_hurt)
	add_child(enemy_hurt)

	var root = get_tree().root
	current_scene = root.get_child(root.get_child_count() - 1)
	levels["main_menu"] = "res://scenes/main_menu.tscn"
	levels["level_1"] = "res://scenes/playable_levels/level_1.tscn"
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	pass

func goto_scene(path):
	# This function will usually be called from a signal callback,
	# or some other function in the current scene.
	# Deleting the current scene at this point is
	# a bad idea, because it may still be executing code.
	# This will result in a crash or unexpected behavior.

	# The solution is to defer the load to a later time, when
	# we can be sure that no code from the current scene is running:

	call_deferred("_deferred_goto_scene", path)


func _deferred_goto_scene(path):
	# It is now safe to remove the current scene.
	print_debug(current_scene)
	current_scene.free()

	# Load the new scene.
	var s = ResourceLoader.load(path)

	# Instance the new scene.
	current_scene = s.instantiate()

	# Add it to the active scene, as child of root.
	get_tree().root.add_child(current_scene)

	# Optionally, to make it compatible with the SceneTree.change_scene_to_file() API.
	get_tree().current_scene = current_scene

func _respawn(target):
	GlobalControl.goto_scene(levels[target])
