extends Control

export var initial_camera_offset : Vector2
export var final_camera_offset : Vector2
export var camera_tween_duration : float = 1.0
export var title_fade_duration : float = 0.5

onready var _tween : Tween = $Tween
onready var _camera : Camera2D = $Camera2D
onready var _control_container : Control = $Control


func _ready() -> void:
	_camera.offset = initial_camera_offset

func _on_start_game_button_pressed():
	_tween.interpolate_property(_camera, "offset", initial_camera_offset, final_camera_offset, camera_tween_duration)
	_tween.interpolate_property(_control_container, "modulate", Color(1.0, 1.0, 1.0, 1.0), Color(1.0, 1.0, 1.0, 0.0), title_fade_duration)
	_tween.start()
