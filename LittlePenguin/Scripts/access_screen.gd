extends Control

@onready var start_btn = $MarginContainer/HBoxContainer/VBoxContainer/start_btn
@onready var access_screen_fx = $access_screen_fx as AudioStreamPlayer


# Called when the node enters the scene tree for the first time.
func _ready():
	start_btn.grab_focus() #deixando o botão iniciar com o foco
	access_screen_fx.play() #tocando a música ao entrar nesta tela
	Globals.player_life = 0
	Globals.coins = 0
	Globals.score = 0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

#sair do jogo
func _on_quit_btn_pressed():
	get_tree().quit()

#acessar a tela dos créditos dos arquivos utilizados no jogo
func _on_credits_btn_pressed():
	get_tree().change_scene_to_file("res://Scenes/credits.tscn")

#acessar a tela de informação de controles do teclado usado no jogo
func _on_controls_btn_pressed():
	get_tree().change_scene_to_file("res://Scenes/control_screen.tscn")

#iniciar o jogo
func _on_start_btn_pressed():
	get_tree().change_scene_to_file("res://Levels/world_01.tscn")
