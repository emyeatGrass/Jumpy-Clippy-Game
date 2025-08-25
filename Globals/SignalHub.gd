extends Node


signal on_clippy_died
signal on_point_scored

func emit_on_clippy_died() -> void:
	on_clippy_died.emit()

func emit_on_point_scored() -> void:
	on_point_scored.emit()
