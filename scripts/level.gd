extends Node2D

@onready var brickObject = preload ("res://scenes/brick.tscn")

var columns = 32
var rows = 4
var margin = 25

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	setupLevel()

func setupLevel():
	
	for r in rows: 
		for c in columns:
			var randomNumber = randi_range(0,2)
			if randomNumber > 0:
				var newBrick = brickObject.instantiate()
				add_child(newBrick)
				newBrick.position = Vector2(margin + (61 * c), margin + (61 * r))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
