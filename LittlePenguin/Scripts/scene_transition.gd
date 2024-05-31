extends CanvasLayer

@onready var background = $background

func ready():
	#show_new_scene()
	pass

func change_scene(path, delay = 3.5):
	var scene_transition = get_tree().create_tween()
	scene_transition.tween_property(background, "threshold", 1.0, 0.5).set_delay(delay)
	await scene_transition.finished
	assert(get_tree().change_scene_to_file(path) == OK)
	

func show_new_scene():
	var show_transition = get_tree().create_tween()
	show_transition.tween_property(background, "threshold", 0.0, 0.5).from(1.0)
