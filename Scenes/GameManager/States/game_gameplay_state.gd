extends GameState

var _level_scene : Node
var _paused_scene : Node
var _king : King
var _tween : Tween
var _is_paused : bool = false


func _enter(args := {}) -> void:
	_level_scene = _create_scene_instance(root.gameplay_scene)
	_king = _level_scene.get_node("King")
	_tween = _level_scene.get_node("Tween")
	_tween.connect("tween_all_completed", self, "_on_tween_all_completed")
	_paused_scene = _create_scene_instance(root.gameplay_paused_scene)
	_paused_scene.connect("resume_button_pressed", self, "_on_resume_button_pressed")
	_paused_scene.visible = false


func _process_state(delta: float) -> void:
	if Input.is_action_just_pressed("pause"):
		print(_level_scene.get_tree().paused)
		
	if Input.is_action_just_pressed("pause") and not _level_scene.get_tree().paused:
		_pause()
	elif Input.is_action_just_pressed("pause") and _level_scene.get_tree().paused:
		_unpause()


func _pause():
	_level_scene.get_tree().paused = true
	_paused_scene.visible = true


func _unpause():
	_level_scene.get_tree().paused = false
	_paused_scene.visible = false


func _on_tween_all_completed() -> void:
	var score = _level_scene.get_node("Score") as Score
	state_machine.transition_to("GameOver_State", {final_score = score.current_score})
	_level_scene.queue_free()


func _on_resume_button_pressed() -> void:
	_unpause()
