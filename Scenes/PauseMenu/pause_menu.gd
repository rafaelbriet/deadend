extends CanvasLayer

signal resume_button_pressed

export var menu_container_fade_duration : float = 0.5
export var menu_container_slide_duration : float = 0.5
export var menu_container_slide_offeset : float = 100
export var container_tween_delay : float = 0.25

onready var _tween : Tween = $Tween
onready var _pause_menu_container : Control = $PauseMenuContainer
onready var _options_menu_container : Control = $OptionsMenuContainer


func _on_resume_button_pressed():
	emit_signal("resume_button_pressed")


func _on_options_button_pressed():
	# Slide pause menu container out
	_tween.interpolate_property(_pause_menu_container,
			"rect_position",
			_pause_menu_container.rect_position,
			Vector2(-menu_container_slide_offeset, 0),
			menu_container_slide_duration,
			Tween.TRANS_LINEAR,
			Tween.EASE_OUT)
	# Fade main menu container out
	_tween.interpolate_property(_pause_menu_container,
			"modulate",
			Color(1.0, 1.0, 1.0, 1.0),
			Color(1.0, 1.0, 1.0, 0.0),
			menu_container_fade_duration,
			Tween.TRANS_LINEAR,
			Tween.EASE_OUT)
	# Set options container visibility
	_tween.interpolate_property(_pause_menu_container,
			"visible",
			true,
			false,
			menu_container_fade_duration,
			Tween.TRANS_LINEAR,
			Tween.EASE_IN,
			menu_container_slide_duration)

	# Slide options container in
	_tween.interpolate_property(_options_menu_container,
			"rect_position",
			Vector2(_options_menu_container.rect_position.x + menu_container_slide_offeset, 0),
			Vector2(0, 0),
			menu_container_slide_duration,
			Tween.TRANS_LINEAR,
			Tween.EASE_IN,
			container_tween_delay)
	# Fade options container out
	_tween.interpolate_property(_options_menu_container,
			"modulate",
			Color(1.0, 1.0, 1.0, 0.0),
			Color(1.0, 1.0, 1.0, 1.0),
			menu_container_fade_duration,
			Tween.TRANS_LINEAR,
			Tween.EASE_IN,
			container_tween_delay)
	# Set options container visibility
	_tween.interpolate_property(_options_menu_container,
			"visible",
			false,
			true,
			menu_container_fade_duration,
			Tween.TRANS_LINEAR,
			Tween.EASE_IN,
			container_tween_delay)
	
	# Start Tweening
	_tween.start()


func _on_back_button_pressed():
	# Slide options container out
	_tween.interpolate_property(_options_menu_container,
			"rect_position",
			_options_menu_container.rect_position,
			Vector2(_options_menu_container.rect_position.x + menu_container_slide_offeset, 0),
			menu_container_slide_duration,
			Tween.TRANS_LINEAR,
			Tween.EASE_OUT)
	# Fade options container out
	_tween.interpolate_property(_options_menu_container,
			"modulate",
			Color(1.0, 1.0, 1.0, 1.0),
			Color(1.0, 1.0, 1.0, 0.0),
			menu_container_fade_duration,
			Tween.TRANS_LINEAR,
			Tween.EASE_OUT)
	# Set options container visibility
	_tween.interpolate_property(_options_menu_container,
			"visible",
			true,
			false,
			menu_container_fade_duration,
			Tween.TRANS_LINEAR,
			Tween.EASE_IN,
			menu_container_slide_duration)
	
	# Slide main menu container in
	_tween.interpolate_property(_pause_menu_container,
			"rect_position",
			_pause_menu_container.rect_position,
			Vector2(0, 0),
			menu_container_slide_duration,
			Tween.TRANS_LINEAR,
			Tween.EASE_IN,
			container_tween_delay)
	# Fade main menu container out
	_tween.interpolate_property(_pause_menu_container,
			"modulate",
			Color(1.0, 1.0, 1.0, 0.0),
			Color(1.0, 1.0, 1.0, 1.0),
			menu_container_fade_duration,
			Tween.TRANS_LINEAR,
			Tween.EASE_OUT,
			container_tween_delay)
	# Set menu menu container visibility
	_tween.interpolate_property(_pause_menu_container,
			"visible",
			false,
			true,
			menu_container_fade_duration,
			Tween.TRANS_LINEAR,
			Tween.EASE_IN,
			container_tween_delay)
	
	# Start Tweening
	_tween.start()
