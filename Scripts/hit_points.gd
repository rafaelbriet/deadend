class_name HitPoints
extends Node

signal hit_points_damaged(damage_origin)
signal hit_points_depleted

enum DamageOrigin {ENEMY, STAMINA}

export var base_max_hit_points : int = 100

var _current_hit_points : int


func _ready()-> void:
	_current_hit_points = base_max_hit_points


func damage(damageAmount: int, damageOrigin = DamageOrigin.ENEMY) -> void:
	print("%s took %d damage and has %d hit points left" % [owner.name, damageAmount, _current_hit_points])
	_current_hit_points -= damageAmount
	emit_signal("hit_points_damaged", damageOrigin)
	
	if _current_hit_points <= 0:
		emit_signal("hit_points_depleted")
