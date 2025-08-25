extends Control


@onready var high_score_label: Label = $MarginContainer/HighScoreLabel

const GAME = preload("res://Scenes/Game/Game.tscn")


func _unhandled_input(event: InputEvent) -> void: 
	if event.is_action("jump") == true:  
		GameManager.load_game_scene()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	get_tree().paused = false
	high_score_label.text = "%04d" % ScoreManager.high_score
