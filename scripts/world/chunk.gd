class_name Chunk
extends MeshInstance3D
## Chunk de 16x64x16 blocos que compõe o mundo

const CHUNK_SIZE = 16
const CHUNK_HEIGHT = 64  # Reduzido para melhor performance

var chunk_position: Vector3i
var blocks: Array = []
var is_dirty: bool = true
var block_textures: BlockTextures

func _init(pos: Vector3i = Vector3i.ZERO):
	chunk_position = pos
	blocks.resize(CHUNK_SIZE * CHUNK_HEIGHT * CHUNK_SIZE)
	block_textures = BlockTextures.new()
	
	for i in blocks.size():
		blocks[i] = Block.new(BlockType.Type.AIR)

func _ready():
	name = "Chunk_%d_%d_%d" % [chunk_position.x, chunk_position.y, chunk_position.z]
	global_position = Vector3(
		chunk_position.x * CHUNK_SIZE,
		chunk_position.y * CHUNK_HEIGHT,
		chunk_position.z * CHUNK_SIZE
	)

func get_block_index(x: int, y: int, z: int) -> int:
	if x < 0 or x >= CHUNK_SIZE or y < 0 or y >= CHUNK_HEIGHT or z < 0 or z >= CHUNK_SIZE:
		return -1
	return x + z * CHUNK_SIZE + y * CHUNK_SIZE * CHUNK_SIZE

func get_block(x: int, y: int, z: int) -> Block:
	var index = get_block_index(x, y, z)
	if index == -1:
		return null
	return blocks[index]

func set_block(x: int, y: int, z: int, block_type: BlockType.Type):
	var index = get_block_index(x, y, z)
	if index == -1:
		return
	blocks[index] = Block.new(block_type, Vector3i(x, y, z))
	is_dirty = true

func generate_simple_terrain():
	for x in range(CHUNK_SIZE):
		for z in range(CHUNK_SIZE):
			var height = 32
			
			# Pedra no fundo
			for y in range(0, height - 5):
				set_block(x, y, z, BlockType.Type.STONE)
			
			# Terra
			for y in range(height - 5, height):
				set_block(x, y, z, BlockType.Type.DIRT)
			
			# Grama no topo
			set_block(x, height, z, BlockType.Type.GRASS)
			
			# Água em alguns lugares
			if (x + chunk_position.x * CHUNK_SIZE) % 16 == 0 and (z + chunk_position.z * CHUNK_SIZE) % 16 == 0:
				for y in range(height + 1, height + 3):
					if y < CHUNK_HEIGHT:
						set_block(x, y, z, BlockType.Type.WATER)
			
			# Areia perto da água
			if abs((x + chunk_position.x * CHUNK_SIZE) % 16) < 3 and abs((z + chunk_position.z * CHUNK_SIZE) % 16) < 3:
				set_block(x, height, z, BlockType.Type.SAND)
	
	# Gerar árvores
	for i in range(2):
		var tree_x = (randi() % (CHUNK_SIZE - 4)) + 2
		var tree_z = (randi() % (CHUNK_SIZE - 4)) + 2
		generate_tree(tree_x, 32, tree_z)
	
	is_dirty = true

func generate_tree(x: int, y: int, z: int):
	# Tronco
	for i in range(5):
		if y + i + 1 < CHUNK_HEIGHT:
			set_block(x, y + i + 1, z, BlockType.Type.WOOD)
	
	# Folhas
	for dx in range(-2, 3):
		for dz in range(-2, 3):
			for dy in range(3):
				var nx = x + dx
				var nz = z + dz
				var ny = y + 4 + dy
				if nx >= 0 and nx < CHUNK_SIZE and nz >= 0 and nz < CHUNK_SIZE and ny < CHUNK_HEIGHT:
					if not (dx == 0 and dz == 0 and dy < 2):
						set_block(nx, ny, nz, BlockType.Type.LEAVES)

