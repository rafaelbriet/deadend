extends SkeletonState


func _enter(args := {}) -> void:
	._enter(args)
	root.velocity = Vector2.ZERO
	root.animation_player.play("RESET")
	root.animation_player.play("Walk")


func _physics_process_state(delta: float) -> void:
	var direction_to_target = round((root.position - root.target.position).normalized().x) * -1
	var velocity = root.base_walk_speed * direction_to_target
	root.move_and_slide(Vector2(velocity, 0), Vector2.UP)
	
	if (direction_to_target > 0):
		root.sprite.flip_h = false
		root.flip_attack_hit_box(false)
	else:
		root.sprite.flip_h = true
		root.flip_attack_hit_box(true)
		
	var distance_to_target = root.global_position.distance_to(root.target.global_position)
	
	if (distance_to_target < root.base_attack_distance):
		state_machine.transition_to("Attack_State")
