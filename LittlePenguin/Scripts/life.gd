extends Area2D

@onready var life_fx = $life_fx as AudioStreamPlayer

var lifes:= 1

#função que o player coleta vida e adiciona
func _on_body_entered(body):
	$anim.play("collect")
	$life_fx.play()
	await $collision.call_deferred("queue_free") #evita a colisão dupla de vidas
	Globals.player_life += lifes
	


func _on_anim_animation_finished():
	queue_free()
