extends CanvasLayer

export(Texture) var pause_icon
export(Texture) var play_icon

onready var left_button : TouchScreenButton = $TouchButtons/Left_TouchScreenButton
onready var right_button : TouchScreenButton = $TouchButtons/Right_TouchScreenButton
onready var jump_button : TouchScreenButton = $TouchButtons/Jump_TouchScreenButton
onready var attack_button : TouchScreenButton = $TouchButtons/Attack_TouchScreenButton
onready var pause_button : TouchScreenButton = $TouchButtons/Pause_TouchScreenButton
onready var _touch_buttons : Node = $TouchButtons
onready var _game_options : GameOptions = get_node("/root/GameOptions")

func _ready() -> void:
	_game_options.connect("display_mobile_controls_changed", self, "_on_display_mobile_controls_changed")
	_on_display_mobile_controls_changed(_game_options.display_mobile_controls)


func update_paused_icon(is_paused: bool) -> void:
	if is_paused:
		pause_button.normal = play_icon
		left_button.visible = false
		right_button.visible = false
		jump_button.visible = false
		attack_button.visible = false
	else:
		pause_button.normal = pause_icon
		left_button.visible = true
		right_button.visible = true
		jump_button.visible = true
		attack_button.visible = true


func _on_display_mobile_controls_changed(value: bool) -> void:
	if _game_options.display_mobile_controls  and not _touch_buttons.is_inside_tree():
		add_child(_touch_buttons)
	elif not _game_options.display_mobile_controls  and _touch_buttons.is_inside_tree():
		remove_child(_touch_buttons)
