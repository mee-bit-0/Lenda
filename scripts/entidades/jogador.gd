extends CharacterBody2D
@onready var animacao = $AnimatedSprite2D

const SPEED = 100.0
var virado: String = "d"
var anim: String

func _physics_process(_delta: float) -> void: #roda todo frame
	
	#Pega input e define vetor direcao
	var direcao = Input.get_vector("andar_esquerda","andar_direita", "andar_cima", "andar_baixo")
	
	#se apertou pra andar
	if direcao:
		velocity = direcao * SPEED
		#verifica pra onde o caba ta virado
		if abs(direcao.x) > abs(direcao.y):
			virado = "r" if (direcao.x > 0) else "l"	
		else:
			virado = "d" if (direcao.y > 0) else "u"
		#define a animação virada pra direção certa
		anim = virado+"_"+"andar"
	else:
		velocity = Vector2.ZERO
		anim = virado+"_"+"idle"
		
	animacao.play(anim)
	#faz mover de acordo com velocity e cuida da colisao
	move_and_slide()
