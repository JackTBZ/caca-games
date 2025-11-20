extends Node2D

@export var type:String = "standard"

var typeArray:Array = [
	"standard",
	"explosive",
	"brittle",
	"fake",
]

func _ready() -> void:
	var randomRotation:float = randf_range(-50,50)
	self.rotation = randomRotation
