# GOHENCRAFT - Estrutura de Código Sugerida

> **Engine:** Godot 4.6.1  
> **Linguagem:** GDScript  
> **Arquitetura:** Node-based com scripts GDScript

## 📁 Estrutura de Pastas do Projeto Godot

```
gohencraft/
│
├── scenes/                       # Cenas Godot (.tscn)
│   ├── main.tscn                 # Cena principal
│   ├── world/
│   │   ├── world.tscn
│   │   ├── chunk.tscn
│   │   └── block.tscn
│   ├── entities/
│   │   ├── player.tscn
│   │   ├── enemies/
│   │   │   ├── zombie.tscn
│   │   │   ├── skeleton.tscn
│   │   │   └── spider.tscn
│   │   └── bosses/
│   │       ├── poseidon.tscn
│   │       ├── hades.tscn
│   │       ├── zeus.tscn
│   │       └── chronos.tscn
│   └── ui/
│       ├── hud.tscn
│       ├── inventory.tscn
│       ├── crafting_menu.tscn
│       └── skill_tree.tscn
│
├── scripts/                      # Scripts GDScript (.gd)
│   ├── core/                     # Sistemas principais
│   │   ├── game.gd               # Loop principal do jogo
│   │   ├── game_state.gd         # Estado do jogo
│   │   └── autoload/             # Singletons (autoload)
│   │       ├── game_manager.gd
│   │       ├── event_bus.gd
│   │       └── save_manager.gd
│   │
│   ├── world/                    # Sistema de mundo
│   │   ├── world.gd              # Classe principal do mundo
│   │   ├── chunk.gd              # Chunk individual (MeshInstance3D)
│   │   ├── chunk_manager.gd      # Gerenciador de chunks
│   │   ├── block.gd              # Dados de bloco
│   │   ├── block_type.gd         # Enumeração de tipos
│   │   └── generation/           # Geração procedural
│   │       ├── world_generator.gd
│   │       ├── biome_generator.gd
│   │       ├── noise_generator.gd
│   │       ├── cave_generator.gd
│   │       └── structure_generator.gd
│   │
│   ├── entities/                 # Entidades do jogo
│   │   ├── entity.gd             # Classe base (CharacterBody3D)
│   │   ├── player.gd             # Jogador
│   │   ├── enemy.gd              # Inimigo base
│   │   ├── enemies/              # Inimigos específicos
│   │   │   ├── zombie.gd
│   │   │   ├── skeleton.gd
│   │   │   ├── spider.gd
│   │   │   └── slime.gd
│   │   └── bosses/               # Bosses
│   │       ├── poseidon.gd
│   │       ├── hades.gd
│   │       ├── zeus.gd
│   │       └── chronos.gd
│   │
│   ├── components/               # Componentes reutilizáveis
│   │   ├── health_component.gd
│   │   ├── movement_component.gd
│   │   ├── combat_component.gd
│   │   └── ai_component.gd
│   │
│   ├── inventory/                # Sistema de inventário
│   │   ├── inventory.gd          # Inventário principal
│   │   ├── item.gd               # Resource class (Item)
│   │   ├── item_stack.gd         # Pilha de itens
│   │   ├── tool.gd               # Ferramenta base
│   │   └── weapon.gd             # Arma base
│   │
│   ├── crafting/                 # Sistema de crafting
│   │   ├── crafting_manager.gd
│   │   ├── recipe.gd             # Resource class
│   │   ├── crafting_table.gd
│   │   └── furnace.gd
│   │
│   ├── progression/              # Sistema de progressão
│   │   ├── level_system.gd       # Sistema de level
│   │   ├── experience_manager.gd # XP
│   │   ├── power_path.gd         # Caminhos de poder
│   │   ├── skill_tree.gd         # Árvore de habilidades
│   │   └── ability_manager.gd    # Gerenciador de habilidades
│   │
│   ├── abilities/                # Habilidades
│   │   ├── ability.gd            # Classe base
│   │   ├── water/                # Caminho da Água
│   │   │   ├── water_ball.gd
│   │   │   ├── water_shield.gd
│   │   │   └── healing_wave.gd
│   │   ├── earth/                # Caminho da Terra
│   │   ├── fire/                 # Caminho do Fogo
│   │   ├── light/                # Caminho da Luz
│   │   └── shadow/               # Caminho da Sombra
│   │
│   ├── ai/                       # Inteligência Artificial
│   │   ├── ai_controller.gd      # Controlador base
│   │   ├── pathfinding.gd        # NavigationAgent3D wrapper
│   │   ├── state_machine.gd      # Máquina de estados
│   │   └── behaviors/            # Comportamentos
│   │       ├── idle_behavior.gd
│   │       ├── patrol_behavior.gd
│   │       ├── idle_behavior.gd
│   │       ├── patrol_behavior.gd
│   │       ├── chase_behavior.gd
│   │       └── attack_behavior.gd
│   │
│   ├── ui/                       # Interface do usuário
│   │   ├── ui_manager.gd
│   │   ├── hud.gd                # HUD principal
│   │   ├── inventory_ui.gd       # UI de inventário
│   │   ├── crafting_ui.gd        # UI de crafting
│   │   ├── skill_tree_ui.gd      # UI da skill tree
│   │   └── menu_ui.gd            # Menus
│   │
│   ├── networking/               # Multiplayer
│   │   ├── network_manager.gd    # Usa MultiplayerAPI do Godot
│   │   ├── server.gd
│   │   ├── client.gd
│   │   └── network_player.gd
│   │
│   └── utils/                    # Utilitários
│       ├── math_utils.gd
│       ├── noise_utils.gd
│       └── object_pool.gd
│
├── resources/                    # Resources do Godot (.tres)
│   ├── items/                    # Item resources
│   │   ├── tools/
│   │   ├── weapons/
│   │   └── materials/
│   ├── recipes/                  # Recipe resources
│   ├── abilities/                # Ability resources
│   └── blocks/                   # Block data resources
│
├── assets/                       # Assets do jogo
│   ├── textures/                 # Texturas
│   │   ├── blocks/               # Blocos 16x16
│   │   ├── items/                # Itens
│   │   ├── entities/             # Entidades
│   │   └── ui/                   # UI
│   ├── audio/
│   │   ├── music/
│   │   └── sfx/
│   ├── models/                   # Modelos 3D (.glb, .gltf)
│   └── shaders/                  # Shaders (.gdshader)
│       ├── block_shader.gdshader
│       └── water_shader.gdshader
│
├── addons/                       # Plugins do Godot (se necessário)
│
├── docs/                         # Documentação
│   ├── STORY.md
│   ├── POWER_SYSTEM.md
│   ├── TECHNICAL_ROADMAP.md
│   ├── ASSETS.md
│   ├── CRAFTING.md
│   ├── BIOMES.md
│   └── CODE_STRUCTURE.md         # Este arquivo
│
├── tests/                        # Testes (GUT framework)
│   ├── unit/
│   └── integration/
│
├── tools/                        # Ferramentas de desenvolvimento
│
├── project.godot                 # Arquivo de projeto Godot
├── GAME_DESIGN_DOCUMENT.md       # GDD principal
├── README.md                     # README
├── .gitignore
└── LICENSE

```

