extends Node2D

@onready var player := $player as CharacterBody2D
@onready var camera := $camera as Camera2D
@onready var control = $HUD/control
@onready var world_fx = $world_fx


# Called when the node enters the scene tree for the first time.
func _ready():
	world_fx.play()
	player.follow_camera(camera)
	player.player_has_died.connect(game_over)
	control.time_is_up.connect(game_over)
	Globals.coins = 0
	Globals.score = 0
	Globals.player_life = 2

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func reload_game():
	await get_tree().create_timer(1.0).timeout
	player.player_has_died_connect(game_over)
	Globals.coins = 0
	Globals.score = 0
	Globals.player_life = 2
	get_tree().reload_current_scene()
	
func game_over():
	get_tree().change_scene_to_file("res://Levels/title_screen.tscn")
	
