extends Node3D

var cameraAxis : Node3D
@export var speed:float = 1.0

func _ready() -> void:
	cameraAxis = $CameraAxis

func _physics_process(delta: float) -> void:
	if cameraAxis != null:
		cameraAxis.rotate_y(speed * delta)

func increaseRotate():
	speed += 0.1

func _on_funni_pressed() -> void:
	print("Speed: " + str(speed))
	increaseRotate()
