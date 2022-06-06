extends Area2D

signal coinCollected


func _on_Coin2d_body_entered(_body):
	
	emit_signal("coinCollected")
	
	queue_free()
	pass # Replace with function body.
