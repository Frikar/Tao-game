extends "res://src/Objects/Enemies/EnemyBase/EnemyBase.gd"

#lista de variables heredadas
#hp, attackDamage, velocity, movimiento, direction

export (int) var jump_speed

#Ademas de los metodos ya establecidos,
#se pueden usar flip() para voltear el sprite
#y getDamage(playerAttack) para recibir daño del jugador

#.move() mueve el jugador a la direccion
#que vea, a la velocidad establecida

func _ready():
	._ready()
	#$AnimationPlayer.play("idle")

func _physics_process(delta):
	._physics_process(delta)
	.move()
	
	_move(delta)

#Movimiento
func _move(delta):
	movimiento.y += gravity * delta
	if is_on_floor():
		movimiento.y = 0
	
	if test_move(Transform2D(0, Vector2(position.x + 12 * direction, position.y)), Vector2(direction, 0)) && test_move(Transform2D(0, Vector2(position.x + 12 * direction, position.y + 8)), Vector2(direction, 0)):
		jump()
	
	elif (!test_move(Transform2D(0, Vector2(position.x + 12 * direction, position.y)), Vector2(0, 1)) && test_move(Transform2D(0, Vector2(position.x + 40 * direction, position.y)), Vector2(0, 1))):
		jump()

func jump():
	if is_on_floor():
		movimiento.y = jump_speed

#Ataque del enemigo
func attack():
	pass

#Muerte del enemigo
func death():
	pass
