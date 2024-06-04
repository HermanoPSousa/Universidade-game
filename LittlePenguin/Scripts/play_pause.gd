extends CanvasLayer

@onready var resume_btn = $resume_btn


func _ready():
	visible = false #tela invisível
	resume_btn.grab_focus() #o botão Resume tem o foco.
	
#funcção que observa se foi pressionado a tecla ESC do teclado.
#Se sim, mostra a tela, foi solicitado a pausa e o botão Resume mantém sob foco.
func _unhandled_input(event):
	if event.is_action_pressed("ui_cancel"):
		visible = true
		get_tree().paused = true
		resume_btn.grab_focus()


func _on_resume_btn_pressed():
	get_tree().paused = false
	visible = false


func _on_quit_game_btn_pressed():
	get_tree().quit()
