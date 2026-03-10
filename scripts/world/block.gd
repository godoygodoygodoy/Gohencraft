class_name Block
## Representa um bloco individual no mundo

var type: BlockType.Type
var position: Vector3i

func _init(block_type: BlockType.Type = BlockType.Type.AIR, pos: Vector3i = Vector3i.ZERO):
	type = block_type
	position = pos

func is_air() -> bool:
	return type == BlockType.Type.AIR

func is_solid() -> bool:
	return BlockType.is_solid(type)

func is_transparent() -> bool:
	return BlockType.is_transparent(type)
