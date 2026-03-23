extends Node3D

@export var mouse_sensitivity := 0.002

var camera_x_rotation := 0.0


func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)


func _unhandled_input(event):
	if event is InputEventMouseMotion:
		# Rotate player left/right
		rotate_y(-event.relative.x * mouse_sensitivity)

		# Rotate camera up/down
		camera_x_rotation -= event.relative.y * mouse_sensitivity
		camera_x_rotation = clamp(camera_x_rotation, deg_to_rad(-90), deg_to_rad(90))
		rotation.x = camera_x_rotation
		
func _process(delta):
	var look_input = Input.get_vector("look_left", "look_right", "look_up", "look_down")

	if look_input.length() > 0:
		# Rotate player left/right
		rotate_y(-look_input.x * mouse_sensitivity * 100 * delta)

		# Rotate camera up/down
		camera_x_rotation -= look_input.y * mouse_sensitivity * 100 * delta
		camera_x_rotation = clamp(camera_x_rotation, deg_to_rad(-90), deg_to_rad(90))
		rotation.x = camera_x_rotation
