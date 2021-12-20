extends Node2D

var tasks = []


# Called when the node enters the scene tree for the first time.
func _ready():
	Manager.nivel = self
	
	for cubo in $Estructura_Nivel/selfies.get_children():
		cubo.connect("put_task", self, "add_task")
		
	
		

func add_task():
	tasks += [1]
	print("anadimos task")
	Manager.goals.get_children()[1].text = str(len(tasks)) 
	
	print(tasks)
	
func remove_task():
	print("empezamos a remover un task")
	tasks.pop_back()
	Manager.goals.get_children()[1].text = str(len(tasks))
	print(tasks)
