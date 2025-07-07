extends Camera3D

# EXPORTED VARIABLES
@export var is_default: bool = false

func _ready() -> void:
	current = is_default

func _on_area_3d_body_entered(body: Node3D) -> void:
	print(body is Player)
	if body is Player:
		print(name + " Está focando no player")
		current = true


func _on_area_3d_body_exited(body: Node3D) -> void:
	print(name + " Não está mais focando no player")
	current = false
