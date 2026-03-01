extends CharacterBody2D

@export var speed: float = 100 
@export var topo: Node2D

func _physics_process(delta: float) -> void:
	if topo == null:
		return
		
	var direction = (topo.global_position - global_position).normalized()
	velocity = velocity.lerp(direction * speed, 0.1)
	
	move_and_slide()