---

## 🏗️ Arquitetura Godot (Node-based)

### Sistema de Nodes

Godot usa uma arquitetura baseada em **nodes** e **cenas**:

**Nodes:**
- Tudo é um Node (Node3D, CharacterBody3D, MeshInstance3D, etc.)
- Hierarquia de nodes forma uma árvore de cena

**Scenes:**
- Coleção de nodes salvos como .tscn
- Reutilizáveis e instanciáveis
- Podem ser compostos (cenas dentro de cenas)

**Scripts:**
- GDScript anexado a nodes
- Acesso direto às propriedades e métodos do node

### Pattern: Componentes como Nodes Filhos

Ao invés de ECS tradicional, usar **composição de nodes**:

```gdscript
# Exemplo de estrutura
Player (CharacterBody3D)
├── MeshInstance3D
├── CollisionShape3D
├── Camera3D
├── HealthComponent (Node)
├── CombatComponent (Node)
└── InventoryComponent (Node)
```

**Exemplo de HealthComponent:**

```gdscript
# scripts/components/health_component.gd
class_name HealthComponent
extends Node

signal health_changed(new_health, max_health)
signal died()

@export var max_health: float = 100.0
var current_health: float

func _ready():
	current_health = max_health

func take_damage(amount: float) -> void:
	current_health = max(0, current_health - amount)
	health_changed.emit(current_health, max_health)
	
	if current_health <= 0:
		died.emit()

func heal(amount: float) -> void:
	current_health = min(max_health, current_health + amount)
	health_changed.emit(current_health, max_health)
```

