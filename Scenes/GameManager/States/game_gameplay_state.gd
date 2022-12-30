extends GameState

var _scene : Node
var _king : King
var _tween : Tween

func _enter(args := {}) -> void:
	_scene = _create_scene_instance(root.gameplay_scene)
	_king = _scene.get_node("King")
	_tween = _scene.get_node("Tween")
	_tween.connect("tween_all_completed", self, "_on_tween_all_completed")


func _on_tween_all_completed() -> void:
	var score = _scene.get_node("Score") as Score
	state_machine.transition_to("GameOver_State", {final_score = score.current_score})
	_scene.queue_free()
