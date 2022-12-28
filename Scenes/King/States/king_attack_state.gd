extends KingState

func _enter(args := {}) -> void:
	root.animation_player.play("Attack_1")
	root.animation_player.connect("animation_finished", self, "_on_animation_finished")


func _exit() -> void:
	root.animation_player.disconnect("animation_finished", self, "_on_animation_finished")


func _on_animation_finished(anim_name: String) -> void:
	state_machine.transition_to("Idle_State")
