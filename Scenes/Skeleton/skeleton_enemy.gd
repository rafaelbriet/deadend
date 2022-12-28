class_name SkeletonEnemy
extends KinematicBody2D

export var animation_player_path := NodePath()
export var sprite_path := NodePath()
export var base_gravity : float = 980
export var base_walk_speed : float = 100
export var base_attack_distance : float = 150
export var hit_points_path := NodePath()

var velocity : Vector2 = Vector2.ZERO
var target : KinematicBody2D

onready var animation_player : AnimationPlayer = get_node(animation_player_path)
onready var sprite : Sprite = get_node(sprite_path)
onready var hit_points : HitPoints = get_node(hit_points_path)
