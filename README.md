<div align="center">
<h1><strong>A3</strong></h1>

<h2><strong>Ahumada Vizcarra Eudaldo Alejandro</strong></h2>
<h2><strong>Avalos Miramontes Alexis Gabriel</strong></h2>
</div>

●～●～●～●～●～●～●～●～●～●～●～●～●～●～●～●～●～●～●～●～●～●～●～●～●～●～●～●～●～●～●～●～●
<div align="center">
<h2><strong>Descripcion del juego y sus mecanicas</strong></h2>
</div>

A3 es un juego de plataformas que consta de 2 niveles, donde requeriras pasar por diferentes obstaculos hechos de 5 tipos de diferentes plataformnas entre ellas (Fija, Oscilatoria, Muerte Instantanea, Rebote y Temporal), donde tambien deberas recolectar monedas aumentando tu personaje para asi poder lograr pasar al siguiente nivel, pero cuidado si llegas a caer al vacio o tocar una plataforma de muerte instantanea tendras que reiniciar el nivel en donde estes, cosa que no sera tan facil como parece, mantente en las plataformas con vida, recoge las suficientes monedas para elevar el porcentaje y vuelvete digno de llegar a la meta.



●～●～●～●～●～●～●～●～●～●～●～●～●～●～●～●～●～●～●～●～●～●～●～●～●～●～●～●～●～●～●～●～●
<div align="center">
<h2><strong>Descripcion de los recursos usados de manera de lista</strong></h2>
</div> 

### Recursos en Escenas
**1.** Door.png (Sprite de una puerta)  
**2.** Hero_006_Idle.png (Sprite del personaje)  
**3.** Moneda.png (Sprite de las monedas del juego)  
**4.** Platform.png (Sprite de las plataformas usadas en el juego)  



●～●～●～●～●～●～●～●～●～●～●～●～●～●～●～●～●～●～●～●～●～●～●～●～●～●～●～●～●～●～●～●～●
<div align="center">
<h2><strong>Descripcion de cada escena</strong></h2>
</div>

### Escena nivel0
**-** Es el primero nivel donde apareces al inciar el juego, nivel que costa de 5 diferentes plataformas (Fija, Oscilatoria, Muerte Instantanea, Rebote y Temporal), donde la razon de este nivel es ir subiendo recogiendo monedas hasta llegar a la puerta, cada moneda vale 200 puntos, por lo cual necesitas de 1000 puntos (5 monedas), para poder pasar al siguiente nivel.

### Escena nivel1
**-** Este nivel a diferencia del 0, es practicamente la misma dinamica pero ir bajando hasta llegar a la puerta consiguiendo antes los 1000 puntos para ganar, por consecuencia el nivel0 es subir y el nivel1 es bajar.

### Escena nivel2
**-** Este nivel es un nivel donde apareces en una plataforma fija al lograr pasar el nivel1, y tendras un mensaje de "Ganaste Felicidades", y es donde termina el juego, no hay que hacer nada mas.

### Escena personaje
**-** Esta escena donde tenemos a nuestro personaje principal del juego, es donde fue recreado dandole sus propiedades (CharacterBody2D, CollisionShape2D, Sprite2D, Camera2D y un Label), y es integrado en los 3 niveles anteriores.

### Escena plataforma
**-** En esta escena tenemos la realizacion de la plataforma base que derivara en sus 5 tipos (Fija, Oscilatoria, Muerte Instantanea, Rebote y Temporal), dandole tambien sus propiedades (Area2D, CollisionShape2D, Sprite2D, StaticBody2D), donde el StaticBody2D tiene como nodo hijo otro CollisionShape2D y es integrado en los 3 niveles anteriores.

### Escena Moneda
**-** Es esta escena tenemos nuestra Moneda base donde fue recredada para incluirla en las escenas del nivel0 y nivel1, tieniendo propiedades como (Area2D, Sprite2D y CollisionShape2D), y son incluidas en varias partes de los niveles (0 y 1), para darle vida al sistema de puntuaje del juego.



●～●～●～●～●～●～●～●～●～●～●～●～●～●～●～●～●～●～●～●～●～●～●～●～●～●～●～●～●～●～●～●～●
<div align="center">
<h2><strong>Descripcion de los codigos empleados para el funcionamiento</strong></h2>
</div>

