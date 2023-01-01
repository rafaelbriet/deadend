class_name KingState
extends State

var root : King


func _ready() -> void:
	yield(owner, "ready")
	root = owner as King
	assert(root != null)


func _enter(args := {}) -> void:
	root.hit_points.connect("hit_points_damaged", self, "on_hit_points_damaged")
	root.hit_points.connect("hit_points_depleted", self, "on_hit_points_depleted")


func _exit() -> void:
	root.hit_points.disconnect("hit_points_damaged", self, "on_hit_points_damaged")
	root.hit_points.disconnect("hit_points_depleted", self, "on_hit_points_depleted")


func on_hit_points_damaged(damage_origin) -> void:
	if damage_origin == HitPoints.DamageOrigin.ENEMY:
		state_machine.transition_to("Hit_State")
	else:
		print("Damage Origin: Stamina")

func on_hit_points_depleted() -> void:
	state_machine.transition_to("Death_State")
