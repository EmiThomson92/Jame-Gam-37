extends PathFollow2D
var increasing = true
var speed = 0.5
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if increasing == true:
		progress_ratio += speed*delta
		clamp(progress_ratio,0,1)
		if progress_ratio == 1:
			increasing = false
	else:
		progress_ratio -= speed*delta
		clamp(progress_ratio,0,1)
		if progress_ratio == 0:
			increasing = true
	print_debug(progress_ratio)
	print_debug(increasing)	
	pass
