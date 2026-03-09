# GOHENCRAFT - Roadmap Técnico

## Fase 1: Fundação (Meses 1-3)

### Core Engine
- [ ] Renderização de blocos 16x16
- [ ] Sistema de chunks (carregamento de mundo)
- [ ] Câmera (primeira pessoa / terceira pessoa)
- [ ] Física básica (gravidade, colisão)
- [ ] Input handling (teclado, mouse)

### Sistema de Mundo
- [ ] Geração procedural básica (flat world primeiro)
- [ ] Sistema de coordenadas (X, Y, Z)
- [ ] Colocação e quebra de blocos
- [ ] Sistema de chunks (16x16x256)
- [ ] Salvamento e carregamento de mundo

### Assets
- [ ] Atlas de texturas básico
- [ ] Modelo de personagem
- [ ] UI primitiva
- [ ] Sons básicos

**Entregável:** Protótipo jogável de movimento e colocação de blocos

---

## Fase 2: Recursos e Crafting (Meses 4-5)

### Sistema de Inventário
- [ ] Sistema de slots
- [ ] UI de inventário
- [ ] Drag and drop
- [ ] Hotbar (9 slots rápidos)
- [ ] Stackable items

### Sistema de Crafting
- [ ] Crafting table funcional
- [ ] Receitas básicas
- [ ] UI de crafting (2x2 e 3x3)
- [ ] Sistema de ferramentas
- [ ] Durabilidade de itens

### Recursos Implementados
- [x] Madeira (log, planks)
- [x] Pedra
- [x] Terra/Grama
- [x] Areia
- [x] Água
- [x] Folhas
- [x] Crafting Table
- [ ] Minérios (cobre, ferro, ouro)
- [ ] Carvão

**Entregável:** Sistema completo de coleta e crafting

---

## Fase 3: Geração de Mundo (Meses 6-7)

### Geração Procedural Avançada
- [ ] Noise generation (Perlin/Simplex)
- [ ] Biomas básicos:
  - [ ] Planície
  - [ ] Floresta
  - [ ] Deserto
  - [ ] Montanha
  - [ ] Oceano
- [ ] Geração de cavernas
- [ ] Geração de árvores
- [ ] Geração de minérios
- [ ] Estruturas naturais

### Otimização
- [ ] Frustum culling
- [ ] Occlusion culling
- [ ] Chunk pooling
- [ ] Multi-threading para geração

**Entregável:** Mundo procedural completo e otimizado

---

## Fase 4: Combate e Inimigos (Meses 8-10)

### Sistema de Combate
- [ ] Health system
- [ ] Damage system
- [ ] Hitboxes
- [ ] Armas corpo a corpo
- [ ] Armas à distância
- [ ] Combo system (básico)
- [ ] Efeitos de dano (knockback, stun)

### IA de Inimigos
- [ ] Pathfinding básico (A*)
- [ ] Comportamento de perseguição
- [ ] Comportamento de ataque
- [ ] Estados de IA (idle, patrol, chase, attack)
- [ ] Spawn system

### Inimigos Básicos
- [ ] Inimigo melee (esqueleto/zumbi)
- [ ] Inimigo ranged (arqueiro)
- [ ] Inimigo voador
- [ ] Inimigo noturno

**Entregável:** Sistema de combate funcional com IA

---

## Fase 5: Progressão RPG (Meses 11-13)

### Sistema de Experiência
- [ ] Barra de XP
- [ ] Sistema de Level Up
- [ ] Curva de experiência
- [ ] Fontes de XP (mobs, mineração, crafting)

### Sistema de Status
- [ ] Vida (HP)
- [ ] Defesa
- [ ] Ataque
- [ ] Velocidade
- [ ] Crescimento por level

### Caminhos de Poder
- [ ] UI de escolha de caminho
- [ ] Árvore de habilidades (básica)
- [ ] Sistema de pontos de habilidade
- [ ] 5 caminhos implementados:
  - [ ] Água
  - [ ] Terra
  - [ ] Fogo
  - [ ] Luz
  - [ ] Sombra

### Habilidades (Tier 1 e 2 apenas)
- [ ] Sistema de hotkeys para habilidades
- [ ] Cooldown system
- [ ] Sistema de recursos (mana/energia)
- [ ] Visual effects básicos
- [ ] 3-5 habilidades por caminho

**Entregável:** Sistema de progressão RPG funcional

---

## Fase 6: Ciclo Dia/Noite e Eventos (Mês 14)

### Sistema de Tempo
- [ ] Ciclo de dia/noite
- [ ] Iluminação dinâmica
- [ ] Sistema de clima (chuva, etc)
- [ ] Relógio do jogo

### Spawn de Inimigos por Tempo
- [ ] Spawn aumentado à noite
- [ ] Spawn reduzido de dia
- [ ] Variação por bioma

### Evento: Lua Vermelha
- [ ] Sistema de detecção de evento
- [ ] Modificadores de inimigos
- [ ] Spawn rate aumentado
- [ ] Loot table melhorada
- [ ] Visual effects (céu vermelho)

**Entregável:** Sistema de tempo completo com evento especial

---

## Fase 7: Dimensões e Bosses (Meses 15-18)

### Sistema de Dimensões
- [ ] Portal system
- [ ] Transição entre dimensões
- [ ] Geração procedural do Inferno
- [ ] Geração procedural do Céu
- [ ] Biomas únicos por dimensão

