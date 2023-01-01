extends SkeletonState


func _enter(args := {}) -> void:
	._enter(args)
	root.animation_player.play("RESET")
	root.animation_player.play("Spawn")
	root.animation_player.connect("animation_finished", self, "_on_animation_finished")


func _exit() -> void:
	._exit()
	root.animation_player.disconnect("animation_finished", self, "_on_animation_finished")


func _physics_process_state(delta: float) -> void:
	if not root.is_on_floor():
		root.velocity.y += root.base_gravity * delta
		root.velocity = root.move_and_slide(root.velocity, Vector2.UP)


func _on_animation_finished(anim_name: String) -> void:
	state_machine.transition_to("Idle_State")
