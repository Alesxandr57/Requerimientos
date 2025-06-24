extends Area2D

enum TipoPlataforma {FIJA, OSCILATORIA, FRAGIL, REBOTE, MUERTE}
@export var tipo: TipoPlataforma = TipoPlataforma.FIJA;
@export var fuerza_rebote := 2.0

func _ready():
	actualizar_plataforma()
	monitorable = true
	monitoring = true
	
func actualizar_plataforma():
	match tipo:
		TipoPlataforma.FIJA:
			$Sprite2D.modulate = Color.GREEN
		TipoPlataforma.OSCILATORIA:
			$Sprite2D.modulate = Color.BLUE
			oscilar()
		TipoPlataforma.FRAGIL:
			$Sprite2D.modulate = Color.RED
		TipoPlataforma.REBOTE:
			$Sprite2D.modulate = Color.YELLOW
		TipoPlataforma.MUERTE:
			$Sprite2D.modulate = Color.WHITE
		


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("jugador"):
		
		match tipo:

			TipoPlataforma.FRAGIL:
				await get_tree().create_timer(0.5).timeout
				queue_free()
			TipoPlataforma.REBOTE:
				if body.has_method("puede_rebotar"):
					body.puede_rebotar(fuerza_rebote)
				else:
					body.velocity.y = body.brinco * fuerza_rebote
			TipoPlataforma.MUERTE:
				await get_tree().reload_current_scene()
	pass # Replace with function body.

func oscilar():
	var tween = create_tween()
	tween.tween_property(self,"position:x",position.x + 100,2)
	tween.tween_property(self,"position:x",position.x - 100,2)
	tween.set_loops()
	
	
	
	
