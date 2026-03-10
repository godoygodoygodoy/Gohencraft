extends Node
## SaveManager - Gerenciamento de salvamento e carregamento do jogo

const SAVE_PATH = "user://save_game.json"

func save_game() -> bool:
	var save_data = {
		"version": "0.1.0",
		"timestamp": Time.get_datetime_string_from_system(),
		"player": save_player_data(),
		"world": save_world_data(),
		"game_state": save_game_state()
	}
	
	var file = FileAccess.open(SAVE_PATH, FileAccess.WRITE)
	if file:
		file.store_string(JSON.stringify(save_data, "\t"))
		file.close()
		print("Jogo salvo com sucesso!")
		return true
	else:
		push_error("Erro ao salvar o jogo!")
		return false

func load_game() -> Dictionary:
	if not FileAccess.file_exists(SAVE_PATH):
		print("Arquivo de save não encontrado")
		return {}
	
	var file = FileAccess.open(SAVE_PATH, FileAccess.READ)
	if file:
		var json_string = file.get_as_text()
		file.close()
		
		var json = JSON.new()
		var parse_result = json.parse(json_string)
		if parse_result == OK:
			print("Jogo carregado com sucesso!")
			return json.data
		else:
			push_error("Erro ao parsear arquivo de save!")
			return {}
	else:
		push_error("Erro ao abrir arquivo de save!")
		return {}

func save_player_data() -> Dictionary:
	if not GameManager.player:
		return {}
	
	var player = GameManager.player
	return {
		"position": {
			"x": player.global_position.x,
			"y": player.global_position.y,
			"z": player.global_position.z
		},
		"rotation": {
			"x": player.rotation.x,
			"y": player.rotation.y,
			"z": player.rotation.z
		}
		# Adicionar mais dados do player conforme necessário
	}

func save_world_data() -> Dictionary:
	# TODO: Implementar salvamento de chunks modificados
	return {
		"seed": 0,  # Será implementado com geração procedural
		"modified_blocks": []
	}

func save_game_state() -> Dictionary:
	return {
		"current_dimension": GameManager.current_dimension,
		"bosses_defeated": GameManager.bosses_defeated
	}

func load_player_data(data: Dictionary):
	if not GameManager.player or data.is_empty():
		return
	
	if data.has("position"):
		var pos = data.position
		GameManager.player.global_position = Vector3(pos.x, pos.y, pos.z)
	
	if data.has("rotation"):
		var rot = data.rotation
		GameManager.player.rotation = Vector3(rot.x, rot.y, rot.z)

func has_save_file() -> bool:
	return FileAccess.file_exists(SAVE_PATH)

func delete_save():
	if has_save_file():
		DirAccess.remove_absolute(SAVE_PATH)
		print("Save deletado")
