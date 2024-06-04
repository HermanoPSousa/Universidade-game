extends CharacterBody2D

@onready var player_jump = $player_jump as AudioStreamPlayer

const SPEED = 300.0
const JUMP_FORCE = -400.0

# variáveis do componente
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity") #gravidade
var is_jumping := false #se saltou
var is_hurted := false #se sofreu dano
var knockback_vector := Vector2.ZERO #bate volta ao se chocar com o inimigo
var knockback_power := 20
var direction
var flag_alert := 0 #sinaliza quando tiver vidas igual a zero

@onready var animation := $anim as AnimatedSprite2D
@onready var remote_transform := $remote as RemoteTransform2D

signal player_has_died() #emite sinal quando está morto

func _physics_process(delta):
	# adiciona a gravidade
	if not is_on_floor():
		velocity.y += gravity * delta

	# trabalhando o salto ao apertar a barra de espaço no teclado
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_FORCE
		is_jumping = true
		player_jump.play()
	elif is_on_floor():
		is_jumping = false

	# obtem a direção de entrada e o controle de movimento ou desaceleração.
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
	
	
#função que observa o impacto do player no inimigo. Se este foi a direita ou a esquerda.
func _on_hurtbox_body_entered(body):
	if $ray_right.is_colliding():
		take_damage(Vector2(-200, -200))
	elif $ray_left.is_colliding():
		take_damage(Vector2(200, -200))

#se o player morre, a câmera não perde o foco
func follow_camera(camera):
	var camera_path = camera.get_path()		
	remote_transform.remote_path = camera_path
	
	
#função que observa os danos recebidos pelo player oriundos de inimigos e obstáculos(cactos e fosso).
#Verifica se tem vidas a subtrair. Caso não emite sinal que o player morreu.	
func take_damage(knockback_force := Vector2.ZERO, duration := 0.25):
	
	if knockback_force != Vector2.ZERO:
		knockback_vector = knockback_force
		
		if Globals.player_life > 0 && Globals.flag_alert == 0:
			var knockback_tween := get_tree().create_tween()
					
			knockback_tween.parallel().tween_property(self, "knockback_vector", Vector2.ZERO, duration)
			animation.modulate = Color(1, 0, 0, 1)
			knockback_tween.parallel().tween_property(animation, "modulate", Color(1, 1 ,1, 1), duration)
			Globals.player_life -= 1
			
		elif Globals.player_life == 0 && Globals.flag_alert == 0:
			Globals.player_life -= 1 #subtrai mais 1 vida
			Globals.flag_alert == 2 #o alerta agora é igual a 2
			queue_free()
			emit_signal("player_has_died")
	

#função que observa e trata os status do player	
func _set_state():
	var state = "idle" #parado
	
	if !is_on_floor(): #se não está no chão
		state = "jump" #está saltando
	elif direction != 0:
		state = "run"
		
	if  is_hurted:
		state = "hurt"
		
	if animation.name != state:
		animation.play(state)
		

