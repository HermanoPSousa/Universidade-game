extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	Globals.coins = 0
	Globals.score = 0
	Globals.player_life = 2
	#$@onready var v_box_container = $VBoxContainer

	#$MarginContainer/HBoxContainer/VBoxContainer/start_btn.grab_focus()
	$VBoxContainer/start_btn.grab_focus()


func _on_start_btn_pressed():
	get_tree().change_scene_to_file("res://Levels/world_01.tscn")


func _on_credits_btn_pressed():	
	get_tree().change_scene_to_file("res://Scenes/credits.tscn")


func _on_quit_btn_pressed():
	get_tree().quit()


func _on_controls_btn_pressed():	
	get_tree().change_scene_to_file("res://Scenes/control_screen.tscn")
	

func _on_transition_out_child_exiting_tree(node):
	pass
