extends ColorRect

var threshold = 0.0

#chama o shader de transição e o tempo de início
func _process(delta):
	material.set("shader_parameter/threshold", threshold)
