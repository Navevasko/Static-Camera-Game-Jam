extends Camera3D

# EXPORTED VARIABLES
@export var is_default: bool = false

var player: Player

func _physics_process(delta: float) -> void:
	if player:
		look_at(player.position)

func _on_area_3d_body_entered(body: Node3D) -> void:
	print(body)
	if body is Player:
		print(name + " Está focando no player")
		current = true
		player = body


func _on_area_3d_body_exited(body: Node3D) -> void:
	print(name + " Está não está mais focando no player")
	current = false
