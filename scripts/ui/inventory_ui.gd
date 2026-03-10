extends Control
## UI do inventário e crafting

@onready var panel = $Panel

var inventory: InventorySystem
var is_open: bool = false

func _ready():
	visible = false
	inventory = InventorySystem.new()
	add_child(inventory)

func _input(event):
	if event.is_action_pressed("ui_tab"):
		toggle()

func toggle():
	is_open = !is_open
	visible = is_open
	
	if is_open:
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
		get_tree().paused = true
	else:
		Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
		get_tree().paused = false
	
	EventBus.inventory_opened.emit() if is_open else EventBus.inventory_closed.emit()

func craft_wood_planks():
	if inventory.has_item(BlockType.Type.WOOD, 1):
		inventory.remove_item(BlockType.Type.WOOD, 1)
		inventory.add_item(BlockType.Type.WOOD_PLANKS, 4)
		print("Craftado: 4 Wood Planks")

func craft_crafting_table():
	if inventory.has_item(BlockType.Type.WOOD_PLANKS, 4):
		inventory.remove_item(BlockType.Type.WOOD_PLANKS, 4)
		inventory.add_item(BlockType.Type.CRAFTING_TABLE, 1)
		print("Craftado: Crafting Table")
