extends Node


signal display_mobile_controls_changed(value)

var display_mobile_controls : bool = true setget set_display_mobile_controls, get_display_mobile_controls


func set_display_mobile_controls(value: bool) -> void:
	display_mobile_controls = value
	emit_signal("display_mobile_controls_changed", value)


func get_display_mobile_controls() -> bool:
	return display_mobile_controls
