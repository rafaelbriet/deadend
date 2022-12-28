# CREDITS 
# Finite State Machine in Godot by Nathan Lovato (GDQuest)
# https://www.gdquest.com/tutorial/godot/design-patterns/finite-state-machine/
class_name StateMachine
extends Node

signal state_transitioned(state_name)

export var initial_state := NodePath()

onready var _current_state : State = get_node(initial_state)


func _ready() -> void:
	yield(owner, "ready")
	
	for child in get_children():
		var state = child as State
		state.state_machine = self
	
	_current_state._enter()


func _unhandled_input(event: InputEvent) -> void:
	_current_state._handle_input(event)


func _process(delta: float) -> void:
	_current_state._process_state(delta)


func _physics_process(delta: float) -> void:
	_current_state._physics_process_state(delta)


func transition_to(target_state_name: String, args: Dictionary = {}) -> void:
	if not has_node(target_state_name):
		push_error("State \"" + target_state_name + "\" not found.")
		return
	
	_current_state._exit()
	_current_state = get_node(target_state_name)
	_current_state._enter(args)
	emit_signal("state_transitioned", _current_state.name)
