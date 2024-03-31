extends Area3D

var clicks_to_pop : int = randi_range(1,5)
var size_increase : float = 0.2
var points_to_give : int = clicks_to_pop


func _ready():
	print(name, " ", clicks_to_pop)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _physics_process(delta):
	rotate_y(3.0*delta)


func _on_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		scale += Vector3.ONE * size_increase
		clicks_to_pop -= 1
		
		if clicks_to_pop == 0:
			get_node("/root/Main/BalloonManager").increase_score(points_to_give)
			queue_free()
	pass # Replace with function body.
