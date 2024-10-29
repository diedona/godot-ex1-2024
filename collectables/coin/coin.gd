extends Node2D

signal coin_collected(body: Node2D);

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Collectable.collected.connect(_on_collectable_collected);

func _on_collectable_collected(body: Node2D) -> void:
	coin_collected.emit(body);
	queue_free();
