class_name HitPoints
extends Node

signal hit_points_damaged
signal hit_points_depleted

export var base_max_hit_points : int = 100

var _current_hit_points : int = base_max_hit_points

func damage(damageAmount: int) -> void:
	print("%s took %d damage and has %d hit points left" % [owner.name, damageAmount, _current_hit_points])
	_current_hit_points -= damageAmount
	emit_signal("hit_points_damaged")
	
	if _current_hit_points <= 0:
		emit_signal("hit_points_depleted")
