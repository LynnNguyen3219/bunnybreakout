extends Control

@onready var main_buttons: VBoxContainer = $MainButtons
@onready var options: Panel = $Options
@onready var howtoplay: Panel = $HowToPlay
@onready var music = $Music
@onready var sfx = [$Collide,$Broken,$Confirm]
@onready var mute = false

# Called when the node enters the scene tree for the first time.
func _ready():
	main_buttons.visible = true
	options.visible = false
	howtoplay.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_start_button_pressed() -> void:
	AudioController.play_confirm()
	get_tree().change_scene_to_file("res://scenes/level.tscn")


func _on_how_to_play_button_pressed() -> void:
	AudioController.play_confirm()
	main_buttons.visible = false
	howtoplay.visible = true


func _on_options_button_pressed() -> void:
	AudioController.play_confirm()
	main_buttons.visible = false
	options.visible = true


func _on_exit_button_pressed() -> void:
	AudioController.play_confirm()
	get_tree().quit()


func _on_music_toggle_pressed() -> void:
	AudioController.toggleMusic()
	AudioController.play_confirm()
	
	if AudioController.musicmute:
		$Options/VBoxContainer/MusicToggle.text = "unmute music"
	else:
		$Options/VBoxContainer/MusicToggle.text = "mute music"


func _on_sfx_toggle_pressed() -> void:
	AudioController.toggleSfx()
	AudioController.play_confirm()
	
	if AudioController.sfxmute:
		$Options/VBoxContainer/SFXToggle.text = "unmute sfx"
	else:
		$Options/VBoxContainer/SFXToggle.text = "mute sfx"


func _on_back_options_pressed() -> void:
	AudioController.play_confirm()
	main_buttons.visible = true
	options.visible = false


func _on_back_how_to_play_pressed() -> void:
	AudioController.play_confirm()
	main_buttons.visible = true
	howtoplay.visible = false
