extends Node2D

@onready var player := $player as CharacterBody2D
@onready var camera := $camera as Camera2D
@onready var control = $HUD/control

# Called when the node enters the scene tree for the first time.
func _ready():
	player.follow_camera(camera)
	player.player_has_died.connect(game_over)
	control.time_is_up.connect(game_over)
	$HUD/control/container/coins_container/coins_icon

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func reload_game():
	await get_tree().create_timer(1.0).timeout
	player.player_has_died_connect("game_over")
	get_tree().reload_current_scene()
	
func game_over():
	get_tree().change_scene_to_file("res://Scenes/GameOver.tscn")
