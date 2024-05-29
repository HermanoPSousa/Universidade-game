extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	$return_btn.grab_focus()


func _on_return_btn_pressed():
	get_tree().change_scene_to_file("res://Levels/title_screen.tscn")
