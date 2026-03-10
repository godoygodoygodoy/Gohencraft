class_name BlockType
## Define os tipos de blocos disponíveis no jogo

enum Type {
	AIR = 0,
	DIRT = 1,
	GRASS = 2,
	STONE = 3,
	WOOD = 4,
	WOOD_PLANKS = 5,
	LEAVES = 6,
	SAND = 7,
	WATER = 8,
	CRAFTING_TABLE = 9
}

## Retorna o nome legível do tipo de bloco
static func get_block_name(block_type: Type) -> String:
	match block_type:
		Type.AIR:
			return "Air"
		Type.DIRT:
			return "Dirt"
		Type.GRASS:
			return "Grass"
		Type.STONE:
			return "Stone"
		Type.WOOD:
			return "Wood"
		Type.WOOD_PLANKS:
			return "Wood Planks"
		Type.LEAVES:
			return "Leaves"
		Type.SAND:
			return "Sand"
		Type.WATER:
			return "Water"
		Type.CRAFTING_TABLE:
			return "Crafting Table"
		_:
			return "Unknown"

## Verifica se o bloco é sólido (tem colisão)
static func is_solid(block_type: Type) -> bool:
	return block_type != Type.AIR and block_type != Type.WATER

## Verifica se o bloco é transparente
static func is_transparent(block_type: Type) -> bool:
	return block_type == Type.AIR or block_type == Type.WATER or block_type == Type.LEAVES