### moneda.gd
**-** Este script está diseñado para un nodo Area2D que representa una moneda u objeto recolectable en un juego. Su función principal es detectar cuándo el jugador (que pertenece al grupo "jugador") entra en contacto con esta área. Al hacerlo:

  🔴 Emite una señal personalizada llamada moneda_recolectada, que puede ser utilizada por otros nodos para saber que una moneda fue recolectada.  
  🔴 Se elimina a sí mismo del juego (queue_free()), simulando que la moneda fue recogida.  

**ˏˋ°•*⁀➷ˏˋ°•*⁀➷ˏˋ°•*⁀➷ˏˋ°•*⁀➷ˏˋ°•*⁀➷**
```
extends Area2D  # Este script se aplica a un nodo tipo Area2D (por ejemplo, una moneda)

signal moneda_recolectada  # Se define una señal personalizada que se emitirá al recolectar la moneda

func _ready():
	# Cuando el nodo está listo, se conecta la señal "body_entered" al método local "_on_body_entered"
	connect("body_entered", Callable(self, "_on_body_entered"))

func _on_body_entered(body):
	# Este método se ejecuta cuando un cuerpo entra en el área
	if body.is_in_group("jugador"):
		# Si el cuerpo pertenece al grupo "jugador", emite la señal de moneda recolectada
		emit_signal("moneda_recolectada")
		# Luego elimina el nodo (la moneda desaparece del juego)
		queue_free()
```
**ˏˋ°•*⁀➷ˏˋ°•*⁀➷ˏˋ°•*⁀➷ˏˋ°•*⁀➷ˏˋ°•*⁀➷**

■━■━■━■■━■━■━■■━■━■━■■━■━■━■■━■━■━■■━■━■━■■━■━■━■■━■━■━■■━■━■━■



### nivel_0.gd **y** nivel_1.gd
**-** Este script se aplica a un nodo Node2D, que probablemente representa un nivel completo (Nivel0, Nivel1, etc.). Su función principal es:

  🔴 Inicializar un contador de puntos (puntos = 0).  
  🔴 Detectar cuándo una moneda (que pertenece al grupo "moneda") es recolectada, conectando su señal moneda_recolectada.  
  🔴 Actualizar el marcador en pantalla (PuntosLabel) al sumar 200 puntos cada vez que se recolecta una moneda.  
  🔴 Proveer acceso al puntaje actual mediante la función obtener_puntos().  
  

**ˏˋ°•*⁀➷ˏˋ°•*⁀➷ˏˋ°•*⁀➷ˏˋ°•*⁀➷ˏˋ°•*⁀➷**
```
extends Node2D  # Este script se aplica a un nodo tipo Node2D, como un nivel del juego

var puntos = 0  # Variable para almacenar el puntaje acumulado del jugador

@onready var puntos_label = $UI/PuntosLabel  # Referencia al nodo que muestra los puntos en pantalla

func _ready():
	# Al iniciar el nodo, se conecta la señal "moneda_recolectada" de cada moneda
	for moneda in get_tree().get_nodes_in_group("moneda"):
		moneda.connect("moneda_recolectada", Callable(self, "_on_moneda_recolectada"))

func _on_moneda_recolectada():
	# Cuando se recolecta una moneda, se suman 200 puntos
	puntos += 200
	# Se actualiza el texto del marcador en pantalla
	puntos_label.text = "Puntos: %d" % puntos

func obtener_puntos():
	# Función para devolver el puntaje actual (puede ser usado por otros scripts)
	return puntos
```
**ˏˋ°•*⁀➷ˏˋ°•*⁀➷ˏˋ°•*⁀➷ˏˋ°•*⁀➷ˏˋ°•*⁀➷**

■━■━■━■■━■━■━■■━■━■━■■━■━■━■■━■━■━■■━■━■━■■━■━■━■■━■━■━■■━■━■━■



### personaje.gd
**-** Este script pertenece a un nodo CharacterBody2D, que representa al jugador principal. Se encarga de su movimiento, salto, gravedad, interacción con zonas de reseteo y puertas, así como de mostrar mensajes en pantalla. Funciona en varios niveles (nivel0, nivel1, etc.).

Sus funciones principales son:  
🔴 Mover al jugador horizontalmente y permitirle saltar.  
🔴 Aplicar gravedad cuando no está en el suelo.  
🔴 Reiniciar el nivel si entra en una zona de reseteo.  
🔴 Cambiar de nivel al llegar a una puerta si tiene al menos 1000 puntos.  
🔴 Mostrar mensajes temporales si no cumple con los requisitos para avanzar o si no hay más niveles.  


