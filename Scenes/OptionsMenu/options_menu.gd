extends Control

signal back_button_pressed


func _on_back_button_pressed():
	emit_signal("back_button_pressed")
