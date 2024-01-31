class_name StateMachine

extends Node

@export var current_state: State
var states: Dictionary = {}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	# Check if child nodes have states attached
	for child in get_children():
		if child is State:
			states[child.name] = child
			print_debug(child.name)
			child.transition.connect(on_child_transition)
		else:
			push_warning("State machine contains incompatible child node.")
			
	await owner.ready
	# print_debug("await complete")
	current_state.enter()
	print_debug(current_state.name)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	current_state.update(delta)
	
	
func _physics_process(delta: float) -> void:
	current_state.physics_update(delta)
	
	
# Check if state has changed
func on_child_transition(new_state_name: StringName) -> void:
	var new_state = states.get(new_state_name)
	if new_state != null:
		if new_state != current_state:
			current_state.exit()
			new_state.enter()
			current_state = new_state
	else:
		push_warning("State does not exist.")
			
