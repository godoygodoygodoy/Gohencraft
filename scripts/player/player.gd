extends CharacterBody3D
## Player - Personagem controlado pelo jogador

# Movimento
@export var speed: float = 5.0
@export var sprint_speed: float = 8.0
@export var jump_velocity: float = 8.0
@export var mouse_sensitivity: float = 0.002

# Componentes
@onready var camera: Camera3D = $Camera3D
@onready var raycast: RayCast3D = $Camera3D/RayCast3D

# Estado
var is_sprinting: bool = false
var gravity: float = 20.0
var inventory: InventorySystem

func _ready():
	GameManager.player = self
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	inventory = InventorySystem.new()
	add_child(inventory)
	
	# Adicionar alguns itens iniciais para teste
	inventory.add_item(BlockType.Type.WOOD, 10)
	inventory.add_item(BlockType.Type.STONE, 20)
	
	print("Player spawned")
	EventBus.player_spawned.emit(self)

func _input(event):
	# Controle de câmera apenas se o mouse estiver capturado
	if event is InputEventMouseMotion and Input.mouse_mode == Input.MOUSE_MODE_CAPTURED:
		rotate_y(-event.relative.x * mouse_sensitivity)
		camera.rotate_x(-event.relative.y * mouse_sensitivity)
		camera.rotation.x = clamp(camera.rotation.x, -PI/2, PI/2)
	
	# ESC para liberar mouse (não pausar)
	if event.is_action_pressed("ui_cancel") and not get_tree().paused:
		if Input.mouse_mode == Input.MOUSE_MODE_CAPTURED:
			Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
		else:
			Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	
	# Interação com blocos apenas se mouse estiver capturado
	if Input.mouse_mode == Input.MOUSE_MODE_CAPTURED:
		if event.is_action_pressed("break_block"):
			break_block()
		
		if event.is_action_pressed("place_block"):
			place_block()

func _physics_process(delta):
	# Aplicar gravidade
	if not is_on_floor():
		velocity.y -= gravity * delta
	
	# Pulo
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = jump_velocity
	
	# Sprint
	is_sprinting = Input.is_action_pressed("sprint")
	
	# Movimento
	var input_dir = Input.get_vector("move_left", "move_right", "move_forward", "move_backward")
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	
	if direction:
		var current_speed = sprint_speed if is_sprinting else speed
		velocity.x = direction.x * current_speed
		velocity.z = direction.z * current_speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
		velocity.z = move_toward(velocity.z, 0, speed)
	
	move_and_slide()

func break_block():
	if not raycast.is_colliding():
		return
	
	var hit_pos = raycast.get_collision_point()
	var normal = raycast.get_collision_normal()
	
	# Ajustar posição para o centro do bloco
	var block_pos = (hit_pos + normal * 0.5).floor()
	
	var block = GameManager.world.get_block_at_world_position(Vector3i(block_pos))
	if block and not block.is_air():
		# Adicionar bloco ao inventário
		inventory.add_item(block.type, 1)
		GameManager.world.set_block_at_world_position(Vector3i(block_pos), BlockType.Type.AIR)
		print("Bloco quebrado: ", BlockType.get_block_name(block.type))
		print("Bloco quebrado em: ", block_pos)

func place_block():
	if not raycast.is_colliding():
		return
	
	var hit_pos = raycast.get_collision_point()
	var normal = raycast.get_collision_normal()
	
	# Ajustar posição para colocar no lado do bloco atingido
	var block_pos = (hit_pos + normal * 0.5).floor()
	
	# Verificar se o jogador não está na posição do bloco
	# Tentar colocar bloco do inventário
	var selected_item = inventory.get_selected_item()
	if selected_item != null:
		if GameManager.world:
			GameManager.world.set_block_at_world_position(Vector3i(block_pos), selected_item.type)
			inventory.remove_item(selected_item.type, 1)
			print("Bloco colocado: ", BlockType.get_block_name(selected_item.type))
	else:
		# Fallback: colocar pedra se não tiver nada selecionado
		if inventory.has_item(BlockType.Type.STONE, 1):
			if GameManager.world:
				GameManager.world.set_block_at_world_position(Vector3i(block_pos), BlockType.Type.STONE)
				inventory.remove_item(BlockType.Type.STONE, 1
	if GameManager.world:
		# Por padrão, colocar pedra (depois será do inventário)
		GameManager.world.set_block_at_world_position(Vector3i(block_pos), BlockType.Type.STONE)
		print("Bloco colocado em: ", block_pos)
