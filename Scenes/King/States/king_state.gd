class_name KingState
extends State

var root : King


func _ready() -> void:
	yield(owner, "ready")
	root = owner as King
	assert(root != null)
