extends SkeletonState


func _enter(args := {}) -> void:
	._enter(args)
	root.velocity = Vector2.ZERO
	root.animation_player.play("RESET")
	root.animation_player.play("Attack")


func _physics_process_state(delta: float) -> void:
	var distance_to_target = root.global_position.distance_to(root.target.global_position)
#
	if (distance_to_target > root.base_attack_distance):
		state_machine.transition_to("Walk_State")