**ˏˋ°•*⁀➷ˏˋ°•*⁀➷ˏˋ°•*⁀➷ˏˋ°•*⁀➷ˏˋ°•*⁀➷**
```
extends CharacterBody2D  # Este script se aplica al jugador que se puede mover y saltar

var velocidad = 200       # Velocidad de movimiento horizontal
var brinco = -400         # Fuerza del salto (negativa para subir)
var gravedad = 1000       # Valor de la gravedad aplicada cuando está en el aire

@onready var mensaje_label = $MensajeLabel  # Referencia al nodo que muestra mensajes en pantalla

func _ready():
	add_to_group("jugador")  # Agrega al jugador al grupo "jugador" (importante para colisiones y señales)

func _physics_process(delta):
	var direccion = Input.get_axis("ui_left","ui_right")  # Captura movimiento izquierda/derecha
	velocity.x = direccion * velocidad  # Aplica la velocidad según la dirección
	
	if not is_on_floor():
		velocity.y += gravedad * delta  # Aplica gravedad si está en el aire
	
	if Input.is_action_just_pressed("ui_up") and is_on_floor():
		velocity.y = brinco  # Realiza el salto si está en el suelo
	
	move_and_slide()  # Aplica el movimiento con deslizamiento (maneja colisiones)

func _on_reset_area_body_entered(body: Node2D) -> void:
	get_tree().reload_current_scene()  # Reinicia la escena si entra en un área de reseteo

func _on_door_body_entered(body: Node2D) -> void:
	if get_parent().has_method("obtener_puntos"):
		var puntos_actuales = get_parent().obtener_puntos()  # Obtiene los puntos del nivel actual

		if puntos_actuales >= 1000:
			var ruta = get_tree().current_scene.scene_file_path  # Detecta el nivel actual
			match ruta:
				"res://nivel0.tscn":
					get_tree().change_scene_to_file("res://nivel1.tscn")  # Cambia a nivel 1
				"res://nivel1.tscn":
					get_tree().change_scene_to_file("res://nivel2.tscn")  # Cambia a nivel 2
				_:
					mostrar_mensaje("No hay escena configurada para continuar.")  # Si no hay más escenas
		else:
			mostrar_mensaje("No tienes el suficiente puntuaje de 1000 para pasar de nivel")  # No cumple puntos

func mostrar_mensaje(texto):
	mensaje_label.text = texto  # Muestra el texto en pantalla
	mensaje_label.visible = true  # Hace visible el mensaje
	await get_tree().create_timer(2.0).timeout  # Espera 2 segundos
	mensaje_label.visible = false  # Oculta el mensaje
```
**ˏˋ°•*⁀➷ˏˋ°•*⁀➷ˏˋ°•*⁀➷ˏˋ°•*⁀➷ˏˋ°•*⁀➷**

■━■━■━■■━■━■━■■━■━■━■■━■━■━■■━■━■━■■━■━■━■■━■━■━■■━■━■━■■━■━■━■



### plataforma.gd
**-** Este script pertenece a un nodo Area2D que actúa como una plataforma interactiva en el juego. La plataforma puede tener distintos comportamientos dependiendo del tipo que se le asigne por medio de un enum (enumeración).

Los tipos de plataforma definidos son:  
🔴 FIJA: No hace nada especial.  
🔴 OSCILATORIA: Se mueve horizontalmente de forma continua.  
🔴 FRÁGIL: Se destruye 0.5 segundos después de que el jugador la pisa.  
🔴 REBOTE: Hace rebotar al jugador con una fuerza multiplicada.  
🔴 MUERTE: Reinicia el nivel si el jugador la toca.  


