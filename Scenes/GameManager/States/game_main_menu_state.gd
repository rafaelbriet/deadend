extends GameState

var _scene : Control
var _tween : Tween

func _enter(args := {}) -> void:
	_scene = _create_scene_instance(root.main_menu_scene) as Control
	_tween = _scene.get_node("Tween")
	_tween.connect("tween_all_completed", self, "_on_tween_all_completed")


func _exit() -> void:
	_tween.disconnect("tween_all_completed", self, "_on_tween_all_completed")
	_scene.queue_free()


func _on_tween_all_completed() -> void:
	state_machine.transition_to("Gameplay_State")
