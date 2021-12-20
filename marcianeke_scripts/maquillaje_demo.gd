extends Node2D

onready var pinturas = $pinturas
onready var pintables = $pintables
onready var herramientas = $herramientas

var lista = []
var lista_colores =[]

func _ready():
	$CanvasLayer/HBoxContainer.hide()
	for pintura in pinturas.get_children():
		pintura.connect("color_selected", self, "set_selected_color")
		lista.append(pintura.pintura)
		lista_colores.append(pintura.color)
		
		
	for herramienta in herramientas.get_children():
		herramienta.connect("tool_selected",self, "set_tool")
	
	Manager.maquillaje = self
	
	for parte in $foto/partes_cara.get_children():
		var indice = randi() % lista.size()
		parte.color_parte = lista[indice]
		parte.color = lista_colores[indice]
		
		
		
	
func set_selected_color(col,name):
	for pintable in pintables.get_children():
		pintable.selected_color = col
		pintable.color = name
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
