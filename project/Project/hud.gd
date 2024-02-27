extends Control
@onready var character_body_2d = $"../.."
@onready var num_jumps = $NUM_JUMPS






# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var format_string = "NUM JUMPS:%s" % character_body_2d.jumps
	num_jumps.clear()
	num_jumps.append_text(format_string)
	pass
