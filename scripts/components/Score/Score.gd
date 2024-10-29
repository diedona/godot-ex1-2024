extends Node2D
class_name Score

@export var label_score: Label;

var _score: int = 0;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	assert(label_score != null, "label_score is null");

func on_coin_collected() -> void:
	_score += 1;
	update_score();

func update_score() -> void:
	label_score.text = str(_score);
