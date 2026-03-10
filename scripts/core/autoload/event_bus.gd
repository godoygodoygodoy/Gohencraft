extends Node
## EventBus - Sistema de eventos global usando signals

# Eventos de Player
signal player_spawned(player: CharacterBody3D)
signal player_died()
signal player_respawned()
signal player_health_changed(current: float, maximum: float)
signal player_level_up(new_level: int)

# Eventos de Combate
signal enemy_died(enemy_name: String, position: Vector3)
signal damage_dealt(amount: float, target: Node)
signal boss_defeated(boss_name: String)

# Eventos de Mundo
signal block_placed(block_type: String, position: Vector3i)
signal block_broken(block_type: String, position: Vector3i)
signal chunk_loaded(chunk_position: Vector3i)
signal chunk_unloaded(chunk_position: Vector3i)

# Eventos de Inventário
signal item_picked_up(item_name: String, amount: int)
signal item_crafted(item_name: String)
signal inventory_changed()

# Eventos de Progressão
signal experience_gained(amount: int)
signal ability_unlocked(ability_name: String)
signal power_path_chosen(path_name: String)

# Eventos de UI
signal inventory_opened()
signal inventory_closed()
signal game_paused(is_paused: bool)

# Eventos de Mundo/Dimensão
signal dimension_changed(dimension_name: String)
signal time_changed(is_night: bool)
signal blood_moon_started()
signal blood_moon_ended()

func _ready():
	print("EventBus inicializado")
