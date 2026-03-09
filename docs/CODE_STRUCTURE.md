# GOHENCRAFT - Estrutura de Código Sugerida

## 📁 Estrutura de Pastas do Projeto

```
gohencraft/
│
├── src/                          # Código-fonte
│   ├── core/                     # Sistemas principais
│   │   ├── Game.cs               # Loop principal do jogo
│   │   ├── GameState.cs          # Estado do jogo
│   │   └── Time.cs               # Sistema de tempo
│   │
│   ├── world/                    # Sistema de mundo
│   │   ├── World.cs              # Classe principal do mundo
│   │   ├── Chunk.cs              # Chunk individual
│   │   ├── ChunkManager.cs       # Gerenciador de chunks
│   │   ├── Block.cs              # Classe de bloco
│   │   ├── BlockType.cs          # Enumeração de tipos
│   │   └── generation/           # Geração procedural
│   │       ├── WorldGenerator.cs
│   │       ├── BiomeGenerator.cs
│   │       ├── NoiseGenerator.cs
│   │       ├── CaveGenerator.cs
│   │       └── StructureGenerator.cs
│   │
│   ├── entities/                 # Entidades do jogo
│   │   ├── Entity.cs             # Classe base
│   │   ├── Player.cs             # Jogador
│   │   ├── Enemy.cs              # Inimigo base
│   │   ├── enemies/              # Inimigos específicos
│   │   │   ├── Zombie.cs
│   │   │   ├── Skeleton.cs
│   │   │   ├── Spider.cs
│   │   │   └── Slime.cs
│   │   └── bosses/               # Bosses
│   │       ├── Poseidon.cs
│   │       ├── Hades.cs
│   │       ├── Zeus.cs
│   │       └── Chronos.cs
│   │
│   ├── components/               # Sistema de componentes (ECS)
│   │   ├── Transform.cs
│   │   ├── Health.cs
│   │   ├── Movement.cs
│   │   ├── Combat.cs
│   │   └── AI.cs
│   │
│   ├── systems/                  # Sistemas (ECS)
│   │   ├── MovementSystem.cs
│   │   ├── CombatSystem.cs
│   │   ├── AISystem.cs
│   │   └── PhysicsSystem.cs
│   │
│   ├── rendering/                # Sistema de renderização
│   │   ├── Renderer.cs           # Renderizador principal
│   │   ├── Camera.cs             # Câmera
│   │   ├── Mesh.cs               # Mesh de blocos
│   │   ├── Shader.cs             # Shaders
│   │   ├── TextureAtlas.cs       # Atlas de texturas
│   │   └── ChunkRenderer.cs      # Renderiza chunks
│   │
│   ├── inventory/                # Sistema de inventário
│   │   ├── Inventory.cs          # Inventário principal
│   │   ├── Item.cs               # Item base
│   │   ├── ItemStack.cs          # Pilha de itens
│   │   ├── Tool.cs               # Ferramenta base
│   │   └── Weapon.cs             # Arma base
│   │
│   ├── crafting/                 # Sistema de crafting
│   │   ├── CraftingManager.cs
│   │   ├── Recipe.cs
│   │   ├── CraftingTable.cs
│   │   └── Furnace.cs
│   │
│   ├── progression/              # Sistema de progressão
│   │   ├── LevelSystem.cs        # Sistema de level
│   │   ├── ExperienceManager.cs  # XP
│   │   ├── PowerPath.cs          # Caminhos de poder
│   │   ├── SkillTree.cs          # Árvore de habilidades
│   │   └── AbilityManager.cs     # Gerenciador de habilidades
│   │
│   ├── abilities/                # Habilidades
│   │   ├── Ability.cs            # Classe base
│   │   ├── water/                # Caminho da Água
│   │   │   ├── WaterBall.cs
│   │   │   ├── WaterShield.cs
│   │   │   └── HealingWave.cs
│   │   ├── earth/                # Caminho da Terra
│   │   ├── fire/                 # Caminho do Fogo
│   │   ├── light/                # Caminho da Luz
│   │   └── shadow/               # Caminho da Sombra
│   │
│   ├── ai/                       # Inteligência Artificial
│   │   ├── AIController.cs       # Controlador base
│   │   ├── Pathfinding.cs        # A* pathfinding
│   │   ├── StateMachine.cs       # Máquina de estados
│   │   └── behaviors/            # Comportamentos
│   │       ├── IdleBehavior.cs
│   │       ├── PatrolBehavior.cs
│   │       ├── ChaseBehavior.cs
│   │       └── AttackBehavior.cs
│   │
│   ├── physics/                  # Sistema de física
│   │   ├── PhysicsEngine.cs
│   │   ├── Collider.cs
│   │   ├── Rigidbody.cs
│   │   └── RaycastHit.cs
│   │
│   ├── ui/                       # Interface do usuário
│   │   ├── UIManager.cs
│   │   ├── HUD.cs                # HUD principal
│   │   ├── InventoryUI.cs        # UI de inventário
│   │   ├── CraftingUI.cs         # UI de crafting
│   │   ├── SkillTreeUI.cs        # UI da skill tree
│   │   └── MenuUI.cs             # Menus
│   │
│   ├── networking/               # Multiplayer
│   │   ├── NetworkManager.cs
│   │   ├── Server.cs
│   │   ├── Client.cs
│   │   ├── NetworkPlayer.cs
│   │   └── Synchronization.cs
│   │
│   ├── audio/                    # Sistema de áudio
│   │   ├── AudioManager.cs
│   │   ├── MusicPlayer.cs
│   │   └── SoundEffect.cs
│   │
│   ├── input/                    # Sistema de input
│   │   ├── InputManager.cs
│   │   ├── KeyBindings.cs
│   │   └── Controller.cs
│   │
│   ├── save/                     # Sistema de salvamento
│   │   ├── SaveManager.cs
│   │   ├── WorldSave.cs
│   │   └── PlayerSave.cs
│   │
│   ├── utils/                    # Utilitários
│   │   ├── Math/
│   │   │   ├── Vector3Int.cs
│   │   │   ├── NoiseUtils.cs
│   │   │   └── MathUtils.cs
│   │   ├── Debug/
│   │   │   ├── DebugDraw.cs
│   │   │   └── Console.cs
│   │   └── Pooling/
│   │       └── ObjectPool.cs
│   │
│   └── textures/                 # Texturas (atual)
│       ├── blocks/               # Blocos
│       ├── items/                # Itens (futuro)
│       ├── entities/             # Entidades (futuro)
│       └── ui/                   # UI (futuro)
│
├── assets/                       # Assets do jogo
│   ├── textures/                 # Link ou cópia de src/textures
│   ├── audio/
│   │   ├── music/
│   │   └── sfx/
│   ├── models/
│   └── shaders/
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
├── tests/                        # Testes (futuro)
│   ├── unit/
│   └── integration/
│
├── tools/                        # Ferramentas de desenvolvimento
│   ├── world_editor/
│   └── texture_packer/
│
├── GAME_DESIGN_DOCUMENT.md       # GDD principal
├── README.md                     # README
├── .gitignore
└── LICENSE

```

