extends GameState

var _scene : Node
var _king : King

func _enter(args := {}) -> void:
	_scene = _create_scene_instance(root.gameplay_scene)
	_king = _scene.get_node("King")
	_king.hit_points.connect("hit_points_depleted", self, "_on_hit_points_depleted")


func _on_hit_points_depleted() -> void:
	print("_on_hit_points_depleted")
