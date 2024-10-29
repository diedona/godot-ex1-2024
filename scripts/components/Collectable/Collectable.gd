extends Node

signal collected();

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print_debug("collectable ready");

func _on_area_2d_body_entered(body: Node2D) -> void:
	if(body.owner.is_in_group("Player")):
		collected.emit();
