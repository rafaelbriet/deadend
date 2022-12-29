class_name Score
extends Node

signal score_changed

var current_score : int = 0


func add_score(scoreAmount: int) -> void:
	current_score += scoreAmount
	emit_signal("score_changed")
