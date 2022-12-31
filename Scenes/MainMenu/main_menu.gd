extends Control

export var initial_camera_offset : Vector2
export var final_camera_offset : Vector2
export var camera_tween_duration : float = 1.0
export var title_fade_duration : float = 0.5
export var menu_container_fade_duration : float = 0.5
export var menu_container_slide_duration : float = 0.5
export var menu_container_slide_offeset : float = 100
export var container_tween_delay : float = 0.25

onready var _tween : Tween = $Tween
onready var _tween_pagination : Tween = $Tween_Pagination
onready var _camera : Camera2D = $Camera2D
onready var _main_menu_container : Control = $MainMenu
onready var _options_menu_container : Control = $OptionsMenu


func _ready() -> void:
	_camera.offset = initial_camera_offset
	_main_menu_container.visible = true
	_options_menu_container.visible = false


func _on_start_game_button_pressed():
	_tween.interpolate_property(_camera, "offset", initial_camera_offset, final_camera_offset, camera_tween_duration)
	_tween.interpolate_property(_main_menu_container, "modulate", Color(1.0, 1.0, 1.0, 1.0), Color(1.0, 1.0, 1.0, 0.0), title_fade_duration)
	_tween.start()


func _on_options_button_pressed():
	# Slide main menu container out
	_tween_pagination.interpolate_property(_main_menu_container,
			"rect_position",
			_main_menu_container.rect_position,
			Vector2(-menu_container_slide_offeset, 0),
			menu_container_slide_duration,
			Tween.TRANS_LINEAR,
			Tween.EASE_OUT)
	# Fade main menu container out
	_tween_pagination.interpolate_property(_main_menu_container,
			"modulate",
			Color(1.0, 1.0, 1.0, 1.0),
			Color(1.0, 1.0, 1.0, 0.0),
			menu_container_fade_duration,
			Tween.TRANS_LINEAR,
			Tween.EASE_OUT)
	# Set options container visibility
	_tween_pagination.interpolate_property(_main_menu_container,
			"visible",
			true,
			false,
			menu_container_fade_duration,
			Tween.TRANS_LINEAR,
			Tween.EASE_IN,
			menu_container_slide_duration)

	# Slide options container in
	_tween_pagination.interpolate_property(_options_menu_container,
			"rect_position",
			Vector2(_main_menu_container.rect_position.x + menu_container_slide_offeset, 0),
			Vector2(0, 0),
			menu_container_slide_duration,
			Tween.TRANS_LINEAR,
			Tween.EASE_IN,
			container_tween_delay)
	# Fade options container out
	_tween_pagination.interpolate_property(_options_menu_container,
			"modulate",
			Color(1.0, 1.0, 1.0, 0.0),
			Color(1.0, 1.0, 1.0, 1.0),
			menu_container_fade_duration,
			Tween.TRANS_LINEAR,
			Tween.EASE_OUT,
			container_tween_delay)
	# Set options container visibility
	_tween_pagination.interpolate_property(_options_menu_container,
			"visible",
			false,
			true,
			menu_container_fade_duration,
			Tween.TRANS_LINEAR,
			Tween.EASE_IN,
			container_tween_delay)
	
	# Start Tweening
	_tween_pagination.start()


func _on_back_button_pressed():
	# Slide options container out
	_tween_pagination.interpolate_property(_options_menu_container,
			"rect_position",
			_options_menu_container.rect_position,
			Vector2(_options_menu_container.rect_position.x + menu_container_slide_offeset, 0),
			menu_container_slide_duration,
			Tween.TRANS_LINEAR,
			Tween.EASE_OUT)
	# Fade options container out
	_tween_pagination.interpolate_property(_options_menu_container,
			"modulate",
			Color(1.0, 1.0, 1.0, 1.0),
			Color(1.0, 1.0, 1.0, 0.0),
			menu_container_fade_duration,
			Tween.TRANS_LINEAR,
			Tween.EASE_OUT)
	# Set options container visibility
	_tween_pagination.interpolate_property(_options_menu_container,
			"visible",
			true,
			false,
			menu_container_fade_duration,
			Tween.TRANS_LINEAR,
			Tween.EASE_IN,
			menu_container_slide_duration)
	
	# Slide main menu container in
	_tween_pagination.interpolate_property(_main_menu_container,
			"rect_position",
			_main_menu_container.rect_position,
			Vector2(0, 0),
			menu_container_slide_duration,
			Tween.TRANS_LINEAR,
			Tween.EASE_IN,
			container_tween_delay)
	# Fade main menu container out
	_tween_pagination.interpolate_property(_main_menu_container,
			"modulate",
			Color(1.0, 1.0, 1.0, 0.0),
			Color(1.0, 1.0, 1.0, 1.0),
			menu_container_fade_duration,
			Tween.TRANS_LINEAR,
			Tween.EASE_OUT,
			container_tween_delay)
	# Set menu menu container visibility
	_tween_pagination.interpolate_property(_main_menu_container,
			"visible",
			false,
			true,
			menu_container_fade_duration,
			Tween.TRANS_LINEAR,
			Tween.EASE_IN,
			container_tween_delay)
	
	# Start Tweening
	_tween_pagination.start()
