extends Node2D

var direction = 1
@export var speed : int = 10
@export var projectileScene: PackedScene

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	change_direction()
	if Input.is_action_just_pressed("action"):
		spawn(global_position)

func change_direction():
	if Input.is_action_just_pressed("move_right"):
		direction = 1
	if Input.is_action_just_pressed("move_left"):
		direction = -1

func spawn(global_spawn_position: Vector2 = global_position, parent: Node = get_tree().current_scene) -> Node:
	assert(projectileScene is PackedScene, "Error: The scene export was never set on this spawner component.")
	
	var instance = projectileScene.instantiate()

	parent.add_child(instance)
	
	instance.global_position = global_spawn_position
	
	instance.velocity *= direction
	
	return instance
