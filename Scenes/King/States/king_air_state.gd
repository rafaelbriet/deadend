extends KingState


func _enter(args := {}) -> void:
	root.animation_player.play("Jump")
	
	if args.has("do_jump"):
		root.velocity.y = -root.base_jump_impulse


func _physics_process_state(delta: float) -> void:
	root.velocity.y += root.base_gravity * delta
	root.velocity = root.move_and_slide(root.velocity, Vector2.UP)
	
	if root.is_on_floor():
		state_machine.transition_to("Idle_State")
