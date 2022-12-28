extends Node2D

export(PackedScene) var skeleton_scene
export(Array, NodePath) var spawn_node_paths := []
export(NodePath) var target_node_path
export var spawn_timer_path := NodePath()
export var skeleton_scale : Vector2 = Vector2.ONE
export var spawn_enabled: bool = true
export var time_between_spawn: float = 1

onready var _spawn_points : Array = _load_nodes(spawn_node_paths) 
onready var _target : KinematicBody2D = get_node(target_node_path)
onready var _spawn_timer: Timer = get_node(spawn_timer_path)

func _ready():
	_spawn_timer.start(time_between_spawn)
	_spawn_skeleton()


func _on_spawn_timer_timeout():
	_spawn_skeleton()


func _spawn_skeleton():
	if (spawn_enabled == false):
		return
	
	print("Next skeleton wave spawned.")
	
	for spawn_point in _spawn_points:
		var skeleton = skeleton_scene.instance()
		skeleton.position = spawn_point.global_position
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