---

## 📦 Gerenciamento de Chunks

### Estrutura de Chunk

```gdscript
# scripts/world/chunk.gd
class_name Chunk
extends MeshInstance3D

const CHUNK_SIZE := 16
const CHUNK_HEIGHT := 256

var chunk_position: Vector3i
var blocks: Array = []  # [CHUNK_SIZE][CHUNK_HEIGHT][CHUNK_SIZE]
var mesh_data: MeshData

func _ready():
	blocks.resize(CHUNK_SIZE * CHUNK_HEIGHT * CHUNK_SIZE)

func generate() -> void:
	# Lógica de geração de blocos
	pass

func build_mesh() -> void:
	var surface_tool := SurfaceTool.new()
	surface_tool.begin(Mesh.PRIMITIVE_TRIANGLES)
	
	# Construir mesh do chunk
	for x in CHUNK_SIZE:
		for y in CHUNK_HEIGHT:
			for z in CHUNK_SIZE:
				var block = get_block(x, y, z)
				if block != null:
					add_block_faces(surface_tool, x, y, z, block)
	
	mesh = surface_tool.commit()

func get_block(x: int, y: int, z: int):
	var index = x + z * CHUNK_SIZE + y * CHUNK_SIZE * CHUNK_SIZE
	return blocks[index]
```

### ChunkManager (Autoload Singleton)

```gdscript
# scripts/world/chunk_manager.gd
extends Node

var chunks: Dictionary = {}  # Vector3i -> Chunk
var chunk_scene := preload("res://scenes/world/chunk.tscn")
var load_distance := 8
var unload_distance := 12

func _process(_delta):
	var player_pos = get_player_position()
	load_chunks_around_player(player_pos)
	unload_distant_chunks(player_pos)

func load_chunks_around_player(player_pos: Vector3) -> void:
	var chunk_pos = world_to_chunk_position(player_pos)
	
	for x in range(-load_distance, load_distance):
		for z in range(-load_distance, load_distance):
			var pos = Vector3i(chunk_pos.x + x, 0, chunk_pos.z + z)
			if not chunks.has(pos):
				load_chunk(pos)

func load_chunk(pos: Vector3i) -> void:
	var chunk = chunk_scene.instantiate()
	chunk.chunk_position = pos
	add_child(chunk)
	chunk.generate()
	chunk.build_mesh()
	chunks[pos] = chunk

func unload_chunk(pos: Vector3i) -> void:
	if chunks.has(pos):
		var chunk = chunks[pos]
		chunk.queue_free()
		chunks.erase(pos)

func world_to_chunk_position(world_pos: Vector3) -> Vector3i:
	return Vector3i(
		floori(world_pos.x / Chunk.CHUNK_SIZE),
		0,
		floori(world_pos.z / Chunk.CHUNK_SIZE)
	)
```

---

## 🎮 Loop Principal (Autoload)

