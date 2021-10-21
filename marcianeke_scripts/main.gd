extends Node2D

#onready var viewport_maquillaje = $Control/HBoxContainer/ViewportContainer2/parte_maquillaje
onready var countdown := $TimerLayer/LevelTimer
onready var time_text := $TimerLayer/Countdown
onready var victory_menu = $VictoryLayer/Panel
onready var defeat_menu = $DefeatLayer/Panel
onready var car := $Control/HBoxContainer/ViewportContainer/Viewport/Autito/russian_car
var use_milliseconds = false

func _ready():
	Manager.principal = self
	$CanvasLayer2/Sprite.visible = false
	victory_menu.hide()
	defeat_menu.hide()
	Manager.niveles_meta.connect("body_entered", self, "on_body_entered")
	
func show_distraction():
	$CanvasLayer2/Sprite.visible = true
	
func hide_distraction():
	$CanvasLayer2/Sprite.visible = false



func _on_Button_pressed():
	get_tree().change_scene("res://scenes/Niveles.tscn")
	
func _on_RestartButtonLVL1_pressed() -> void:
	get_tree().change_scene("res://scenes/main1.tscn")
	
func _on_RestartButtonLVL2_pressed() -> void:
	get_tree().change_scene("res://scenes/main2.tscn")

func _on_RestartButtonLVL3_pressed() -> void:
	get_tree().change_scene("res://scenes/main3.tscn")
	
func _on_RestartButtonLVL4_pressed() -> void:
	get_tree().change_scene("res://scenes/main4.tscn")
	
func _on_MainMenuButton_pressed() -> void:
	get_tree().change_scene("res://scenes/Menu.tscn")
	
func _on_ExitButton_pressed() -> void:
	get_tree().quit()



# Función que le da formato al tiempo del layer con el tiempo restante del nivel
func _format_seconds(time : float, use_milliseconds : bool) -> String:
	var minutes := time / 60
	var seconds := fmod(time, 60)
	if not use_milliseconds:
		return "%02d:%02d" % [minutes, seconds]
	var milliseconds := fmod(time, 1) * 100
	return "%02d:%02d:%02d" % [minutes, seconds, milliseconds]

# Función que actualiza el layer con el tiempo restante del nivel
func _process(_delta : float) -> void:
	time_text.set_text(_format_seconds(countdown.time_left, use_milliseconds))
	
# Función que se ejecuta cuando se acaba el tiempo del timer
func _on_LevelTimer_timeout() -> void:
	#your timer events start here
	car.block = 1
	defeat_menu.show()
	
# Función que se ejecuta cuando se llega a la meta
func on_body_entered(body: Node):
	if(countdown.time_left>0 and true and true and countdown.time_left<countdown.get_wait_time()): # and goals and maquillaje
		countdown.set_paused(1)
		car.block = 1
		victory_menu.show()
	elif(countdown.time_left>0 and (!true or !true) and countdown.time_left<countdown.get_wait_time()): # (not goals or not maquillaje)
		car.block = 1
		defeat_menu.show()
