extends Node2D

@onready var player := $player as CharacterBody2D
@onready var camera := $camera as Camera2D
@onready var control = $HUD/control


func _ready():
	player.follow_camera(camera)
	player.player_has_died.connect(game_over)
	control.time_is_up.connect(game_over)


func reload_game():
	await get_tree().create_timer(1.0).timeout

#exibe a tela GAME OVER	
func game_over():
	get_tree().change_scene_to_file("res://Scenes/GameOver.tscn")
	