```gdscript
# scripts/core/autoload/game_manager.gd
extends Node

var player: Player
var world: World

func _ready():
	# Inicializar sistemas
	initialize_game()

func _process(delta):
	# Atualizado automaticamente pelo engine
	pass

func initialize_game() -> void:
	load_world()
	spawn_player()

func load_world() -> void:
	var world_scene = preload("res://scenes/world/world.tscn")
	world = world_scene.instantiate()
	add_child(world)

func spawn_player() -> void:
	var player_scene = preload("res://scenes/entities/player.tscn")
	player = player_scene.instantiate()
	world.add_child(player)
	player.global_position = Vector3(0, 100, 0)
```

---

## 🔧 Autoload Singletons (Configurar em Project Settings)

Godot permite criar **singletons globais** via Autoload:

1. **GameManager** - Gerencia estado geral do jogo
2. **EventBus** - Sistema de eventos global
3. **SaveManager** - Salvamento e carregamento
4. **AudioManager** - Gerenciamento de áudio
5. **InputManager** - Mapeamento de input customizado

### Exemplo: EventBus

```gdscript
# scripts/core/autoload/event_bus.gd
extends Node

# Sinais globais
signal player_damaged(damage: float)
signal player_died()
signal item_crafted(item: Item)
signal level_up(new_level: int)
signal ability_unlocked(ability: Ability)

# Uso em qualquer script:
# EventBus.player_damaged.emit(10.0)
# EventBus.player_damaged.connect(_on_player_damaged)
```

---

## 🎨 Sistema de Resources

Godot usa **Resources** (.tres) para dados reutilizáveis:

### Exemplo: Item Resource

```gdscript
# scripts/inventory/item.gd
class_name Item
extends Resource

enum ItemType { MATERIAL, TOOL, WEAPON, CONSUMABLE }

@export var item_name: String
@export var item_type: ItemType
@export var icon: Texture2D
@export var max_stack_size: int = 64
@export var durability: int = -1  # -1 = sem durabilidade
@export_multiline var description: String
```

Criar instâncias no editor salvando como .tres:
- `res://resources/items/materials/wood.tres`
- `res://resources/items/tools/stone_pickaxe.tres`

---

## 🌐 Multiplayer (High-Level API)

Godot 4.x possui uma API de multiplayer de alto nível:

```gdscript
# scripts/networking/network_manager.gd
extends Node

const PORT = 7777
const MAX_PLAYERS = 4

func create_server():
	var peer = ENetMultiplayerPeer.new()
	peer.create_server(PORT, MAX_PLAYERS)
	multiplayer.multiplayer_peer = peer
	
	multiplayer.peer_connected.connect(_on_player_connected)
	multiplayer.peer_disconnected.connect(_on_player_disconnected)

func join_server(address: String):
	var peer = ENetMultiplayerPeer.new()
	peer.create_client(address, PORT)
	multiplayer.multiplayer_peer = peer

@rpc("any_peer")
func sync_player_position(pos: Vector3):
	# Sincronizar posição entre players
	pass

func _on_player_connected(id: int):
	print("Player %d connected" % id)

func _on_player_disconnected(id: int):
	print("Player %d disconnected" % id)
```

---

## 🔧 Padrões de Design Recomendados para Godot

### 1. Autoload Singletons
Para managers globais acessíveis de qualquer lugar:
- GameManager
- AudioManager
- SaveManager
- EventBus

### 2. Signals (Observer Pattern)
Sistema nativo do Godot para eventos:

```gdscript
# Emitir sinal
signal health_changed(new_value)
health_changed.emit(50)

# Conectar sinal
player.health_changed.connect(_on_player_health_changed)
```

### 3. Composição de Nodes
Ao invés de herança profunda, usar composição:

```gdscript
Enemy (CharacterBody3D)
├── HealthComponent
├── AttackComponent
├── LootComponent
└── AIComponent
```

### 4. Resources para Dados
Usar Resources (.tres) para dados reutilizáveis:
- Items
- Recipes
- Enemy stats
- Abilities

### 5. Scene Instancing
Reutilizar cenas como templates:

```gdscript
var enemy_scene = preload("res://scenes/enemies/zombie.tscn")
var enemy = enemy_scene.instantiate()
add_child(enemy)
```

