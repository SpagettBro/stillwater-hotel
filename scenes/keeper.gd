extends CharacterBody3D

@export var speed := 4.0
@export var stop_distance := 1.5

@onready var player = get_tree().get_root().get_node("Root/Player") as CharacterBody3D

func _physics_process(delta):
	if not player:
		return

	var direction = (player.global_transform.origin - global_transform.origin)
	var distance = direction.length()

	if distance > stop_distance:
		direction = direction.normalized()
		velocity = direction * speed
	else:
		velocity = Vector3.ZERO

	# Move the enemy
	move_and_slide()
