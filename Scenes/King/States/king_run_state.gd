extends KingState


func _enter(args := {}) -> void:
	root.velocity = Vector2.ZERO
	root.animation_player.play("Run")


func _physics_process_state(delta: float) -> void:
	if Input.is_action_pressed("move_left"):
		root.velocity.x = -root.base_walk_speed
		root.sprite.flip_h = true
	elif Input.is_action_pressed("move_right"):
		root.velocity.x = root.base_walk_speed
		root.sprite.flip_h = false
	else:
		state_machine.transition_to("Idle_State")
		
	root.move_and_slide(root.velocity, Vector2.UP)
	
	if Input.is_action_just_pressed("attack"):
		state_machine.transition_to("Attack_1_State")
	
	if Input.is_action_just_pressed("jump"):
		state_machine.transition_to("Air_State", {do_jump = true})