### Boss Framework
- [ ] Sistema de boss (HP, fases, patterns)
- [ ] Boss arena
- [ ] Mecânicas de invulnerabilidade
- [ ] Drops exclusivos

### Implementação de Bosses

#### Poseidon (Terra)
- [ ] Model e animations
- [ ] 3 fases de ataque
- [ ] Habilidades de água
- [ ] Arena específica

#### Hades (Inferno)
- [ ] Model e animations
- [ ] Invocação de mortos
- [ ] Habilidades de sombra
- [ ] Arena no submundo

#### Zeus (Céu)
- [ ] Model e animations
- [ ] Ataques de raio
- [ ] Tempestades
- [ ] Arena nas nuvens

#### Chronos (Boss Final)
- [ ] Model e animations
- [ ] Manipulação do tempo
- [ ] Múltiplas fases
- [ ] Mecânicas únicas de tempo

**Entregável:** Três dimensões e quatro bosses jogáveis

---

## Fase 8: Multiplayer (Meses 19-22)

### Networking Básico
- [ ] Servidor dedicado ou P2P
- [ ] Sincronização de mundo
- [ ] Sincronização de jogadores
- [ ] Chat system

### Multiplayer Features
- [ ] Compartilhamento de mundo
- [ ] Sincronização de inventários
- [ ] PvP (opcional)
- [ ] Sistema de party
- [ ] Sincronização de combate
- [ ] Sincronização de habilidades

### Otimização de Rede
- [ ] Interpolação de movimento
- [ ] Lag compensation
- [ ] Delta compression
- [ ] Priorização de pacotes

**Entregável:** Multiplayer funcional e estável

---

## Fase 9: Polimento (Meses 23-25)

### Audio
- [ ] Música ambiente por bioma
- [ ] Música de boss
- [ ] Efeitos sonoros de habilidades
- [ ] Sons de ambiente (vento, água)
- [ ] UI sounds

### Visual Effects
- [ ] Partículas de habilidades
- [ ] Explosões
- [ ] Efeitos de hit
- [ ] Iluminação melhorada
- [ ] Post-processing

### UI/UX Completo
- [ ] Menu principal
- [ ] Configurações
- [ ] Pause menu
- [ ] HUD completo
- [ ] Minimapa
- [ ] Quest tracker (se houver quests)

### Tutoriais
- [ ] Tutorial de movimento
- [ ] Tutorial de crafting
- [ ] Tutorial de combate
- [ ] Tutorial de poderes

### Balance
- [ ] Balance de dificuldade
- [ ] Balance de caminhos de poder
- [ ] Balance de drops
- [ ] Balance de XP

**Entregável:** Jogo polido e balanceado

---

## Fase 10: História e Conteúdo Final (Meses 26-28)

### Sistema de História
- [ ] Fragmentos de memória
- [ ] Cutscenes (simples)
- [ ] Diálogos (se houver NPCs)
- [ ] Quest system (opcional)

### Conteúdo Final
- [ ] Todas as habilidades Tier 3 e 4
- [ ] Formas divinas
- [ ] Estruturas especiais
- [ ] Easter eggs
- [ ] Conquistas/Achievements

### Final do Jogo
- [ ] Boss final (Chronos) completo
- [ ] Cutscene final
- [ ] Créditos
- [ ] New Game+ (opcional)

**Entregável:** Jogo completo

---

## Fase 11: Pré-Lançamento (Mês 29-30)

### Testing
- [ ] Alpha testing
- [ ] Beta testing
- [ ] Bug fixing
- [ ] Performance testing
- [ ] Multiplayer stress testing

### Release Prep
- [ ] Trailer
- [ ] Marketing materials
- [ ] Store page (Steam/Itch.io)
- [ ] Documentação
- [ ] Patch notes

**Entregável:** Jogo pronto para lançamento

---

## Tecnologias Sugeridas

### Engine
- **Unity** (fácil, muitos recursos)
- **Godot** (open source, leve)
- **Unreal Engine** (visual melhor, mais pesado)
- **Custom Engine** (C++, máximo controle)

### Networking
- **Mirror** (Unity)
- **Photon** (Unity)
- **Netcode for GameObjects** (Unity oficial)
- **Custom** (sockets diretos)

### Procedural Generation
- **Perlin Noise / Simplex Noise**
- **FastNoise2**
- **Algorithms**: Diamond-Square, Midpoint Displacement

---

## Estimativa Total

**Tempo:** 30 meses (~2.5 anos)  
**Equipe Mínima:**
- 1 Programador principal
- 1 Artista / Designer de níveis
- 1 Game Designer (pode acumular)
- 1 Sound Designer (freelancer)

**Equipe Ideal:**
- 2 Programadores
- 1 Artista 2D
- 1 Game Designer
- 1 Level Designer
- 1 Sound Designer

---

## Prioridades por MVP

### MVP 1 (3 meses) - Movimentação e Blocos
- Movimento
- Colocação/quebra de blocos
- Mundo simples

### MVP 2 (5 meses) - Crafting
- Inventário
- Crafting table
- Ferramentas básicas

### MVP 3 (10 meses) - Combate
- Inimigos básicos
- Armas
- Sistema de combate

### MVP 4 (18 meses) - Bosses
- Dimensões
- 4 bosses
- Progressão básica

### MVP 5 (28 meses) - Jogo Completo
- História
- Multiplayer
- Polimento

---

*Roadmap atualizado em: 09/03/2026*
