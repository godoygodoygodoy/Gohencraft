extends Node
## GameManager - Singleton global para gerenciar o estado do jogo

var player: CharacterBody3D
var world: Node3D
var current_dimension: String = "earth"  # earth, hell, heaven

var game_paused: bool = false
var bosses_defeated: Array[String] = []

func _ready():
	print("GameManager inicializado")

func _input(event):
	if event.is_action_pressed("ui_cancel"):
		toggle_pause()

func toggle_pause():
	game_paused = !game_paused
	get_tree().paused = game_paused
	EventBus.game_paused.emit(game_paused)

func defeat_boss(boss_name: String):
	if boss_name not in bosses_defeated:
		bosses_defeated.append(boss_name)
		EventBus.boss_defeated.emit(boss_name)
		print("Boss derrotado: ", boss_name)

func is_boss_defeated(boss_name: String) -> bool:
	return boss_name in bosses_defeated

func change_dimension(dimension_name: String):
	current_dimension = dimension_name
	EventBus.dimension_changed.emit(dimension_name)
	print("Dimensão alterada para: ", dimension_name)
