extends SkeletonState

func _enter(args := {}) -> void:
	._enter(args)
	root.animation_player.play("RESET")

func _physics_process_state(delta: float) -> void:
	root.velocity.y += root.base_gravity * delta
	root.velocity = root.move_and_slide(root.velocity, Vector2.UP)
	
	if root.is_on_floor():
		state_machine.transition_to("Idle_State")
