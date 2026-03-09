# GOHENCRAFT - Recursos de Desenvolvimento

## 🎓 Tutoriais Recomendados

### Geração Procedural
- **Procedural Generation in Minecraft** - GDC Talk
- **Sebastian Lague - Procedural Landmass Generation** (YouTube)
- **Perlin Noise Tutorial** - Khan Academy
- **Understanding Simplex Noise** - Adrian's Soapbox

### Voxel Engines
- **Let's Make a Voxel Engine** - AlwaysGeeky
- **Voxel Engine Development** - Hopson97 (YouTube)
- **Culled Meshing for Minecraft-like Games** - 0fps

### Multiplayer/Networking
- **Gaffer On Games - Networking for Game Programmers**
- **Fast-Paced Multiplayer** - Gabriel Gambetta
- **Source Multiplayer Networking** - Valve Developer Wiki

### Entity Component System (ECS)
- **Game Programming Patterns - Component Pattern** - Bob Nystrom
- **Entity Systems are the future of MMORPG development** - Adam Martin
- **Unity DOTS Documentation** (se usar Unity)

### Pathfinding (AI)
- **A* Pathfinding for Beginners** - Patrick Lester
- **Introduction to A*** - Red Blob Games
- **Jump Point Search** - Harabor & Grastien

---

## 📚 Livros Recomendados

### Game Development
- **Game Programming Patterns** - Robert Nystrom
- **Game Engine Architecture** - Jason Gregory
- **Real-Time Rendering** - Tomas Akenine-Möller
- **AI for Games** - Ian Millington

### Math
- **Mathematics for 3D Game Programming** - Eric Lengyel
- **3D Math Primer for Graphics** - Fletcher Dunn

### Design
- **The Art of Game Design: A Book of Lenses** - Jesse Schell
- **Level Up! The Guide to Great Video Game Design** - Scott Rogers

---

## 🔧 Ferramentas Úteis

### Game Engines
- **Unity** - https://unity.com/
- **Godot** - https://godotengine.org/
- **Unreal Engine** - https://www.unrealengine.com/

### Pixel Art / Textures
- **Aseprite** - https://www.aseprite.org/ (Pixel art editor)
- **Piskel** - https://www.piskelapp.com/ (Online, free)
- **GIMP** - https://www.gimp.org/ (Free)
- **Paint.NET** - https://www.getpaint.net/ (Free)

### 3D Modeling (se necessário)
- **Blender** - https://www.blender.org/ (Free)
- **MagicaVoxel** - https://ephtracy.github.io/ (Voxel editor)

### Audio
- **Audacity** - https://www.audacityteam.org/ (Free audio editor)
- **LMMS** - https://lmms.io/ (Free music production)
- **Bfxr** - https://www.bfxr.net/ (Sound effect generator)

### Level Editing
- **Tiled** - https://www.mapeditor.org/ (2D level editor)
- **Trenchbroom** - https://trenchbroom.github.io/ (Voxel editor)

### Version Control
- **Git** - https://git-scm.com/
- **GitHub Desktop** - https://desktop.github.com/
- **GitKraken** - https://www.gitkraken.com/

### Profiling & Debugging
- **Unity Profiler** (se usar Unity)
- **RenderDoc** - https://renderdoc.org/ (Graphics debugger)
- **Visual Studio Profiler**

---

## 🌐 Recursos Online

### Documentação
- **Unity Documentation** - https://docs.unity3d.com/
- **Godot Documentation** - https://docs.godotengine.org/
- **OpenGL Documentation** - https://www.opengl.org/documentation/

### Fóruns e Comunidades
- **Reddit - r/gamedev** - https://reddit.com/r/gamedev
- **Reddit - r/VoxelGameDev** - https://reddit.com/r/VoxelGameDev
- **Unity Forum** - https://forum.unity.com/
- **Godot Community** - https://godotengine.org/community

### Asset Resources (Free/Paid)
- **OpenGameArt** - https://opengameart.org/ (Free assets)
- **itch.io Assets** - https://itch.io/game-assets (Free/Paid)
- **Kenney Assets** - https://kenney.nl/ (Free, high quality)
- **Unity Asset Store** - https://assetstore.unity.com/

### Sound/Music Resources (Free)
- **Freesound** - https://freesound.org/
- **Incompetech** - https://incompetech.com/ (Kevin MacLeod music)
- **Purple Planet Music** - https://www.purple-planet.com/
- **ZapSplat** - https://www.zapsplat.com/

---

## 💡 Algoritmos Úteis

### Geração de Mundo

#### Perlin Noise
```csharp
// Pseudocódigo
float PerlinNoise(float x, float y) {
    // Implementação de Perlin Noise
}

float height = PerlinNoise(x * scale, z * scale);
```

