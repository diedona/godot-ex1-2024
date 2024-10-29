extends Node

@export var label: Label;

var _score: int = 0;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	assert(label != null, "label is empty");

