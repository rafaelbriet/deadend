extends Node

export var fade_out_duration : float = 1.0

onready var _tween : Tween = $Tween
onready var _king : King = $King
onready var _fade_out_canvas : CanvasLayer = $FadeOut
onready var _fade_out_color_rect : ColorRect = $FadeOut/ColorRect


func _ready() -> void:
	_fade_out_canvas.visible = false
	_king.hit_points.connect("hit_points_depleted", self, "_on_hit_points_depleted")
	_tween.interpolate_property(_fade_out_color_rect, 
			"modulate", 
			Color(1.0, 1.0, 1.0, 0.0), 
			Color(1.0, 1.0, 1.0, 1.0), 
			fade_out_duration,
			Tween.TRANS_BOUNCE)

func _on_hit_points_depleted() -> void:
	_fade_out_canvas.visible = true
	_tween.start()
