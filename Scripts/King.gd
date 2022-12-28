class_name King
extends KinematicBody2D

export var animation_player_path := NodePath()
export var sprite_path := NodePath()
export var base_gravity : float = 300
export var base_walk_speed : float = 400
export var base_jump_impulse : float = 800

var velocity : Vector2 = Vector2.ZERO
var can_use_next_attack : bool = false

onready var animation_player : AnimationPlayer = get_node(animation_player_path)
onready var sprite : Sprite = get_node(sprite_path)


func set_can_use_next_attack(value: bool) -> void:
	can_use_next_attack = value
