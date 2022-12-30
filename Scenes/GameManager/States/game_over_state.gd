extends GameState

var _scene : Control
var _restart_game_button
var _back_to_main_menu_button

func _enter(args := {}) -> void:
	_scene = _create_scene_instance(root.game_over_scene)
	_restart_game_button = _scene.get_node("VBoxContainer/HFlowContainer/RestartGameButton") as Button
	_back_to_main_menu_button = _scene.get_node("VBoxContainer/HFlowContainer/BackToMainMenuButton") as Button
	_restart_game_button.connect("pressed", self, "_on_restart_game_button_pressed")
	_back_to_main_menu_button.connect("pressed", self, "_on_back_to_main_menu_button_pressed")
	_set_score_text(args.final_score)


func exit() -> void:
	print("GAMEOVERSTATE EXIT")
	_restart_game_button.disconnect("pressed", self, "_on_restart_game_button_pressed")
	_back_to_main_menu_button.disconnect("pressed", self, "_on_back_to_main_menu_button_pressed")

func _on_restart_game_button_pressed() -> void:
	state_machine.transition_to("Gameplay_State")
	_scene.queue_free()	


func _on_back_to_main_menu_button_pressed() -> void:
	state_machine.transition_to("MainMenu_State")
	_scene.queue_free()	


func _set_score_text(score: int) -> void:
	var score_text = _scene.get_node("VBoxContainer/Score") as Label
	score_text.set_text(str(score))
