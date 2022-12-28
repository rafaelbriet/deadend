extends SkeletonState


func _enter(args := {}) -> void:
	root.velocity = Vector2.ZERO
	root.animation_player.play("Idle")


func _physics_process_state(delta: float) -> void:
	if not root.is_on_floor():
		state_machine.transition_to("Air_State")
		
	if root.is_on_floor():
		state_machine.transition_to("Walk_State")
