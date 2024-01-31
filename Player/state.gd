class_name State

extends Node

# signal to reference by other nodes
signal transition(new_state_name: StringName)

var player: Player


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	await owner.ready
	player = owner as Player
	

# When a state is entered
func enter() -> void:
	pass
	
# When a state is exited
func exit() -> void:
	pass
	
# General function called every frame
func update(delta: float) -> void:
	pass
	
# Physics function called every frame
func physics_update(delta: float) -> void:
	pass
