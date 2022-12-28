class_name SkeletonState
extends State

var root : SkeletonEnemy


func _ready() -> void:
	yield(owner, "ready")
	root = owner as SkeletonEnemy
	assert(root != null)


func _enter(args := {}) -> void:
	#print("signals connected")
	root.hit_points.connect("hit_points_damaged", self, "on_hit_points_damaged")
	root.hit_points.connect("hit_points_depleted", self, "on_hit_points_depleted")


func _exit() -> void:
	#print("signals disconnected")
	root.hit_points.disconnect("hit_points_damaged", self, "on_hit_points_damaged")
	root.hit_points.disconnect("hit_points_depleted", self, "on_hit_points_depleted")


func on_hit_points_damaged() -> void:
	state_machine.transition_to("Hit_State")
	
func on_hit_points_depleted() -> void:
	state_machine.transition_to("Death_State")
