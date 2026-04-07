extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.unlocked_level += 1


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_ragequit_pressed() -> void:
	get_tree().quit()
	



func _on_next_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/level_select.tscn")
