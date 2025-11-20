extends Node3D
var gameSelectionScreen:String = "res://scenes/GameSelection/game_selection_gui.tscn"
func _on_play_pressed() -> void:
	Global.scene_manager.change_gui_scene(gameSelectionScreen)

func _on_settings_pressed() -> void:
	pass # Replace with function body.

func _on_exit_pressed() -> void:
	get_tree().quit()
