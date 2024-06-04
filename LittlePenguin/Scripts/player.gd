extends CharacterBody2D

@onready var player_jump = $player_jump as AudioStreamPlayer

const SPEED = 300.0
const JUMP_FORCE = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var is_jumping := false
var is_hurted := false
var knockback_vector := Vector2.ZERO
var knockback_power := 20
var direction
var flag_alert := 0

@onready var animation := $anim as AnimatedSprite2D
@onready var remote_transform := $remote as RemoteTransform2D

signal player_has_died()

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_FORCE
		is_jumping = true
		player_jump.play()
	elif is_on_floor():
		is_jumping = false

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	direction = Input.get_axis("ui_left", "ui_right")
	if direction != 0:
		velocity.x = direction * SPEED
		animation.scale.x = direction
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	if knockback_vector != Vector2.ZERO:
		velocity = knockback_vector
	
	_set_state()	
	move_and_slide()
	
	

func _on_hurtbox_body_entered(body):
	#28/5 14:09
	#var knockback = Vector2( (global_position.x - body.global_position.x) * knockback_power, - 200)
	#take_damage(knockback)
	
	#anterior a 28/05
	#if body.is_in_group("enemies"):
	#	queue_free()
	
	#28/5 - 14:10
	#if Globals.player_life < 0:	
		#player_died.play()	
		#queue_free()
		
	#else:
	
	#ativando em28/5-14:12
	if $ray_right.is_colliding():
		take_damage(Vector2(-200, -200))
	elif $ray_left.is_colliding():
		take_damage(Vector2(200, -200))

func follow_camera(camera):
	var camera_path = camera.get_path()		
	remote_transform.remote_path = camera_path
	
	
	
func take_damage(knockback_force := Vector2.ZERO, duration := 0.25):
	
	#if Globals.player_life > 0 && Globals.flag_alert == 0:
		#Globals.player_life -= 1
		#print("passou aqui em vida maior que 0")
	#elif Globals.player_life == 0 && Globals.flag_alert == 0:
		#"passou aqui em vida maior que 0"
		#Globals.player_life -= 1 #subtrai mais 1 vida
		#Globals.flag_alert == 2 #o alerta agora é igual a 2
		#queue_free()
		#emit_signal("player_has_died")
		
	#if Globals.player_life > 0:
		#Globals.player_life -= 1
	#else:
		#queue_free()		
		#emit_signal("player_has_died")
	
	if knockback_force != Vector2.ZERO:
		knockback_vector = knockback_force
		print("passou aqui no Knockbac")
		if Globals.player_life > 0 && Globals.flag_alert == 0:
			print("VIDA > 0 e ALERTA = 0")
			var knockback_tween := get_tree().create_tween()		
			knockback_tween.parallel().tween_property(self, "knockback_vector", Vector2.ZERO, duration)
			animation.modulate = Color(1, 0, 0, 1)
			knockback_tween.parallel().tween_property(animation, "modulate", Color(1, 1 ,1, 1), duration)
			Globals.player_life -= 1
		elif Globals.player_life == 0 && Globals.flag_alert == 0:
			print("VIDA = 0 e ALERTA = 0")
			#var knockback_tween := get_tree().create_tween()		
			#knockback_tween.parallel().tween_property(self, "knockback_vector", Vector2.ZERO, duration)
			#animation.modulate = Color(1, 0, 0, 1)
			#knockback_tween.parallel().tween_property(animation, "modulate", Color(1, 1 ,1, 1), duration)
			Globals.player_life -= 1 #subtrai mais 1 vida
			Globals.flag_alert == 2 #o alerta agora é igual a 2
			#if Globals.player_life < 0 && Globals.flag_alert == 2:
			print("VIDA < 0 e ALERTA = 2")
			queue_free()
			emit_signal("player_has_died")
		#------------------------------------------------------------------------
		#if Globals.player_life >0:	
			#var knockback_tween := get_tree().create_tween()		
			#knockback_tween.parallel().tween_property(self, "knockback_vector", Vector2.ZERO, duration)
			#animation.modulate = Color(1, 0, 0, 1)
			#knockback_tween.parallel().tween_property(animation, "modulate", Color(1, 1 ,1, 1), duration)
			#flag_alert = 0
			
		#elif Globals.player_life ==0:
			
			#if flag_alert == 0:
				#var knockback_tween := get_tree().create_tween()	
				#knockback_tween.parallel().tween_property(self, "knockback_vector", Vector2.ZERO, duration)
				#animation.modulate = Color(1, 0, 0, 1)
				#knockback_tween.parallel().tween_property(animation, "modulate", Color(1, 1 ,1, 1), duration)
				#flag_alert = 2
				
		#elif Globals.player_life < 0:
			
			#if flag_alert == 2:
				#queue_free()		
				#emit_signal("player_has_died")
				#flag_alert == 0
	#else:
		#is_hurted = true
		#await get_tree().create_timer(.3).timeout
		#is_hurted = false
		#print("senao")
		#print("knockback_force: " + str(knockback_force))
		#print("knockback_force: " + str(Vector2.ZERO))
	
	
	
func _set_state():
	var state = "idle"
	
	if !is_on_floor():
		state = "jump"
	elif direction != 0:
		state = "run"
		
	if  is_hurted:
		state = "hurt"
		
	if animation.name != state:
		animation.play(state)
		

