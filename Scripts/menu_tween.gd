extends Tween

export var tween_target_path := NodePath()
export var tween_duration : float = 1.0
export var inital_position : Vector2
export var final_position : Vector2
export var initial_color : Color = Color(1.0, 1.0, 1.0, 0.0)
export var final_color : Color = Color(1.0, 1.0, 1.0, 1.0)
export var delay : float = 0

onready var _tween_target : Control = get_node(tween_target_path)


func _ready() -> void:
	_tween_target.modulate = initial_color
	_tween_target.rect_position = inital_position
	
	interpolate_property(_tween_target,
			"modulate",
			initial_color,
			final_color,
			tween_duration,
			Tween.TRANS_BACK,
			Tween.EASE_IN,
			delay)
	interpolate_property(_tween_target,
			"rect_position",
			inital_position,
			final_position,
			tween_duration,
			Tween.TRANS_BACK,
			Tween.EASE_IN,
			delay)
	start()
