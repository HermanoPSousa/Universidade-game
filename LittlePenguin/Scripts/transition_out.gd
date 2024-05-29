extends CanvasLayer

@onready var color_rect = $color_rect

# Called when the node enters the scene tree for the first time.
func _ready():
	show_new_scene()
	

func change_scene(path, delay = 2.5):
	var scene_transition_out = get_tree().create_tween()
	scene_transition_out.tween_property(color_rect, "threshold", 8.0, 0.9).set_delay(delay)
	await scene_transition_out.finished
	assert(get_tree().change_scene_to_file(path) == OK)
	

func show_new_scene():
	var show_transition_out = get_tree().create_tween()
	show_transition_out.tween_property(color_rect, "threshold", 0.0, 0.9).from(1.0)
