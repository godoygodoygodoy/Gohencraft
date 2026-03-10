class_name World
extends Node3D
## Gerencia o mundo e os chunks

@export var render_distance: int = 2  # Distância de renderização em chunks
@export var world_seed: int = 12345

var chunks: Dictionary = {}  # Vector3i -> Chunk
var chunk_scene = preload("res://scripts/world/chunk.gd")

func _ready():
	name = "World"
	GameManager.world = self
	print("Mundo inicializado com seed: ", world_seed)

func _process(_delta):
	if GameManager.player:
		update_chunks_around_player()

## Atualiza chunks ao redor do player
func update_chunks_around_player():
	var player_chunk_pos = world_to_chunk_position(GameManager.player.global_position)
	
	# Carregar chunks próximos
	for x in range(-render_distance, render_distance + 1):
		for z in range(-render_distance, render_distance + 1):
			var chunk_pos = Vector3i(player_chunk_pos.x + x, 0, player_chunk_pos.z + z)
			if not chunks.has(chunk_pos):
				load_chunk(chunk_pos)
	
	# Descarregar chunks distantes
	var chunks_to_unload = []
	for chunk_pos in chunks.keys():
		var distance = abs(chunk_pos.x - player_chunk_pos.x) + abs(chunk_pos.z - player_chunk_pos.z)
		if distance > render_distance + 2:
			chunks_to_unload.append(chunk_pos)
	
	for chunk_pos in chunks_to_unload:
		unload_chunk(chunk_pos)

## Carrega um chunk
func load_chunk(chunk_pos: Vector3i):
	var chunk = Chunk.new(chunk_pos)
	add_child(chunk)
	chunk.generate_simple_terrain()
	chunk.build_mesh()
	chunks[chunk_pos] = chunk
	EventBus.chunk_loaded.emit(chunk_pos)

## Descarrega um chunk
func unload_chunk(chunk_pos: Vector3i):
	if chunks.has(chunk_pos):
		var chunk = chunks[chunk_pos]
		chunk.queue_free()
		chunks.erase(chunk_pos)
		EventBus.chunk_unloaded.emit(chunk_pos)

## Converte posição do mundo para posição do chunk
func world_to_chunk_position(world_pos: Vector3) -> Vector3i:
	return Vector3i(
		floori(world_pos.x / Chunk.CHUNK_SIZE),
		0,
		floori(world_pos.z / Chunk.CHUNK_SIZE)
	)

## Obtém o chunk em uma posição
func get_chunk_at_position(chunk_pos: Vector3i) -> Chunk:
	if chunks.has(chunk_pos):
		return chunks[chunk_pos]
	return null

## Obtém um bloco em uma posição do mundo
func get_block_at_world_position(world_pos: Vector3) -> Block:
	var chunk_pos = world_to_chunk_position(world_pos)
	var chunk = get_chunk_at_position(chunk_pos)
	if not chunk:
		return null
	
	# Converter para coordenadas locais do chunk
	var local_x = int(world_pos.x) % Chunk.CHUNK_SIZE
	var local_y = int(world_pos.y)
	var local_z = int(world_pos.z) % Chunk.CHUNK_SIZE
	
	if local_x < 0:
		local_x += Chunk.CHUNK_SIZE
	if local_z < 0:
		local_z += Chunk.CHUNK_SIZE
	
	return chunk.get_block(local_x, local_y, local_z)

## Define um bloco em uma posição do mundo
func set_block_at_world_position(world_pos: Vector3i, block_type: BlockType.Type):
	var chunk_pos = world_to_chunk_position(Vector3(world_pos))
	var chunk = get_chunk_at_position(chunk_pos)
	if not chunk:
		return
	
	# Converter para coordenadas locais do chunk
	var local_x = world_pos.x % Chunk.CHUNK_SIZE
	var local_y = world_pos.y
	var local_z = world_pos.z % Chunk.CHUNK_SIZE
	
	if local_x < 0:
		local_x += Chunk.CHUNK_SIZE
	if local_z < 0:
		local_z += Chunk.CHUNK_SIZE
	
	chunk.set_block(local_x, local_y, local_z, block_type)
	chunk.build_mesh()
	
	EventBus.block_placed.emit(BlockType.get_block_name(block_type), world_pos)
