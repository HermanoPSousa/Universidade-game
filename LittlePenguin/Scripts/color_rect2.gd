extends ColorRect

var threshold = 0.0

#função que determina o instante de início da transição entre as fases
#efeito zebrado em laranja e preto
func _process(delta):
	material.set("shader_parameter/threshold", threshold)
