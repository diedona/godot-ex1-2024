extends Node2D
class_name Score

@export var label: Label;

var _score: int = 0;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	assert(label != null, "label is empty");

func on_coin_collected() -> void:
	_score += 1;
	print_debug("score: ", _score);
