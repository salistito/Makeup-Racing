extends Area2D

var block = 0

signal put_task

func _on_Maquillaje_seal_area_entered(area):
	if block == 0:
		emit_signal("put_task")
		block = 1
	