---

## 📊 Otimizações Importantes para Godot

### Chunks e World
- Usar `Thread` para geração procedural em background
- Implementar frustum culling manual se necessário
- Pooling de chunks com `Node.queue_free()` e reutilização
- Usar `RenderingServer` para otimizações de baixo nível

### Rendering
- **MultiMeshInstance3D** para blocos repetidos (instancing)
- **OccluderInstance3D** para occlusion culling
- Combinar múltiplos blocos em um único mesh por chunk
- Usar **Lightmap** GI ao invés de real-time para luzes estáticas

### Física
- Usar **CollisionShape3D** simples (box colliders)
- Implementar spatial partitioning manual se necessário
- Desabilitar física em entidades distantes
- Usar `collision_layer` e `collision_mask` adequadamente

### GDScript
- Evitar chamadas de funções em loops internos
- Cachear referências de nodes (`@onready var`)
- Usar tipos estáticos quando possível (`var speed: float = 5.0`)
- Preferir `@export` para expor variáveis no editor

## 🧪 Testing com GUT Framework

Godot possui o framework **GUT** (Godot Unit Test) para testes:

```gdscript
# tests/unit/test_health_component.gd
extends GutTest

var health_component

func before_each():
	health_component = HealthComponent.new()
	health_component.max_health = 100

func test_take_damage():
	health_component.take_damage(30)
	assert_eq(health_component.current_health, 70, "Deve ter 70 de vida")

func test_death_signal():
	watch_signals(health_component)
	health_component.take_damage(100)
	assert_signal_emitted(health_component, "died")
```

### Áreas de Teste Importantes
- Geração de mundo (noise, biomas)
- Pathfinding (A*)
- Cálculos de dano
- Operações de inventário
- Save/Load system

---

## 🔐 Sistema de Salvamento

### Salvamento com FileAccess

```gdscript
# scripts/core/autoload/save_manager.gd
extends Node

const SAVE_PATH = "user://save_game.json"

func save_game():
	var save_data = {
		"version": "0.1.0",
		"player": {
			"position": GameManager.player.global_position,
			"health": GameManager.player.health,
			"level": GameManager.player.level,
			"power_path": GameManager.player.power_path,
			"inventory": serialize_inventory(),
			"abilities": serialize_abilities()
		},
		"world": {
			"seed": GameManager.world.seed,
			"modified_blocks": serialize_world_changes()
		},
		"bosses_defeated": GameManager.bosses_defeated
	}
	
	var file = FileAccess.open(SAVE_PATH, FileAccess.WRITE)
	if file:
		file.store_string(JSON.stringify(save_data, "\t"))
		file.close()
		return true
	return false

func load_game():
	if not FileAccess.file_exists(SAVE_PATH):
		return null
	
	var file = FileAccess.open(SAVE_PATH, FileAccess.READ)
	if file:
		var json_string = file.get_as_text()
		file.close()
		var json = JSON.new()
		var parse_result = json.parse(json_string)
		if parse_result == OK:
			return json.data
	return null
```

### Formato de Save

```json
{
  "version": "0.1.0",
  "player": {
    "position": {"x": 100, "y": 70, "z": 200},
    "health": 100,
    "level": 15,
    "power_path": "fire",
    "inventory": [...],
    "abilities": [...]
  },
  "world": {
    "seed": 123456789,
    "modified_blocks": [
      {"chunk": [0, 0], "blocks": [...]}
    ]
  },
  "bosses_defeated": ["poseidon"]
}
```

---

## 🌐 Networking (Multiplayer)

### Arquitetura Client-Server com ENet

**Server (Autoridade):**
- Valida ações dos clientes
- Simula física e combate
- Sincroniza estado do mundo
- Gerencia spawn de inimigos

**Client (Predição):**
- Envia inputs ao servidor
- Client-side prediction para movimento
- Interpola posições de entities
- Reconcilia com servidor

### RPCs (Remote Procedure Calls)

