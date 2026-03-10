# GOHENCRAFT - Game Design Document

## Visão Geral

**Nome:** Gohencraft  
**Gênero:** Sandbox, RPG, Mundo Aberto  
**Estilo Visual:** Pixel Art 16x16  
**Modos de Jogo:** Singleplayer e Multiplayer Cooperativo  
**Plataforma:** Godot 4.6.1  
**Inspirações:** Minecraft, Terraria, RPGs de Progressão, Mitologia Grega

## Conceito Central

Gohencraft é um jogo sandbox de mundo aberto onde o jogador explora, coleta recursos, constrói e evolui poderes divinos enquanto descobre sua verdadeira identidade como um deus esquecido.

---

## História

### Premissa

O jogador controla **um deus esquecido** que foi apagado da existência por **Chronos**, o deus do tempo.

### Condição Inicial

- Perdeu todos os poderes
- Perdeu todas as memórias
- Foi esquecido por todos os seres do universo
- Despertou na Terra como um ser enfraquecido

### Objetivo Narrativo

1. Recuperar memórias
2. Recuperar poderes divinos
3. Descobrir o que Chronos fez
4. Restaurar sua existência
5. Confrontar Chronos

### Dimensões do Jogo

A jornada acontece em três grandes dimensões:

1. **Terra** - Dimensão inicial, mundo de exploração básica
2. **Inferno** - Segunda dimensão, domínio das sombras
3. **Céu** - Terceira dimensão, reino divino

Cada dimensão representa uma etapa da recuperação de poder.

---

## Personagem Principal

### Identidade

- **Nome Padrão:** Gohen
- **Nome Customizável:** Sim

### Estado Inicial

- Sem poderes
- Sem memória
- Status básicos fracos

### Progressão

Com o avanço no jogo, desbloqueia:
- Habilidades básicas
- Poderes elementais
- Poderes divinos

---

## Antagonistas

### Vilão Principal: Chronos

**Título:** Deus do Tempo  
**Papel:** Boss Final  
**Motivação:** Reorganizou o universo apagando o protagonista

**Poderes:**
- Manipulação do tempo
- Congelamento temporal
- Aceleração de inimigos
- Retroceder eventos

**Presença:** Aparece raramente, manipulando eventos de longe

### Mini-Bosses: Os Três Deuses

#### 1. Hades
- **Dimensão:** Inferno
- **Tema:** Morte, Sombras, Almas
- **Habilidades:**
  - Invocar mortos
  - Criar áreas de corrupção
  - Ataques de sombra

#### 2. Zeus
- **Dimensão:** Céu
- **Tema:** Trovão, Tempestade, Autoridade Divina
- **Habilidades:**
  - Raios
  - Tempestades
  - Ataques em área

#### 3. Poseidon
- **Dimensão:** Terra / Oceanos
- **Tema:** Água, Mar, Controle de Marés
- **Habilidades:**
  - Ondas gigantes
  - Criaturas marinhas
  - Controle da água

---

## Sistema de Progressão

### Level System

Sistema de Level Up estilo RPG tradicional.

**Ao subir de nível:**
- Ganha pontos de habilidade
- Desbloqueia novas opções de poderes

**Curva de Experiência:**
```
Level 1 → 100 XP
Level 2 → 200 XP
Level 3 → 350 XP
Level 4 → 600 XP
[progressão exponencial]
```

### Caminhos de Poder

O jogador deve **escolher um caminho de poder permanente**.

**Caminhos Disponíveis:**
- Caminho da Água
- Caminho da Terra
- Caminho do Fogo
- Caminho da Luz
- Caminho da Sombra

⚠️ **IMPORTANTE:** Escolha é permanente! Uma vez escolhido, o jogador não pode mudar de caminho.

**Impacto no Multiplayer:**
- Cria especialização de builds
- Incentiva diversidade no grupo
- Gera sinergia entre jogadores

---

