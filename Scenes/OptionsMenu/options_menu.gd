extends Control

signal back_button_pressed

onready var _master_audio_bus := AudioServer.get_bus_index("Master")
onready var _music_audio_bus := AudioServer.get_bus_index("Music")
onready var _sfx_audio_bus := AudioServer.get_bus_index("SFX")
onready var _master_volume_slider : Slider = $VBoxContainer/MasterVolume/HSlider
onready var _music_volume_slider : Slider = $VBoxContainer/MusicVolume/HSlider
onready var _sfx_volume_slider : Slider = $VBoxContainer/SoundEffectsVolume/HSlider


func _ready():
	_master_volume_slider.value = db2linear(AudioServer.get_bus_volume_db(_master_audio_bus))
	_music_volume_slider.value = db2linear(AudioServer.get_bus_volume_db(_music_audio_bus))
	_sfx_volume_slider.value = db2linear(AudioServer.get_bus_volume_db(_master_audio_bus))


func _on_back_button_pressed():
	emit_signal("back_button_pressed")


func _on_master_volume_slider_value_changed(value):
	AudioServer.set_bus_volume_db(_master_audio_bus, linear2db(_master_volume_slider.value))


func _on_music_volume_slider_value_changed(value):
	AudioServer.set_bus_volume_db(_music_audio_bus, linear2db(_music_volume_slider.value))


func _on_sound_effect_volume_value_changed(value):
	AudioServer.set_bus_volume_db(_sfx_audio_bus, linear2db(_sfx_volume_slider.value))
