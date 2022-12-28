extends KingState

func _enter(args := {}) -> void:
	root.animation_player.play("Jump")
	
	if args.has("do_jump"):
		if Input.is_action_pressed("move_left"):
			root.velocity.x = -root.base_jump_move_speed
		elif Input.is_action_pressed("move_right"):
			root.velocity.x = root.base_jump_move_speed
		
		root.velocity.y = -root.base_jump_impulse


func _physics_process_state(delta: float) -> void:
	if root.velocity.y > 0:
		root.animation_player.play("Fall")
		root.velocity.y += root.base_gravity * root.gravity_multiplier * delta
	else:
		root.velocity.y += root.base_gravity * delta
	
	root.velocity = root.move_and_slide(root.velocity, Vector2.UP)
	
	if root.is_on_floor():
		state_machine.transition_to("Idle_State")
