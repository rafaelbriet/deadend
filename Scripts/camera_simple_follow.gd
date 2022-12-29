extends Camera2D

export(NodePath) var target_path

onready var target = get_node(target_path)

func _physics_process(delta) -> void:
	if target == null:
		return
	
	position.x = target.position.x
