extends KinematicBody2D

export var walk_speed : float = 400.0

const GRAVITY : float = 200.0

onready var _animation_player : AnimationPlayer = $AnimationPlayer
onready var _sprite : Sprite = $Sprite

var _velocity : Vector2 = Vector2()
		
func _physics_process(delta) -> void:
	_velocity.y += delta * GRAVITY
	
	if Input.is_action_pressed("ui_right"):
		_velocity.x = walk_speed
		_animation_player.play("Run")
		_sprite.flip_h = false
	elif Input.is_action_pressed("ui_left"):
		_velocity.x = -walk_speed
		_animation_player.play("Run")
		_sprite.flip_h = true
	else:
		_velocity.x = 0
		_animation_player.play("Idle")

	move_and_slide(_velocity, Vector2.UP)
