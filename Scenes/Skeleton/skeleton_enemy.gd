class_name SkeletonEnemy
extends KinematicBody2D

export var animation_player_path := NodePath()
export var sprite_path := NodePath()
export var base_gravity : float = 980
export var base_walk_speed : float = 100
export var base_attack_distance : float = 150
export var base_attack_damage : int = 40
export var attack_hit_box_path := NodePath()
export var hit_points_path := NodePath()

var velocity : Vector2 = Vector2.ZERO
var target : KinematicBody2D

onready var animation_player : AnimationPlayer = get_node(animation_player_path)
onready var sprite : Sprite = get_node(sprite_path)
onready var hit_points : HitPoints = get_node(hit_points_path)
onready var attack_hit_box : Area2D = get_node(attack_hit_box_path)

func flip_attack_hit_box(flip: bool) -> void:
	if flip:
		attack_hit_box.scale.x = -1
	else:
		attack_hit_box.scale.x = 1


func _on_attack_hit_box_area_entered(area):
	if area.is_in_group("Damageable"):
		area.owner.hit_points.damage(base_attack_damage)