#### Multi-Octave Noise
```csharp
float MultiOctaveNoise(float x, float y, int octaves) {
    float total = 0;
    float frequency = 1;
    float amplitude = 1;
    float maxValue = 0;
    
    for (int i = 0; i < octaves; i++) {
        total += PerlinNoise(x * frequency, y * frequency) * amplitude;
        maxValue += amplitude;
        amplitude *= 0.5;
        frequency *= 2;
    }
    
    return total / maxValue;
}
```

### Pathfinding - A*
```csharp
List<Node> AStar(Node start, Node goal) {
    PriorityQueue openSet = new PriorityQueue();
    openSet.Add(start);
    
    Dictionary<Node, Node> cameFrom = new Dictionary<Node, Node>();
    Dictionary<Node, float> gScore = new Dictionary<Node, float>();
    gScore[start] = 0;
    
    while (openSet.Count > 0) {
        Node current = openSet.Dequeue();
        
        if (current == goal) {
            return ReconstructPath(cameFrom, current);
        }
        
        foreach (Node neighbor in current.Neighbors) {
            float tentativeGScore = gScore[current] + Distance(current, neighbor);
            
            if (!gScore.ContainsKey(neighbor) || tentativeGScore < gScore[neighbor]) {
                cameFrom[neighbor] = current;
                gScore[neighbor] = tentativeGScore;
                float fScore = tentativeGScore + Heuristic(neighbor, goal);
                openSet.Add(neighbor, fScore);
            }
        }
    }
    
    return null; // No path found
}
```

### Greedy Meshing (Otimização de Chunks)
```csharp
void GreedyMesh(Chunk chunk) {
    // Combina faces adjacentes do mesmo tipo
    // Reduz número de vértices drasticamente
    
    for (int axis = 0; axis < 3; axis++) {
        // Para cada eixo (X, Y, Z)
        // Identifica faces visíveis
        // Mescla faces adjacentes do mesmo tipo
    }
}
```

---

## 📊 Performance Tips

### Chunk Loading
- Carregar chunks em thread separada
- Priorizar chunks mais próximos do player
- Manter cache de chunks recentemente usados

### Rendering
- Usar instancing para blocos repetidos
- Implementar frustum culling
- LOD (Level of Detail) para objetos distantes
- Occlusion culling para chunks escondidos

### Memória
- Object pooling para projéteis, partículas
- Texture atlas para reduzir draw calls
- Compressão de chunks não ativos

### Networking
- Interpolação de movimento
- Client-side prediction
- Delta compression para reduzir bandwidth

---

## 🎨 Pixel Art Guidelines

### Resolução 16x16
- Mantenha formas simples e reconhecíveis
- Use dithering com moderação
- Limite de cores por bloco: 4-8 cores
- Mantenha consistência de estilo

### Paleta de Cores
- Defina paleta antes de começar
- Use HSV para variações
- Contraste adequado para visibilidade

### Animação
- Frame rate: 6-12 fps para pixel art
- Movimento exagerado (squash & stretch)
- Frames de transição suaves

---

## 🧪 Testing Checklist

### Performance Tests
- [ ] FPS mantém 60+ com 100 chunks carregados
- [ ] Memory usage < 2GB
- [ ] Chunk generation < 100ms
- [ ] Load time < 5s

### Gameplay Tests
- [ ] Player movement feels responsive
- [ ] Combat feels impactful
- [ ] Crafting is intuitive
- [ ] Progression é recompensadora

### Multiplayer Tests
- [ ] Latência < 100ms aceitável
- [ ] Sincronização precisa
- [ ] Sem crashes em 4+ players

---

## 📈 Milestones de Desenvolvimento

### Milestone 1: Protótipo Básico (3 meses)
- Movimento do player
- Colocação/quebra de blocos
- Mundo procedural simples

### Milestone 2: Gameplay Core (6 meses)
- Inventário funcional
- Crafting básico
- Combate implementado

### Milestone 3: Progressão (12 meses)
- Sistema de levels
- Caminhos de poder
- Habilidades básicas

### Milestone 4: Conteúdo (18 meses)
- Três dimensões
- Bosses implementados
- História integrada

### Milestone 5: Polimento (24 meses)
- Multiplayer estável
- Audio completo
- Balance finalizado

### Milestone 6: Release (30 meses)
- Bug-free (idealmente)
- Trailer e marketing
- Lançamento público

---

## 🔗 Links Úteis

### Referências de Minecraft
- **Minecraft Wiki** - https://minecraft.fandom.com/
- **Minecraft Technical** - /r/MinecraftCommands

### Game Development Blogs
- **Gamasutra** - https://www.gamasutra.com/
- **80.lv** - https://80.lv/
- **Game Developer** - https://www.gamedeveloper.com/

### YouTube Channels
- **Sebastian Lague** - Procedural generation
- **Brackeys** - Unity tutorials
- **CodeMonkey** - Game dev tutorials
- **Game Maker's Toolkit** - Game design analysis

---

*Este documento será atualizado com novos recursos conforme descobertos.*
