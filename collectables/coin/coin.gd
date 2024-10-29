extends Node2D

signal coin_collected();

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func _on_collectable_collected() -> void:
	coin_collected.emit();
