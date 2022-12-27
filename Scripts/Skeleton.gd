extends KinematicBody2D

enum SkeletonState { IDLE, FALLING, WALKING, ATTACKING, HIT, DIEING }

const GRAVITY : float = 200.0

export var walk_speed : float = 100.0
export var attack_distance : float = 150.0

var target : KinematicBody2D

var _current_state

onready var _animatedSprite : AnimatedSprite = $AnimatedSprite

var _velocity : Vector2 = Vector2()

func _ready() -> void:
	change_state(SkeletonState.IDLE)

func _process(delta) -> void:
	_process_state(delta)

func _physics_process(delta) -> void:
	_physics_process_state(delta)

func change_state(new_state):
	_exit_state()
	_current_state = new_state
	_enter_state()

func _process_state(delta : float):
	match _current_state:
		SkeletonState.IDLE:
			pass
		SkeletonState.FALLING:
			pass
		SkeletonState.WALKING:
			pass
		SkeletonState.ATTACKING:
			pass
		SkeletonState.HIT:
			pass
		SkeletonState.DIEING:
			pass

func _physics_process_state(delta : float):
	match _current_state:
		SkeletonState.IDLE:
			if (is_on_floor() == false):
				change_state(SkeletonState.FALLING)
			if (is_on_floor()):
				change_state(SkeletonState.WALKING)
		SkeletonState.FALLING:
			_velocity.y += delta * GRAVITY
			move_and_slide(_velocity, Vector2.UP)
			
			if (is_on_floor()):
				change_state(SkeletonState.IDLE)
		SkeletonState.WALKING:
			var direction_to_target = round((position - target.position).normalized().x) * -1
			var velocity = walk_speed * direction_to_target
			move_and_slide(Vector2(velocity, 0), Vector2.UP)
			
			if (direction_to_target > 0):
				_animatedSprite.flip_h = false
			else:
				_animatedSprite.flip_h = true
				
			var distance_to_target = global_position.distance_to(target.global_position)
			
			if (distance_to_target < attack_distance):
				change_state(SkeletonState.ATTACKING)
		SkeletonState.ATTACKING:
			var distance_to_target = global_position.distance_to(target.global_position)
			
			if (distance_to_target > attack_distance):
				change_state(SkeletonState.WALKING)
			pass
		SkeletonState.HIT:
			pass
		SkeletonState.DIEING:
			pass

func _exit_state():
	match _current_state:
		SkeletonState.IDLE:
			pass
		SkeletonState.FALLING:
			pass
		SkeletonState.WALKING:
			pass
		SkeletonState.ATTACKING:
			pass
		SkeletonState.HIT:
			pass
		SkeletonState.DIEING:
			pass

func _enter_state():
	match _current_state:
		SkeletonState.IDLE:
			_animatedSprite.play("Idle")
			pass
		SkeletonState.FALLING:
			pass
		SkeletonState.WALKING:
			_animatedSprite.play("Walk")
			pass
		SkeletonState.ATTACKING:
			_animatedSprite.play("Attack")
			pass
		SkeletonState.HIT:
			_animatedSprite.play("Hit")
			pass
		SkeletonState.DIEING:
			_animatedSprite.play("Death")
			pass
