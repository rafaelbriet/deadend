class_name GameState
extends State


var root : GameManager


func _ready() -> void:
	yield(owner, "ready")
	root = owner as GameManager
	assert(root != null)


func _create_scene_instance(packed_scene: PackedScene) -> Node:
	var sceneInstance = packed_scene.instance()
	owner.add_child(sceneInstance)
	return sceneInstance
