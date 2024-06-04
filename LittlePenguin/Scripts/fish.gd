extends Area2D

@onready var fish_fx = $fish_fx as AudioStreamPlayer


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	$anim.play("collect")
	fish_fx.play()

func _on_anim_animation_finished():
	#$pinguim_fx.play()
	queue_free()
