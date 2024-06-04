extends Area2D

@onready var egg_fx = $egg_fx as AudioStreamPlayer
@onready var scene_transition = $"../scene_transition"
@export var next_level : String = ""

#quando o player entra no espaço do componente ovo é verificado se há um cenário
#vinculado. Caso sim, o cenário é chamado. Senão, exibe mensagem "Scene no load"
func _on_body_entered(body):
	$anim.play("collect")
	egg_fx.play()
	if body.name == "player" and !next_level == "":
		scene_transition.change_scene(next_level)
	else:
		print("scene no load")
	

#finaliza o cenário
func _on_anim_animation_finished():
	queue_free()
	
