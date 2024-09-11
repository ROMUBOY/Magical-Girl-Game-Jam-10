extends Node2D
class_name  projectile

@export var velocity : Vector2

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	translate(velocity * delta)