func build_mesh():
	if not is_dirty:
		return
	
	var surface_tool = SurfaceTool.new()
	surface_tool.begin(Mesh.PRIMITIVE_TRIANGLES)
	
	var block_count = 0
	
	for x in range(CHUNK_SIZE):
		for y in range(CHUNK_HEIGHT):
			for z in range(CHUNK_SIZE):
				var block = get_block(x, y, z)
				if block and not block.is_air():
					add_block_faces(surface_tool, x, y, z, block)
					block_count += 1
	
	if block_count > 0:
		surface_tool.generate_normals()
		mesh = surface_tool.commit()
		
		var material = StandardMaterial3D.new()
		var grass_tex = load("res://src/textures/blocks/grass.png")
		if grass_tex:
			material.albedo_texture = grass_tex
			material.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
		material.albedo_color = Color.WHITE
		material.roughness = 0.8
		set_surface_override_material(0, material)
		
		if not has_node("CollisionShape3D"):
			create_collision_from_mesh()
	
	is_dirty = false

func add_block_faces(surface_tool: SurfaceTool, x: int, y: int, z: int, _block: Block):
	var pos = Vector3(x, y, z)
	var size = 0.5
	
	if should_render_face(x, y + 1, z):
		add_quad(surface_tool, pos + Vector3(0, size, 0), pos + Vector3(size, size, 0),
			pos + Vector3(size, size, size), pos + Vector3(0, size, size), Vector3.UP)
	
	if should_render_face(x, y - 1, z):
		add_quad(surface_tool, pos + Vector3(0, 0, size), pos + Vector3(size, 0, size),
			pos + Vector3(size, 0, 0), pos + Vector3(0, 0, 0), Vector3.DOWN)
	
	if should_render_face(x, y, z + 1):
		add_quad(surface_tool, pos + Vector3(0, 0, size), pos + Vector3(0, size, size),
			pos + Vector3(size, size, size), pos + Vector3(size, 0, size), Vector3.FORWARD)
	
	if should_render_face(x, y, z - 1):
		add_quad(surface_tool, pos + Vector3(size, 0, 0), pos + Vector3(size, size, 0),
			pos + Vector3(0, size, 0), pos + Vector3(0, 0, 0), Vector3.BACK)
	
	if should_render_face(x + 1, y, z):
		add_quad(surface_tool, pos + Vector3(size, 0, size), pos + Vector3(size, size, size),
			pos + Vector3(size, size, 0), pos + Vector3(size, 0, 0), Vector3.RIGHT)
	
	if should_render_face(x - 1, y, z):
		add_quad(surface_tool, pos + Vector3(0, 0, 0), pos + Vector3(0, size, 0),
			pos + Vector3(0, size, size), pos + Vector3(0, 0, size), Vector3.LEFT)

func should_render_face(x: int, y: int, z: int) -> bool:
	var neighbor = get_block(x, y, z)
	if neighbor == null:
		return true
	return neighbor.is_air() or neighbor.is_transparent()

func add_quad(st: SurfaceTool, v1: Vector3, v2: Vector3, v3: Vector3, v4: Vector3, n: Vector3):
	st.set_normal(n)
	st.set_uv(Vector2(0, 0))
	st.add_vertex(v1)
	st.set_uv(Vector2(1, 0))
	st.add_vertex(v2)
	st.set_uv(Vector2(1, 1))
	st.add_vertex(v3)
	
	st.set_normal(n)
	st.set_uv(Vector2(0, 0))
	st.add_vertex(v1)
	st.set_uv(Vector2(1, 1))
	st.add_vertex(v3)
	st.set_uv(Vector2(0, 1))
	st.add_vertex(v4)

func create_collision_from_mesh():
	if not mesh:
		return
	
	var static_body = StaticBody3D.new()
	static_body.name = "ChunkCollision"
	add_child(static_body)
	
	var collision_shape = CollisionShape3D.new()
	collision_shape.name = "CollisionShape"
	static_body.add_child(collision_shape)
	
	collision_shape.shape = mesh.create_trimesh_shape()
