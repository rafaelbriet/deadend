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
onready var _credits_menu_container : Control = $CreditsMenu

var _current_container : Control

func _ready() -> void:
	_camera.offset = initial_camera_offset
	_main_menu_container.visible = true
	_options_menu_container.visible = false
	_credits_menu_container.visible = false


func _on_start_game_button_pressed():
	_tween.interpolate_property(_camera, "offset", initial_camera_offset, final_camera_offset, camera_tween_duration)
	_tween.interpolate_property(_main_menu_container, "modulate", Color(1.0, 1.0, 1.0, 1.0), Color(1.0, 1.0, 1.0, 0.0), title_fade_duration)
	_tween.start()


func _on_options_button_pressed():
	_current_container = _options_menu_container
	
	# Slide main menu container out
	_slide_out(_main_menu_container,
			_main_menu_container.rect_position,
			Vector2(-menu_container_slide_offeset, 0),
			menu_container_slide_duration,
			container_tween_delay)

	# Slide options container in
	_slide_in(_options_menu_container,
			Vector2(_main_menu_container.rect_position.x + menu_container_slide_offeset, 0),
			Vector2(0, 0),
			menu_container_slide_duration,
			container_tween_delay)
	
	# Start Tweening
	_tween_pagination.start()


func _on_credits_button_pressed():
	_current_container = _credits_menu_container
	
	# Slide main menu container out
	_slide_out(_main_menu_container,
			_main_menu_container.rect_position,
			Vector2(-menu_container_slide_offeset, 0),
			menu_container_slide_duration,
			container_tween_delay)

	# Slide options container in
	_slide_in(_credits_menu_container,
			Vector2(_credits_menu_container.rect_position.x + menu_container_slide_offeset, 0),
			Vector2(0, 0),
			menu_container_slide_duration,
			container_tween_delay)
	
	_tween_pagination.start()


func _on_back_button_pressed():
	# Slide options container out
	_slide_out(_current_container,
			_current_container.rect_position,
			Vector2(_current_container.rect_position.x + menu_container_slide_offeset, 0),
			menu_container_slide_duration,
			container_tween_delay)
	
	# Slide main menu container in
	_slide_in(_main_menu_container,
			_main_menu_container.rect_position,
			Vector2(0, 0),
			menu_container_slide_duration,
			container_tween_delay)
	
	# Start Tweening
	_tween_pagination.start()


func _slide_in(target: Control, initial_position: Vector2, final_position: Vector2, duration: float, delay: float) -> void:
	# Slide options container in
	_tween_pagination.interpolate_property(target,
			"rect_position",
			initial_position,
			final_position,
			duration,
			Tween.TRANS_LINEAR,
			Tween.EASE_IN,
			delay)
	# Fade options container out
	_tween_pagination.interpolate_property(target,
			"modulate",
			Color(1.0, 1.0, 1.0, 0.0),
			Color(1.0, 1.0, 1.0, 1.0),
			duration,
			Tween.TRANS_LINEAR,
			Tween.EASE_IN,
			delay)
	# Set options container visibility
	_tween_pagination.interpolate_property(target,
			"visible",
			false,
			true,
			duration,
			Tween.TRANS_LINEAR,
			Tween.EASE_IN,
			delay)


func _slide_out(target: Control, initial_position: Vector2, final_position: Vector2, duration: float, delay: float) -> void:
	# Slide main menu container out
	_tween_pagination.interpolate_property(target,
			"rect_position",
			initial_position,
			final_position,
			duration,
			Tween.TRANS_LINEAR,
			Tween.EASE_OUT)
	# Fade main menu container out
	_tween_pagination.interpolate_property(target,
			"modulate",
			Color(1.0, 1.0, 1.0, 1.0),
			Color(1.0, 1.0, 1.0, 0.0),
			duration,
			Tween.TRANS_LINEAR,
			Tween.EASE_OUT)
	# Set options container visibility
	_tween_pagination.interpolate_property(target,
			"visible",
			true,
			false,
			duration,
			Tween.TRANS_LINEAR,
			Tween.EASE_IN,
			delay)
