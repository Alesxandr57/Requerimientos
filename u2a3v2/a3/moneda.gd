extends Area2D

signal moneda_recolectada

func _ready():
	connect("body_entered", Callable(self, "_on_body_entered"))
	
func _on_body_entered(body):
	if body.is_in_group("jugador"):
		emit_signal("moneda_recolectada")
		queue_free()
