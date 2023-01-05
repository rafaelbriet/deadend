extends CanvasLayer

export(Texture) var pause_icon
export(Texture) var play_icon

onready var left_button : TouchScreenButton = $Left_TouchScreenButton
onready var right_button : TouchScreenButton = $Right_TouchScreenButton
onready var jump_button : TouchScreenButton = $Jump_TouchScreenButton
onready var attack_button : TouchScreenButton = $Attack_TouchScreenButton
onready var pause_button : TouchScreenButton = $Pause_TouchScreenButton

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
