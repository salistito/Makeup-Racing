extends Node2D

onready var pinturas = $pinturas
onready var pintables = $pintables
onready var herramientas = $herramientas

var lista = []

func _ready():
	$CanvasLayer/HBoxContainer.hide()
	for pintura in pinturas.get_children():
		pintura.connect("color_selected", self, "set_selected_color")
		lista.append(pintura.pintura)
		
	for herramienta in herramientas.get_children():
		herramienta.connect("tool_selected",self, "set_tool")
	
	Manager.maquillaje = self
	
	for parte in $foto/partes_cara.get_children():

		parte.color_parte = lista[randi() % lista.size()]
		
		
		
	
func set_selected_color(col):
	for pintable in pintables.get_children():
		pintable.selected_color = col
func set_tool(herr):
	for pintable in pintables.get_children():
		pintable.selected_tool = herr
		
func randomizer(datos):	
	var arreglo = pintables.get_children()
	print("chocamos, cambiaremos una vez")
	while datos > 0:
		print("ahora estamos en while")
		var indice = randi()%len(arreglo)
		
		arreglo[indice].pintura = lista[randi() % lista.size()]
		arreglo.remove(indice)
		datos = datos - 1
