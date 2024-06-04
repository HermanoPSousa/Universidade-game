extends Area2D

@onready var collision = $collision as CollisionShape2D
@onready var spikes = $spikes as Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready():
	collision.shape.size = spikes.get_rect().size
	#collision.shape.size = collision.get_rect().size
	
	
# função que observa a entrada do player nos espinhos e dispara as ações para 
# evento.
func _on_body_entered(body):
	
	#body.take_damage(Vector2(0, -250))
	if body.name == "player" && Globals.player_life > 0:
		#body.take_damage(Vector2(0, -250))
		Globals.player_life -= 1
		get_tree().reload_current_scene() #carrega a cena corrente
	elif body.name == "player" && Globals.player_life == 0:
		body.take_damage(Vector2(0, -250))	
	'''
	#se quantidade de vidas do player maior que 0 r alerta = 0
	if body.name == "player" && Globals.player_life > 0  &&  Globals.flag_alert == 0:
		Globals.player_life -= 1 #subrai as vidas
		get_tree().reload_current_scene() #carrega a cena corrente
	
	#se o player não tiver mais vidas e alerta igual a zero	
	elif body.name == "player" && Globals.player_life == 0 && Globals.flag_alert == 0:
		Globals.player_life -= 1 #subtrai mais 1 vida
		Globals.flag_alert == 2 #o alerta agora é igual a 2
		#chama a função que irá atribuir a continuidade para nó game over
		body.take_damage(Vector2(0, -250)) 
	#if body.name == "player" && body.has_method("take_damage"):
		#body.take_damage(Vector2(0, -250))
	'''
