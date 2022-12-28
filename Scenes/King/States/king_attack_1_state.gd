extends KingState

func _enter(args := {}) -> void:
	root.animation_player.play("Attack_1")
	root.animation_player.connect("animation_finished", self, "_on_animation_finished")
	root.can_use_next_attack = false


func _exit() -> void:
	root.animation_player.disconnect("animation_finished", self, "_on_animation_finished")


func _process_state(delta: float) -> void:
	if Input.is_action_just_pressed("attack") and root.can_use_next_attack:
		state_machine.transition_to("Attack_2_State")


func _on_animation_finished(anim_name: String) -> void:
	state_machine.transition_to("Idle_State")
