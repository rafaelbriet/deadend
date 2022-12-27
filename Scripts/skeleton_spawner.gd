extends Node2D

export(PackedScene) var skeleton_scene
export(Array, NodePath) var spawn_node_paths := []
export(NodePath) var target_node_path
export var skeleton_scale : Vector2 = Vector2.ONE
export var spawn_enabled: bool = true

onready var _spawn_points : Array = _load_nodes(spawn_node_paths) 
onready var _target : KinematicBody2D = get_node(target_node_path)

func _ready():
	_spawn_skeleton()

func _spawn_skeleton():
	if (spawn_enabled == false):
		return
	
	for spawn_point in _spawn_points:
		var skeleton = skeleton_scene.instance()
		skeleton.position = spawn_point.position
		skeleton.scale = skeleton.scale * skeleton_scale
		skeleton.target = _target
		add_child(skeleton)

func _load_nodes(nodePaths : Array):
	var nodes := []
	
	for nodePath in nodePaths:
		var node := get_node(nodePath)
		if node != null:
			nodes.append(node)
	
	return nodes
