# 🚀 SETUP - Como Executar o Gohencraft

## Pré-requisitos

- **Godot Engine 4.6.1** instalado
  - Download: https://godotengine.org/download

## ⚡ Início Rápido

### 1. Abrir o Projeto

1. Abra o **Godot Engine 4.6.1**
2. Clique em **"Import"**
3. Navegue até a pasta do projeto `gohencraft`
4. Selecione o arquivo `project.godot`
5. Clique em **"Import & Edit"**

### 2. Executar o Jogo

- Pressione **F5** ou clique no botão ▶️ **"Play"** no canto superior direito
- Ou pressione **F6** para executar a cena atual

## 🎮 Controles

### Movimento
- **W, A, S, D** - Mover
- **Espaço** - Pular
- **Shift** - Correr (sprint)
- **Mouse** - Olhar ao redor

### Interação com Blocos
- **Botão Esquerdo do Mouse** - Quebrar bloco
- **Botão Direito do Mouse** - Colocar bloco (pedra por padrão)

### Interface
- **ESC** - Liberar/Capturar mouse
- **E** - Inventário *(não implementado ainda)*

## 📋 O Que Foi Implementado

### ✅ Sistema Core
- [x] Autoload Singletons (GameManager, EventBus, SaveManager)
- [x] Sistema de Input configurado
- [x] Estrutura de projeto Godot

### ✅ Sistema de Mundo
- [x] Sistema de chunks (16x16x256)
- [x] Geração de terreno simples
- [x] Renderização de blocos
- [x] Face culling básico
- [x] Carregamento/descarregamento dinâmico de chunks
- [x] Colisão com blocos

### ✅ Player
- [x] Movimento (WASD)
- [x] Pulo e gravidade
- [x] Sprint
- [x] Controle de câmera (mouse look)
- [x] Raycast para interação
- [x] Quebrar e colocar blocos

### ✅ UI
- [x] Crosshair (mira central)
- [x] Debug info (FPS, posição, chunks)

### ✅ Blocos Definidos
- [x] Air, Dirt, Grass, Stone
- [x] Wood, Wood Planks, Leaves
- [x] Sand, Water
- [x] Crafting Table

## 🔧 Próximos Passos de Desenvolvimento

### Em Breve
- [ ] Sistema de inventário
- [ ] Diferentes ferramentas (picareta, machado)
- [ ] Sistema de crafting
- [ ] Texturas dos blocos (usando as texturas 16x16 criadas)

### Médio Prazo
- [ ] Geração procedural avançada (biomas, cavernas)
- [ ] Sistema de combate
- [ ] Inimigos e IA
- [ ] Sistema de progressão (XP, levels)

### Longo Prazo
- [ ] Caminhos de poder
- [ ] Multiplayer
- [ ] Bosses
- [ ] Três dimensões (Terra, Inferno, Céu)

## 🐛 Problemas Conhecidos

- As texturas dos blocos ainda não estão aplicadas (usando cores padrão do Godot)
- Colisão pode ser pesada com muitos chunks
- Não há otimização de mesh batching ainda

## 💡 Dicas

1. **Performance:** Se o FPS estiver baixo, reduza o `render_distance` no World (padrão: 4)
2. **Exploração:** Ande bastante para ver novos chunks sendo carregados
3. **Construção:** Use botão direito do mouse para construir (atualmente só coloca pedra)

## 📁 Estrutura do Projeto

```
gohencraft/
├── project.godot          # Configuração do projeto Godot
├── scenes/
│   ├── main.tscn         # Cena principal
│   ├── world.tscn        # Cena do mundo
│   └── player.tscn       # Cena do jogador
├── scripts/
│   ├── core/
│   │   └── autoload/     # Singletons globais
│   ├── world/            # Sistema de mundo/chunks/blocos
│   ├── player/           # Script do player
│   └── ui/               # Scripts de interface
└── docs/                 # Documentação do projeto
```

## 🆘 Suporte

Se encontrar problemas:
1. Verifique se está usando **Godot 4.6.1** (não funcionará em versões anteriores)
2. Veja o console do Godot para mensagens de erro
3. Pressione **F12** para abrir o debugger

---

**Divirta-se explorando o mundo de Gohencraft!** 🎮
