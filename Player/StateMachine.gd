class_name StateMachine

extends Node

@export var current_state : State
var states: Dictionary = {}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	# Check if child nodes have states attached
	for child in get_children():
		if child is State:
			states[child.name] = child
			child.transition.connect(on_child_transition)
		else:
			push_warning("State machine contains incompatible child node.")
			
	await owner.ready
	current_state._enter()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	current_state._process(delta)
	
	
func _physics_process(delta: float) -> void:
	current_state._physics_process(delta)
	
	
# Check if state has changed
func on_child_transition(new_state_name: StringName) -> void:
	var new_state = states.get(new_state_name)
	if new_state != null:
		if new_state != current_state:
			current_state._exit()
			new_state._enter()
			current_state = new_state
	else:
		push_warning("State does not exist.")
			
