class_name SkeletonState
extends State

var root : SkeletonEnemy


func _ready() -> void:
	yield(owner, "ready")
	root = owner as SkeletonEnemy
	assert(root != null)
