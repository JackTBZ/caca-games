extends Control
signal increaseSpeed
signal playPressed
signal settingsPressed
signal exitPressed

func _on_funni_pressed() -> void:
	increaseSpeed.emit()

func _on_play_pressed() -> void:
	playPressed.emit()

func _on_settings_pressed() -> void:
	settingsPressed.emit()

func _on_exit_pressed() -> void:
	exitPressed.emit()
