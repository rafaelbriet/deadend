extends Tween

export var tween_target_path := NodePath()

onready var _tween_target : Control = get_node(tween_target_path)


func _ready() -> void:
	_tween_target.modulate = Color(1.0, 1.0, 1.0, 0.0)
	interpolate_property(_tween_target,
			"modulate",
			Color(1.0, 1.0, 1.0, 0.0),
			Color(1.0, 1.0, 1.0, 1.0),
			owner.fade_in_duration,
			Tween.TRANS_BACK,
			Tween.EASE_IN)
	interpolate_property(_tween_target,
			"rect_position",
			_tween_target.rect_position,
			Vector2(0.0, 0.0),
			owner.fade_in_duration,
			Tween.TRANS_BACK,
			Tween.EASE_IN)
	start()
