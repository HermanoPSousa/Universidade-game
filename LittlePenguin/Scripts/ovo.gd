extends Area2D

@onready var egg_fx = $egg_fx as AudioStreamPlayer

@onready var scene_transition = $"../scene_transition"
#@onready var transition = $"../transition"

@export var next_level : String = ""


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	$anim.play("collect")
	egg_fx.play()
	if body.name == "player" and !next_level == "":
		scene_transition.change_scene(next_level)
	else:
		print("scene no load")
	


func _on_anim_animation_finished():
	queue_free()
	
