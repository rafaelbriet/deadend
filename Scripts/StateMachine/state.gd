# CREDITS 
# Finite State Machine in Godot by Nathan Lovato (GDQuest)
# https://www.gdquest.com/tutorial/godot/design-patterns/finite-state-machine/
class_name State
extends Node

var state_machine = null

func _handle_input(event: InputEvent) -> void:
	pass


func _process_state(delta: float) -> void:
	pass


func _physics_process_state(delta: float) -> void:
	pass


func _enter(args := {}) -> void:
	pass


func _exit() -> void:
	pass
