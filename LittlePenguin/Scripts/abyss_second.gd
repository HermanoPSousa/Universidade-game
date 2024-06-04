extends Area2D

@onready var collision_second = $collision_second as CollisionShape2D

#função que identifica se o player entrou no collision (caiu no fosso)
func _on_body_entered(body):
	
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
	'''
