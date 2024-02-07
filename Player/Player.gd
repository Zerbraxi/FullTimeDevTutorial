class_name Player

extends CharacterBody2D

@export var speed: float = 100.0
@export var acceleration: float = 0.25
@export var gravity: float = 500.0
@export var jump_velocity: float = 200.0


@onready var sprite: AnimatedSprite2D = $Sprite

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print_debug("Loaded")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func get_input_vector() -> Vector2:
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_axis("left","right")
	return input_vector
	
func apply_gravity(delta: float) -> void:
	velocity.y += gravity * delta
	#print_debug("gravity applied")
	
# lerp function needs 3 values
# lerp(value a, value b, rate at which we approach value b from a)
# since third value = 0.25 from acceleration variable, this provides the feeling of acceleration to get to value b
func apply_movement(input_vector: Vector2, delta: float) -> void:
	velocity.x = lerp(velocity.x, input_vector.x * speed, acceleration)
	
func apply_velocity(delta: float) -> void:
	move_and_slide()
	
func apply_jump():
	velocity.y -= jump_velocity
	
func change_direciton(direction) -> void:
	if sign(direction) == -1:
		sprite.flip_h = true
	elif sign(direction) == 1:
		sprite.flip_h = false

