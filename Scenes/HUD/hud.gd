extends CanvasLayer

export var king_path := NodePath()
export var hit_points_bar_path := NodePath()
export var stamina_bar_path := NodePath()
export var score_path := NodePath()
export var score_board_path := NodePath()
export var fade_in_duration : float = 0.25

onready var _king : King = get_node(king_path)
onready var _hit_points_bar : TextureProgress = get_node(hit_points_bar_path)
onready var _stamina_bar : TextureProgress = get_node(stamina_bar_path)
onready var _score : Score = get_node(score_path)
onready var _score_board : Label = get_node(score_board_path)


func _ready() -> void:
	# Set up King's Hit Points bar
	_king.hit_points.connect("hit_points_damaged", self, "_on_hit_points_damaged")
	_hit_points_bar.max_value = _king.hit_points.base_max_hit_points
	_hit_points_bar.value = _king.hit_points.base_max_hit_points
	
	# Set up level score
	_score.connect("score_changed", self, "_on_score_changed")
	_score_board.set_text(str(_score.current_score))
	
	#Set up King' Stamina bar
	_king.stamina.connect("hit_points_damaged", self, "_on_stamina_damaged")
	_stamina_bar.max_value = _king.stamina.base_max_hit_points
	_stamina_bar.value = _king.stamina.base_max_hit_points


func _on_hit_points_damaged(damage_origin) -> void:
	_hit_points_bar.value = _king.hit_points._current_hit_points


func _on_score_changed():
	_score_board.set_text(str(_score.current_score))


func _on_stamina_damaged(damage_origin):
	_stamina_bar.value = _king.stamina._current_hit_points
