extends KingState

var _timer : Timer

func _enter(args := {}) -> void:
	._enter(args)
	root.velocity = Vector2.ZERO
	root.animation_player.play("Idle")
	_timer = Timer.new()
	add_child(_timer)
	_timer.connect("timeout", self, "_on_timer_timeout")
	_timer.wait_time = root.stamina_recover_wait_time
	_timer.start()


func _exit() -> void:
	_timer.queue_free()


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


func _on_timer_timeout() -> void:
	print("TIMEOUT")
	root.stamina.recover(root.stamina_recover_amount)
