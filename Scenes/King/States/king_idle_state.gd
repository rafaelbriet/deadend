extends KingState


func _enter(args := {}) -> void:
	root.velocity = Vector2.ZERO
	root.animation_player.play("Idle")


func _process_state(delta: float) -> void:
	if not owner.is_on_floor():
		state_machine.transition_to("Air_State")
		return
	
	if Input.is_action_just_pressed("attack"):
		state_machine.transition_to("Attack_1_State")
	
	if Input.is_action_just_pressed("jump"):
		state_machine.transition_to("Air_State", {do_jump = true})
	
	if Input.is_action_pressed("move_left") or Input.is_action_pressed("move_right"):
		state_machine.transition_to("Run_State")
