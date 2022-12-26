extends KinematicBody2D

export var walk_speed : float = 400.0

const GRAVITY : float = 200.0

onready var _animatedSprite : AnimatedSprite = $AnimatedSprite

var _velocity : Vector2 = Vector2()
		
func _physics_process(delta) -> void:
	_velocity.y += delta * GRAVITY
	
	if Input.is_action_pressed("ui_right"):
		_velocity.x = walk_speed
		_animatedSprite.play("Run")
		_animatedSprite.flip_h = false
	elif Input.is_action_pressed("ui_left"):
		_velocity.x = -walk_speed
		_animatedSprite.play("Run")
		_animatedSprite.flip_h = true
	else:
		_velocity.x = 0
		_animatedSprite.play("Idle")

	move_and_slide(_velocity, Vector2.UP)
