extends RigidBody2D

@export var speed:float = 32.0
@export var jump_height:float = 48.0
var max_speed:float = 250

func get_input():
	var input_direction:float = 0.0
	if Input.is_action_pressed("Move Left"):
		input_direction -= 1.0
	if Input.is_action_pressed("Move Right"):
		input_direction += 1.0
	return input_direction
	

func _physics_process(delta: float) -> void:
	print(get_contact_count())
	var input_direction = get_input()
	if input_direction != 0:
		if abs(linear_velocity.x) < max_speed:
			apply_impulse(Vector2(input_direction * speed, 0))

func _integrate_forces(state: PhysicsDirectBodyState2D) -> void:
	if Input.is_action_just_pressed("Jump") and is_on_ground():
		apply_impulse(Vector2(0, -(jump_height*10)))

func is_on_ground() -> bool:
	return get_contact_count() > 0
