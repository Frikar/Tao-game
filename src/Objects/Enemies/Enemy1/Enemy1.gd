extends "res://src/Objects/Enemies/EnemyBase/EnemyBase.gd"

#lista de variables heredadas
#hp, attackDamage, velocity, movimiento, direction

#Ademas de los metodos ya establecidos,
#se pueden usar flip() para voltear el sprite
#y getDamage(playerAttack) para recibir daño del jugador

#.move() mueve el jugador a la direccion
#que vea, a la velocidad establecida

func _ready():
	._ready()
	$AnimationPlayer.play("idle")

func _physics_process(delta):
	pass

#Movimiento
func move():
	pass

#Ataque del enemigo
func attack():
	pass

#Muerte del enemigo
func death():
	pass
