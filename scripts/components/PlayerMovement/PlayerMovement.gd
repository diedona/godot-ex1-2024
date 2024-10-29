extends Node
class_name PlayerMovement

@export var acceleration: int  = 1000;
@export var deceleration: int  = 1500;
@export var max_speed: int  = 200;
@export var character_body_2d: CharacterBody2D;

var _current_speed: float = 0;
var _previous_direction = Vector2.ZERO;
var _target_direction = Vector2.ZERO;

func _ready():
	print_debug("PlayerMovement is ready");
	assert(character_body_2d != null, "no CharacterBody2D for the player movement");

func move(delta: float):

	# gets the direction the player wants to go
	_target_direction = _get_direction();

	# if the player is stopped, we can change directions
	if(_current_speed == 0):
		_previous_direction = _target_direction;

	_current_speed = _calculate_speed(delta);

	# move plz
	character_body_2d.velocity = _previous_direction * _current_speed;
	character_body_2d.move_and_slide();



func _calculate_speed(delta: float) -> float:
	if(_target_direction == Vector2.ZERO || _target_direction != _previous_direction):
		return clampf(_current_speed - deceleration * delta, 0, _current_speed);

	return clampf(_current_speed + acceleration * delta, 0, max_speed);

func _get_direction() -> Vector2:
	return Input.get_vector(
		"ui_left", 
		"ui_right", 
		"ui_up", 
		"ui_down"
	);