extends StaticBody2D

export(NodePath) var target_path
export var target_offset : float = 464

onready var _target : KinematicBody2D = get_node(target_path)

func _physics_process(delta) -> void:
	position.x = _target.position.x - target_offset