## Sistema de Mundo

### Geração Procedural

Mundo aberto gerado proceduralmente, similar a Minecraft.

### Biomas

- Florestas
- Desertos
- Oceanos
- Montanhas
- Cavernas
- [Mais biomas a adicionar]

### Mecânicas de Mundo

- Mineração
- Construção
- Exploração livre
- Coleta de recursos

### Ciclo de Dia e Noite

#### 🌞 Durante o Dia
- Poucos inimigos
- Foco em exploração
- Coleta de recursos segura

#### 🌙 Durante a Noite
- Monstros aparecem
- Maior perigo
- Mais experiência ao derrotar inimigos

#### 🔴 Evento Especial: Lua Vermelha

Evento raro com alta dificuldade e recompensas.

**Efeitos:**
- Todos os monstros ficam corrompidos
- Inimigos ficam mais fortes
- Spawn rate aumenta drasticamente
- Monstros raros aparecem

**Recompensas:**
- Drops melhores
- Mais experiência

---

## Sistema de Multiplayer

### Características

- Jogo cooperativo com amigos
- Cada jogador escolhe um caminho de poder diferente
- Sinergia de equipe estilo RPG

### Exemplo de Composição de Grupo

```
Jogador 1 → Água (Suporte/Controle)
Jogador 2 → Fogo (Dano)
Jogador 3 → Terra (Tanque/Defesa)
```

---

## Estilo Visual

### Especificações Técnicas

- **Resolução de Textura:** 16x16 pixels
- **Estilo:** Pixel Art
- **Estética:** Simples e limpa

### Design do Personagem

Formato simples e blocado:
- Cabeça quadrada
- Corpo retangular
- Braços e pernas blocados
- Design único (não igual ao Minecraft)

---

## Sistema de Recursos

### Recursos Implementados

#### Madeira
- `wood.png` - Tronco (lateral)
- `wood2.png` - Tronco (topo)
- `wood_planks.png` - Tábuas de madeira
- `leaves.png` - Folhas

#### Crafting
- `crafting_table.png` - Mesa de crafting (lateral)
- `crafting_table_top.png` - Mesa de crafting (topo)

#### Minerais
- `stone.png` - Pedra

#### Natureza
- `water.png` - Água
- `sand.png` - Areia
- `dirt.png` - Terra
- `grass.png` - Terra com grama
- `grass_top.png` - Grama (topo)

### Utilização de Recursos

- Crafting de itens
- Construção de estruturas
- Criação de ferramentas

---

## Sistema de Crafting

### Mecânica

Utiliza uma **Crafting Table** para criar itens.

### Categorias de Crafting

#### Ferramentas
- Picareta
- Machado
- Pá

#### Armas
- Espada
- Arco
- [Mais armas baseadas em elementos]

#### Estruturas
- Blocos de construção
- Decorações

#### Itens Especiais
- Poções
- Itens mágicos
- Equipamentos elementais

---

## Objetivo Final

### Progressão Narrativa

1. Explorar o mundo (Terra)
2. Evoluir poderes
3. Recuperar memórias fragmentadas
4. Derrotar os deuses guardiões (Hades, Zeus, Poseidon)
5. Confrontar Chronos

### Conclusão

**Ao derrotar Chronos:**
- O protagonista recupera completamente sua identidade divina
- Restaura sua existência no universo
- [Final a ser detalhado]

---

## Próximos Passos de Desenvolvimento

- [ ] Sistema de movimento e física
- [ ] Sistema de inventário
- [ ] Sistema de crafting
- [ ] Geração procedural de mundo
- [ ] Sistema de combate
- [ ] Sistema de poderes/habilidades
- [ ] Sistema de progressão (XP e levels)
- [ ] Caminhos de poder
- [ ] IA de inimigos
- [ ] Sistema de dia/noite
- [ ] Multiplayer
- [ ] Bosses

---

*Documento criado em: 09/03/2026*
