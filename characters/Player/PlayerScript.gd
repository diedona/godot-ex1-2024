extends CharacterBody2D

var speed: float = 0;
var max_speed = 200;
var acceleration = 1000;
var deceleration = 1500;
var direction = Vector2.ZERO;
var previous_direction = Vector2.ZERO;
var intended_direction = Vector2.ZERO;

func _physics_process(delta: float) -> void:

	print_debug("speed: ", speed);

	intended_direction = get_direction();
	
	print_debug("intended: ", intended_direction, "previous: ", previous_direction);

	if(speed == 0):
		previous_direction = intended_direction;

	speed = calculate_speed(delta);

	velocity = previous_direction * speed;
	move_and_slide();

func calculate_speed(delta: float) -> float:
	if(intended_direction == Vector2.ZERO || intended_direction != previous_direction):
		return clampf(speed - deceleration * delta, 0, speed);
		
	return clampf(speed + acceleration * delta, 0, max_speed);

func get_direction() -> Vector2:
	return Input.get_vector(
		"ui_left", 
		"ui_right", 
		"ui_up", 
		"ui_down"
	);
