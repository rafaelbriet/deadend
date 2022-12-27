extends Node2D

export(PackedScene) var skeleton_scene
export(Array, NodePath) var spawn_node_paths := []

onready var _spawn_points : Array = _load_nodes(spawn_node_paths) 

func _ready():
	_spawn_skeleton()

func _spawn_skeleton():
	for spawn_point in _spawn_points:
		var skeleton = skeleton_scene.instance()
		skeleton.position = spawn_point.position
		add_child(skeleton)

func _load_nodes(nodePaths : Array):
	var nodes := []
	
	for nodePath in nodePaths:
		var node := get_node(nodePath)
		if node != null:
			nodes.append(node)
	
	return nodes
