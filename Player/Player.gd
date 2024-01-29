extends CharacterBody2D

var gravity: int = ProjectSettings.get_setting("physics/2d/default_gravity")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if not is_on_floor():
		apply_gravity(delta)
		
		# Move character
		move_and_slide()
	
# Apply Gravity
func apply_gravity(delta: float) -> void:
	velocity.y += gravity * delta
	
	
	

