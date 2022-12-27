extends Node

export var start_maximezed : bool = false

func _ready():
	OS.set_window_maximized(start_maximezed)
