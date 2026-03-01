extends CharacterBody2D

@onready var topo = $AnimatedSprite2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	if (velocity.x > 0 or velocity.x < -1):
		topo.play("rolling")	
	else:
		topo.play("idle")
	
	var isLeft = velocity.x < 0
	topo.flip_h = isLeft
	move_and_slide()


func _on_hitbox_body_entered(body):
	get_tree().change_scene_to_file("res://game_over.tscn")
