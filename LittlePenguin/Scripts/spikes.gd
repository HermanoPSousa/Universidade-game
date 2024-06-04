extends Area2D

@onready var collision = $collision as CollisionShape2D
@onready var spikes = $spikes as Sprite2D


func _ready():
	collision.shape.size = spikes.get_rect().size #tamanho do shape de colisão
	
	
	
# função que observa a entrada do player nos cactos e dispara as ações para 
# evento.
func _on_body_entered(body):
	
	if body.name == "player" && Globals.player_life > 0: #se é o player e ainda tiver vida
		Globals.player_life -= 1
		get_tree().reload_current_scene() #carrega a cena corrente
	elif body.name == "player" && Globals.player_life == 0: #senão tiver mais vida
		body.take_damage(Vector2(0, -250))	
	