---

## 🏗️ Arquitetura Sugerida

### Entity Component System (ECS)

Usar ECS para melhor performance e flexibilidade:

**Entidades:**
- São apenas IDs
- Não contêm lógica

**Componentes:**
- Apenas dados
- Transform, Health, Movement, etc.

**Sistemas:**
- Processam entidades com componentes específicos
- MovementSystem, CombatSystem, etc.

**Exemplo:**

```csharp
// Componente
public class Health : Component {
    public float current;
    public float max;
}

// Sistema
public class HealthSystem : System {
    public void Update() {
        foreach (Entity entity in GetEntities<Health>()) {
            Health health = entity.Get<Health>();
            if (health.current <= 0) {
                entity.Destroy();
            }
        }
    }
}
```

---

## 📦 Gerenciamento de Chunks

### Estrutura de Chunk

```csharp
public class Chunk {
    public const int SIZE = 16;
    public const int HEIGHT = 256;
    
    public Vector3Int position;
    public Block[,,] blocks = new Block[SIZE, HEIGHT, SIZE];
    public Mesh mesh;
    
    public void Generate() { }
    public void BuildMesh() { }
    public void Render() { }
}
```

### ChunkManager

```csharp
public class ChunkManager {
    Dictionary<Vector3Int, Chunk> chunks;
    Queue<Chunk> chunkLoadQueue;
    
    public void LoadChunksAroundPlayer(Vector3 playerPosition) { }
    public void UnloadDistantChunks(Vector3 playerPosition) { }
    public Chunk GetChunk(Vector3Int position) { }
}
```

