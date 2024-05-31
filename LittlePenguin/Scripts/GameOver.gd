extends Control

@onready var game_over_fx = $gameOver_fx as AudioStreamPlayer


# Called when the node enters the  scene tree for the first time.
func _ready():
	$gameOver_fx.play()
	$VBoxContainer/restart_btn.grab_focus() # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_restart_btn_pressed():
	get_tree().change_scene_to_file("res://Levels/title_screen.tscn")


func _on_quit_game_btn_pressed():
	get_tree().quit()
