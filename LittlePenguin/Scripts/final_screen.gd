extends Control

@onready var final_screen_fx = $finalScreen_fx as AudioStreamPlayer


# Called when the node enters the scene tree for the first time.
func _ready():
	$restart_btn.grab_focus()
	final_screen_fx.play()
	 # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_restart_btn_pressed():
	get_tree().change_scene_to_file("res://Levels/title_screen.tscn")


func _on_quit_game_btn_pressed():
	get_tree().quit()