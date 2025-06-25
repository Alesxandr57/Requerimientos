extends CharacterBody2D

var velocidad = 200
var brinco = -400
var gravedad = 1000
@onready var mensaje_label = $MensajeLabel

func _ready():
	add_to_group("jugador")

func _physics_process(delta):
	var direccion = Input.get_axis("ui_left","ui_right")
	velocity.x = direccion * velocidad
	
	if not is_on_floor():
		velocity.y += gravedad * delta
	
	if Input.is_action_just_pressed("ui_up") and is_on_floor():
		velocity.y = brinco
	
	move_and_slide()
	


func _on_reset_area_body_entered(body: Node2D) -> void:
	get_tree().reload_current_scene()


func _on_door_body_entered(body: Node2D) -> void:
	if get_parent().has_method("obtener_puntos"):
		var puntos_actuales = get_parent().obtener_puntos()
		if puntos_actuales >= 1000:
			get_tree().change_scene_to_file("nivel1.tscn")
		else:
			mostrar_mensaje("No tienes el suficiente puntuaje de 1000 para pasar de nivel")
			
func mostrar_mensaje(texto):
	mensaje_label.text = texto
	mensaje_label.visible = true
	await get_tree().create_timer(2.0).timeout
	mensaje_label.visible = false
	
	
