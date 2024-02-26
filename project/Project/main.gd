extends Node2D


@onready var collision_polygon_2d = $StaticBody2D/CollisionPolygon2D
@onready var polygon_2d = $StaticBody2D/CollisionPolygon2D/Polygon2D
@onready var num_jumps = $NUM_JUMPS
@onready var character_body_2d = $CharacterBody2D

func _ready():
	RenderingServer.set_default_clear_color(Color.BLACK)
	polygon_2d.polygon = collision_polygon_2d.polygon
func _process(delta):
	var format_string = "NUM JUMPS:%s" % character_body_2d.jumps
	num_jumps.clear()
	num_jumps.append_text(format_string)
