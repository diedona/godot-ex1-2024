extends Node

signal collected();

@export var parent: Node2D;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	assert(parent != null, "parent is not set");
	
	print_debug("collectable ready");

func _on_area_2d_body_entered(body: Node2D) -> void:
	if(body.owner.is_in_group("Player")):
		parent.queue_free();
		collected.emit();
