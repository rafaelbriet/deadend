extends KingState

func _enter(args := {}) -> void:
	._enter(args)
	root.animation_player.play("Attack_3")
	root.animation_player.connect("animation_finished", self, "_on_animation_finished")
	root.can_use_next_attack = false


func _exit() -> void:
	._exit()
	root.animation_player.disconnect("animation_finished", self, "_on_animation_finished")


func _on_animation_finished(anim_name: String) -> void:
	state_machine.transition_to("Idle_State")
