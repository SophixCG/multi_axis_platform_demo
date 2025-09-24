extends Area2D

@onready var _Timer: Timer = $Timer


func _OnBodyEntered(body: Node2D) -> void:
	_Timer.start()


func _OnTimerTimeout() -> void:
	get_tree().call_deferred("reload_current_scene")
