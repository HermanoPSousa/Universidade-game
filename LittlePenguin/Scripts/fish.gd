extends Area2D

@onready var fish_fx = $fish_fx as AudioStreamPlayer

#função que o player alimenta-se com o peixe
func _on_body_entered(body):
	$anim.play("collect")
	fish_fx.play()

#fim da animação
func _on_anim_animation_finished():
	#$pinguim_fx.play()
	queue_free()
