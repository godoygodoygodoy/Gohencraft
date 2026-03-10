class_name InventorySystem
extends Node
## Sistema de inventário do jogador

signal inventory_changed()

const MAX_SLOTS = 36
const HOTBAR_SLOTS = 9

var items: Array = []  # Array de ItemStack
var selected_slot: int = 0

func _ready():
	items.resize(MAX_SLOTS)
	for i in items.size():
		items[i] = null

func add_item(item_type: BlockType.Type, amount: int = 1) -> bool:
	# Procurar slot com o mesmo item
	for i in range(items.size()):
		if items[i] != null and items[i].type == item_type:
			if items[i].amount + amount <= 64:
				items[i].amount += amount
				inventory_changed.emit()
				return true
	
	# Procurar slot vazio
	for i in range(items.size()):
		if items[i] == null:
			items[i] = ItemStack.new(item_type, amount)
			inventory_changed.emit()
			return true
	
	return false  # Inventário cheio

func remove_item(item_type: BlockType.Type, amount: int = 1) -> bool:
	for i in range(items.size()):
		if items[i] != null and items[i].type == item_type:
			if items[i].amount >= amount:
				items[i].amount -= amount
				if items[i].amount <= 0:
					items[i] = null
				inventory_changed.emit()
				return true
	return false

func has_item(item_type: BlockType.Type, amount: int = 1) -> bool:
	var count = 0
	for item in items:
		if item != null and item.type == item_type:
			count += item.amount
	return count >= amount

func get_selected_item() -> ItemStack:
	return items[selected_slot]

func clear():
	for i in range(items.size()):
		items[i] = null
	inventory_changed.emit()

class ItemStack:
	var type: BlockType.Type
	var amount: int
	
	func _init(t: BlockType.Type, a: int = 1):
		type = t
		amount = a
