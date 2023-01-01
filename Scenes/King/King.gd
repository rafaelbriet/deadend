class_name King
extends KinematicBody2D

export var animation_player_path := NodePath()
export var sprite_path := NodePath()
export var sword_hit_box_path := NodePath()
export var hit_points_path := NodePath()
export var stamina_points_path := NodePath()
export var base_gravity : float = 300
export var gravity_multiplier : float = 2.0
export var base_walk_speed : float = 400
export var base_jump_impulse : float = 800
export var base_jump_move_speed : float = 100
export var base_attack_damage : int = 40
export var jump_audio_stream_path :=  NodePath()
export var death_audio_stream_path :=  NodePath()
export var attack_1_stamina_cost : float = 3.0
export var attack_2_stamina_cost : float = 4.0
export var attack_3_stamina_cost : float = 5.0
export var jump_staminha_cost : float = 5.0
export var walk_stamina_cost : float = 1.0
export var stamina_recover_amount : int = 3
export var stamina_recover_wait_time : float = 1.0

var velocity : Vector2 = Vector2.ZERO
var can_use_next_attack : bool = false

onready var animation_player : AnimationPlayer = get_node(animation_player_path)
onready var sprite : Sprite = get_node(sprite_path)
onready var hit_points : HitPoints = get_node(hit_points_path)
onready var stamina : StaminaPoints = get_node(stamina_points_path)
onready var jump_audio_stream : AudioStreamPlayer = get_node(jump_audio_stream_path)
onready var death_audio_stream : AudioStreamPlayer = get_node(death_audio_stream_path)
onready var _sword_hit_box : Area2D = get_node(sword_hit_box_path)

func set_can_use_next_attack(value: bool) -> void:
	can_use_next_attack = value


func run_damage_stamina() -> void:
	stamina.damage(walk_stamina_cost)


func flip_sword_hit_box(flip: bool) -> void:
	if flip:
		_sword_hit_box.scale.x = -1.0
	else:
		_sword_hit_box.scale.x = 1.0


func _on_sword_hit_box_area_entered(area):
	if area.is_in_group("Damageable"):
		area.owner.hit_points.damage(base_attack_damage)