```gdscript
# scripts/entities/player.gd
extends CharacterBody3D

@rpc("any_peer", "call_remote", "unreliable")
func sync_position(pos: Vector3, vel: Vector3):
	if multiplayer.get_remote_sender_id() != multiplayer.get_unique_id():
		global_position = pos
		velocity = vel

func _physics_process(delta):
	# ... movimento local ...
	
	if multiplayer.is_server():
		# Servidor envia para todos os clientes
		sync_position.rpc(global_position, velocity)
	elif Input.is_anything_pressed():
		# Cliente envia input ao servidor
		send_input.rpc_id(1, Input.get_vector("left", "right", "forward", "back"))
```

### Sincronização (Sugestão)
- **Player position/rotation:** 20 updates/sec (unreliable)
- **Health/Stats:** Event-based (reliable)
- **Block changes:** Event-based (reliable)
- **Combat actions:** Event-based (reliable)

---

## 📝 Convenções de Código GDScript

### Nomenclatura (Godot Style Guide)

```gdscript
# Classes e arquivos: snake_case (player.gd, health_component.gd)
class_name Player

# Constantes: UPPER_SNAKE_CASE
const MAX_HEALTH = 100
const JUMP_FORCE = 10.0

# Variáveis: snake_case
var player_name: String
var current_health: float
var _private_var: int  # prefixo _ para privado

# Funções: snake_case
func take_damage(amount: float) -> void:
	current_health -= amount

# Sinais: snake_case com past tense
signal health_changed
signal player_died

# Enums: PascalCase para o enum, UPPER_SNAKE_CASE para valores
enum PowerPath { WATER, EARTH, FIRE, LIGHT, SHADOW }

# Exports para o editor
@export var speed: float = 5.0
@export_range(0, 100) var health: int = 100

# Onready para cachear nodes
@onready var sprite = $Sprite3D
@onready var collision = $CollisionShape3D
```

### Comentários

```gdscript
# Comentário de linha única

## Documentação de função (aparece no editor)
## Causa dano ao jogador
## [param amount]: Quantidade de dano a aplicar
func take_damage(amount: float) -> void:
	pass
```

### Organização de Script

```gdscript
class_name Player
extends CharacterBody3D

# 1. Sinais
signal health_changed(new_health: float)

# 2. Enums
enum State { IDLE, WALKING, JUMPING }

# 3. Constantes
const SPEED = 5.0
const JUMP_VELOCITY = 4.5

# 4. Exports
@export var max_health: float = 100.0

# 5. Variáveis públicas
var current_health: float

# 6. Variáveis privadas
var _velocity: Vector3

# 7. Onready vars
@onready var mesh = $MeshInstance3D

# 8. Funções built-in (lifecycle)
func _ready():
	pass

func _process(delta):
	pass

func _physics_process(delta):
	pass

# 9. Funções públicas
func take_damage(amount: float):
	pass

# 10. Funções privadas
func _calculate_velocity():
	pass

# 11. Callbacks de sinais
func _on_area_entered(area):
	pass
```

---

## 🚀 Próximos Passos

1. **Criar projeto Godot 4.6.1**
2. **Configurar estrutura de pastas** (scenes/, scripts/, assets/)
3. **Configurar Autoloads** (GameManager, EventBus, SaveManager)
4. **Implementar sistema de chunks básico**
5. **Renderização de blocos com MeshInstance3D**
6. **Movimento do player com CharacterBody3D**
7. **Sistema de inventário com Resources**
8. **... seguir TECHNICAL_ROADMAP.md**

---

## 📚 Recursos Úteis

- **Documentação Godot 4.x:** https://docs.godotengine.org/
- **GDScript Style Guide:** https://docs.godotengine.org/en/stable/tutorials/scripting/gdscript/gdscript_styleguide.html
- **Godot Voxel Games:** Pesquisar "Godot voxel" para referências
- **Zylann's Voxel Tools:** Plugin popular para voxel games

---

*Esta estrutura está otimizada especificamente para Godot 4.6.1 com GDScript.*
