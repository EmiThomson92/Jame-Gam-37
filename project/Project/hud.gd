extends Control
@onready var character_body_2d = $"../.."
@onready var status = $Status







# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	status.clear()
	var format_string = "NUM JUMPS: %s" % character_body_2d.jumps
	status.append_text(format_string)
	format_string = "\nJUMPING: %s" % character_body_2d.is_jumping
	format_string = format_string.to_upper()
	status.append_text(format_string)
	format_string = "\nAMMO: %s" % character_body_2d.ammo
	status.append_text(format_string)
	pass
