extends RigidBody3D

@onready var sfx = $SFX

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	contact_monitor = true
	max_contacts_reported = 4

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_sfx_finished() -> void:
	get_tree().call_group("enemy", "hear_noise", global_position)


func _on_body_entered(body: Node) -> void:
	if not sfx.playing:
		sfx.play()
