extends RigidBody3D

@onready var sfx = $SFX
@export var max_distance := 10.0 # tweak this

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	contact_monitor = true
	max_contacts_reported = 4

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_sfx_finished() -> void:
	for enemy in get_tree().get_nodes_in_group("Enemy"):
		var distance = enemy.global_position.distance_to(global_position)
		
		if distance <= max_distance:
			enemy.hear_noise(global_position)

func _on_body_entered(body: Node) -> void:
	if not sfx.playing:
		sfx.play()
