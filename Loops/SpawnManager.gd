extends Node


@export var spawn_count : int = 500
var star_scene = preload("res://Loops/star.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
		
	# Get the screen center
	var screen_center = get_node("/root/Main/Camera2D").get_screen_center_position()
	
	# Get the viewport rectangle
	var viewport_rect = get_node("/root/Main/Camera2D").get_viewport_rect()
	
	# Calculate the edges
	var left_edge = screen_center.x - (viewport_rect.size.x / 2)
	var right_edge = screen_center.x + (viewport_rect.size.x / 2)
	var top_edge = screen_center.y - (viewport_rect.size.y / 2)
	var bottom_edge = screen_center.y + (viewport_rect.size.y / 2)
	
	# Output the edges
	print("Viewport rect: ", viewport_rect)
	print("Left Edge: ", left_edge)
	print("Right Edge: ", right_edge)
	print("Top Edge: ", top_edge)
	print("Bottom Edge: ", bottom_edge)
	for i in spawn_count:
		var star = star_scene.instantiate()
		add_child(star)
		star.position.x = randi_range(left_edge, right_edge)
		star.position.y = randi_range(top_edge, bottom_edge)
	
		var star_size = randf_range(0.4, 2.0)
		star.scale.x = star_size
		star.scale.y = star_size


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
