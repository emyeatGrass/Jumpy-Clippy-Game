extends Node2D

const PIPES = preload("res://Scenes/Pipes/Pipes.tscn")

@onready var pipes_holder: Node = $PipesHolder
@onready var upper_point: Marker2D = $UpperPoint
@onready var lower_point: Marker2D = $LowerPoint


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	spwan_pipes()

# _enter_tree() VS _ready() : in some cases where we are already emitting a signal in _read(), it's usually
# used to reset the game UI. For exmaple, lives might be reset when starting a new level. If we emit another
# signal inside _ready() and other things are connecting up to the signal in the _ready(), if one is called
# before the other, the one that's connecting to the signal might actually not then receive the signal because
# it's connected too late. To fix that, use _enter_tree().
func _enter_tree() -> void:
	SignalHub.on_clippy_died.connect(_on_clippy_died)

func spwan_pipes() -> void:
	var np = PIPES.instantiate()
	var y_pos: float = randf_range(
		upper_point.position.y,
		lower_point.position.y,
	)
	np.position = Vector2(
		upper_point.position.x,
		y_pos
	)
	pipes_holder.add_child(np)

func _on_spawn_timer_timeout() -> void:
	spwan_pipes()

func _on_clippy_died() -> void:
	get_tree().paused = true 	
