extends KinematicBody2D

export(int) var hp
export(int) var attackDamage
export(int) var velocity
export(int) var gravity
export(bool) var flip

var movimiento = Vector2()
var direction

func _ready():
	$Sprite.flip_h = flip
	
	#Valor inicial de la variable direction
	if $Sprite.flip_h == false:
		direction = 1
	
	elif $Sprite.flip_h == true:
		direction = -1

func _physics_process(delta):
	#movimiento = movimiento.normalized()
	move_and_slide(movimiento, Vector2(0, -1))

#Mueve al jugador hacia la direccion que mire
func move():
	movimiento.x = velocity * direction

#voltea horizontalmente el sprite
func flip():
	if $Sprite.flip_h == false:
		$Sprite.flip_h = true
	
	elif $Sprite.flip_h == true:
		$Sprite.flip_h = false
	
	direction *= -1

#Ataque del enemigo
func attack():
	pass

#Recepcion de daño
func getDamage(playerAttack):
	hp -= playerAttack

#Muerte del enemigo
func death():
	pass
