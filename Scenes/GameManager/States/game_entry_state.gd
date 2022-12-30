extends GameState


func _enter(args := {}) -> void:
	state_machine.transition_to("MainMenu_State")
