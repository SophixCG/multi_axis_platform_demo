extends AnimatableBody2D

@onready var LeftCast2D: RayCast2D = $LeftCast2D
@onready var RightCast2D: RayCast2D = $RightCast2D
@onready var UpCast2D: RayCast2D = $UpCast2D
@onready var DownCast2D: RayCast2D = $DownCast2D

@export var Speed = 60

@export var xAxisDirection = 1.0
@export var yAxisDirection = -1.0
@export var XDirection := true 

func _physics_process(delta: float) -> void:
	DetermineDirection(delta)

func DetermineDirection(delta):
	if XDirection == true:
		MovePlatformX(delta)
	else:
		MovePlatformY(delta)
	
func MovePlatformX(delta) -> void:
	position.x += xAxisDirection * Speed * delta
	BouncePlatform(delta)
	
func MovePlatformY(delta) -> void:
	position.y += yAxisDirection * Speed * delta
	BouncePlatform(delta)
	
func BouncePlatform(delta) -> void: 
	if RightCast2D.is_colliding():
		xAxisDirection = -1.0
	if LeftCast2D.is_colliding():
		xAxisDirection = 1.0
	if DownCast2D.is_colliding():
		yAxisDirection = -1.0
	if UpCast2D.is_colliding():
		yAxisDirection = 1.0
