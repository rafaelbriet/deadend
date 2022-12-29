extends CanvasLayer

export var king_path := NodePath()
export var hit_points_bar_path := NodePath()

onready var _king : King = get_node(king_path)
onready var _hit_points_bar : TextureProgress = get_node(hit_points_bar_path)


func _ready() -> void:
	_king.hit_points.connect("hit_points_damaged", self, "_on_hit_points_damaged")
	_hit_points_bar.max_value = _king.hit_points.base_max_hit_points
	_hit_points_bar.value = _king.hit_points.base_max_hit_points

func _on_hit_points_damaged() -> void:
	_hit_points_bar.value = _king.hit_points._current_hit_points
