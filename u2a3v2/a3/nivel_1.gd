extends Node2D

var puntos = 0
@onready var puntos_label = $UI/PuntosLabel

func _ready():
	for moneda in get_tree().get_nodes_in_group("moneda"):
		moneda.connect("moneda_recolectada", Callable(self, "_on_moneda_recolectada"))
		
func _on_moneda_recolectada():
	puntos += 200
	puntos_label.text = "Puntos: %d" % puntos

func obtener_puntos():
	return puntos
