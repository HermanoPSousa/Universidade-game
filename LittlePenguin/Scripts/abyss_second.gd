extends Area2D

@onready var collision_second = $collision_second as CollisionShape2D

#função que identifica se o player entrou no collision (caiu no fosso)
func _on_body_entered(body):
	
	if body.name == "player" && Globals.player_life > 0:
		Globals.player_life -= 1
		get_tree().reload_current_scene() #carrega a cena corrente
	
	#se foi o player que colidiu e tinha 0 vidas, chama a função para verificar se o player morreu	
	elif body.name == "player" && Globals.player_life == 0: 
		body.take_damage(Vector2(0, -250))