---

## 🎮 Loop Principal do Jogo

```csharp
public class Game {
    void Initialize() {
        // Inicializar sistemas
        renderer = new Renderer();
        world = new World();
        player = new Player();
        inputManager = new InputManager();
        // ...
    }
    
    void Update(float deltaTime) {
        // Atualizar lógica
        inputManager.Update();
        player.Update(deltaTime);
        world.Update(deltaTime);
        entityManager.Update(deltaTime);
        aiSystem.Update(deltaTime);
        physicsSystem.Update(deltaTime);
    }
    
    void Render() {
        // Renderizar
        renderer.BeginFrame();
        world.Render();
        entityManager.Render();
        ui.Render();
        renderer.EndFrame();
    }
    
    void Run() {
        Initialize();
        while (running) {
            float deltaTime = CalculateDeltaTime();
            Update(deltaTime);
            Render();
        }
        Cleanup();
    }
}
```

---

## 🔧 Padrões de Design Recomendados

### 1. Singleton (com cuidado)
Para managers globais:
- GameManager
- AudioManager
- InputManager

### 2. Object Pool
Para objetos frequentemente criados/destruídos:
- Projéteis
- Partículas
- Chunks

### 3. Observer Pattern
Para eventos:
- Morte de inimigo → XP gain
- Level up → Unlock abilities
- Boss derrotado → Cutscene

### 4. Strategy Pattern
Para comportamentos variáveis:
- AI behaviors
- Pathfinding algorithms

### 5. Factory Pattern
Para criação de objetos:
- ItemFactory
- EntityFactory
- BlockFactory

---

## 📊 Otimizações Importantes

### Chunks
- Carregar/descarregar baseado em distância do player
- Thread separada para geração procedural
- Pooling de chunks

### Rendering
- Frustum culling
- Occlusion culling (chunks atrás de outros)
- Mesh batching
- Instancing para blocos repetidos

### Física
- Spatial partitioning (grid, quadtree)
- Broad phase collision detection
- Sleep inativo entities

### Memória
- Object pooling
- Texture atlasing
- LOD (Level of Detail) para distâncias

---

## 🧪 Testing

### Unit Tests
- Geração de mundo
- Pathfinding
- Damage calculations
- Inventory operations

### Integration Tests
- Player-World interaction
- Multiplayer sync
- Save/Load system

---

## 🔐 Salvamento

### Formato de Save

```json
{
  "version": "0.1.0",
  "player": {
    "position": [100, 70, 200],
    "health": 100,
    "level": 15,
    "power_path": "fire",
    "inventory": [...],
    "abilities": [...]
  },
  "world": {
    "seed": 123456789,
    "chunks": [
      {
        "position": [0, 0, 0],
        "modified_blocks": [...]
      }
    ]
  },
  "bosses_defeated": ["poseidon"]
}
```

---

## 🌐 Networking (Multiplayer)

### Arquitetura Client-Server

**Server:**
- Autoridade sobre o mundo
- Valida ações dos clientes
- Sincroniza estado

**Client:**
- Envia inputs
- Predição local (client-side prediction)
- Reconcilia com servidor

### Sincronização
- Player position: 20 updates/sec
- Entity state: 10 updates/sec
- World changes: Event-based

---

## 📝 Convenções de Código

### Nomenclatura
- Classes: `PascalCase`
- Métodos: `PascalCase`
- Variáveis locais: `camelCase`
- Constantes: `UPPER_SNAKE_CASE`
- Private fields: `_camelCase` ou `camelCase`

### Comentários
```csharp
// Single-line comment para explicações breves

/// <summary>
/// XML documentation para métodos públicos
/// </summary>
public void DoSomething() { }
```

---

## 🚀 Próximos Passos

1. **Criar projeto base** na engine escolhida
2. **Implementar estrutura de pastas**
3. **Sistema de chunks básico**
4. **Renderização de blocos**
5. **Movimento do player**
6. **Sistema de inventário**
7. **... seguir roadmap técnico**

---

*Esta estrutura pode ser adaptada conforme a engine/linguagem escolhida.*
