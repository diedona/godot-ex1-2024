extends Node2D

@export var score: Node;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	assert(score != null, "score is not set in scene");

	for coin in get_tree().get_nodes_in_group("Collectable"):
		coin.connect("coin_collected", score.on_coin_collected);