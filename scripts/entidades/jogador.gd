extends CharacterBody2D
@onready var animacao = $AnimatedSprite2D

const SPEED = 80.0

#roda a cada frame
func _physics_process(delta: float) -> void:
	
	#Pega input e define vetor direcao
	var direcao = Input.get_vector("andar_esquerda","andar_direita", "andar_cima", "andar_baixo")
	
	if direcao:
		velocity = direcao * SPEED
		
	else:
		velocity = direcao.move_toward(Vector2.ZERO, SPEED/2)
		
	move_and_slide()
