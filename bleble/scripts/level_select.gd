extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for button in get_tree().get_nodes_in_group("level_buttons"):
		if button.level_number > Global.unlocked_level:
			button.disabled = true
		else:
			button.disabled = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("res://control.tscn")


func _on_level_1_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/level-1.tscn")
	

func _on_level_2_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/level-2.tscn")


func _on_level_3_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/level-3.tscn")
