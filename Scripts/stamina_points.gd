class_name StaminaPoints
extends HitPoints

export var hit_points_path := NodePath()

onready var _hit_points : HitPoints = get_node(hit_points_path)


## Deals demage to the stamina
func damage(damageAmount: int) -> void:
	.damage(damageAmount)
	
	if _current_hit_points < 0:
		_hit_points.damage(damageAmount)
		_current_hit_points = 0
	
