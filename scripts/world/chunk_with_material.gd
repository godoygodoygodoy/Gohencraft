extends Chunk
## Versão extendida do Chunk com material padrão

var default_material: StandardMaterial3D

func _init(pos: Vector3i = Vector3i.ZERO):
	super._init(pos)
	
	# Criar material padrão
	default_material = StandardMaterial3D.new()
	default_material.albedo_color = Color(0.6, 0.5, 0.4)  # Cor marrom/terra
	default_material.roughness = 0.8
	default_material.metallic = 0.0

func build_mesh():
	super.build_mesh()
	
	# Aplicar material
	if mesh:
		set_surface_override_material(0, default_material)
