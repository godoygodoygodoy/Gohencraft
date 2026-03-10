class_name BlockTextures
extends Node
## Gerenciador de texturas dos blocos

# Texturas carregadas
var textures: Dictionary = {}

func _init():
	load_textures()

func load_textures():
	# Carregar todas as texturas dos blocos
	textures[BlockType.Type.DIRT] = load("res://src/textures/blocks/dirt.png")
	textures[BlockType.Type.GRASS] = load("res://src/textures/blocks/grass.png")
	textures[BlockType.Type.STONE] = load("res://src/textures/blocks/stone.png")
	textures[BlockType.Type.WOOD] = load("res://src/textures/blocks/wood.png")
	textures[BlockType.Type.WOOD_PLANKS] = load("res://src/textures/blocks/wood_planks.png")
	textures[BlockType.Type.LEAVES] = load("res://src/textures/blocks/leaves.png")
	textures[BlockType.Type.SAND] = load("res://src/textures/blocks/sand.png")
	textures[BlockType.Type.WATER] = load("res://src/textures/blocks/water.png")
	textures[BlockType.Type.CRAFTING_TABLE] = load("res://src/textures/blocks/crafting_table.png")
	
	# Texturas especiais (topo)
	textures["grass_top"] = load("res://src/textures/blocks/grass_top.png")
	textures["wood_top"] = load("res://src/textures/blocks/wood2.png")
	textures["crafting_table_top"] = load("res://src/textures/blocks/crafting_table_top.png")

func get_texture(block_type: BlockType.Type, face: String = "side") -> Texture2D:
	# Texturas especiais para certos blocos
	if block_type == BlockType.Type.GRASS and face == "top":
		return textures.get("grass_top", textures.get(block_type))
	elif block_type == BlockType.Type.WOOD and (face == "top" or face == "bottom"):
		return textures.get("wood_top", textures.get(block_type))
	elif block_type == BlockType.Type.CRAFTING_TABLE and (face == "top" or face == "bottom"):
		return textures.get("crafting_table_top", textures.get(block_type))
	
	return textures.get(block_type)

func create_material(block_type: BlockType.Type, face: String = "side") -> StandardMaterial3D:
	var material = StandardMaterial3D.new()
	var texture = get_texture(block_type, face)
	
	if texture:
		material.albedo_texture = texture
		material.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST  # Pixel art
		material.albedo_color = Color.WHITE
	else:
		# Cor padrão se não tiver textura
		material.albedo_color = get_default_color(block_type)
	
	material.roughness = 0.8
	material.metallic = 0.0
	
	# Transparência para água e folhas
	if block_type == BlockType.Type.WATER:
		material.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
		material.albedo_color = Color(1, 1, 1, 0.6)
	elif block_type == BlockType.Type.LEAVES:
		material.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA_DEPTH_PRE_PASS
	
	return material

func get_default_color(block_type: BlockType.Type) -> Color:
	match block_type:
		BlockType.Type.DIRT:
			return Color(0.6, 0.4, 0.2)
		BlockType.Type.GRASS:
			return Color(0.3, 0.6, 0.2)
		BlockType.Type.STONE:
			return Color(0.5, 0.5, 0.5)
		BlockType.Type.WOOD:
			return Color(0.5, 0.3, 0.1)
		BlockType.Type.WOOD_PLANKS:
			return Color(0.7, 0.5, 0.3)
		BlockType.Type.LEAVES:
			return Color(0.2, 0.5, 0.2)
		BlockType.Type.SAND:
			return Color(0.9, 0.8, 0.5)
		BlockType.Type.WATER:
			return Color(0.2, 0.4, 0.8, 0.6)
		BlockType.Type.CRAFTING_TABLE:
			return Color(0.6, 0.4, 0.2)
		_:
			return Color(1, 0, 1)  # Magenta para blocos desconhecidos
