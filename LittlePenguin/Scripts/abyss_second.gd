extends Area2D

@onready var collision_second = $collision_second as CollisionShape2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	if body.name == "player" && body.has_method("take_damage"):
		body.take_damage(Vector2(0, -250))
		Globals.player_life < 0
		Globals.flag_alert = 2
