# ***A3***

## ***Ahumada Vizcarra Eudaldo Alejandro***
## ***Avalos Miramontes Alexis Gabriel***
--------------------------------------------------------------------------------------
## Descripcion del juego y sus mecanicas

A3 es un juego de plataformas que consta de 2 niveles, donde requeriras pasar por diferentes obstaculos hechos de 5 tipos de diferentes plataformnas entre ellas (Fija, Oscilatoria, Muerte Instantanea, Rebote y Temporal), donde tambien deberas recolectar monedas aumentando tu personaje para asi poder lograr pasar al siguiente nivel, pero cuidado si llegas a caer al vacio o tocar una plataforma de muerte instantanea tendras que reiniciar el nivel en donde estes, cosa que no sera tan facil como parece, mantente en las plataformas con vida, recoge las suficientes monedas para elevar el porcentaje y vuelvete digno de llegar a la meta.



-------------------------------------------------------------------------------------
## Descripcion de los recursos usados de manera de lista 

### Recursos en Escenas
**1.** Door.png (Sprite de una puerta)
**2.** Hero_006_Idle.png (Sprite del personaje)
**3.** Moneda.png (Sprite de las monedas del juego)
**4.** Platform.png (Sprite de las plataformas usadas en el juego)



-------------------------------------------------------------------------------------
## Descripcion de cada escena

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



------------------------------------------------------------------------------------
## Descripcion de los codigos empleados para el funcionamiento




-----------------------------------------------------------------------------------
## Dificultad por integrante las dificultades que se tuvieron al usar herraminetas colabrativas



-----------------------------------------------------------------------------------
## Conclucion del uso e importancoa de las heeramintas colaborativas