**ˏˋ°•*⁀➷ˏˋ°•*⁀➷ˏˋ°•*⁀➷ˏˋ°•*⁀➷ˏˋ°•*⁀➷**
```
extends Area2D  # Este script se aplica a una plataforma basada en Area2D

# Enum que define los distintos tipos de plataforma
enum TipoPlataforma {FIJA, OSCILATORIA, FRAGIL, REBOTE, MUERTE}

# Exporta el tipo de plataforma para que se pueda seleccionar desde el editor
@export var tipo: TipoPlataforma = TipoPlataforma.FIJA

# Exporta la fuerza de rebote (solo usada si es una plataforma de tipo REBOTE)
@export var fuerza_rebote := 2.0

func _ready():
	actualizar_plataforma()  # Configura el comportamiento inicial según el tipo
	monitorable = true       # Permite detectar colisiones con cuerpos
	monitoring = true        # Habilita el monitoreo del área

func actualizar_plataforma():
	match tipo:
		TipoPlataforma.FIJA:
			$Sprite2D.modulate = Color.GREEN  # Color verde
		TipoPlataforma.OSCILATORIA:
			$Sprite2D.modulate = Color.BLUE   # Color azul
			oscilar()                         # Inicia movimiento oscilatorio
		TipoPlataforma.FRAGIL:
			$Sprite2D.modulate = Color.RED    # Color rojo
		TipoPlataforma.REBOTE:
			$Sprite2D.modulate = Color.YELLOW # Color amarillo
		TipoPlataforma.MUERTE:
			$Sprite2D.modulate = Color.WHITE  # Color blanco

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("jugador"):  # Solo actúa si el cuerpo es el jugador
		match tipo:

			TipoPlataforma.FRAGIL:
				await get_tree().create_timer(0.5).timeout  # Espera medio segundo
				queue_free()  # Destruye la plataforma

			TipoPlataforma.REBOTE:
				if body.has_method("puede_rebotar"):
					body.puede_rebotar(fuerza_rebote)  # Llama a función personalizada si existe
				else:
					body.velocity.y = body.brinco * fuerza_rebote  # Si no, aplica rebote manualmente

			TipoPlataforma.MUERTE:
				await get_tree().reload_current_scene()  # Reinicia el nivel actual

	pass  # (Instrucción vacía por si no hay match válido)

func oscilar():
	var tween = create_tween()
	tween.tween_property(self, "position:x", position.x + 100, 2)  # Se mueve a la derecha
	tween.tween_property(self, "position:x", position.x - 100, 2)  # Luego a la izquierda
	tween.set_loops()  # Se repite infinitamente
```
**ˏˋ°•*⁀➷ˏˋ°•*⁀➷ˏˋ°•*⁀➷ˏˋ°•*⁀➷ˏˋ°•*⁀➷**



●～●～●～●～●～●～●～●～●～●～●～●～●～●～●～●～●～●～●～●～●～●～●～●～●～●～●～●～●～●～●～●～●
<div align="center">
<h2><strong>Dificultad por integrante las dificultades que se tuvieron al usar herraminetas colabrativas</strong></h2>
</div>

### Dificultades de Eudaldo
**-** En lo personal aprender sobre como usar github tanto como visual estudio code a la par, para poder trabajar de forma colaborativa junto con alexis fue todo un reto, a pesar de las varias explicaciones que se nos dio, tuvimos mucho retraso a la hora de la elaboración del proyecto y que no sabiamos como hacer comits al inicio, despues de ahi aprendimos pero varias veces borramos el juego o haciamos algo mal que terminaba en un desastre, ya que intentabamos trabajar en la misma rama primaria de una forma rara, lo que nos llevo a retrasarnos varios dias aprendiendo a como hacerlo bien, fue ahi cuando una tarde me puse a hacer prueba y error con otra laptop en mi cada, y poder descubrir como hacerlo bien.  

### Dificultades de Alexis
**-** TEXTO DE ALEXIS, TEXTO DE ALEXIS, TEXTO DE ALEXIS, TEXTO DE ALEXIS, TEXTO DE ALEXIS, TEXTO DE ALEXIS, TEXTO DE ALEXIS, TEXTO DE ALEXIS, TEXTO DE ALEXIS, TEXTO DE ALEXIS, TEXTO DE ALEXIS, TEXTO DE ALEXIS, TEXTO DE ALEXIS, TEXTO DE ALEXIS, TEXTO DE ALEXIS, TEXTO DE ALEXIS, TEXTO DE ALEXIS, TEXTO DE ALEXIS, TEXTO DE ALEXIS, TEXTO DE ALEXIS, TEXTO DE ALEXIS, TEXTO DE ALEXIS, TEXTO DE ALEXIS, TEXTO DE ALEXIS, TEXTO DE ALEXIS, TEXTO DE ALEXIS,TEXTO DE ALEXIS, TEXTO DE ALEXIS,


●～●～●～●～●～●～●～●～●～●～●～●～●～●～●～●～●～●～●～●～●～●～●～●～●～●～●～●～●～●～●～●～●
<div align="center">
<h2><strong>Conclucion del uso e importancoa de las herramientas colaborativas</strong></h2>
</div>

**-** Las herramientas colaborativas son fundamentales para el programador moderno, ya que permiten trabajar en equipo de forma eficiente, mantener el control de versiones, compartir avances en tiempo real y asegurar la integración continua del código. Facilitan la organización, reducen errores y mejoran la productividad, siendo esenciales en proyectos tanto pequeños como de gran escala.
