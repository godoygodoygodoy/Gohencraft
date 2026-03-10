extends Label
## Debug Info HUD - Mostra informações de debug

func _process(_delta):
	if GameManager.player:
		var pos = GameManager.player.global_position
		var chunk_pos = Vector3i(
			floori(pos.x / 16),
			0,
			floori(pos.z / 16)
		)
		
		text = "FPS: %d\nPos: %.1f, %.1f, %.1f\nChunk: %d, %d\nChunks carregados: %d" % [
			Engine.get_frames_per_second(),
			pos.x, pos.y, pos.z,
			chunk_pos.x, chunk_pos.z,
			GameManager.world.chunks.size() if GameManager.world else 0
		]
